Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e37.co.us.ibm.com ([32.97.110.158]:46058 "EHLO
 e37.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1751747AbcDWTXy (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sat, 23 Apr 2016
 15:23:54 -0400
Received: from localhost	by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sat, 23 Apr
 2016 13:23:53 -0600
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27])	by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id
 7E8E81FF001F	for <perfbook@vger.kernel.org>; Sat, 23 Apr 2016 13:23:36 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3NJNodN30867468	for <perfbook@vger.kernel.org>; Sat, 23 Apr 2016 19:23:50
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3NJNoMg022703	for <perfbook@vger.kernel.org>; Sat, 23 Apr 2016 15:23:50
 -0400
Date: Sat, 23 Apr 2016 12:24:23 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 0/3] qqz and runlatex improvements
Message-ID: <20160423192423.GQ3756@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <571B5FBE.6030005@gmail.com> <571B8D14.4090401@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <571B8D14.4090401@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Apr 23, 2016 at 11:56:20PM +0900, Akira Yokosawa wrote:
> On 2016/04/23 20:42, Akira Yokosawa wrote:
> >>From 0a9063f5bfc9a984b505fefe54d347f39e099f58 Mon Sep 17 00:00:00 2001
> > From: Akira Yokosawa <akiysw@gmail.com>
> > Date: Sat, 23 Apr 2016 20:37:29 +0900
> > Subject: [PATCH v2 0/3] qqz and runlatex improvements
> > 
> 
> Hi, Paul
> 
> I should have mentioned that this series is rebased to the current master
> 431a80df9d6e ("Fix build error on Fedora 23 with texlive").
> 
> Regarding to ("[PATCH v2 2/3] Improve behavior of build scripts"), I
> want to add some comments in the form of a reply to your previous feedback.
> As I refactored the script, please note that in-line comments do not
> exactly match the actual patch.

Feel free to update the comments either as part of your upcoming
series/pull, or as a separate follow-on patch.

> > To see what I am getting at, please add a "\ref{this is a typo}" or a
> > reference to any other non-\label string, then type "make".  This is a
> > pure error that no number of reruns will fix, but the build script will
> > nevertheless crank away multiple times.
> 
> I checked several intentional error cases for this patch. However, I'm
> sure you are the one who will use the scripts most heavily, you might
> find corner cases I'm not aware of. 

I tried a number of things, including adding undefined references,
deleting and re-adding full chapters, and so on.  It worked quite
well.

> > Before, it would run bibtex and stop.  (Which, I freely admit, wasn't
> > particularly good behavior either!)
> > 
> > My question is whether it is possible to make the script let the user
> > know why it is re-running latex, so that the user can choose to kill
> > it early, if appropriate.  Or, alternatively (and for extra credit!),
> > recognize which labels are undefined, and do more passes if they are
> > quick-quiz links.
> 
> I've not gone so far as to distinguish whether a warning is of a quick-quiz
> link or not, but I think current level of output should be quite useful
> for most of the cases. Please give it a try.

I am sure that further improvement is possible, but I definitely would
like to queue up what you currently have.  Please fix up the XXXX
strings in the commit logs and remove the trailing whitespace from
the second patch and resend, and I will queue the result.

							Thanx, Paul

> >> --- 
> >> #!/bin/sh
> >> # [snip]
> >> #
> >>
> >> if test -z "$1"
> >> then
> >> 	echo No latex file, aborting.
> >> 	exit 1
> >> fi
> >>
> >> basename=`echo $1 | sed -e 's/\.tex$//'`
> >>
> >> iter=1
> >> echo "pdflatex $iter"
> >> pdflatex $basename > /dev/null 2>&1 < /dev/null || :
> >> if grep -q '! Emergency stop.' $basename.log
> >> then
> >> 	echo "----- Fatal latex error, see $basename.log for details. -----"
> > 
> > Please add "exit 1" here.  (Yes, this was a bug in my orignal.  But as
> > long as we are here...)
> > 
> 
> Done.
> 
> >> fi
> >> if grep -q 'LaTeX Warning: There were undefined references' $basename.log
> >> then
> >> 	if test -d "$2"
> >> 	then
> >> 		bibtex $basename || :
> >> 	else
> >> 		echo "No bibliography directory, skipping bibtex."
> >> 	fi
> >> fi
> >> while grep -q 'LaTeX Warning: There were undefined references' $basename.log
> >> do
> >> 	if test "$iter" -eq 4
> >> 	then
> >> 		echo "Iteration limit: $iter passes through pdflatex"
> >> 		exit 1
> >> 	fi
> >> 	iter=`expr $iter + 1`
> > 
> > This would be one point to add some indication of why we are doing
> > another pass through the loop.  Might be as simple as adding "Undefined
> > references" to the "echo" below.  Or maybe even show the last symbol
> > listed as undefined.
> >
> 
> Done.
> 
> And I made a change so that the giving-up of the iteration is decided
> by the result of comparison of recent two logs. When they have identical
> warnings, giving-up logic kicks in (note that there are special cases
> mentioned in the commit message) and the remaining warning messages will be
> displayed. The messages should contain the info of undefined symbols.
> 
> >> 	echo "pdflatex $iter"
> >> 	pdflatex $basename > /dev/null 2>&1 < /dev/null || :
> >> 	if grep -q '! Emergency stop.' $basename.log
> >> 	then
> >> 		echo "----- Fatal latex error, see $basename.log for details. -----"
> >> 		exit 1
> >> 	fi
> >> done
> >> while grep -q 'LaTeX Warning: Label(s) may have changed' $basename.log
> >> do
> >> 	if test "$iter" -ge 4
> >> 	then
> >> 		echo "Iteration limit: $iter passes through pdflatex"
> >> 		exit 1
> >> 	fi
> >> 	iter=`expr $iter + 1`
> > 
> > This would be one point to add some indication of why we are doing
> > another pass through the loop.  Might be as simple as adding "Label(s)
> > may have changed" to the "echo" below.
> > 
> 
> Done.
> 
> >> 	echo "pdflatex $iter"
> >> 	pdflatex $basename > /dev/null 2>&1 < /dev/null || :
> >> 	if grep -q '! Emergency stop.' $basename.log
> >> 	then
> >> 		echo "----- Fatal latex error, see $basename.log for details. -----"
> >> 		exit 1
> >> 	fi
> >> done
> >> grep "LaTeX Warning:" $basename.log
> >> exit 0
> >>
> > 
> > 
> 
> As for the bibtex part moved to Makefile, I made '.bbl' be dependent
> on '.aux.' 
> '.aux' requires pdflatex to run for the first time, so I separated
> 'runfirstlatex.sh.' Since '.aux' is always updated by pdflatex, this
> means that bibtex is always invoked for a normal 'make.'
> If you absolutely want bibtex *not* to run (and you are sure that '.bib'
> files are not modified), touch a related '.bbl' file just before a 'make'.
> Then 'runfirstlatex.sh' won't be invoked. But I think bibtex itself is
> fairly quick, and simply doing 'make' is acceptable. Please give it a try
> and let me know how it feels like.
> 
> I also made changes in the comment area at the head of each script. I added
> my copyright notices there, but not sure if those are what are expected.
> Could you please give a look at them, too?
> 
>                                                          Thanks, Akira
> 

