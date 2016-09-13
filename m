Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50363 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1755204AbcIMPwV (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Tue, 13 Sep 2016 11:52:21 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id u8DFmIOi004005
 for <perfbook@vger.kernel.org>; Tue, 13 Sep 2016 11:52:20 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 25eh21d4kn-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 13 Sep 2016 11:52:20 -0400
Received: from localhost by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 13 Sep
 2016 09:52:20 -0600
Date: Tue, 13 Sep 2016 08:52:18 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [GIT PULL] treewide: Enclose 'verbbox' within 'figure'
Reply-To: paulmck@linux.vnet.ibm.com
References: <00a15c91-6d25-4136-e72e-6c00ff0ed57e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00a15c91-6d25-4136-e72e-6c00ff0ed57e@gmail.com>
Message-Id: <20160913155218.GK3851@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Sep 14, 2016 at 12:21:53AM +0900, Akira Yokosawa wrote:
> The following changes since commit 13fd84a696ca3951b5a2c2d15b524cf898c9400e:
> 
>   Add scripts to check 'verbbox' env usage (2016-09-13 07:05:06 -0700)
> 
> are available in the git repository at:
> 
>   https://github.com/akiyks/perfbook.git enclose-verbbox-in-figure-v2
> 
> for you to fetch changes up to a9fe7df2efbc785602351e8fd9f26b0a683f6b9f:
> 
>   treewide: Enclose 'verbbox' within 'figure' (2016-09-14 00:02:53 +0900)

Pulled, thank you!

							Thanx, Paul

> ----------------------------------------------------------------
> Akira Yokosawa (1):
>       treewide: Enclose 'verbbox' within 'figure'
> 
>  SMPdesign/SMPdesign.tex              | 16 ++++++-------
>  SMPdesign/beyond.tex                 |  8 +++----
>  SMPdesign/partexercises.tex          |  6 ++---
>  advsync/advsync.tex                  |  2 +-
>  advsync/memorybarriers.tex           |  4 ++--
>  appendix/primitives/primitives.tex   | 10 ++++----
>  appendix/questions/after.tex         |  4 ++--
>  appendix/whymb/whymemorybarriers.tex |  4 ++--
>  count/count.tex                      | 44 ++++++++++++++++++------------------
>  datastruct/datastruct.tex            | 28 +++++++++++------------
>  debugging/debugging.tex              |  4 ++--
>  defer/defer.tex                      |  2 +-
>  defer/hazptr.tex                     |  6 ++---
>  defer/rcuapi.tex                     |  4 ++--
>  defer/rcufundamental.tex             | 10 ++++----
>  defer/rcuusage.tex                   | 16 ++++++-------
>  defer/refcnt.tex                     |  4 ++--
>  defer/seqlock.tex                    | 10 ++++----
>  formal/axiomatic.tex                 |  4 ++--
>  formal/dyntickrcu.tex                | 16 ++++++-------
>  formal/ppcmem.tex                    |  8 +++----
>  formal/spinhint.tex                  | 30 ++++++++++++------------
>  future/htm.tex                       |  2 +-
>  locking/locking-existence.tex        |  4 ++--
>  locking/locking.tex                  | 16 ++++++-------
>  rt/rt.tex                            |  8 +++----
>  together/applyrcu.tex                | 12 +++++-----
>  together/refcnt.tex                  |  8 +++----
>  toolsoftrade/toolsoftrade.tex        | 16 ++++++-------
>  29 files changed, 153 insertions(+), 153 deletions(-)
> 

