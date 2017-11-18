Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60272 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S936233AbdKRUKc (ORCPT <rfc822;perfbook@vger.kernel.org>); Sat,
 18 Nov 2017 15:10:32 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vAIK8hu2087425
 for <perfbook@vger.kernel.org>; Sat, 18 Nov 2017 15:10:32 -0500
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2eahmfda48-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sat,
 18 Nov 2017 15:10:31 -0500
Received: from localhost by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 18 Nov
 2017 15:10:31 -0500
Date: Sat, 18 Nov 2017 12:10:27 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 3/3] memorder: Fix trivial typo
Reply-To: paulmck@linux.vnet.ibm.com
References: <ec7ed5f9-1986-ba77-5e64-48334404c033@gmail.com>
 <c2a30f43-d49c-807f-ffe0-e51bf1b3d639@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2a30f43-d49c-807f-ffe0-e51bf1b3d639@gmail.com>
Message-Id: <20171118201027.GM3624@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Nov 19, 2017 at 12:07:02AM +0900, Akira Yokosawa wrote:
> >From a2d0cd80fb99a15bd5265f12863ac8f0183f9a9b Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 18 Nov 2017 23:39:26 +0900
> Subject: [PATCH 3/3] memorder: Fix trivial typo
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

I applied all three, and especially like the script taking up some
of the manual handling of quick quizzes with figures!

One thing I left out, please see below.

							Thanx, Paul

> ---
>  memorder/memorder.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 68dc09b..d11df62 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -10,7 +10,7 @@ Causality and sequencing are deeply intuitive, and hackers often
>  tend to have a much stronger grasp of these concepts than does
>  the general population.
>  These intuitions can be extremely powerful tools when writing, analyzing,
> -and debugging both sequential code and parallel code that makes
> +and debugging both sequential code and parallel code that make
>  use of standard mutual-exclusion mechanisms, such as locking and
>  RCU.
>  Unfortunately, these intuitions break down completely in face of

If it was "intuitions" that made use of "standard mutual-exclusion
mechanisms", this fix would be correct.  Plural "intuitions" would
require plural "make".  (And no, I have no idea why English adds "s"
to nouns to denote plural, but removes "s" from verbs to denote plural.
Probably because it is English...)

But it is "code" that made use of "standard mutual-exclusion mechanisms".
I am treating "code" like "water", that is, "lines of code" would be
plural (like "molecules of water"), but "code" is singular (like "water").

I also treat "data" as singular, that is, as a collective noun.  This
is controversial, and people who like "data" to be plural probably also
like "code" to be plural when referring to lines of code.

https://en.wikipedia.org/wiki/Data_(word)

And it appears that most people are now willing to put up with "data"
as a collective noun when applied to computers.  Others are probably
still protesting that "data" is the plural form of "datum" in Latin.

But, yes, English!  :-/

							Thanx, Paul

> @@ -38,7 +38,7 @@ follows up with more detail on what representative hardware platforms
>  actually do to unwary parallel programmers.
>  Finally, Section~\ref{sec:memorder:Where is Memory Ordering Needed?}
>  provides some rules of thumb for what situations require parallel
> -programmers to take special action to preserver memory ordering.
> +programmers to take special action to preserve memory ordering.
> 
>  \section{Ordering: Why and How?}
>  \label{sec:memorder:Ordering: Why and How?}
> -- 
> 2.7.4
> 
> 

