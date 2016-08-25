Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:59821 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1758715AbcHYMV5 (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Thu, 25 Aug 2016 08:21:57 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u7PCKAJF098388
 for <perfbook@vger.kernel.org>; Thu, 25 Aug 2016 08:21:56 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 250w841syj-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Thu,
 25 Aug 2016 08:21:56 -0400
Received: from localhost by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Thu, 25 Aug
 2016 06:21:55 -0600
Date: Thu, 25 Aug 2016 05:22:09 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/3] Typo fixes
Reply-To: paulmck@linux.vnet.ibm.com
References: <bd90da8b-ed06-e104-8a70-96b029ad666a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd90da8b-ed06-e104-8a70-96b029ad666a@gmail.com>
Message-Id: <20160825122209.GP3482@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Aug 24, 2016 at 11:07:24PM +0900, Akira Yokosawa wrote:
> >From 98c6fbbe2a7b04bc1ad11d70d96995425d8635de Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 24 Aug 2016 20:43:42 +0900
> Subject: [PATCH 0/3] Typo fixes
> 
> Hi,
> 
> This series consists of typo fixes.
> 
> 1st patch is the result of a variant of hypen2endash.sh script.
> No, this patch does not convert hyphens to endashes, but
> replaces spaces in "lines nn-mm" and "Lines nn-mm" with tildes.
> It also corrects typos such as "line^nn-mm" to "lines~nn-mm".
> Modified sed script can be found in the commit message.
> 
> 2nd patch adjusts plurality of verbs in appendix/rcuimpl/rcutreewt.tex
> after the 1st patch. This file is not referenced any more, so this fix
> may be unnecessary.
> 
> 3rd patch fixes typos I noticed while reviewing Chapter 7.

All applied, thank you!

I followed up patch 1 with a few "line N" and "Line N" changes in those
same files as well.

							Thanx, Paul

>                                                   Thanks, Akira
> 
> Akira Yokosawa (3):
>   treewide: Use nbsp after 'Lines' and 'lines'
>   appendix/rcuimpl: Adjust plurality of verb
>   locking: Typo fixes
> 
>  appendix/questions/after.tex         |  4 +--
>  appendix/rcuimpl/rcutreewt.tex       |  8 +++---
>  appendix/rcuimpl/srcu.tex            |  2 +-
>  appendix/whymb/whymemorybarriers.tex |  2 +-
>  datastruct/datastruct.tex            |  2 +-
>  formal/dyntickrcu.tex                |  2 +-
>  formal/spinhint.tex                  | 56 ++++++++++++++++++------------------
>  locking/locking.tex                  |  8 +++---
>  toolsoftrade/toolsoftrade.tex        |  2 +-
>  9 files changed, 43 insertions(+), 43 deletions(-)
> 
> -- 
> 1.9.1
> 

