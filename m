Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e32.co.us.ibm.com ([32.97.110.150]:50429 "EHLO
 e32.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1757086AbcEENV5 (ORCPT	<rfc822;perfbook@vger.kernel.org>); Thu, 5 May 2016
 09:21:57 -0400
Received: from localhost	by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Thu, 5 May 2016
 07:21:56 -0600
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])	by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id
 A97F61FF001E	for <perfbook@vger.kernel.org>; Thu, 5 May 2016 07:21:38 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u45DLrU536044932	for <perfbook@vger.kernel.org>; Thu, 5 May 2016 13:21:53 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u45DLqH2007504	for <perfbook@vger.kernel.org>; Thu, 5 May 2016 09:21:52 -0400
Date: Thu, 5 May 2016 06:21:53 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [GIT PULL FOR TEST v2] Another round of build script tweaks
Message-ID: <20160505132153.GG3750@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <3d253c44-5f0d-a809-119d-70f0ba38000e@gmail.com>
 <13c274c8-bde5-b13c-7c1b-64731a2298c2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13c274c8-bde5-b13c-7c1b-64731a2298c2@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, May 05, 2016 at 08:35:45AM +0900, Akira Yokosawa wrote:
> On 2016/05/05 0:39, Akira Yokosawa wrote:
> > Hi, Paul.
> > 
> > Finally, I set up a GitHub account, and pushed v2 of the series
> > "Another round of build script tweaks".
> > 
> > Please pull this into your local test branch and take time to see if
> > it actually works as you would expect. I'm fairly certain there would
> > be some regression, especially in the final commit 92ae43c3a72a
> > ("Further improvement of build scripts").
> > I'm also concerned about the fix of sig-theft.dot.
> > 
> > Changes from v1.
> >     Reorganized the entire series so that minor changes would come
> >     first.
> > 
> > Note: While I set up the account, I noticed a typo in my git-config
> > setting of user.email.  My email address in the commit messages so
> > far was wrong. Sorry for the slip-up...

So akiysw@gmail.com is wrong and akiyks@gmail.com is correct, right?
Looks like it from the email archives.

And in general, this looks to be good cleanup work.  I do have some
questions and comments below.

> >                                                 Thanks, Akira
> > 
> > ---
> > The following changes since commit 3f8bb7d620edee44637be00ba738761a4fc0732e:
> > 
> >   .gitignore: Add planned empty targets (2016-05-03 17:49:50 -0700)
> > 
> > are available in the git repository at:
> > 
> >   https://github.com/akiyks/perfbook.git makefile-tweaks-v2
> > 
> > for you to fetch changes up to 92ae43c3a72a3bcd7fd99ac681209ceafc6d7e65:
> > 
> >   Further improvement of build scripts (2016-05-04 23:43:06 +0900)
> > 
> > ----------------------------------------------------------------
> > Akira Yokosawa (7):
> >       Add font installation check

Hmmm...  The numbering is a bit inconsistent.  And there are a lot of
build questions.  We should place the trouble-shooting questions (1-4)
to a FAQ-build.txt file.  Then have FAQ.txt file question #1's answer be
"See FAQ-build.txt".  And then renumber the remaining FAQ.txt questions.

Would you be willing to do this?

Also, please delete "have ever" from "If you have ever built" in the
first line of the answer.

> >       Add short name targets in Makefile

For this one, the answer should also mention "make hb" for the
perfbook-hb.pdf that is useful for making hard-bound printouts.

> >       sig-theft: Fix .dot source for dot - graphviz version 2.36.0

Looks good!

> >       Make default target of "make" overridable

This one should mention "hb" as well.

> >       Makefile: Reorder rules

Looks good!

> >       Makefile: Use wildcards

Hmmm...  I didn't know that you could do this.  Something about having
started using "make" more than 30 years ago, I guess.

For BIBSOURCES, please do "BIBSOURCES = bib/*.bib" on one line.  I do
not expect multiple bibliography directories.

The dot files should probably be processed in the same way -- I added
them at different times, and apparently didn't make the processing
consistent.  As long as you are fixing things, this would be good to
fix as well.

> >       Further improvement of build scripts

I don't understand the point of interchanging the 1c and 2c rules.

I don't understand why perfbook.pdf no longer depends on extraction.
Ah, I see, the dependency is still there, but via perfbook.bbl and
perfbook_aux.

Rather than create "perfbook_aux" and "extraction" files, wouldn't it be
more natural for perfbook.aux to depend on contrib.tex and origpub.tex,
and then have separate rules to generate each of these files?  Ditto
or perfbook-bh_aux, and perfbook-1c_aux.

I do see the point of the "embedfonts" file -- nothing really to depend
on otherwise, since the files are fixed up in place.  So I am OK with
that one.

							Thanx, Paul

> >  .gitignore            |   1 -
> >  FAQ.txt               |  23 ++++
> >  Makefile              | 336 ++++++++++++++++++-------------------------------
> >  count/sig-theft.dot   |  17 +--
> >  count/sig-theft.eps   | 338 +++++++++++++++++++++++---------------------------
> >  utilities/eps2pdf.sh  |  12 ++
> >  utilities/runlatex.sh |   9 ++
> >  7 files changed, 333 insertions(+), 403 deletions(-)
> > 
> 
> There was a regression in Makefile that prevents build after "make distclean".
> The fix is pushed.
> 
> --- 
> The following changes since commit 92ae43c3a72a3bcd7fd99ac681209ceafc6d7e65:
> 
>   Further improvement of build scripts (2016-05-04 23:43:06 +0900)
> 
> are available in the git repository at:
> 
>   https://github.com/akiyks/perfbook.git makefile-tweaks-v2
> 
> for you to fetch changes up to c496b1d5c45dec5401658449d049d2b4e70148c4:
> 
>   Fix regression in Makefile (2016-05-05 08:23:46 +0900)
> 
> ----------------------------------------------------------------
> Akira Yokosawa (1):
>       Fix regression in Makefile
> 
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 

