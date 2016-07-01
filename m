Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:26001 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)	by vger.kernel.org
 with ESMTP id S1751911AbcGAUdX (ORCPT	<rfc822;perfbook@vger.kernel.org>);
 Fri, 1 Jul 2016 16:33:23 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])	by
 mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u61KOtOj001838
 for <perfbook@vger.kernel.org>; Fri, 1 Jul 2016 16:32:25 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])	by
 mx0b-001b2d01.pphosted.com with ESMTP id 23w76q5rrh-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Fri,
 01 Jul 2016 16:32:25 -0400
Received: from localhost	by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Fri, 1 Jul 2016
 16:32:25 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28])	by d01dlp02.pok.ibm.com (Postfix) with ESMTP id 9CA766E803F
 for <perfbook@vger.kernel.org>; Fri, 1 Jul 2016 16:32:04 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u61KWO4N37945570	for <perfbook@vger.kernel.org>; Fri, 1 Jul 2016 20:32:24 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u61KWM93025580	for <perfbook@vger.kernel.org>; Fri, 1 Jul 2016 16:32:22 -0400
Date: Fri, 1 Jul 2016 13:32:26 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/4] Fixup trivial nitpicks under defer/
Reply-To: paulmck@linux.vnet.ibm.com
References: <1467333834-17050-1-git-send-email-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1467333834-17050-1-git-send-email-sj38.park@gmail.com>
Message-Id: <20160701203226.GR4650@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Jul 01, 2016 at 09:43:50AM +0900, SeongJae Park wrote:
> This patchset contains fixup of trivial nitpicks that has found during
> translation of defer/ directory.
> 
> SeongJae Park (4):
>   defer: Fix typos
>   defer: Insert missing tildes
>   defer: Add missing dot
>   defer/seqlock: Fix wrong line reference
> 
>  defer/defer.tex          |  4 ++--
>  defer/rcufundamental.tex |  6 +++---
>  defer/seqlock.tex        | 14 +++++++-------
>  defer/toyrcu.tex         | 10 +++++-----
>  defer/whichtochoose.tex  |  2 +-
>  5 files changed, 18 insertions(+), 18 deletions(-)

Very good, thank you!

I queued and pushd 1, 2, and 4.  #3 was in an obsolete passage, so
I queued a commit deleting it.

							Thanx, Paul

