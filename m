Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e33.co.us.ibm.com ([32.97.110.151]:33223 "EHLO
 e33.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1752592AbcEGNUn (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sat, 7 May 2016
 09:20:43 -0400
Received: from localhost	by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sat, 7 May 2016
 07:20:42 -0600
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23])	by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id
 999C619D8040	for <perfbook@vger.kernel.org>; Sat, 7 May 2016 07:20:23 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u47DKdXj36700318	for <perfbook@vger.kernel.org>; Sat, 7 May 2016 13:20:39 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u47DKdQb001335	for <perfbook@vger.kernel.org>; Sat, 7 May 2016 09:20:39 -0400
Date: Sat, 7 May 2016 06:20:39 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [GIT PULL v3] Another round of build script tweaks
Message-ID: <20160507132039.GN3593@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <3d253c44-5f0d-a809-119d-70f0ba38000e@gmail.com>
 <13c274c8-bde5-b13c-7c1b-64731a2298c2@gmail.com>
 <20160505132153.GG3750@linux.vnet.ibm.com>
 <5864f027-b0dd-ee44-0005-c9fb289bc8cc@gmail.com>
 <20160506110935.GA3593@linux.vnet.ibm.com>
 <9bef63f8-e639-598f-c422-573e178b261d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bef63f8-e639-598f-c422-573e178b261d@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, May 07, 2016 at 09:06:18AM +0900, Akira Yokosawa wrote:
> Hi, Paul.
> 
> On 2016/05/06 04:09:35 -0700, Paul E. McKenney wrote:
> > On Fri, May 06, 2016 at 08:47:13AM +0900, Akira Yokosawa wrote:
> >> Is it OK to commit the fixes on the makefile-tweaks-v2 branch?
> > 
> > Make the above changes, and I will commit it.  "git rebase -i" is
> > of course your friend for this task.
> > 
> 
> It seems there were no advance in master since then, so rebase was
> not necessary.

The issue is not master moving.  If I do move it in the next little
bit, it will be for changes under CodeSamples, which won't conflict
with your changes anyway.  So for me it will be a simple merge, not
a problem at all.

I am instead asking you to rebase in order to put the changes I
requested into a few of the earlier patches.  For example:

	git branch makefile-tweaks-v3
	git rebase -i origin/master origin/master makefile-tweaks-v3

Creating the branch allows you to keep the history.  This is important,
as it allows you to do this as a check after you are done:

	git diff makefile-tweaks-v2

Any diffs should of course correspond to intentional changes.

Alternatively, you can do the following:

	git checkout -b makefile-tweaks-v3 origin/master

Then for each commit ID "X":

	git cherry-pick -n X
	# Do any needed editing
	git commit -a -s

At the end, you can again use "git diff" to check your work.

You don't have a huge number of commits, so either way will work well.
If you had (say) 20 commits, "git rebase -i" would work much better.

> Pull request follows. Note that this is relative to the last one.
> Do you prefer a request relative to the current master?

Please!  That allows you to create FAQ-BUILD.txt to start with and
have your changes relative to that.

>                                            Thanks, Akira
> --- 
> The following changes since commit c496b1d5c45dec5401658449d049d2b4e70148c4:
> 
>   Fix regression in Makefile (2016-05-05 08:23:46 +0900)
> 
> are available in the git repository at:
> 
>   https://github.com/akiyks/perfbook.git makefile-tweaks-v2
> 
> for you to fetch changes up to 8e169b78cd71b72afecfd4c2ad5843119da974fe:
> 
>   Makefile: Add comment on why 'extraction' is an empty target (2016-05-07 08:42:26 +0900)
> 
> ----------------------------------------------------------------
> Akira Yokosawa (5):
>       Place trouble-shooting questions to FAQ-BUILD.txt

Good!  But please make #1's answer be just:

		See FAQ-BUILD.txt for build information.  That way all
		the build information is in one place.

Then FAQ-BUILD.txt #1 should be something like "How to I build this?"
and the answer should be 'Install the Steel City Comic font and then
type "make".'  Then renumber the questions.

For FAQ-BUILD.txt #2, please change "I prefer perfbook-1c.pdf" to
"I prefer the single-column perfbook-1c.pdf".  This will make it
clear to people what they get from this.

For FAQ-BUILD.txt #3, please change the "will build perfbook.pdf" in the
last line of the answer to "will build the single-column perfbook.pdf".

For FAQ-BUILD.txt #4, in the last line of the answer, please change
"always works" to "will override the default specified by the
environment variable".

For FAQ-BUILD.txt #7, please update the final sentence of the answer
to take perfbook-hb.log into account.  For example, "Please send me the
log output (perfbook.log, perfbook-1c.log, or perfbook-hb.log,
depending on which you were building) so that I can fix the scripts.
This can be a separate commit, since it is a bug in my original.

>       Further tweaks of Makefile

Please remove the perfbook_html-related rules first, and then do the
update.  That way your changes will be a lot simpler.

>       rm qqz.tex and add store15tred.esp to repository

The "store15tred.esp" should be "store15tred.eps", right?  Please
update this commit's log.

>       Remove rules related to perfbook_html

As noted earlier, please do this removal before "Further tweaks of
Makefile".  (I am not asking you to move this to the very front
of all of your commits because I didn't ask you to remove this
until after you did those commits.  Though doing that might simplify
your series even more.)

>       Makefile: Add comment on why 'extraction' is an empty target

Very good addition, thank you!

							Thanx, Paul

>  .gitignore              |   10 +-
>  FAQ-BUILD.txt           |   80 +
>  FAQ.txt                 |   91 +-
>  Makefile                |   82 +-
>  advsync/store15tred.eps |  653 ++++
>  qqz.tex                 | 7707 -----------------------------------------------
>  utilities/runlatex.sh   |    6 +-
>  7 files changed, 785 insertions(+), 7844 deletions(-)
>  create mode 100644 FAQ-BUILD.txt
>  create mode 100644 advsync/store15tred.eps
>  delete mode 100644 qqz.tex
> 

