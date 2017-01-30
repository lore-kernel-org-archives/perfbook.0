Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60522 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1754068AbdA3TdK (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 30
 Jan 2017 14:33:10 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v0UJSgoD012589
 for <perfbook@vger.kernel.org>; Mon, 30 Jan 2017 14:32:10 -0500
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 289sqxsjc0-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 30 Jan 2017 14:32:09 -0500
Received: from localhost by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 30 Jan
 2017 12:32:07 -0700
Date: Mon, 30 Jan 2017 11:32:09 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/4] Misc updates and fixes
Reply-To: paulmck@linux.vnet.ibm.com
References: <07d5345b-53d6-243c-8ba4-84b865552852@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07d5345b-53d6-243c-8ba4-84b865552852@gmail.com>
Message-Id: <20170130193209.GN3989@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Jan 28, 2017 at 08:06:36PM +0900, Akira Yokosawa wrote:
> >From 11f5734bf4b31fbb51cd6ec603d680a8b3f4f99c Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 28 Jan 2017 20:01:42 +0900
> Subject: [PATCH 0/4] Misc updates and fixes
> 
> Hi Paul,
> 
> This is a collection of random updates and fixes.
> 
> Patch 4 replaces non-hyphenation dashes with math mode minus signs.
> As you know, I dislike such uses of dashes in LaTeX source. ;-)

Applied, thank you!

But I am beginning to think in terms of just not using hyphens to
indicate inapplicable or missing information.  ;-)

							Thanx, Paul

>                                     Thanks, Akira
> --
> Akira Yokosawa (4):
>   Update hyphen-to-endash scripts
>   advsync/memorybarriers: Use American spelling (initialize)
>   together: Typo fix (a RCU ... -> an RCU ...)
>   Use math mode minus signs for dashes in tables
> 
>  advsync/memorybarriers.tex           |  2 +-
>  appendix/whymb/whymemorybarriers.tex | 20 ++++++++++----------
>  together/applyrcu.tex                |  2 +-
>  together/refcnt.tex                  |  8 ++++----
>  utilities/bibhyphen2endash.sh        | 27 +++++++++++++++++++++++++++
>  utilities/dohyphen2endash.sh         | 12 ++++++++++++
>  utilities/hyphen2endash.sh           |  4 +++-
>  7 files changed, 58 insertions(+), 17 deletions(-)
>  create mode 100644 utilities/bibhyphen2endash.sh
> 
> -- 
> 2.7.4
> 

