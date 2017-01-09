Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:45303 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S941040AbdAIVBy (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon,
 9 Jan 2017 16:01:54 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id v09Kwg0c089810
 for <perfbook@vger.kernel.org>; Mon, 9 Jan 2017 16:01:49 -0500
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 27vd62m8xe-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 09 Jan 2017 16:01:48 -0500
Received: from localhost by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 9 Jan 2017
 14:01:47 -0700
Date: Mon, 9 Jan 2017 13:01:43 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/3] Quick Quiz layout update
Reply-To: paulmck@linux.vnet.ibm.com
References: <04f10e4e-b325-c5a3-4076-3417a188ece2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04f10e4e-b325-c5a3-4076-3417a188ece2@gmail.com>
Message-Id: <20170109210143.GB3800@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Jan 09, 2017 at 11:37:57PM +0900, Akira Yokosawa wrote:
> >From 6da1b01ee71e53c559a73e20686eabe67ba23935 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 9 Jan 2017 23:09:24 +0900
> Subject: [PATCH 0/3] Quick Quiz layout update
> 
> Hi Paul,
> 
> This patch set improves layout of Appendix "Answers to Quick Quizzes".
> White boxes at the end of answers sometimes become "orphans".
> This happens when an answer finishes with an "enumerate" or "figure"
> environment. As an end of these environments is treated as a page/column
> break candidate, a white box just after the end of an environment tends to
> become an orphan (single symbol at the top of next page/column).
> 
> To prevent this, white boxes can be moved to just after the final item
> of "enumerate" environments. Or they can be moved to just after the final
> paragraph before "figure" environments. 
> 
> I wrote a script to do this (Patch 1), and incorporated it into the rule of
> target "qqz.tex" (Patch 2). Patch 3 tweaks vertical space parameters for
> a better look of the Appendix

I queued this and pushed it, let's see what people think.  It does
make the answers ending in a list look better, though I am wondering
whether ending an answer with a list is the right thing for me to
be doing.  ;-)

							Thanx, Paul

>                                                  Thanks, Akira
> --
> Akira Yokosawa (3):
>   qqz: Add script to reorder lines in qqz.tex
>   Makefile: Use qqzreorder.pl in qqz.tex target
>   qqz.sty: Tweak \vspace{} parameter
> 
>  Makefile                |  2 +-
>  qqz.sty                 |  6 ++--
>  utilities/qqzreorder.pl | 88 +++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 92 insertions(+), 4 deletions(-)
>  create mode 100644 utilities/qqzreorder.pl
> 
> -- 
> 2.7.4
> 

