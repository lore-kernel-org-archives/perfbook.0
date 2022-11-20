MIME-Version: 1.0
Date: Sun, 20 Nov 2022 15:40:06 -0800
References: <CAJbg=FWTVdoZr2uzDeSMcUE-0EGQbFgtVR6NvoRQ9Y+P1LSoRQ@mail.gmail.com>
	<CAJbg=FVh9H+Qo-oiH1W-G4hrcpM=-QWTJFO8s7Z7PYNrVedCSQ@mail.gmail.com>
In-Reply-To: <CAJbg=FVh9H+Qo-oiH1W-G4hrcpM=-QWTJFO8s7Z7PYNrVedCSQ@mail.gmail.com>
Message-ID: <CAJzB8QEWUfeo5qA3P1S3OiYdTqYiFCbtGGgOJDHsdxkqxBVjJg@mail.gmail.com>
Subject: Re: Hazard pointers: suspicious dereference
From: Paul McKenney <paulmckrcu@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000006d3d7205edef75ab"
To: Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

--0000000000006d3d7205edef75ab
Content-Type: text/plain; charset="UTF-8"

Hello, Elad, and please accept my apology for the delay.  I somehow
confused myself into thinking that Akira's changes covered this situation
as well.

Old code, let's see...

One possible point of confusion is this definition and comment:

/* Must be the first field in the hazard-pointer-protected structure. */
/* It is illegal to nest one such structure inside another. */
typedef struct hazptr_head {
        struct hazptr_head *next;
} hazptr_head_t;

This pointer is used to link up hazard-pointer-protected objects awaiting
reclamation.  So in hazptr_read_perf_test(), there is a local variable hh
that acts as a trivial hazard-pointer-protected structure and an hhp that
has a reference to this structure. As you say, the address of hhp is passed
to hp_record(), that is, a pointer to a pointer to the structure.  The
reason for this is that we are modeling a hazard-pointer-protected pointer
to this structure, which could change.

Then hp_record() passes a pointer to the structure itself to
hp_try_record(), which as you say seems to dereference one level too many.

Removing the "*" from hp_record()'s call to hp_try_record() seems to work,
but then again, the tests pass when that "*" is still there.

So at the very least, the tests are not all that great.

Thoughts?

                                       Thanx, Paul



On Sun, Nov 20, 2022 at 10:36 AM Elad Lahav <e2lahav@gmail.com> wrote:

> Hi Paul,
>
> Any comments on this one? I can submit a patch, but it's possible I'm
> missing something here.
>
> --Elad
>
> On Sun, 13 Nov 2022 at 10:20, Elad Lahav <e2lahav@gmail.com> wrote:
> >
> > hp_try_record() takes a pointer to a pointer, casts it to void **, and
> > then passes it to _h_t_r_impl(). So far so good.
> >
> > hp_record() takes a pointer to a pointer, but dereferences it when
> > calling hp_try_record(). That seems odd to me. Let's say we have a
> > structure foo_t, and a pointer to it, foo_p. Then
> >
> > hp_record((void **)&foo_p, hp)  =>
> > hp_try_record(*p, hp) // p is pointer to pointer to foo_s =>
> > _h_t_r_impl((void **)p, hp) // p is a pointer to foo_s, cast as (void
> **) =>
> > tmp = READ_ONCE(*p) // reading from the first bytes of foo_s as an
> address
> >
> > I also tried building the example route_hazard.c such that it uses
> > hp_record() instead of hp_try_record(), and it crashes as I expected.
> >
> > Am I missing something?
> >
> > --Elad
>

--0000000000006d3d7205edef75ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello, Elad, and please accept my apology for the del=
ay.=C2=A0 I somehow confused myself into thinking that Akira&#39;s changes =
covered this situation as well.</div><div><br></div><div>Old code, let&#39;=
s see...<br></div><div><br></div><div>One possible point of confusion is th=
is definition and comment:</div><div><br></div><div><span style=3D"font-fam=
ily:monospace">/* Must be the first field in the hazard-pointer-protected s=
tructure. */<br>/* It is illegal to nest one such structure inside another.=
 */<br>typedef struct hazptr_head {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct h=
azptr_head *next;<br>} hazptr_head_t;</span></div><div><br></div><div>This =
pointer is used to link up hazard-pointer-protected objects awaiting reclam=
ation.=C2=A0 So in hazptr_read_perf_test(), there is a local variable hh th=
at acts as a trivial hazard-pointer-protected structure and an hhp that has=
 a reference to this structure. As you say, the address of hhp is passed to=
 hp_record(), that is, a pointer to a pointer to the structure.=C2=A0 The r=
eason for this is that we are modeling a hazard-pointer-protected pointer t=
o this structure, which could change.<br></div><div><br></div><div>Then hp_=
record() passes a pointer to the structure itself to hp_try_record(), which=
 as you say seems to dereference one level too many.</div><div><br></div><d=
iv>Removing the &quot;*&quot; from hp_record()&#39;s call to hp_try_record(=
) seems to work, but then again, the tests pass when that &quot;*&quot; is =
still there.</div><div><br></div><div>So at the very least, the tests are n=
ot all that great.<br></div><div><br></div><div>Thoughts?</div><div><br></d=
iv><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 Thanx, Paul</div><div><br></div><div><br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Nov 20,=
 2022 at 10:36 AM Elad Lahav &lt;<a href=3D"mailto:e2lahav@gmail.com">e2lah=
av@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Hi Paul,<br>
<br>
Any comments on this one? I can submit a patch, but it&#39;s possible I&#39=
;m<br>
missing something here.<br>
<br>
--Elad<br>
<br>
On Sun, 13 Nov 2022 at 10:20, Elad Lahav &lt;<a href=3D"mailto:e2lahav@gmai=
l.com" target=3D"_blank">e2lahav@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; hp_try_record() takes a pointer to a pointer, casts it to void **, and=
<br>
&gt; then passes it to _h_t_r_impl(). So far so good.<br>
&gt;<br>
&gt; hp_record() takes a pointer to a pointer, but dereferences it when<br>
&gt; calling hp_try_record(). That seems odd to me. Let&#39;s say we have a=
<br>
&gt; structure foo_t, and a pointer to it, foo_p. Then<br>
&gt;<br>
&gt; hp_record((void **)&amp;foo_p, hp)=C2=A0 =3D&gt;<br>
&gt; hp_try_record(*p, hp) // p is pointer to pointer to foo_s =3D&gt;<br>
&gt; _h_t_r_impl((void **)p, hp) // p is a pointer to foo_s, cast as (void =
**) =3D&gt;<br>
&gt; tmp =3D READ_ONCE(*p) // reading from the first bytes of foo_s as an a=
ddress<br>
&gt;<br>
&gt; I also tried building the example route_hazard.c such that it uses<br>
&gt; hp_record() instead of hp_try_record(), and it crashes as I expected.<=
br>
&gt;<br>
&gt; Am I missing something?<br>
&gt;<br>
&gt; --Elad<br>
</blockquote></div>

--0000000000006d3d7205edef75ab--
