Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34273 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)	by vger.kernel.org
 with ESMTP id S1752345AbcHJWmu (ORCPT	<rfc822;perfbook@vger.kernel.org>);
 Wed, 10 Aug 2016 18:42:50 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])	by
 mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u7AMdEKC053617
 for <perfbook@vger.kernel.org>; Wed, 10 Aug 2016 18:42:49 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])	by
 mx0b-001b2d01.pphosted.com with ESMTP id 24qm9uter3-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Wed,
 10 Aug 2016 18:42:49 -0400
Received: from localhost	by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Wed, 10 Aug
 2016 18:42:48 -0400
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23])	by d01dlp02.pok.ibm.com (Postfix) with ESMTP id AB1A96E8045
 for <perfbook@vger.kernel.org>; Wed, 10 Aug 2016 18:42:25 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u7AMgjlo15532486	for <perfbook@vger.kernel.org>; Wed, 10 Aug 2016 22:42:45
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u7AMgj9U021867	for <perfbook@vger.kernel.org>; Wed, 10 Aug 2016 18:42:45
 -0400
Date: Wed, 10 Aug 2016 15:42:50 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 0/1] Trial of replacing hyphens with minus signs
Reply-To: paulmck@linux.vnet.ibm.com
References: <32c543fd-cad8-f3da-4b1f-15ed2fd919c0@gmail.com>
 <20160808163608.GJ3482@linux.vnet.ibm.com>
 <5d1f41dd-a4f1-81f7-cc6c-b9ce8c229f88@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d1f41dd-a4f1-81f7-cc6c-b9ce8c229f88@gmail.com>
Message-Id: <20160810224250.GP3482@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Aug 09, 2016 at 11:04:34PM +0900, Akira Yokosawa wrote:
> >From f4068f222bfa4f1cb60b9c16e9228990bc886280 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 9 Aug 2016 22:28:34 +0900
> Subject: [PATCH v2 0/1] Trial of replacing hyphens with minus signs
> 
> This is round two of my attempt to avoid using hyphens as minus signs.

And I am good with this one.  The positive and negative numerals appear
to use the same glyphs, so postive and negative numbers look the same,
which is good.

> First of all, I didn't intend to mark up every number in the text.
> The reason I used two latex commands was to make it easy to try
> several different combinations of appearance in the resulting PDF.
> Once we choose one combination, we can replace the mark-up commands
> by automatic scripting.  I prepared two types of mark up because
> there already exist numbers enclosed in \co{}.

But if they are in \co{}, it makes sense to use hyphens, which is
the tradition for typewriter/command-line display.

> I should have made this point clear in the previous series cover
> letter.
> 
> This time, I choose the simple math mode for negative numbers. I think
> this is acceptable enough.  I'm not sure if we should also use \co{}
> for some negative numbers.  This can be discussed later.
> 
> BTW, I used a script to find candidates of negative numbers. 
> Although it outputs a lot of false positives within verbatim and \co{}
> code snippets, it is still useful as hints.
> 
> Following is the diff of "before" and "after" of the output of the
> script.  I hope this can help you grasp what it looks like.

Anyway, the patch looked good, so I pulled it in.

							Thanx, Paul

>                                                 Thanks, Akira
> 
> ------
> --- /tmp/before	2016-08-09 22:11:29.061603725 +0900
> +++ /tmp/after	2016-08-09 22:11:50.129602753 +0900
> @@ -1,8 +1,4 @@
> -./future/htm.tex:642:	to -1.
>  ./future/htm.tex:656:  1   int my_status = -1;  /* Thread local. */
> -./SMPdesign/beyond.tex:272:which must be initialized to all [-1,-1].
> -./SMPdesign/partexercises.tex:277:be assigned decreasing numbers (-1, -2, -3, \ldots), while a series of
> -./SMPdesign/SMPdesign.tex:1000:element of the \co{pool} array, or -1 if all elements are empty.
>  ./count/count.tex:787: 40     exit(-1);
>  ./count/count.tex:3062: 10     exit(-1);
>  ./together/applyrcu.tex:148: 36     exit(-1);
> @@ -14,7 +10,6 @@
>  ./toolsoftrade/toolsoftrade.tex:188:  7   exit(-1);
>  ./toolsoftrade/toolsoftrade.tex:228:  8     if (pid == -1) {
>  ./toolsoftrade/toolsoftrade.tex:232: 12       exit(-1);
> -./toolsoftrade/toolsoftrade.tex:259:If the process ID is instead -1, this indicates that the \co{wait()}
>  ./toolsoftrade/toolsoftrade.tex:294: 12   exit(-1);
>  ./toolsoftrade/toolsoftrade.tex:395: 18     exit(-1);
>  ./toolsoftrade/toolsoftrade.tex:399: 22     exit(-1);
> @@ -34,15 +29,7 @@
>  ./toolsoftrade/toolsoftrade.tex:739: 19     exit(-1);
>  ./toolsoftrade/toolsoftrade.tex:883: 25       exit(-1);
>  ./toolsoftrade/toolsoftrade.tex:890: 32       exit(-1);
> -./appendix/questions/after.tex:146:17563: & 1152396.251585 & (-16.928) & 27 & 27 & 27 \\
> -./appendix/questions/after.tex:147:18004: & 1152396.252581 & (-12.875) & 24 & 24 & 24 \\
> -./appendix/questions/after.tex:148:18163: & 1152396.252955 & (-19.073) & 18 & 18 & 18 \\
> -./appendix/questions/after.tex:149:18765: & 1152396.254449 & (-148.773) & 216 & 216 & 216 \\
> -./appendix/questions/after.tex:150:19863: & 1152396.256960 & (-6.914) & 18 & 18 & 18 \\
> -./appendix/questions/after.tex:151:21644: & 1152396.260959 & (-5.960) & 18 & 18 & 18 \\
> -./appendix/questions/after.tex:152:23408: & 1152396.264957 & (-20.027) & 15 & 15 & 15 \\
>  ./rt/rt.tex:1360:	\co{echo -1 > /proc/sys/kernel/sched_rt_runtime_us}
>  ./rt/rt.tex:1711: 3   exit(-1);
>  ./rt/rt.tex:1715: 7   exit(-1);
>  ./rt/rt.tex:1719:11   exit(-1);
> -./datastruct/datastruct.tex:1076:The \co{->ht_resize_cur} field on line~14 is equal to -1 unless a resize
> ------ 
> 
> Akira Yokosawa (1):
>   Trial of replacing hyphens of negative values with minus signs
> 
>  SMPdesign/SMPdesign.tex       |  2 +-
>  SMPdesign/beyond.tex          |  2 +-
>  SMPdesign/partexercises.tex   |  2 +-
>  appendix/questions/after.tex  | 14 +++++++-------
>  datastruct/datastruct.tex     |  2 +-
>  future/htm.tex                |  2 +-
>  toolsoftrade/toolsoftrade.tex |  2 +-
>  utilities/findminusnum.sh     | 29 +++++++++++++++++++++++++++++
>  8 files changed, 42 insertions(+), 13 deletions(-)
>  create mode 100644 utilities/findminusnum.sh
> 
> -- 
> 1.9.1
> 

