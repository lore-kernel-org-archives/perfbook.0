Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39044 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S932356AbdJ3RW3 (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 30
 Oct 2017 13:22:29 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v9UHKpM7081837
 for <perfbook@vger.kernel.org>; Mon, 30 Oct 2017 13:22:28 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2dx6t8dcq6-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 30 Oct 2017 13:22:27 -0400
Received: from localhost by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 30 Oct
 2017 13:17:25 -0400
Date: Mon, 30 Oct 2017 10:17:24 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] formal/regression: Fix typo
Reply-To: paulmck@linux.vnet.ibm.com
References: <ea9123a0-7651-72c0-24d5-1b847b6b2efc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea9123a0-7651-72c0-24d5-1b847b6b2efc@gmail.com>
Message-Id: <20171030171724.GV3659@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Oct 31, 2017 at 12:53:39AM +0900, Akira Yokosawa wrote:
> >From c313894cb1f877b1d8ef5303d59d97b187cf925e Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 31 Oct 2017 00:48:11 +0900
> Subject: [PATCH] formal/regression: Fix typo
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> Here are fixes of several typos in the new section.
> There are chances I'm guessing wrong in some of the hunks, though.

Good eyes, thank you very much!  I applied this, but have not yet pushed
it out as it is blocked behind the patch I sent you, which I do not wish
to push until you are happy with it.

							Thanx, Paul

>       Thanks, Akira
> --
>  formal/regression.tex | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/formal/regression.tex b/formal/regression.tex
> index 39ca388..09d28e1 100644
> --- a/formal/regression.tex
> +++ b/formal/regression.tex
> @@ -60,7 +60,7 @@ and C++ code, but these tools work only on very small litmus tests,
>  which normally means that you must extract the core of your
>  mechanism---by hand.
>  As with Promela and \co{spin}, both PPCMEM and \co{herd} are
> -extremely useful, but they are well-suited for regression suites.
> +extremely useful, but they are not well-suited for regression suites.
> 
>  In contrast, \co{cbmc} and Nidhugg can input C programs of reasonable
>  (though still quite limited) size, and if their capabilities continue
> @@ -394,7 +394,7 @@ Worse yet, imagine another software artifact with one bug that fails
>  once every day on average and 24 more that fail every million years
>  each.
>  Suppose that a formal-verification tool located the 24 million-year
> -bugs, but failed to fined the one-day bug.
> +bugs, but failed to find the one-day bug.
>  Fixing the 24 bugs located will take time and effort, likely slightly
>  decrease reliability, and do nothing at all about the pressing
>  each-day failure that is likely causing much embarrassment and perhaps
> @@ -479,7 +479,7 @@ Despite requiring hand translation, Promela handles assertions
>  in a natural way, so its fifth cell is green.
> 
>  PPCMEM usually requires hand translation due to the small size of litmus
> -tests that it support, so its first cell is orange.
> +tests that it supports, so its first cell is orange.
>  It accurately handles several memory models, so its second cell is green.
>  Its overhead is quite high, so its third cell is red.
>  It provides a graphical display of relations among operations, which
> @@ -493,7 +493,7 @@ so \co{herd}'s first cell is also orange.
>  It supports a wide variety of memory models, so its second cell is blue.
>  It has reasonable overhead, so its third cell is yellow.
>  Its bug-location and assertion capabilities are quite similar to those
> -of \co{cbmc}, so \co{herd} gets the same color for the next two cells.
> +of PPCMEM, so \co{herd} gets the same color for the next two cells.
> 
>  The \co{cbmc} tool inputs C code directly, so its first cell is blue.
>  It supports a few memory models, so its second cell is yellow.
> @@ -515,7 +515,7 @@ so they are all yellow with question marks.
> 
>  Once again, please note that this table rates these tools for use in
>  regression testing.
> -Just because many of them area poor fit for regression testing does
> +Just because many of them are poor fit for regression testing does
>  not at all mean that they are useless, in fact,
>  many of them have proven their worth many times over.
>  Just not for regression testing.
> -- 
> 2.7.4
> 

