Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e31.co.us.ibm.com ([32.97.110.149]:54195 "EHLO
 e31.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1752744AbcDVNdz (ORCPT	<rfc822;perfbook@vger.kernel.org>); Fri, 22 Apr 2016
 09:33:55 -0400
Received: from localhost	by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Fri, 22 Apr
 2016 07:33:54 -0600
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23])	by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id
 2AB361FF0049	for <perfbook@vger.kernel.org>; Fri, 22 Apr 2016 07:33:38 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3MDXqRC34013190	for <perfbook@vger.kernel.org>; Fri, 22 Apr 2016 13:33:52
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3MDXqG9032341	for <perfbook@vger.kernel.org>; Fri, 22 Apr 2016 09:33:52
 -0400
Date: Fri, 22 Apr 2016 06:34:24 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/2] runlatex.sh: Fix while loop condition
Message-ID: <20160422133424.GP3879@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <5718E390.1090309@gmail.com> <5718E478.3000406@gmail.com>
 <20160421162741.GB3879@linux.vnet.ibm.com> <57194E98.1040001@gmail.com>
 <20160421235400.GI3879@linux.vnet.ibm.com> <571A1FF0.2080602@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <571A1FF0.2080602@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Apr 22, 2016 at 09:58:24PM +0900, Akira Yokosawa wrote:
> On 2016/04/22 16:54 -0700, Paul E. McKenney wrote:
> [snip]
> 
> >> Can you try this one?
> >> Thanks, Akira
> > 
> > I did, though for some reason I had to hand-apply it on my test branch.
> > Not sure what "git apply" didn't like.
> 
> Well, I'm afraid you tried to apply it after [PATCH 2/2] applied.
> I should have made it clear it was a diff from master at that moment.
> Sorry for your trouble.

I am pretty sure that I was applying it to the current master,
but I cannot prove anything at this point.  ;-)

> > It does repeat upon undefined, which is good.  Nicer behavior after
> > bibliography changes!
> > 
> > There is another "Fatal latex error" earlier that I missed, and it would
> > be good to have an "exit 1" on that one as well.
> > 
> > The one thing I am still concerned about is a real undefined reference,
> > which would consume a full five iterations.  Not really sure what would
> > be improved behavior, though.  Thoughts?
> > 
> > 							Thanx, Paul
> 
> So your question is why you need to change the maximum value from 4 to 5,
> isn't it?  That's because the count is checked at the end of the loop,
> and even when the 4th round of pdflatex is successful, the check will
> fire and 'make' will regard it as an error. At such a later stage, 
> remaining warning should only be 'LaTeX Warning: Label(s) may have changed',
> if any.

Yes, I do understand that.  Your (very welcome!) changes to the quick-quiz
links can require additional passes through latex.  Therefore, the script
should change to provide this.

To see what I am getting at, please add a "\ref{this is a typo}" or a
reference to any other non-\label string, then type "make".  This is a
pure error that no number of reruns will fix, but the build script will
nevertheless crank away multiple times.

Before, it would run bibtex and stop.  (Which, I freely admit, wasn't
particularly good behavior either!)

My question is whether it is possible to make the script let the user
know why it is re-running latex, so that the user can choose to kill
it early, if appropriate.  Or, alternatively (and for extra credit!),
recognize which labels are undefined, and do more passes if they are
quick-quiz links.

> So I made a fairly invasive modification to the script so that the count
> is checked at the beginning of the loop. Also the loop is separated for each
> of the warning message.
> 
> Appended is the whole source code of the script (without the comment part at
> the head). I'm not sure which point should I make a diff from. Note that
> I truncated the warning messages given to grep. They should be long enough.

Good idea!

> What do you think?

Please see below.

							Thanx, Paul

> If it is OK, I'll resubmit the V2 of the patch series relative to the
> current master.
> 
>                                                        Thanks, Akira.
> 
> --- 
> #!/bin/sh
> # [snip]
> #
> 
> if test -z "$1"
> then
> 	echo No latex file, aborting.
> 	exit 1
> fi
> 
> basename=`echo $1 | sed -e 's/\.tex$//'`
> 
> iter=1
> echo "pdflatex $iter"
> pdflatex $basename > /dev/null 2>&1 < /dev/null || :
> if grep -q '! Emergency stop.' $basename.log
> then
> 	echo "----- Fatal latex error, see $basename.log for details. -----"

Please add "exit 1" here.  (Yes, this was a bug in my orignal.  But as
long as we are here...)

> fi
> if grep -q 'LaTeX Warning: There were undefined references' $basename.log
> then
> 	if test -d "$2"
> 	then
> 		bibtex $basename || :
> 	else
> 		echo "No bibliography directory, skipping bibtex."
> 	fi
> fi
> while grep -q 'LaTeX Warning: There were undefined references' $basename.log
> do
> 	if test "$iter" -eq 4
> 	then
> 		echo "Iteration limit: $iter passes through pdflatex"
> 		exit 1
> 	fi
> 	iter=`expr $iter + 1`

This would be one point to add some indication of why we are doing
another pass through the loop.  Might be as simple as adding "Undefined
references" to the "echo" below.  Or maybe even show the last symbol
listed as undefined.

> 	echo "pdflatex $iter"
> 	pdflatex $basename > /dev/null 2>&1 < /dev/null || :
> 	if grep -q '! Emergency stop.' $basename.log
> 	then
> 		echo "----- Fatal latex error, see $basename.log for details. -----"
> 		exit 1
> 	fi
> done
> while grep -q 'LaTeX Warning: Label(s) may have changed' $basename.log
> do
> 	if test "$iter" -ge 4
> 	then
> 		echo "Iteration limit: $iter passes through pdflatex"
> 		exit 1
> 	fi
> 	iter=`expr $iter + 1`

This would be one point to add some indication of why we are doing
another pass through the loop.  Might be as simple as adding "Label(s)
may have changed" to the "echo" below.

> 	echo "pdflatex $iter"
> 	pdflatex $basename > /dev/null 2>&1 < /dev/null || :
> 	if grep -q '! Emergency stop.' $basename.log
> 	then
> 		echo "----- Fatal latex error, see $basename.log for details. -----"
> 		exit 1
> 	fi
> done
> grep "LaTeX Warning:" $basename.log
> exit 0
> 

