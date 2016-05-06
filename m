Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e32.co.us.ibm.com ([32.97.110.150]:37254 "EHLO
 e32.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1752594AbcEFLJm (ORCPT	<rfc822;perfbook@vger.kernel.org>); Fri, 6 May 2016
 07:09:42 -0400
Received: from localhost	by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Fri, 6 May 2016
 05:09:40 -0600
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27])	by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id
 DE2B819D803F	for <perfbook@vger.kernel.org>; Fri, 6 May 2016 05:09:20 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u46B9aIt34537484	for <perfbook@vger.kernel.org>; Fri, 6 May 2016 11:09:36 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u46B9aP7024969	for <perfbook@vger.kernel.org>; Fri, 6 May 2016 07:09:36 -0400
Date: Fri, 6 May 2016 04:09:35 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [GIT PULL FOR TEST v2] Another round of build script tweaks
Message-ID: <20160506110935.GA3593@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <3d253c44-5f0d-a809-119d-70f0ba38000e@gmail.com>
 <13c274c8-bde5-b13c-7c1b-64731a2298c2@gmail.com>
 <20160505132153.GG3750@linux.vnet.ibm.com>
 <5864f027-b0dd-ee44-0005-c9fb289bc8cc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5864f027-b0dd-ee44-0005-c9fb289bc8cc@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, May 06, 2016 at 08:47:13AM +0900, Akira Yokosawa wrote:
> On 2016/05/05 06:21:53 -0700, Paul E. McKenney wrote:
> > On Thu, May 05, 2016 at 08:35:45AM +0900, Akira Yokosawa wrote:
> >> On 2016/05/05 0:39, Akira Yokosawa wrote:
> >>> Hi, Paul.
> >>>
> >>> Finally, I set up a GitHub account, and pushed v2 of the series
> >>> "Another round of build script tweaks".
> >>>
> >>> Please pull this into your local test branch and take time to see if
> >>> it actually works as you would expect. I'm fairly certain there would
> >>> be some regression, especially in the final commit 92ae43c3a72a
> >>> ("Further improvement of build scripts").
> >>> I'm also concerned about the fix of sig-theft.dot.
> >>>
> >>> Changes from v1.
> >>>     Reorganized the entire series so that minor changes would come
> >>>     first.
> >>>
> >>> Note: While I set up the account, I noticed a typo in my git-config
> >>> setting of user.email.  My email address in the commit messages so
> >>> far was wrong. Sorry for the slip-up...
> > 
> > So akiysw@gmail.com is wrong and akiyks@gmail.com is correct, right?
> > Looks like it from the email archives.
> 
> Yes, that's right.
> 
> > And in general, this looks to be good cleanup work.  I do have some
> > questions and comments below.
> 
> OK.
> 
> > 
> >>>                                                 Thanks, Akira
> >>>
> >>> ---
> >>> The following changes since commit 3f8bb7d620edee44637be00ba738761a4fc0732e:
> >>>
> >>>   .gitignore: Add planned empty targets (2016-05-03 17:49:50 -0700)
> >>>
> >>> are available in the git repository at:
> >>>
> >>>   https://github.com/akiyks/perfbook.git makefile-tweaks-v2
> >>>
> >>> for you to fetch changes up to 92ae43c3a72a3bcd7fd99ac681209ceafc6d7e65:
> >>>
> >>>   Further improvement of build scripts (2016-05-04 23:43:06 +0900)
> >>>
> >>> ----------------------------------------------------------------
> >>> Akira Yokosawa (7):
> >>>       Add font installation check
> > 
> > Hmmm...  The numbering is a bit inconsistent.  And there are a lot of
> > build questions.  We should place the trouble-shooting questions (1-4)
> > to a FAQ-build.txt file.  Then have FAQ.txt file question #1's answer be
> > "See FAQ-build.txt".  And then renumber the remaining FAQ.txt questions.
> > 
> > Would you be willing to do this?
> 
> Will do.
> 
> > Also, please delete "have ever" from "If you have ever built" in the
> > first line of the answer.
> 
> Will do
> 
> >>>       Add short name targets in Makefile
> > 
> > For this one, the answer should also mention "make hb" for the
> > perfbook-hb.pdf that is useful for making hard-bound printouts.
> 
> I see.
> 
> > 
> >>>       sig-theft: Fix .dot source for dot - graphviz version 2.36.0
> > 
> > Looks good!
> > 
> >>>       Make default target of "make" overridable
> > 
> > This one should mention "hb" as well.
> 
> You mean in FAQ-BUILD.txt?

Yes, please.

> >>>       Makefile: Reorder rules
> > 
> > Looks good!
> > 
> >>>       Makefile: Use wildcards
> > 
> > Hmmm...  I didn't know that you could do this.  Something about having
> > started using "make" more than 30 years ago, I guess.
> > 
> > For BIBSOURCES, please do "BIBSOURCES = bib/*.bib" on one line.  I do
> > not expect multiple bibliography directories.
> 
> Will do.
> 
> > The dot files should probably be processed in the same way -- I added
> > them at different times, and apparently didn't make the processing
> > consistent.  As long as you are fixing things, this would be good to
> > fix as well.
> 
> So, the old one (dot -> eps) seems to be used because you want to convert
> the font to embeddable one. This is the way you want both .dot files
> (and other files to be added in the future) are handled?

I am not going to be that specific.  ;-)

You are right, the fonts must be embeddable because otherwise the various
Internet printing services cannot handle the resulting PDF.  Which might
well mean that the new one is broken -- I use the Internet printing
services only once every few years, so I would not have seen the bug.

> >>>       Further improvement of build scripts
> > 
> > I don't understand the point of interchanging the 1c and 2c rules.
> 
> Ah, I put the one corresponding to the default target above.
> But there was no point doing that. Will fix.
> 
> > I don't understand why perfbook.pdf no longer depends on extraction.
> > Ah, I see, the dependency is still there, but via perfbook.bbl and
> > perfbook_aux.
> > 
> > Rather than create "perfbook_aux" and "extraction" files, wouldn't it be
> > more natural for perfbook.aux to depend on contrib.tex and origpub.tex,
> > and then have separate rules to generate each of these files?  Ditto
> > or perfbook-bh_aux, and perfbook-1c_aux.
> 
> Well, perfbook_aux seems unnecessary if perfbook.bbl is touched just
> before perfbook.pdf in runlatex.sh.
> 
> contrib.tex and origpub.tex are tricky here. I'll try to explain.
> 
> There are loops in dependency around perfbook_flat.tex
> 
> perfbook_flat.tex requires an empty qqz.tex and up-to-date
> contrib.tex and origpub.tex for texexpand to work properly.
> 
> Both contrib.tex and origpub.tex requires perfbook_flat.tex.
> contrib.tex also requires up-to-date qqz.tex.
> 
> So at first glance, rules for contrib.tex and origpub.tex
> can be added, but that requires extraction to be a phony
> target.
> 
> extraction is prerequisite for perfbook.aux.
> If you make it a phony target, the rule for perfbook.aux is
> always executed. That means runfirstlatex.run will run even
> if no source file is updated.
> 
> Does the above explanation answer your question?

I had forgotten about that complication, thank you for the explanation.

> I may have missed something here. My original intention was
> to remove qqz.tex, contrib.tex and origpub.tex from the
> repository. I'd be happy if that can be done without any
> regression.

I would be fine with them being removed.

> > I do see the point of the "embedfonts" file -- nothing really to depend
> > on otherwise, since the files are fixed up in place.  So I am OK with
> > that one.
> > 
> > 							Thanx, Paul
> 
> Is it OK to commit the fixes on the makefile-tweaks-v2 branch?

Make the above changes, and I will commit it.  "git rebase -i" is
of course your friend for this task.

> And there is a related question I'd like to ask.
> 
> Is the target perfbook_html actively maintained?
> When I tried this, I got a plenty of warning messages and the
> html files generated under perfbook_html seemed incomplete.
> Is there any prerequisite package for this to work?

The perfbook_html never did work very well.  The people asking for it
eventually decided that perfbook-1c.pdf worked well enough for them.
I would be fine with perfbook_html being removed.  Or fixed, just in
case someone has created a good latex-to-html conversion tool since
I last looked.  When I last looked, the coversion looked great unless
you looked closely.  It tended to corrupt some figures.

							Thanx, Paul

>                                                      Thanks, Akira
> > 
> >>>  .gitignore            |   1 -
> >>>  FAQ.txt               |  23 ++++
> >>>  Makefile              | 336 ++++++++++++++++++-------------------------------
> >>>  count/sig-theft.dot   |  17 +--
> >>>  count/sig-theft.eps   | 338 +++++++++++++++++++++++---------------------------
> >>>  utilities/eps2pdf.sh  |  12 ++
> >>>  utilities/runlatex.sh |   9 ++
> >>>  7 files changed, 333 insertions(+), 403 deletions(-)
> >>>
> >>
> >> There was a regression in Makefile that prevents build after "make distclean".
> >> The fix is pushed.
> >>
> >> --- 
> >> The following changes since commit 92ae43c3a72a3bcd7fd99ac681209ceafc6d7e65:
> >>
> >>   Further improvement of build scripts (2016-05-04 23:43:06 +0900)
> >>
> >> are available in the git repository at:
> >>
> >>   https://github.com/akiyks/perfbook.git makefile-tweaks-v2
> >>
> >> for you to fetch changes up to c496b1d5c45dec5401658449d049d2b4e70148c4:
> >>
> >>   Fix regression in Makefile (2016-05-05 08:23:46 +0900)
> >>
> >> ----------------------------------------------------------------
> >> Akira Yokosawa (1):
> >>       Fix regression in Makefile
> >>
> >>  Makefile | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> > 
> > 
> 

