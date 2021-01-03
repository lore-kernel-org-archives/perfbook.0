Return-Path: <SRS0=nsJR=GG=gmail.com=danny.nitzan@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PQaN3grEB02c8XDHB01OG4JIdk0jfkKqM0nQ3M0PuGY=;
        b=UpcwwohQuAYXnMtGORdzomENwfyYESdcsBDzyuTi7h2Ew+jQWdktvWUEx0UmMbJt0T
         EmZ64/rFCLrtXKCKm+QcNrNF5ca8hSzMP/NEYC9tVX9wsDbIcw9ozOy3RLQALXawhyQr
         1txfA8zNDnlFHk0mZ0tQ02myHpaZnonn8ZBY9HNJIKVbU2bDbJPXw0fVlX58Io0Id2CD
         N1Gg5yFPfA2aP5vcrkbA4Yh3I0yEsoneh/vZRLEPGx70J08VU+WTbJDC9WGxgpF+eW1t
         LpED/TjvJB863oriy1aZWlb9A1qKECdAAgxVnJ66OYGp7KWsKTfCGnsxX8f5ohvYUf9C
         9crw==
MIME-Version: 1.0
References: <CAApSCJY_u9gsLHUY+=mBVBXzxU_oS8mF5CM5d_RkDFw7asPmyg@mail.gmail.com>
 <20210103035250.GE12032@paulmck-ThinkPad-P72>
In-Reply-To: <20210103035250.GE12032@paulmck-ThinkPad-P72>
From: Daniel Nitzan <danny.nitzan@gmail.com>
Date: Sun, 3 Jan 2021 08:27:04 +0200
Message-ID: <CAApSCJZG-n9GDbxeTUiP4Z3M+RDv8qhC4g0B36_+A0keLa9p0w@mail.gmail.com>
Subject: Re: Request for clarification on Alpha reordering
Content-Type: multipart/alternative; boundary="00000000000087c16505b7f91010"
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

--00000000000087c16505b7f91010
Content-Type: text/plain; charset="UTF-8"

Thanks Paul, makes perfect sense now.

Daniel

On Sun, Jan 3, 2021 at 5:52 AM Paul E. McKenney <paulmck@kernel.org> wrote:

> On Sun, Jan 03, 2021 at 12:04:24AM +0200, Daniel Nitzan wrote:
> > In 15.5.1 (Alpha) - In regard to the following statement: "Yes, this
> > does mean that Alpha can in effect fetch the data pointed to before it
> > fetches the pointer itself, strange but true."
> > I'd appreciate it if someone could clarify what this means. I don't
> > understand this statement in light of the actual data-dependent
> > reordering presented in this section, i.e. the pointer itself is
> > fetched, points to the correct location in memory, but the data is
> > stale.
>
> Yes, your last statement is equivalent.  Either way, the reading CPU sees
> the new value of the pointer and the old value of the pointed-to data.
> You can look at it either as counter-intuitive reordering (as I did)
> or as counter-intuitive stale data (as you did).
>
> The key point is that these values are not in a single location, but
> are instead replicated across the CPUs' caches.  Stores are therefore
> not atomic unless the hardware goes to a lot of trouble to make them
> appear to be atomic.
>
>                                                         Thanx, Paul
>

--00000000000087c16505b7f91010
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks Paul, makes perfect sense now.</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Daniel</div><div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jan 3, 2021 at 5:52 AM P=
aul E. McKenney &lt;<a href=3D"mailto:paulmck@kernel.org">paulmck@kernel.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Sun, Jan 03, 20=
21 at 12:04:24AM +0200, Daniel Nitzan wrote:<br>
&gt; In 15.5.1 (Alpha) - In regard to the following statement: &quot;Yes, t=
his<br>
&gt; does mean that Alpha can in effect fetch the data pointed to before it=
<br>
&gt; fetches the pointer itself, strange but true.&quot;<br>
&gt; I&#39;d appreciate it if someone could clarify what this means. I don&=
#39;t<br>
&gt; understand this statement in light of the actual data-dependent<br>
&gt; reordering presented in this section, i.e. the pointer itself is<br>
&gt; fetched, points to the correct location in memory, but the data is<br>
&gt; stale.<br>
<br>
Yes, your last statement is equivalent.=C2=A0 Either way, the reading CPU s=
ees<br>
the new value of the pointer and the old value of the pointed-to data.<br>
You can look at it either as counter-intuitive reordering (as I did)<br>
or as counter-intuitive stale data (as you did).<br>
<br>
The key point is that these values are not in a single location, but<br>
are instead replicated across the CPUs&#39; caches.=C2=A0 Stores are theref=
ore<br>
not atomic unless the hardware goes to a lot of trouble to make them<br>
appear to be atomic.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Thanx, Paul<br>
</blockquote></div></div>

--00000000000087c16505b7f91010--
