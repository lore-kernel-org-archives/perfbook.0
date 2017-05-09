Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc;        bh=wtr9T632fRGqZJDlZfOWHBQ6YUkE9EHrsULLNvfzDBg=;
 b=VSXT4WlKHPYqjWHscWz/1abIX5J/sFSrbzMPW9OcZ9rnetjkpbQ5syt1BXct7RL+UF
 /Y812hl6cJX2OJfcfJlPz7Wyk4iYNq6rAczYz13/Qb1PCmRnOYI/4ybEzjX2WsFbAamH
 tKtUjqBk6Pb/CO8bbPbVuU1VjDUdthVABQvccK87LoGJW3ht5dn8cD+DLJz6ER6vl9E/
 JoEtkq7Pq2lEi0o/nfUEXr0QGulawPMlS84EG9pmCfuuWTfZBnOK8aXxfDtWrTJL2K32
 cbG8cn7KYZaHF56pEm8gGSO7UQef0kjGwlBnqX+xpbNm4YxMDjTmKIeCsURGrKQeOxOV
 PW5w==
MIME-Version: 1.0
In-Reply-To: <20170509155818.GA4123@HP>
References: <20170429142605.GC2536@master>
 <20170501155816.GB3956@linux.vnet.ibm.com> <20170508132523.GA7570@HP>
 <20170508155052.GA3956@linux.vnet.ibm.com> <20170509110758.GA5835@HP>
 <20170509042132.GJ3956@linux.vnet.ibm.com> <20170509155818.GA4123@HP>
From: Junchang Wang <junchangwang@gmail.com>
Date: Tue, 9 May 2017 17:03:36 +0800
Message-ID: 
 <CABoNC82KixTg6zMfmH19cj1M1SjZXihsGGtk_Cbb4sHtjtA+Ag@mail.gmail.com>
Subject: Re: The weird re-ordering issue of the Alpha arch'
Content-Type: multipart/alternative; boundary=001a11414ebe9428c0054f13a16f
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

--001a11414ebe9428c0054f13a16f
Content-Type: text/plain; charset=UTF-8

Hi Yubin,

I never heard that memory barrier instructions can speedup other
instructions (either read or write). My understanding is that under the
covers a barrier instruction may need to, for example, flush pipeline to
maintain program order, and to wait for the propagation of data to other
CPU cores, which disturbs the normal execution process of other
instructions instead of accelerating.


--Junchang


On Tue, May 9, 2017 at 11:58 PM, Yubin Ruan <ablacktshirt@gmail.com> wrote:

> On Mon, May 08, 2017 at 09:21:32PM -0700, Paul E. McKenney wrote:
> > On Tue, May 09, 2017 at 07:08:01PM +0800, Yubin Ruan wrote:
> > > On Mon, May 08, 2017 at 08:50:52AM -0700, Paul E. McKenney wrote:
> > > > On Mon, May 08, 2017 at 09:25:28PM +0800, Yubin Ruan wrote:
> > > > > On Mon, May 01, 2017 at 08:58:16AM -0700, Paul E. McKenney wrote:
> > > > > > On Sat, Apr 29, 2017 at 10:26:05PM +0800, Yubin Ruan wrote:
> > > >
> > > > [ . . . ]
> > > >
> > > > > Hmm...that reminds me of some words in the perfbook. In the answer
> of quick quiz 4.17,
> > > > > you state that:
> > > > >
> > > > >     Memory barrier only enforce ordering among multiple memory
> references: They do
> > > > >     absolutely nothing to expedite the propogation of data from
> one part of the system
> > > > >     to another. This leads to a quick rule of thumb:  You do not
> need memory barriers
> > > > >     unless you are using more than one variable to communicate
> between multiple threads.
> > > > >
> > > > > Is that only true for the Alpha processor? I mean, on platforms
> other than
> > > > > Alpha (e.g x86), memory barrier *do* expedite the propogation of
> data from one
> > > > > processor/core to other processor/core, even though that is not
> officially documented.
> > > >
> > > > Can you point me at any unofficial documentation of this, for
> example,
> > > > any performance measurements indicating that (for example) the mfence
> > > > instruction speeds up the propagation of previous writes to other
> CPUs?
> > >
> > > Hmm...I might had had too much drug at that moment. What I mean is
> that, on platform
> > > like x86, memory barrier instructions(e.g sfence) enforce that the
> order of some memory
> > > references are preserved as the same as in the origin processor by
> another processors.
> > > However, any speedup is not guaranteed.
> >
> > Hey, I was hoping!  ;-)
>
> Ah...sorry to dispoint you. :)
> Maybe some memory barrier instructions do have some speedup side effect to
> "expedite" the propogation of previous writes. Maybe try to consult some
> Intel
> engineer about this...?
> It would be good to have some experiments to measure this. But currently I
> don't
> know how to carry out the experiment myself. Do you have any plan or idea?
>
> Thanks,
> Yubin
>
> >
> >                                                       Thanx, Paul
> >
> > > Regards,
> > > Yubin
> > >
> > > > In the absence of such documentation, all I can really do is change
> > > > "They do absolutely nothing to expedite..." to something like "They
> are
> > > > not guaranteed to do anything to expedite..."
> > > >
> > > >                                                   Thanx, Paul
> > > >
> > > > > ---
> > > > > Yubin
> > > > >
> > > > > > >
> > > > > > > [1]: https://www.cs.umd.edu/~pugh/java/memoryModel/
> AlphaReordering.html
> > > > > > >
> > > > > >
> > > > >
> > > >
> > >
> >
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--001a11414ebe9428c0054f13a16f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Yubin,<div><br></div><div>I never heard that=C2=A0<span=
 style=3D"font-size:12.8px">memory barrier instructions can speedup=C2=A0ot=
her instructions (either read or write). My understanding is that under the=
 covers a barrier instruction may need to, for example, flush pipeline to m=
aintain program order, and to wait for the propagation of data to other CPU=
 cores, which disturbs the normal execution process of other instructions i=
nstead of accelerating.</span></div><div><span style=3D"font-size:12.8px"><=
br></span></div><div><br></div><div>--Junchang</div><div><span style=3D"fon=
t-size:12.8px"><br></span></div></div><div class=3D"gmail_extra"><br><div c=
lass=3D"gmail_quote">On Tue, May 9, 2017 at 11:58 PM, Yubin Ruan <span dir=
=3D"ltr">&lt;<a href=3D"mailto:ablacktshirt@gmail.com" target=3D"_blank">ab=
lacktshirt@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><span class=3D"">On Mon, May 08, 2017 at 09:21:32PM -0700, Paul E. McKenn=
ey wrote:<br>
&gt; On Tue, May 09, 2017 at 07:08:01PM +0800, Yubin Ruan wrote:<br>
&gt; &gt; On Mon, May 08, 2017 at 08:50:52AM -0700, Paul E. McKenney wrote:=
<br>
&gt; &gt; &gt; On Mon, May 08, 2017 at 09:25:28PM +0800, Yubin Ruan wrote:<=
br>
&gt; &gt; &gt; &gt; On Mon, May 01, 2017 at 08:58:16AM -0700, Paul E. McKen=
ney wrote:<br>
&gt; &gt; &gt; &gt; &gt; On Sat, Apr 29, 2017 at 10:26:05PM +0800, Yubin Ru=
an wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; [ . . . ]<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Hmm...that reminds me of some words in the perfbook. In=
 the answer of quick quiz 4.17,<br>
&gt; &gt; &gt; &gt; you state that:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Memory barrier only enforce ordering=
 among multiple memory references: They do<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0absolutely nothing to expedite the p=
ropogation of data from one part of the system<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0to another. This leads to a quick ru=
le of thumb:=C2=A0 You do not need memory barriers<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0unless you are using more than one v=
ariable to communicate between multiple threads.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Is that only true for the Alpha processor? I mean, on p=
latforms other than<br>
&gt; &gt; &gt; &gt; Alpha (e.g x86), memory barrier *do* expedite the propo=
gation of data from one<br>
&gt; &gt; &gt; &gt; processor/core to other processor/core, even though tha=
t is not officially documented.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Can you point me at any unofficial documentation of this, fo=
r example,<br>
&gt; &gt; &gt; any performance measurements indicating that (for example) t=
he mfence<br>
&gt; &gt; &gt; instruction speeds up the propagation of previous writes to =
other CPUs?<br>
&gt; &gt;<br>
&gt; &gt; Hmm...I might had had too much drug at that moment. What I mean i=
s that, on platform<br>
&gt; &gt; like x86, memory barrier instructions(e.g sfence) enforce that th=
e order of some memory<br>
&gt; &gt; references are preserved as the same as in the origin processor b=
y another processors.<br>
&gt; &gt; However, any speedup is not guaranteed.<br>
&gt;<br>
&gt; Hey, I was hoping!=C2=A0 ;-)<br>
<br>
</span>Ah...sorry to dispoint you. :)<br>
Maybe some memory barrier instructions do have some speedup side effect to<=
br>
&quot;expedite&quot; the propogation of previous writes. Maybe try to consu=
lt some Intel<br>
engineer about this...?<br>
It would be good to have some experiments to measure this. But currently I =
don&#39;t<br>
know how to carry out the experiment myself. Do you have any plan or idea?<=
br>
<br>
Thanks,<br>
Yubin<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Thanx, Paul<br>
&gt;<br>
&gt; &gt; Regards,<br>
&gt; &gt; Yubin<br>
&gt; &gt;<br>
&gt; &gt; &gt; In the absence of such documentation, all I can really do is=
 change<br>
&gt; &gt; &gt; &quot;They do absolutely nothing to expedite...&quot; to som=
ething like &quot;They are<br>
&gt; &gt; &gt; not guaranteed to do anything to expedite...&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Thanx, Paul<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; Yubin<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; [1]: <a href=3D"https://www.cs.umd.edu/~pugh/=
java/memoryModel/AlphaReordering.html" rel=3D"noreferrer" target=3D"_blank"=
>https://www.cs.umd.edu/~pugh/<wbr>java/memoryModel/<wbr>AlphaReordering.ht=
ml</a><br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
--<br>
To unsubscribe from this list: send the line &quot;unsubscribe perfbook&quo=
t; in<br>
the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org">major=
domo@vger.kernel.org</a><br>
More majordomo info at=C2=A0 <a href=3D"http://vger.kernel.org/majordomo-in=
fo.html" rel=3D"noreferrer" target=3D"_blank">http://vger.kernel.org/<wbr>m=
ajordomo-info.html</a><br>
</div></div></blockquote></div><br></div>

--001a11414ebe9428c0054f13a16f--

