Return-Path: <SRS0=yRAN=4L=gmail.com=dimhen@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XZh1FF93tumuASqHG9QGmQaUAIx1SQCnVqfcIj4CEao=;
        b=CkevAiPdF4H6246RkchNwvh0Y70J6zhNJM/aDfQja2wcAmD3uowPtwZWuelieD5EPz
         D45JLDWSw3xgyStzWhoLv68Fy/sVqdl0oZhHLr7VEJiWlCxDVUjMN8spaTNkOUILgavs
         mvLkNt0eaQomuD68bT7otUgGdu9nsTsLy1/Xn1yu5fHlw16JyfiNucOgh7DU1byuLhr6
         PUlrIY58i411uBTFw3ZZg8qTCcf57QliUw8+ShTIQ6ZnxrnP4a6UTH6SqQRVRbQ1WKej
         RW9ZGjD7Pd5stpbWAubN35WPjlS3BWSenid7c6zh8iCysQTlSNfQbd2nZx1qFTl7YPEb
         flwg==
MIME-Version: 1.0
References: <20200223153317.GA23764@paulmck-ThinkPad-P72> <CADJjh6mRc4z5mUY73EVEvUZwTddB+x0f6sDOUnb61nauDjt7kA@mail.gmail.com>
 <20200223184730.GF2935@paulmck-ThinkPad-P72>
In-Reply-To: <20200223184730.GF2935@paulmck-ThinkPad-P72>
From: =?UTF-8?B?0JTQvNC40YLRgNC40Lkg0JTRjNGP0YfQtdC90LrQvg==?= <dimhen@gmail.com>
Date: Sun, 23 Feb 2020 23:52:25 +0300
Message-ID: <CADJjh6keJo0F+97nb_CF_U5g-3rG0JPb-M5bmTL0tyHMsaUCyg@mail.gmail.com>
Subject: Re: Towards second edition
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: paulmck@kernel.org
Cc: akiyks@gmail.com, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hello, Paul,

I check FAQ-BUILD.txt and find Q. 10.A
" ... and TeX Live releases prior to 2020 (epigraph)".

I update livetex today and probably I have the latest epigraph' version
./texlive/texmf-dist/tex/latex/epigraph:
total 8
-rw-r--r--. 1 dima dima 4602 Jan  3 01:06 epigraph.sty

To avoid make clean/make problems I
-- rm build-perfbook
-- update perfbook
-- copy perfbook into build-perfbook
-- run make in clean dir.

I use Fedora 31 up-to-day, x86_64.

I 'll try tomorrow to find the first commit after 07 feb with errors.

Thank you,
Dmitry

=D0=B2=D1=81, 23 =D1=84=D0=B5=D0=B2=D1=80. 2020 =D0=B3. =D0=B2 21:47, Paul =
E. McKenney <paulmck@kernel.org>:
>
> On Sun, Feb 23, 2020 at 07:49:32PM +0300, =D0=94=D0=BC=D0=B8=D1=82=D1=80=
=D0=B8=D0=B9 =D0=94=D1=8C=D1=8F=D1=87=D0=B5=D0=BD=D0=BA=D0=BE wrote:
> > Hello!
> >
> > I build perfbook sometimes and try build today after read 'Toward secon=
d
> > edition' letter.
> > I use up-to-day livetex and up-to-day perfbook.
> >
> > 07-feb-2020 build PASS.
> > Today build FAIL [1].
>
> Hello, Dmitry,
>
> There was a change in the build system to fix a rendering problem.
> Could you please check recent changes to FAQ-BUILD.txt and see if they
> apply to you?  It might be necessary for you download epigraph.zip,
> depending on what distro version you happen to be using.  (I had to
> download it, for example.)
>
> Either way, does "make clean" followed by "make" help?
>
>                                                         Thanx, Paul
>
> > Thank you,
> > Dmitry
> >
> > [1] make
> > [...]
> > echo > origpub.tex
> > latexpand --empty-comments perfbook.tex 1> perfbook_flat.tex 2> /dev/nu=
ll
> > sh utilities/extractqqz.sh < perfbook_flat.tex | perl utilities/
> > qqzreorder.pl > qqz.tex
> > cat perfbook_flat.tex qqz.tex | sh utilities/extractcontrib.sh > contri=
b.tex
> > sh utilities/extractorigpub.sh < perfbook_flat.tex > origpub.tex
> > sh utilities/runfirstlatex.sh perfbook
> > pdflatex 1 for perfbook.pdf
> >
> > LaTeX Warning: Reference `ln:toolsoftrade:Inviting a Store-to-Load
> > Conversion:l
> > oad:p' on page 42 undefined on input line 1988.
> >
> >
> > ! Package examplep Error: \PVerb inner delimiter must be brace,
> > (examplep)                not backslash or control sequence or active c=
har.
> >
> > See the examplep package documentation for explanation.
> > Type  H <return>  for immediate help.
> >  ...
> >
> > l.1988 ...load:p} fetches \co{p}, but the \qco{if}
> >                                                    statement on
> > ?
> > ! Emergency stop.
> >  ...
> >
> > l.1988 ...load:p} fetches \co{p}, but the \qco{if}
> >                                                    statement on
> > Try typing  <return>  to proceed.
> > ----- Fatal latex error, see perfbook.log for details. -----
> > make: *** [Makefile:183: perfbook.aux] =D0=9E=D1=88=D0=B8=D0=B1=D0=BA=
=D0=B0 1
> > Command exited with non-zero status 2
> >
> > =D0=B2=D1=81, 23 =D1=84=D0=B5=D0=B2=D1=80. 2020 =D0=B3. =D0=B2 18:33, P=
aul E. McKenney <paulmck@kernel.org>:
> >
> > > Hello!
> > >
> > > I finally found and fixed the rcu_barrier() bug [1], so I should agai=
n
> > > be able to devote some big-system test time to redoing performance
> > > results in perfbook.  Once that is done, I expect that it is time for
> > > the second edition.
> > >
> > > I might also convert the blank page hiding the solution to the Dining
> > > Philosophers Problem to a quick quiz, but I consider this optional.
> > >
> > > Are there any other changes that are needed? [2]
> > >
> > >                                                         Thanx, Paul
> > >
> > >
> > > [1] The fix is at 77abca1c358a ("rcu: Make rcu_barrier() account for
> > >     offline no-CBs CPUs") in -rcu, in case anyone is curious.
> > >
> > > [2] Here is a list of some things that I believe can follow the secon=
d
> > >     edition:
> > >
> > >         Expand lock-free algorithm discussion to include LIFO push,
> > >         illustrating the infamous pointer-zap issue.  (See ISO SC22
> > >         WG21 P1726R3, which should appear in a couple of weeks, for
> > >         more details.)
> > >
> > >         Add text describing the Issaquah Challenge.
> > >
> > >         Add text describing skiplists, one of the more concurrency
> > >         friendly data structures.
> > >
> > >         Add text describing data-race detectors such as KCSAN.  (This=
 needs
> > >         to wait for more Linux-kernel experience.)
> > >
> > >         Additional material from todo.txt.  ;-)
> > >
