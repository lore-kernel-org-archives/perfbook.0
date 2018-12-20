Return-Path: <markem@pdx.edu>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdx-edu.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ubChLG26nDqlrc+VqymyRfTBpo6ckXrIujV52LimgHE=;
        b=0EPN35DJ7Vc3z5BGZRONt2EbJFu2HT9WJz125vBCEcvot9YfwazX8NDwGRC/jDkH+b
         pj5aPb9X+vLIRH5qEhoUjz6fXKSf0f0Cv6k+IynWG9EN/2AWnbgY1nIITqTgO5O2Of2t
         Jj1oCW1fSEEdFx7X/NOS9obaP5rX2FcgHoT8HoYjoiGRaAtJV9vy9uSZeziAVWBlfXED
         vjKB3deY+raiR6kvDuodwuPIgrM+ersrS4Lcpb1W4ODikxMo1diEJOYFbnXbBZjH+J4r
         mVLgrR2rwRzbIjnmIZsb18qb+RuFzYSXBhS2wvgRBukdMqq30RIxmaFkKTQbv0o5A+cU
         oRRQ==
MIME-Version: 1.0
References: <CAGnMLyzE5pjntT4Hz1PZaLKbz-2LSP=ziK60yWyNbwr4=WBdAg@mail.gmail.com>
 <20181220004525.GZ4170@linux.ibm.com>
In-Reply-To: <20181220004525.GZ4170@linux.ibm.com>
From: Mark Morrissey <markem@pdx.edu>
Date: Wed, 19 Dec 2018 17:13:01 -0800
Message-ID: <CAGnMLyyOaXro0g1q7ipnQVk1ei0dwiQGwqROBH+F=JoQmkoOzA@mail.gmail.com>
Subject: Re: Parallel programming book query
Content-Type: multipart/alternative; boundary="0000000000009215e7057d69d5e8"
To: Paul McKenney <paulmck@linux.ibm.com>
Cc: alexey.roytman@oracle.com, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

--0000000000009215e7057d69d5e8
Content-Type: text/plain; charset="UTF-8"

I agree that it is equivalent to:

p = s * ceil(m/s)

But why not just perform that calculation? If it is based on either
efficiency or clock cycles, I don't see it. I admit to not having looked at
the implementation of the ceil() library routine. If I should look at
ceil(), then just slap me and I will understand.

--mark
--
Mark Morrissey, markem@pdx.edu
Senior Instructor, Computer Science
Portland State University


On Wed, Dec 19, 2018 at 4:45 PM Paul E. McKenney <paulmck@linux.ibm.com>
wrote:

> On Mon, Dec 17, 2018 at 01:04:37PM -0800, Mark Morrissey wrote:
> > Hi Paul,
> >
> > I am looking at your parallel programming book, 12/5/2018 version. In
> > formula E.6, you use the floor function rather than the ceiling function.
> > Is this deliberate or perhaps in error?
>
> Good question!
>
> The intent is that the "+ s - 1" in the numerator does the upwards part
> of the rounding, and the floor function does the rest.
>
> Or am I missing something here?  It should be possible to express this
> in terms of the ceiling function, though that would be further removed
> from C code implementing this equation.
>
> Adding Alexey and the list on CC.  This is on page 423 (PDF page 435) of
>
> https://mirrors.edge.kernel.org/pub/linux/kernel/people/paulmck/perfbook/perfbook.2018.12.08a.pdf
>
>                                                         Thanx, Paul
>
>

--0000000000009215e7057d69d5e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I agree that it is equivalent to:<div><br></div><div>p =3D=
 s * ceil(m/s)</div><div><br></div><div>But why not just perform that calcu=
lation? If it is based on either efficiency or clock cycles, I don&#39;t se=
e it. I admit to not having looked at the implementation of the ceil() libr=
ary routine. If I should look at ceil(), then just slap me and I will under=
stand.</div><div><br></div><div>--mark<br clear=3D"all"><div><div dir=3D"lt=
r" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D=
"ltr"><div><div dir=3D"ltr"><div style=3D"font-size:small">--</div><div sty=
le=3D"font-size:small">Mark Morrissey, <a href=3D"mailto:markem@pdx.edu" ta=
rget=3D"_blank">markem@pdx.edu</a></div><div style=3D"font-size:small">Seni=
or Instructor, Computer Science</div><div style=3D"font-size:small">Portlan=
d State University</div></div></div></div></div></div><br></div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Dec 19, 2018 at 4:45 PM =
Paul E. McKenney &lt;<a href=3D"mailto:paulmck@linux.ibm.com">paulmck@linux=
.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Mon, Dec 17, 2018 at 01:04:37PM -0800, Mark Morrissey wrote:<br>
&gt; Hi Paul,<br>
&gt; <br>
&gt; I am looking at your parallel programming book, 12/5/2018 version. In<=
br>
&gt; formula E.6, you use the floor function rather than the ceiling functi=
on.<br>
&gt; Is this deliberate or perhaps in error?<br>
<br>
Good question!<br>
<br>
The intent is that the &quot;+ s - 1&quot; in the numerator does the upward=
s part<br>
of the rounding, and the floor function does the rest.<br>
<br>
Or am I missing something here?=C2=A0 It should be possible to express this=
<br>
in terms of the ceiling function, though that would be further removed<br>
from C code implementing this equation.<br>
<br>
Adding Alexey and the list on CC.=C2=A0 This is on page 423 (PDF page 435) =
of<br>
<a href=3D"https://mirrors.edge.kernel.org/pub/linux/kernel/people/paulmck/=
perfbook/perfbook.2018.12.08a.pdf" rel=3D"noreferrer" target=3D"_blank">htt=
ps://mirrors.edge.kernel.org/pub/linux/kernel/people/paulmck/perfbook/perfb=
ook.2018.12.08a.pdf</a><br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Thanx, Paul<br>
<br>
</blockquote></div>

--0000000000009215e7057d69d5e8--

