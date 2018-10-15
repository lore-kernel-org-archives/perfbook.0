Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33056 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726262AbeJOH72 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 15 Oct 2018 03:59:28 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w9F0DcVx077920
        for <perfbook@vger.kernel.org>; Sun, 14 Oct 2018 20:16:41 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2n4g47r4gn-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Sun, 14 Oct 2018 20:16:41 -0400
Received: from localhost
        by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Sun, 14 Oct 2018 20:16:40 -0400
Date: Sun, 14 Oct 2018 17:16:39 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 0/6] count: Employ new code-snippet scheme (cont.)
Reply-To: paulmck@linux.ibm.com
References: <a20c67f0-db94-7e03-ed69-d09fd51899dd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a20c67f0-db94-7e03-ed69-d09fd51899dd@gmail.com>
Message-Id: <20181015001639.GO2674@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Oct 13, 2018 at 11:52:50PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> count_lim_sig.c was a hard one to review for me regarding the usage
> of READ_ONCE()/WRITE_ONCE(). Patch #5 is my attempt to add several
> of them. There might be other combination of racy accesses.
> 
> Patches #1--#4 are trivial ones.
> 
> Patch #6 is the result of quick review of your recent addition to
> toolsoftrade.  I'm not sure you like the addition of comments
> "/* BUGGY!!! */" to Lisitngs which look irrelevant to their
> captions.
> 
> Patches #5 and #6 are more likely to need your close look.

It looks good from what I can see, though your patch 6/6 should
limit your confidence in this.  ;-)

I folded your later 7/6 into 4/6.

Queued and pushed, thank you!!!

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (6):
>   count: Employ new scheme for snippet of count_lim_app
>   count: Fix uses of READ/WRITE_ONCE() in count_lim_app
>   count: Employ new scheme for snippet of count_lim_atomic
>   count: Employ new scheme for snippet of count_lim_sig
>   count: READ/WRITE_ONCE() tweaks for count_lim_sig
>   toolsoftrade: Proofread newly added sections
> 
>  CodeSamples/count/count_lim_app.c    |  17 +-
>  CodeSamples/count/count_lim_atomic.c | 209 ++++----
>  CodeSamples/count/count_lim_sig.c    | 159 ++++---
>  count/count.tex                      | 892 ++++++++++-------------------------
>  toolsoftrade/toolsoftrade.tex        |  44 +-
>  5 files changed, 494 insertions(+), 827 deletions(-)
> 
> -- 
> 2.7.4
> 

