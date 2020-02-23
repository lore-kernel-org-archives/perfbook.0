Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:60054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726208AbgBWSrb (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 23 Feb 2020 13:47:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582483650;
        bh=Spvojz+oVY1+pYUE0K2PcwEsm0R14csg/fLzbTkDaG4=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=kbsITWAp33o+chTpV75GACsf/lIlL7BPupdR1GBjZTu7v3mPdR9MiSIkDrqaOAunO
         4QJoywhH+ytfPfs+RCz8oUCu9TQmAt3jyPgQ/kcf2KXOY07bhn2h5gU864ia2rKcv6
         vRTJ6g2hzo13RGSzfnqXvQTb9+3FY3xv8tE+HJEI=
Date: Sun, 23 Feb 2020 10:47:30 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Towards second edition
Message-ID: <20200223184730.GF2935@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200223153317.GA23764@paulmck-ThinkPad-P72>
 <CADJjh6mRc4z5mUY73EVEvUZwTddB+x0f6sDOUnb61nauDjt7kA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADJjh6mRc4z5mUY73EVEvUZwTddB+x0f6sDOUnb61nauDjt7kA@mail.gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: =?utf-8?B?0JTQvNC40YLRgNC40Lkg0JTRjNGP0YfQtdC90LrQvg==?= <dimhen@gmail.com>
Cc: akiyks@gmail.com, perfbook@vger.kernel.org

On Sun, Feb 23, 2020 at 07:49:32PM +0300, Дмитрий Дьяченко wrote:
> Hello!
> 
> I build perfbook sometimes and try build today after read 'Toward second
> edition' letter.
> I use up-to-day livetex and up-to-day perfbook.
> 
> 07-feb-2020 build PASS.
> Today build FAIL [1].

Hello, Dmitry,

There was a change in the build system to fix a rendering problem.
Could you please check recent changes to FAQ-BUILD.txt and see if they
apply to you?  It might be necessary for you download epigraph.zip,
depending on what distro version you happen to be using.  (I had to
download it, for example.)

Either way, does "make clean" followed by "make" help?

							Thanx, Paul

> Thank you,
> Dmitry
> 
> [1] make
> [...]
> echo > origpub.tex
> latexpand --empty-comments perfbook.tex 1> perfbook_flat.tex 2> /dev/null
> sh utilities/extractqqz.sh < perfbook_flat.tex | perl utilities/
> qqzreorder.pl > qqz.tex
> cat perfbook_flat.tex qqz.tex | sh utilities/extractcontrib.sh > contrib.tex
> sh utilities/extractorigpub.sh < perfbook_flat.tex > origpub.tex
> sh utilities/runfirstlatex.sh perfbook
> pdflatex 1 for perfbook.pdf
> 
> LaTeX Warning: Reference `ln:toolsoftrade:Inviting a Store-to-Load
> Conversion:l
> oad:p' on page 42 undefined on input line 1988.
> 
> 
> ! Package examplep Error: \PVerb inner delimiter must be brace,
> (examplep)                not backslash or control sequence or active char.
> 
> See the examplep package documentation for explanation.
> Type  H <return>  for immediate help.
>  ...
> 
> l.1988 ...load:p} fetches \co{p}, but the \qco{if}
>                                                    statement on
> ?
> ! Emergency stop.
>  ...
> 
> l.1988 ...load:p} fetches \co{p}, but the \qco{if}
>                                                    statement on
> Try typing  <return>  to proceed.
> ----- Fatal latex error, see perfbook.log for details. -----
> make: *** [Makefile:183: perfbook.aux] Ошибка 1
> Command exited with non-zero status 2
> 
> вс, 23 февр. 2020 г. в 18:33, Paul E. McKenney <paulmck@kernel.org>:
> 
> > Hello!
> >
> > I finally found and fixed the rcu_barrier() bug [1], so I should again
> > be able to devote some big-system test time to redoing performance
> > results in perfbook.  Once that is done, I expect that it is time for
> > the second edition.
> >
> > I might also convert the blank page hiding the solution to the Dining
> > Philosophers Problem to a quick quiz, but I consider this optional.
> >
> > Are there any other changes that are needed? [2]
> >
> >                                                         Thanx, Paul
> >
> >
> > [1] The fix is at 77abca1c358a ("rcu: Make rcu_barrier() account for
> >     offline no-CBs CPUs") in -rcu, in case anyone is curious.
> >
> > [2] Here is a list of some things that I believe can follow the second
> >     edition:
> >
> >         Expand lock-free algorithm discussion to include LIFO push,
> >         illustrating the infamous pointer-zap issue.  (See ISO SC22
> >         WG21 P1726R3, which should appear in a couple of weeks, for
> >         more details.)
> >
> >         Add text describing the Issaquah Challenge.
> >
> >         Add text describing skiplists, one of the more concurrency
> >         friendly data structures.
> >
> >         Add text describing data-race detectors such as KCSAN.  (This needs
> >         to wait for more Linux-kernel experience.)
> >
> >         Additional material from todo.txt.  ;-)
> >
