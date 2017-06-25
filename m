Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48076 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1750944AbdFYDY2 (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sat, 24 Jun 2017 23:24:28 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v5P3O8PB022426
 for <perfbook@vger.kernel.org>; Sat, 24 Jun 2017 23:24:27 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2ba136ehc2-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sat,
 24 Jun 2017 23:24:27 -0400
Received: from localhost by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 24 Jun
 2017 23:24:27 -0400
Date: Sat, 24 Jun 2017 20:24:23 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/5] Add white spaces before unit symbols
Reply-To: paulmck@linux.vnet.ibm.com
References: <69a63f84-0f40-1194-3770-e4074897388f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69a63f84-0f40-1194-3770-e4074897388f@gmail.com>
Message-Id: <20170625032423.GY3721@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Jun 25, 2017 at 08:59:32AM +0900, Akira Yokosawa wrote:
> >From 27d084e3bffbcd26a56d56859145f449750fc7b1 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 25 Jun 2017 08:53:02 +0900
> Subject: [PATCH 0/5] Add white spaces before unit symbols
> 
> Hi Paul,
> 
> This is a patch series to do the same tweaks as I did in QC section.
> As NIST style guide covers only the SI units, I split the patches
> for SI units and non-SI units.
> 
> Patches 1 and 2 are for SI unit symbols.
> Patch 3 improves the look of the "rt-regimes" figure.
> Patches 4 and 5 are for non-SI unit symbols. I'm not sure if you like
> these changes involving KB, MB, and GB symbols.
> 
> Strictly speaking, if you really want to stick to the NIST guide, they
> should be replaced with KiB, MiB, and GiB when they represent
> powers of 2. But I think in perfbook, there is no worry of confusion.
> So I stopped short of doing those changes.
> 
> Please apply as far as you like.

Applied and pushed, thank you!

Would you be willing to add a style guide, perhaps in
appendix/questions?  That could be quite helpful to people
wishing contribute -- including me.  ;-)

						Thanx, Paul

>          Thanks, Akira
> -- 
> Akira Yokosawa (5):
>   treewide: Add narrow spaces before SI unit symbols
>   treewide: Add whitespace before SI unit symbols in figures
>   Substitute 'greek mu' for 'u' in microsecond symbol
>   treewide: Add narrow spaces before non-SI unit symbols
>   cartoons: Add whitespace before 'MB'
> 
>  SMPdesign/SMPdesign.tex              |  2 +-
>  SMPdesign/beyond.tex                 |  4 +--
>  advsync/memorybarriers.tex           | 14 ++++----
>  appendix/questions/after.tex         |  2 +-
>  appendix/toyrcu/toyrcu.tex           |  2 +-
>  cartoons/r-2014-Old-man-and-Brat.svg |  2 +-
>  count/count.tex                      |  2 +-
>  cpu/SystemArch.fig                   |  2 +-
>  cpu/hwfreelunch.tex                  |  4 +--
>  cpu/overheads.tex                    |  8 ++---
>  cpu/overview.tex                     |  6 ++--
>  cpu/swdesign.tex                     |  2 +-
>  datastruct/datastruct.tex            |  2 +-
>  debugging/debugging.tex              |  2 +-
>  defer/rcuusage.tex                   |  4 +--
>  defer/refcnt.tex                     |  2 +-
>  formal/dyntickrcu.tex                |  4 +--
>  formal/spinhint.tex                  |  6 ++--
>  glossary.tex                         |  2 +-
>  intro/intro.tex                      |  6 ++--
>  rt/rt-regimes.svg                    | 66 ++++++++++++++++++------------------
>  rt/rt.tex                            |  4 +--
>  22 files changed, 74 insertions(+), 74 deletions(-)
> 
> -- 
> 2.7.4
> 
> 
> 

