Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53608 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S941837AbcLWUxb (ORCPT <rfc822;perfbook@vger.kernel.org>); Fri, 23
 Dec 2016 15:53:31 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id uBNKnNO4053676
 for <perfbook@vger.kernel.org>; Fri, 23 Dec 2016 15:53:31 -0500
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 27h70e0kfv-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Fri,
 23 Dec 2016 15:53:30 -0500
Received: from localhost by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Fri, 23 Dec
 2016 13:53:29 -0700
Date: Fri, 23 Dec 2016 10:58:42 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/3] Patches for recent updates
Reply-To: paulmck@linux.vnet.ibm.com
References: <729a5146-a533-0511-d3a0-88ca20a10106@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <729a5146-a533-0511-d3a0-88ca20a10106@gmail.com>
Message-Id: <20161223185842.GB3742@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Dec 23, 2016 at 05:07:17PM +0900, Akira Yokosawa wrote:
> >From cbb7797d6b307850a280248589bc09b8852e8a68 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Fri, 23 Dec 2016 16:46:06 +0900
> Subject: [PATCH 0/3] Patches for recent updates
> 
> Hi Paul,
> 
> This short patch set consists of fixes to recent updates in
> advsync/memorybarriers.
> 
> I'm not sure what is your preference of quotation of short variable
> names and keywords. In the 1st patch, I chose the form of ~~\co{a}''.
> If you prefer other one, please let me know.
> 
> Ya, I know a variety of styles are mixed-used in perfbook,
> reflecting various original publications...

My current rule is that an identifier can be mistaken for an English
word or letter of the alphabet, then it should be in double quotation
marks and under \co{}, consistent with your changes.  However, something
like "rcu_node" cannot reasonably be mistaken for English, so it only
needs \co{}.

Thoughts?

> But at least within a (sub)section, it would be better to keep
> consistency.

Applied and pushed, thank you!

							Thanx, Paul

>                                                 Thanks, Akira
> -- 
> Akira Yokosawa (3):
>   advsync/memorybarriers: Use consistent quotation marks
>   advsync/memorybarriers: Fix typo (READ_ONCE -> WRITE_ONCE)
>   advsync/memorybarriers: Fix trivial typo
> 
>  advsync/memorybarriers.tex | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> -- 
> 2.7.4
> 

