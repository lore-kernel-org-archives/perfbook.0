Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:42545 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1754349AbdDDQCe (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 4
 Apr 2017 12:02:34 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v34Frfot053377
 for <perfbook@vger.kernel.org>; Tue, 4 Apr 2017 12:02:33 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 29kydgmstg-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 04 Apr 2017 12:02:33 -0400
Received: from localhost by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 4 Apr 2017
 12:02:32 -0400
Date: Tue, 4 Apr 2017 09:02:29 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 00/12] advsync: Rename LOCK/UNLOCK to ACQUIRE/RELEASE
Reply-To: paulmck@linux.vnet.ibm.com
References: <b00db59a-a0b0-42d6-7546-01872ad3e404@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b00db59a-a0b0-42d6-7546-01872ad3e404@gmail.com>
Message-Id: <20170404160229.GW3637@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Apr 01, 2017 at 11:09:27AM +0900, Akira Yokosawa wrote:
> >From 8aa4157fbed720fd3e8a259de620184003bf09da Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 1 Apr 2017 10:48:45 +0900
> Subject: [RFC PATCH 00/12] advsync: Rename LOCK/UNLOCK to ACQUIRE/RELEASE
> 
> Hi Paul,
> 
> This series mostly corresponds to commit 2e4f5382d12a ("locking/doc:
> Rename LOCK/UNLOCK to ACQUIRE/RELEASE") in Linux kernel repository.
> Although Documentation/memory-barriers.txt has a lot of updated
> contents after the import to perfbook, this series basically
> does substitution of existing "LOCK/UNLOCK".
> 
> Patches 1--3 do simple substitutions.
> Patch 4 does another replacement not included in the original commit.
> Patch 5 is an attempt to add a footnote on "LOCK/UNLOCK" wording. You
> may want to rewrite the text of the footnote.
> Patch 6 replaces some of "the" with "a/an". I think they are reasonable,
> but this is from an non-native POV. I might missing something.
> Patch 7 is to go along with current wording in memory-barriers.txt.
> Patch 8 is a big patch in line count, but it just adds proper nbsps
> (in LaTeX sense).
> Patch 9 adjusts the position of a footnote appended in the previous
> patch set.
> Patch 10 is an independent trivial typo fix.
> Patches 11 and 12 are tweaks for a better layout.

Queued and pushed, thank you!

							Thanx, Paul

>                                       Thanks, Akira
> --
> Akira Yokosawa (12):
>   advsync: LOCK/UNLOCK -> ACQUIRE/RELEASE (part 1)
>   advsync: LOCK/UNLOCK -> ACQUIRE/RELEASE (part 2)
>   advsync: LOCK/UNLOCK -> ACQUIRE/RELEASE (part 3)
>   advsync: More replacement to ACQUIRE
>   advsync: Add footnote mentioning LOCK/UNLOCK wording
>   advsync: Modify usage of definite article
>   advsync: Substitute 'guarantee' with 'implication'
>   advsync: Properly use nbsp
>   advsync: Move footnote on transitivity forward
>   advsync: Fix line number called out
>   advsync: Add extdash shortcut
>   advsync: Avoid indent after minipage
> 
>  advsync/memorybarriers.tex | 504 +++++++++++++++++++++++----------------------
>  1 file changed, 254 insertions(+), 250 deletions(-)
> 
> -- 
> 2.7.4
> 

