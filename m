Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e34.co.us.ibm.com ([32.97.110.152]:36377 "EHLO
 e34.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1751934AbcENKNl (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sat, 14 May 2016
 06:13:41 -0400
Received: from localhost	by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sat, 14 May
 2016 04:13:40 -0600
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23])	by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id
 D5E443E40030	for <perfbook@vger.kernel.org>; Sat, 14 May 2016 04:13:37 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4EADbxY36634702	for <perfbook@vger.kernel.org>; Sat, 14 May 2016 10:13:37
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4EADbiZ015580	for <perfbook@vger.kernel.org>; Sat, 14 May 2016 06:13:37
 -0400
Date: Sat, 14 May 2016 02:55:55 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [GIT PULL v4] Another round of build script tweaks
Message-ID: <20160514095555.GI3608@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <3d253c44-5f0d-a809-119d-70f0ba38000e@gmail.com>
 <13c274c8-bde5-b13c-7c1b-64731a2298c2@gmail.com>
 <20160505132153.GG3750@linux.vnet.ibm.com>
 <5864f027-b0dd-ee44-0005-c9fb289bc8cc@gmail.com>
 <20160506110935.GA3593@linux.vnet.ibm.com>
 <9bef63f8-e639-598f-c422-573e178b261d@gmail.com>
 <20160507132039.GN3593@linux.vnet.ibm.com>
 <66044a40-906d-0c7c-afdd-d26da56db3c5@gmail.com>
 <20160511091727.GE3515@linux.vnet.ibm.com>
 <bdf1de74-2c82-dd00-39b3-1ec4e8e69137@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdf1de74-2c82-dd00-39b3-1ec4e8e69137@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, May 11, 2016 at 11:34:52PM +0900, Akira Yokosawa wrote:
> On 2016/05/11 02:17:27 -0700, Paul E. McKenney wrote:
> > On Sun, May 08, 2016 at 12:23:49AM +0900, Akira Yokosawa wrote:
> >> On 2016/05/07 06:20:39 -0700, Paul E. McKenney wrote:
> >>> On Sat, May 07, 2016 at 09:06:18AM +0900, Akira Yokosawa wrote:
> >>>> Hi, Paul.
> >>>>
> >>>> On 2016/05/06 04:09:35 -0700, Paul E. McKenney wrote:
> >>>>> On Fri, May 06, 2016 at 08:47:13AM +0900, Akira Yokosawa wrote:
> >>>>>> Is it OK to commit the fixes on the makefile-tweaks-v2 branch?
> >>>>>
> >>>>> Make the above changes, and I will commit it.  "git rebase -i" is
> >>>>> of course your friend for this task.
> >>>>>
> >>>>
> >>>> It seems there were no advance in master since then, so rebase was
> >>>> not necessary.
> >>>
> >>> The issue is not master moving.  If I do move it in the next little
> >>> bit, it will be for changes under CodeSamples, which won't conflict
> >>> with your changes anyway.  So for me it will be a simple merge, not
> >>> a problem at all.
> >>>
> >>> I am instead asking you to rebase in order to put the changes I
> >>> requested into a few of the earlier patches.  For example:
> >>>
> >>> 	git branch makefile-tweaks-v3
> >>> 	git rebase -i origin/master origin/master makefile-tweaks-v3
> >>>
> >>> Creating the branch allows you to keep the history.  This is important,
> >>> as it allows you to do this as a check after you are done:
> >>>
> >>> 	git diff makefile-tweaks-v2
> >>>
> >>> Any diffs should of course correspond to intentional changes.
> >>>
> >>> Alternatively, you can do the following:
> >>>
> >>> 	git checkout -b makefile-tweaks-v3 origin/master
> >>>
> >>> Then for each commit ID "X":
> >>>
> >>> 	git cherry-pick -n X
> >>> 	# Do any needed editing
> >>> 	git commit -a -s
> >>>
> >>> At the end, you can again use "git diff" to check your work.
> >>>
> >>> You don't have a huge number of commits, so either way will work well.
> >>> If you had (say) 20 commits, "git rebase -i" would work much better.
> >>>
> >>>> Pull request follows. Note that this is relative to the last one.
> >>>> Do you prefer a request relative to the current master?
> >>>
> >>> Please!  That allows you to create FAQ-BUILD.txt to start with and
> >>> have your changes relative to that.
> >>
> >> I see. Attached is the retry of the PULL request. I hope it is what you are
> >> expecting. In the future, I'll do things this way. There are a lot of things
> >> I need to learn regarding the workflow using git.
> > 
> > Understood, "git rebase" was a bit scary for me the first time I got a
> > conflict.  But could you please at least give it a try?  It is the only
> > way to become comfortable with it, and that skill is quite valuable.
> > 
> > 							Thanx, Paul
> 
> Hi, Paul.
> 
> This time, I tried "git rebase -i".
> 
> Made a branch makefile-tweaks-v4 on makefile-tweaks-v2, then did "git rebase -i".
> There actually were commits you pushed after makefile-tweaks-v2 was branched, so
> the rebase does have some meaning. (no conflict -- went smoothly)
> 
> Thank you for giving me a chance to try rebasing. Well, this is an interesting, or
> rather, amazing feature of git! 
> 
> Appended is the pull request of v4. Does this seem right?

Hello, Akira,

I have pulled this in and pushed it, thank you!

Next time we will work a bit more on your "git rebase" skills, but
this is good for this time.  ;-)

							Thanx, Paul

> ---
> Change from v3:
>     Rebased to the current master 08259a39f7dc ("Make spinlock primitives abort
>     on error for easier debugging") using "git rebase -i"
> 
> Changes from v2:
>     changes from "Fix regression in Makefile" to "Makefile: Add comment on why
>     'extraction' is an empty target".  In short, 
>         1) regression in v2 ("make distclean") is fixed
>         2) questions on build issues in FAQ.txt are moved to a new file FAQ-BUILD.txt,
>         3) use of empty targets "perfbook_aux", "perfbook-1c_aux" and
>            "perfbook-hb_aux" are abandoned and actual "perfbook.aux", etc. are
>            used instead,
>         4) rule for qqz.tex is added and qqz.tex is removed from the repository, 
>         5) rule for (.dot -> pdf) is removed and rule of (.dot -> .eps) is used
>            instead. store15tred.esp is added to the repository,
>         6) rules related to perfbook_html is removed,
> 
> Changes from v1:
>     Reorganized the entire series so that minor changes would come
>     first.
> 
> ---
> The following changes since commit 08259a39f7dccdd3aead9add883291678a017209:
> 
>   Make spinlock primitives abort on error for easier debugging (2016-05-06 10:46:51 -0700)
> 
> are available in the git repository at:
> 
>   https://github.com/akiyks/perfbook.git makefile-tweaks-v4
> 
> for you to fetch changes up to 7f46bce80811f24a1d623da37920964294c623be:
> 
>   Makefile: Add comment on why 'extraction' is an empty target (2016-05-11 22:54:49 +0900)
> 
> ----------------------------------------------------------------
> Akira Yokosawa (13):
>       Add font installation check
>       Add short name targets in Makefile
>       sig-theft: Fix .dot source for dot - graphviz version 2.36.0
>       Make default target of "make" overridable
>       Makefile: Reorder rules
>       Makefile: Use wildcards
>       Further improvement of build scripts
>       Fix regression in Makefile
>       Place trouble-shooting questions to FAQ-BUILD.txt
>       Further tweaks of Makefile
>       rm qqz.tex and add store15tred.esp to repository
>       Remove rules related to perfbook_html
>       Makefile: Add comment on why 'extraction' is an empty target
> 
>  .gitignore              |   11 +-
>  FAQ-BUILD.txt           |   80 +
>  FAQ.txt                 |   68 +-
>  Makefile                |  353 +--
>  advsync/store15tred.eps |  653 ++++
>  count/sig-theft.dot     |   17 +-
>  count/sig-theft.eps     |  338 +--
>  qqz.tex                 | 7707 -----------------------------------------------
>  utilities/eps2pdf.sh    |   12 +
>  utilities/runlatex.sh   |   13 +-
>  10 files changed, 1062 insertions(+), 8190 deletions(-)
>  create mode 100644 FAQ-BUILD.txt
>  create mode 100644 advsync/store15tred.eps
>  delete mode 100644 qqz.tex
> 

