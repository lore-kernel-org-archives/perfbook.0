Return-Path: <markem@pdx.edu>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdx-edu.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OCcu135Q5TpFA1zMeRTonlARRrU6daMg2NSUlT7h2P4=;
        b=MD911Yks8WZUfsPf5r/QS1vPVSIWtOR0/XQUzo1IBix/FsB5xfSYtDbcY/bmKpkEkV
         xZBuoh4DHgXLPdwGt+UPucu1EqbyylPVVdH6n3NU+KT5qYGvvLEsSDS9oe9r0bRneF26
         +l97P3qL/E7jDvm7JiK546y/mUAUjoyFoEBows/tB9PS30sLpEa3vY78jHLyPtlosD48
         bAIlvcP2G8IVLBckiu8F6ZNFmxKVo9MxHLsFHAQcrJNRw18u5LE4AcugmE8lT9jVIwVp
         q8hfNUFj8mGEplee4knRNCGwU/iOjIzKp/EN2ZzX8n8Q2xGmulvbFV/8nPGPVSQBFoqu
         5UxQ==
MIME-Version: 1.0
References: <CAGnMLyzE5pjntT4Hz1PZaLKbz-2LSP=ziK60yWyNbwr4=WBdAg@mail.gmail.com>
 <20181220004525.GZ4170@linux.ibm.com> <CAGnMLyyOaXro0g1q7ipnQVk1ei0dwiQGwqROBH+F=JoQmkoOzA@mail.gmail.com>
 <20181220043500.GA4170@linux.ibm.com>
In-Reply-To: <20181220043500.GA4170@linux.ibm.com>
From: Mark Morrissey <markem@pdx.edu>
Date: Thu, 20 Dec 2018 08:17:35 -0800
Message-ID: <CAGnMLywxM+M33pTgV+61AnSsP4mfUEA0Kh-BNdfYarU_P6L3Sg@mail.gmail.com>
Subject: Re: Parallel programming book query
Content-Type: multipart/alternative; boundary="0000000000008796e2057d76781f"
To: Paul McKenney <paulmck@linux.ibm.com>
Cc: alexey.roytman@oracle.com, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

--0000000000008796e2057d76781f
Content-Type: text/plain; charset="UTF-8"

Thanks, Paul.l  Didn't mean to cause a book change.

--mark
--
Mark Morrissey, markem@pdx.edu
Senior Instructor, Computer Science
Portland State University


On Wed, Dec 19, 2018 at 8:35 PM Paul E. McKenney <paulmck@linux.ibm.com>
wrote:

> No, that would work.  Not something I would think of because there is
> no globally accessible ceil() function in the Linux kernel.  ;-)
>
> I have queued a patch with your Reported-by as shown at the end of this
> email.  Please let me know if I messed anything up.
>
>                                                         Thanx, Paul
>
> On Wed, Dec 19, 2018 at 05:13:01PM -0800, Mark Morrissey wrote:
> > I agree that it is equivalent to:
> >
> > p = s * ceil(m/s)
> >
> > But why not just perform that calculation? If it is based on either
> > efficiency or clock cycles, I don't see it. I admit to not having looked
> at
> > the implementation of the ceil() library routine. If I should look at
> > ceil(), then just slap me and I will understand.
> >
> > --mark
> > --
> > Mark Morrissey, markem@pdx.edu
> > Senior Instructor, Computer Science
> > Portland State University
> >
> >
> > On Wed, Dec 19, 2018 at 4:45 PM Paul E. McKenney <paulmck@linux.ibm.com>
> > wrote:
> >
> > > On Mon, Dec 17, 2018 at 01:04:37PM -0800, Mark Morrissey wrote:
> > > > Hi Paul,
> > > >
> > > > I am looking at your parallel programming book, 12/5/2018 version. In
> > > > formula E.6, you use the floor function rather than the ceiling
> function.
> > > > Is this deliberate or perhaps in error?
> > >
> > > Good question!
> > >
> > > The intent is that the "+ s - 1" in the numerator does the upwards part
> > > of the rounding, and the floor function does the rest.
> > >
> > > Or am I missing something here?  It should be possible to express this
> > > in terms of the ceiling function, though that would be further removed
> > > from C code implementing this equation.
> > >
> > > Adding Alexey and the list on CC.  This is on page 423 (PDF page 435)
> of
> > >
> > >
> https://mirrors.edge.kernel.org/pub/linux/kernel/people/paulmck/perfbook/perfbook.2018.12.08a.pdf
>
> ------------------------------------------------------------------------
>
> commit 9d317176364184ad6ef55fdab5535449fb8d110d
> Author: Paul E. McKenney <paulmck@linux.ibm.com>
> Date:   Wed Dec 19 20:30:28 2018 -0800
>
>     SMPdesign: Use ceiling symbol, skip odd floor computation
>
>     Equation E.6 in Quick Quiz 6.20 computes the floor function of
>     "(m + 2 - 1) / s", which is just the ceiling function of "m / s".
>     This commit therefore moves to this simpler formulation, on the
>     strength of the ceil() function in the standard library.  The fact
>     that ceil() is not globally available in the Linux kernel, which
>     motivated the original, seems a bit irrelevant, hence the change.
>
>     Reported-by: Mark Morrissey <markem@pdx.edu>
>     Signed-off-by: Paul E. McKenney <paulmck@linux.ibm.com>
>
> diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
> index fe8f445851e3..0ba7ebd04fe6 100644
> --- a/SMPdesign/SMPdesign.tex
> +++ b/SMPdesign/SMPdesign.tex
> @@ -1177,7 +1177,7 @@ this book.
>         $m$ rounded up to the next multiple of $s$, as follows:
>
>         \begin{equation}
> -               p = s \left \lfloor \frac{m + s - 1}{s} \right \rfloor
> +               p = s \left \lceil \frac{m}{s} \right \rceil
>         \label{sec:SMPdesign:p}
>         \end{equation}
>
>
>

--0000000000008796e2057d76781f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, Paul.l=C2=A0 Didn&#39;t mean to cause a book chang=
e.<div><br></div><div>--mark<br clear=3D"all"><div><div dir=3D"ltr" class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><d=
iv><div dir=3D"ltr"><div style=3D"font-size:small">--</div><div style=3D"fo=
nt-size:small">Mark Morrissey, <a href=3D"mailto:markem@pdx.edu" target=3D"=
_blank">markem@pdx.edu</a></div><div style=3D"font-size:small">Senior Instr=
uctor, Computer Science</div><div style=3D"font-size:small">Portland State =
University</div></div></div></div></div></div><br></div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr">On Wed, Dec 19, 2018 at 8:35 PM Paul E. =
McKenney &lt;<a href=3D"mailto:paulmck@linux.ibm.com">paulmck@linux.ibm.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
No, that would work.=C2=A0 Not something I would think of because there is<=
br>
no globally accessible ceil() function in the Linux kernel.=C2=A0 ;-)<br>
<br>
I have queued a patch with your Reported-by as shown at the end of this<br>
email.=C2=A0 Please let me know if I messed anything up.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Thanx, Paul<br>
<br>
On Wed, Dec 19, 2018 at 05:13:01PM -0800, Mark Morrissey wrote:<br>
&gt; I agree that it is equivalent to:<br>
&gt; <br>
&gt; p =3D s * ceil(m/s)<br>
&gt; <br>
&gt; But why not just perform that calculation? If it is based on either<br=
>
&gt; efficiency or clock cycles, I don&#39;t see it. I admit to not having =
looked at<br>
&gt; the implementation of the ceil() library routine. If I should look at<=
br>
&gt; ceil(), then just slap me and I will understand.<br>
&gt; <br>
&gt; --mark<br>
&gt; --<br>
&gt; Mark Morrissey, <a href=3D"mailto:markem@pdx.edu" target=3D"_blank">ma=
rkem@pdx.edu</a><br>
&gt; Senior Instructor, Computer Science<br>
&gt; Portland State University<br>
&gt; <br>
&gt; <br>
&gt; On Wed, Dec 19, 2018 at 4:45 PM Paul E. McKenney &lt;<a href=3D"mailto=
:paulmck@linux.ibm.com" target=3D"_blank">paulmck@linux.ibm.com</a>&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Mon, Dec 17, 2018 at 01:04:37PM -0800, Mark Morrissey wrote:<b=
r>
&gt; &gt; &gt; Hi Paul,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I am looking at your parallel programming book, 12/5/2018 ve=
rsion. In<br>
&gt; &gt; &gt; formula E.6, you use the floor function rather than the ceil=
ing function.<br>
&gt; &gt; &gt; Is this deliberate or perhaps in error?<br>
&gt; &gt;<br>
&gt; &gt; Good question!<br>
&gt; &gt;<br>
&gt; &gt; The intent is that the &quot;+ s - 1&quot; in the numerator does =
the upwards part<br>
&gt; &gt; of the rounding, and the floor function does the rest.<br>
&gt; &gt;<br>
&gt; &gt; Or am I missing something here?=C2=A0 It should be possible to ex=
press this<br>
&gt; &gt; in terms of the ceiling function, though that would be further re=
moved<br>
&gt; &gt; from C code implementing this equation.<br>
&gt; &gt;<br>
&gt; &gt; Adding Alexey and the list on CC.=C2=A0 This is on page 423 (PDF =
page 435) of<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://mirrors.edge.kernel.org/pub/linux/kernel/peopl=
e/paulmck/perfbook/perfbook.2018.12.08a.pdf" rel=3D"noreferrer" target=3D"_=
blank">https://mirrors.edge.kernel.org/pub/linux/kernel/people/paulmck/perf=
book/perfbook.2018.12.08a.pdf</a><br>
<br>
------------------------------------------------------------------------<br=
>
<br>
commit 9d317176364184ad6ef55fdab5535449fb8d110d<br>
Author: Paul E. McKenney &lt;<a href=3D"mailto:paulmck@linux.ibm.com" targe=
t=3D"_blank">paulmck@linux.ibm.com</a>&gt;<br>
Date:=C2=A0 =C2=A0Wed Dec 19 20:30:28 2018 -0800<br>
<br>
=C2=A0 =C2=A0 SMPdesign: Use ceiling symbol, skip odd floor computation<br>
<br>
=C2=A0 =C2=A0 Equation E.6 in Quick Quiz 6.20 computes the floor function o=
f<br>
=C2=A0 =C2=A0 &quot;(m + 2 - 1) / s&quot;, which is just the ceiling functi=
on of &quot;m / s&quot;.<br>
=C2=A0 =C2=A0 This commit therefore moves to this simpler formulation, on t=
he<br>
=C2=A0 =C2=A0 strength of the ceil() function in the standard library.=C2=
=A0 The fact<br>
=C2=A0 =C2=A0 that ceil() is not globally available in the Linux kernel, wh=
ich<br>
=C2=A0 =C2=A0 motivated the original, seems a bit irrelevant, hence the cha=
nge.<br>
<br>
=C2=A0 =C2=A0 Reported-by: Mark Morrissey &lt;<a href=3D"mailto:markem@pdx.=
edu" target=3D"_blank">markem@pdx.edu</a>&gt;<br>
=C2=A0 =C2=A0 Signed-off-by: Paul E. McKenney &lt;<a href=3D"mailto:paulmck=
@linux.ibm.com" target=3D"_blank">paulmck@linux.ibm.com</a>&gt;<br>
<br>
diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex<br>
index fe8f445851e3..0ba7ebd04fe6 100644<br>
--- a/SMPdesign/SMPdesign.tex<br>
+++ b/SMPdesign/SMPdesign.tex<br>
@@ -1177,7 +1177,7 @@ this book.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $m$ rounded up to the next multiple of $s$, as =
follows:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \begin{equation}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p =3D s \left \lflo=
or \frac{m + s - 1}{s} \right \rfloor<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p =3D s \left \lcei=
l \frac{m}{s} \right \rceil<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \label{sec:SMPdesign:p}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \end{equation}<br>
<br>
<br>
</blockquote></div>

--0000000000008796e2057d76781f--

