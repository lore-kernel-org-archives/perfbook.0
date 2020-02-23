Return-Path: <SRS0=yRAN=4L=gmail.com=dimhen@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jQXzRVWaQolMXDKYCrZV5oRDzyDqGpxFse5s6pIEeW8=;
        b=EYFkh1BIdMoKKw9rmOXfHZjtdafokTR9MZQSfDOaCHvCye0CYid2M5wc+EMhNkzq0j
         SyxVdQuc5r2kJsOJZdRgPnPxLSVwXDu1srR36FyximGKEdntVsBPGERI7FJe2FWmekf0
         WMBYMaZ1Hg6qLcA1ww+XSzQ1Wpyt6MWLovc5ctlIyRrahYciZZAvbePzKheMWJzUIc57
         ppayYq54rTDyF2zUIjv35aGC3/nNydA+atGfMl0hanziRmTSf9fj0dQ4DKRyYDbxB4dK
         gZDItiaoVMTMnhdh+kWx1n+0fL6zHMcrP6Mx34Z62Ta7wOCtgFHbQ2jxTf1D0p6U15Ml
         GMdQ==
MIME-Version: 1.0
References: <20200223153317.GA23764@paulmck-ThinkPad-P72>
In-Reply-To: <20200223153317.GA23764@paulmck-ThinkPad-P72>
From: =?UTF-8?B?0JTQvNC40YLRgNC40Lkg0JTRjNGP0YfQtdC90LrQvg==?= <dimhen@gmail.com>
Date: Sun, 23 Feb 2020 19:49:32 +0300
Message-ID: <CADJjh6mRc4z5mUY73EVEvUZwTddB+x0f6sDOUnb61nauDjt7kA@mail.gmail.com>
Subject: Re: Towards second edition
Content-Type: multipart/alternative; boundary="0000000000002124f3059f410c16"
To: paulmck@kernel.org
Cc: akiyks@gmail.com, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

--0000000000002124f3059f410c16
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

I build perfbook sometimes and try build today after read 'Toward second
edition' letter.
I use up-to-day livetex and up-to-day perfbook.

07-feb-2020 build PASS.
Today build FAIL [1].

Thank you,
Dmitry

[1] make
[...]
echo > origpub.tex
latexpand --empty-comments perfbook.tex 1> perfbook_flat.tex 2> /dev/null
sh utilities/extractqqz.sh < perfbook_flat.tex | perl utilities/
qqzreorder.pl > qqz.tex
cat perfbook_flat.tex qqz.tex | sh utilities/extractcontrib.sh > contrib.te=
x
sh utilities/extractorigpub.sh < perfbook_flat.tex > origpub.tex
sh utilities/runfirstlatex.sh perfbook
pdflatex 1 for perfbook.pdf

LaTeX Warning: Reference `ln:toolsoftrade:Inviting a Store-to-Load
Conversion:l
oad:p' on page 42 undefined on input line 1988.


! Package examplep Error: \PVerb inner delimiter must be brace,
(examplep)                not backslash or control sequence or active char.

See the examplep package documentation for explanation.
Type  H <return>  for immediate help.
 ...

l.1988 ...load:p} fetches \co{p}, but the \qco{if}
                                                   statement on
?
! Emergency stop.
 ...

l.1988 ...load:p} fetches \co{p}, but the \qco{if}
                                                   statement on
Try typing  <return>  to proceed.
----- Fatal latex error, see perfbook.log for details. -----
make: *** [Makefile:183: perfbook.aux] =D0=9E=D1=88=D0=B8=D0=B1=D0=BA=D0=B0=
 1
Command exited with non-zero status 2

=D0=B2=D1=81, 23 =D1=84=D0=B5=D0=B2=D1=80. 2020 =D0=B3. =D0=B2 18:33, Paul =
E. McKenney <paulmck@kernel.org>:

> Hello!
>
> I finally found and fixed the rcu_barrier() bug [1], so I should again
> be able to devote some big-system test time to redoing performance
> results in perfbook.  Once that is done, I expect that it is time for
> the second edition.
>
> I might also convert the blank page hiding the solution to the Dining
> Philosophers Problem to a quick quiz, but I consider this optional.
>
> Are there any other changes that are needed? [2]
>
>                                                         Thanx, Paul
>
>
> [1] The fix is at 77abca1c358a ("rcu: Make rcu_barrier() account for
>     offline no-CBs CPUs") in -rcu, in case anyone is curious.
>
> [2] Here is a list of some things that I believe can follow the second
>     edition:
>
>         Expand lock-free algorithm discussion to include LIFO push,
>         illustrating the infamous pointer-zap issue.  (See ISO SC22
>         WG21 P1726R3, which should appear in a couple of weeks, for
>         more details.)
>
>         Add text describing the Issaquah Challenge.
>
>         Add text describing skiplists, one of the more concurrency
>         friendly data structures.
>
>         Add text describing data-race detectors such as KCSAN.  (This nee=
ds
>         to wait for more Linux-kernel experience.)
>
>         Additional material from todo.txt.  ;-)
>

--0000000000002124f3059f410c16
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hello!<br></div><div><br></div><div>=
I build perfbook sometimes and try build today after read &#39;Toward secon=
d edition&#39; letter.</div><div></div><div>I use up-to-day livetex and up-=
to-day perfbook.</div><div><br></div><div>07-feb-2020 build PASS.<br></div>=
<div>Today build FAIL [1].</div><div><br></div><div>Thank you,<br></div><di=
v>Dmitry<br></div><div><br></div><div>[1] make</div><div>[...]<br></div><di=
v>echo &gt; origpub.tex<br>latexpand --empty-comments perfbook.tex 1&gt; pe=
rfbook_flat.tex 2&gt; /dev/null<br>sh utilities/extractqqz.sh &lt; perfbook=
_flat.tex | perl utilities/<a href=3D"http://qqzreorder.pl" target=3D"_blan=
k">qqzreorder.pl</a> &gt; qqz.tex<br>cat perfbook_flat.tex qqz.tex | sh uti=
lities/extractcontrib.sh &gt; contrib.tex<br>sh utilities/extractorigpub.sh=
 &lt; perfbook_flat.tex &gt; origpub.tex<br>sh utilities/runfirstlatex.sh p=
erfbook<br>pdflatex 1 for perfbook.pdf<br><br>LaTeX Warning: Reference `ln:=
toolsoftrade:Inviting a Store-to-Load Conversion:l<br>oad:p&#39; on page 42=
 undefined on input line 1988.<br><br><br>! Package examplep Error: \PVerb =
inner delimiter must be brace,<br>(examplep) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0not backslash or control sequence or active char=
.<br><br>See the examplep package documentation for explanation.<br>Type =
=C2=A0H &lt;return&gt; =C2=A0for immediate help.<br>=C2=A0... =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>l.1988 ...load:p} fetches \co{p}, but the \=
qco{if}<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0statement on<br>? <br>! Emerge=
ncy stop.<br>=C2=A0... =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>l.19=
88 ...load:p} fetches \co{p}, but the \qco{if}<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0statement on<br>Try typing =C2=A0&lt;return&gt; =C2=A0to proceed.=
<br>----- Fatal latex error, see perfbook.log for details. -----<br>make: *=
** [Makefile:183: perfbook.aux] =D0=9E=D1=88=D0=B8=D0=B1=D0=BA=D0=B0 1<br>C=
ommand exited with non-zero status 2</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">=D0=B2=D1=81, 23 =D1=84=D0=B5=D0=
=B2=D1=80. 2020 =D0=B3. =D0=B2 18:33, Paul E. McKenney &lt;<a href=3D"mailt=
o:paulmck@kernel.org">paulmck@kernel.org</a>&gt;:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Hello!<br>
<br>
I finally found and fixed the rcu_barrier() bug [1], so I should again<br>
be able to devote some big-system test time to redoing performance<br>
results in perfbook.=C2=A0 Once that is done, I expect that it is time for<=
br>
the second edition.<br>
<br>
I might also convert the blank page hiding the solution to the Dining<br>
Philosophers Problem to a quick quiz, but I consider this optional.<br>
<br>
Are there any other changes that are needed? [2]<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Thanx, Paul<br>
<br>
<br>
[1] The fix is at 77abca1c358a (&quot;rcu: Make rcu_barrier() account for<b=
r>
=C2=A0 =C2=A0 offline no-CBs CPUs&quot;) in -rcu, in case anyone is curious=
.<br>
<br>
[2] Here is a list of some things that I believe can follow the second<br>
=C2=A0 =C2=A0 edition:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Expand lock-free algorithm discussion to includ=
e LIFO push,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 illustrating the infamous pointer-zap issue.=C2=
=A0 (See ISO SC22<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 WG21 P1726R3, which should appear in a couple o=
f weeks, for<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 more details.)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Add text describing the Issaquah Challenge.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Add text describing skiplists, one of the more =
concurrency<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 friendly data structures.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Add text describing data-race detectors such as=
 KCSAN.=C2=A0 (This needs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 to wait for more Linux-kernel experience.)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Additional material from todo.txt.=C2=A0 ;-)<br=
>
</blockquote></div></div>

--0000000000002124f3059f410c16--
