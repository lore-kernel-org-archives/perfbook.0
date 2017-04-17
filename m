Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49410 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1756737AbdDQPjV (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Mon, 17 Apr 2017 11:39:21 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v3HFdDd6081897
 for <perfbook@vger.kernel.org>; Mon, 17 Apr 2017 11:39:20 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 29vvwvsebj-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 17 Apr 2017 11:39:20 -0400
Received: from localhost by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 17 Apr
 2017 11:39:19 -0400
Date: Mon, 17 Apr 2017 08:39:18 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 00/14] advsync: Use pseudo asm in code sequence
Reply-To: paulmck@linux.vnet.ibm.com
References: <be8c3cb5-9ee2-9f60-bfcd-e729389304f9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be8c3cb5-9ee2-9f60-bfcd-e729389304f9@gmail.com>
Message-Id: <20170417153918.GO3956@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Apr 17, 2017 at 07:11:37AM +0900, Akira Yokosawa wrote:
> >From 6efc224d8e6d2b64bf7a86b52d03de01ccea7032 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 17 Apr 2017 06:53:11 +0900
> Subject: [PATCH 00/14] advsync: Use pseudo asm in code sequence
> 
> Hi Paul,
> 
> This series substitutes pseudo-asm codes for C style statements
> in code sequences in 'Memory Barrier' section.
> 
> Other than the substitution, Patch 2 replaces ACCESS_ONCE(),
> Patch 4 is a backport of the changes made in memory-barriers.txt,
> Patches 8 and 12 add footnotes to imply the necessity of data
> dependency barrier, and Patch 11 renames Section "Guarantee"
> to "Minimal Guarantee".
> 
> My guess is that the original intention of the "Guarantee"
> section was to present minimal guarantees free of memory barriers.
> When the necessity of read dependency barrier was recognized,
> the barrier sneaked into this section.
> 
> In LaTeX, as footnotes can prevent readers' misunderstanding,
> We can preserve the original intention.
> 
> Thoughts?

Good changes, queued, thank you!  Of course, please feel free to
submit clarifying and style patches against memory-barriers.txt if
needed.

							Thanx, Paul

>                                   Thanks Akira
> --
> Akira Yokosawa (14):
>   advsync: Use pseudo asm in sequence in 'Paring' section
>   advsync: Substitute READ_ONCE()/WRITE_ONCE() for ACCESS_ONCE()
>   advsync: Use pseudo asm in sequence in 'Review of Locking Impl'
>   advsync: Backport upstream commits regarding reordering example
>   advsync: Use pseudo asm in reordering example
>   advsync: Use pseudo asm in another reordering example
>   advsync: Avoid indent after minipages
>   advsync: Add footnote to imply necessity of data dependency barrier
>   advsync: Use READ_ONCE()/WRITE_ONCE() in sequence of 'Device
>     Operations'
>   advsync: Use READ_ONCE()/WRITE_ONCE() in sequence in 'Guarantees'
>   advsync: Rename Section 'Guarantee' to 'Minimal Guarantee'
>   advsync: Add another footnote implying data dependency barrier
>   advsync: Use pseudo asm in sequence in 'Data Dependency Barriers'
>   advsync: Use pseudo asm in sequence in 'SMP Barrier Pairing'
> 
>  advsync/memorybarriers.tex | 321 ++++++++++++++++++++++++---------------------
>  1 file changed, 172 insertions(+), 149 deletions(-)
> 
> -- 
> 2.7.4
> 

