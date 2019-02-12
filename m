Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:42166 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727039AbfBLXq0 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 12 Feb 2019 18:46:26 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x1CNkMXF111816
        for <perfbook@vger.kernel.org>; Tue, 12 Feb 2019 18:46:26 -0500
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2qm6p6jue7-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Tue, 12 Feb 2019 18:46:25 -0500
Received: from localhost
        by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Tue, 12 Feb 2019 23:45:45 -0000
Date: Tue, 12 Feb 2019 15:45:42 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 4/4] memorder: Remove 'snippet' meta command in stray
 litmus test
Reply-To: paulmck@linux.ibm.com
References: <1b7c8489-cf0a-d959-f307-e3eadae4998c@gmail.com>
 <f824fa58-c67a-afb5-68e2-cac8cf86660e@gmail.com>
 <20190212161631.GL4240@linux.ibm.com>
 <074fb553-9044-ded1-ab15-66f73350e7fc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <074fb553-9044-ded1-ab15-66f73350e7fc@gmail.com>
Message-Id: <20190212234542.GV4240@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Feb 13, 2019 at 07:11:02AM +0900, Akira Yokosawa wrote:
> On 2019/02/12 08:16:31 -0800, Paul E. McKenney wrote:
> > On Wed, Feb 13, 2019 at 12:39:38AM +0900, Akira Yokosawa wrote:
> >> >From 0ddf5c5ea4a66a0d6bff1b6c0ce32682459c20ad Mon Sep 17 00:00:00 2001
> >> From: Akira Yokosawa <akiyks@gmail.com>
> >> Date: Tue, 12 Feb 2019 23:18:29 +0900
> >> Subject: [PATCH 4/4] memorder: Remove 'snippet' meta command in stray litmus test
> >>
> >> C-SB+o-rcusync-o+rl-rul-o.litmus is identical to
> >> C-SB+o-rcusync-o+rl-o-rul-o.litmus and causes "make" to emit
> >> warning:
> >>
> >>     target 'CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-rul-o@whole.fcv'
> >>     given more than once in the same rule
> >>
> >> This commit removes "snippet" meta commands in the test.
> >> Just removing the file can cause a build error afterward.
> >> A "make clean" will resolve the error, but keeping the file
> >> looks like a reasonable approach to avoid surprising people.
> >> The file can be removed in the near future when most active
> >> users have updated snippets.d.
> > 
> > Unless I am confused, this litmus test appears as Listing 15.37.
> 
> Listing 15.37 is "C-SB+o-rcusync-o+rl-o-rul-o".
> The file I modified is "C-SB+o-rcusync-o+rl-rul-o.litmus" (note the
> missing "-o-" in the final part") but contains the same test
> "C-SB+o-rcusync-o+rl-o-rul-o". There exists
> C-SB+o-rcusync-o+rl-o-rul-o.litmus which contains the same test
> "C-SB+o-rcusync-o+rl-o-rul-o". So C-SB+o-rcusync-o+rl-rul-o.litmus
> can be safely removed. But this patch removes the snippet meta-commands
> instead.
> 
> Have I made the point clearer?

You have!  My confusion stemmed from the fact that these two files
are identical, as you say:

CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-rul-o.litmus
CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-rul-o.litmus

I was searching based on the name within the file rather than the
filename.  In short, we can just get rid of the unused file.

Apologies for my confusion!

							Thanx, Paul

>         Thanks, Akira
> 
> > That said, its discussion does not reference any line numbers, so
> > the snippet comments could reasonably be removed.  Or maybe I should
> > instead upgrade the discussion to include line numbers.
> > 
> > So what am I missing here?
> > 
> > 							Thanx, Paul
> > 
> >> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> >> ---
> >>  CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-rul-o.litmus | 2 --
> >>  1 file changed, 2 deletions(-)
> >>
> >> diff --git a/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-rul-o.litmus b/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-rul-o.litmus
> >> index a39baf3..2407a51 100644
> >> --- a/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-rul-o.litmus
> >> +++ b/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-rul-o.litmus
> >> @@ -1,5 +1,4 @@
> >>  C C-SB+o-rcusync-o+rl-o-rul-o
> >> -//\begin[snippet][labelbase=ln:formal:C-SB+o-rcusync-o+rl-o-rul-o:whole,commandchars=\@\[\]]
> >>  {
> >>  }
> >>  
> >> @@ -19,5 +18,4 @@ P1(uintptr_t *x0, uintptr_t *x1)
> >>  	uintptr_t r2 = READ_ONCE(*x0);
> >>  }
> >>  
> >> -//\end[snippet]
> >>  exists (1:r2=0 /\ 0:r2=0)
> >> -- 
> >> 2.7.4
> >>
> >>
> > 
> 

