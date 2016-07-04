Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48991 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)	by vger.kernel.org
 with ESMTP id S932182AbcGDAKt (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sun,
 3 Jul 2016 20:10:49 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])	by
 mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u64098eE125939
 for <perfbook@vger.kernel.org>; Sun, 3 Jul 2016 20:10:44 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])	by
 mx0b-001b2d01.pphosted.com with ESMTP id 23x6hw58ur-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Sun,
 03 Jul 2016 20:10:43 -0400
Received: from localhost	by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sun, 3 Jul 2016
 20:10:43 -0400
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23])	by d01dlp02.pok.ibm.com (Postfix) with ESMTP id 4A45D6E803C
 for <perfbook@vger.kernel.org>; Sun, 3 Jul 2016 20:10:23 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u640AfmF48693266	for <perfbook@vger.kernel.org>; Mon, 4 Jul 2016 00:10:41 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u640AfLM002500	for <perfbook@vger.kernel.org>; Sun, 3 Jul 2016 20:10:41 -0400
Date: Sun, 3 Jul 2016 17:10:47 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [GIT PULL] Cosmetic fixes part 2 and typo fixes
Reply-To: paulmck@linux.vnet.ibm.com
References: <014c725d-2252-5892-ab4c-1621d89e2768@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <014c725d-2252-5892-ab4c-1621d89e2768@gmail.com>
Message-Id: <20160704001047.GI4650@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Jul 02, 2016 at 08:26:31PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> Here is part 2 of cosmetic fixes.
> Most commits do the same changes I did in the previous patch series.
> I also did some typo fixes in the last 3 commits.
> Most of them are trivial fixes, but there may be some wrong ones.
> Please review them with skeptical eyes.

They look good, thank you!

I applied the patch shown below to the quick-quiz answer -- it needed
a complete rewrite rather than wordsmithing.  Thank you for calling my
attention to it.

							Thanx, Paul

>                                             Thanks, Akira
> 
> ---
> The following changes since commit 91ac20e1ab95767f1e33b84aee474d0cd38cc748:
> 
>   hlist_for_each_entry_rcu() now has only three arguments (2016-07-01 13:31:02 -0700)
> 
> are available in the git repository at:
> 
>   https://github.com/akiyks/perfbook.git cosmetic-fixes-and-typo-fixes
> 
> for you to fetch changes up to 644ca3567d857cf2059f5820d30d4fd472f142c8:
> 
>   howto: Miscellaneous fixes (2016-07-02 20:08:43 +0900)
> 
> ----------------------------------------------------------------
> Akira Yokosawa (24):
>       locking: Centering figures of verbatim code examples
>       locking: Use \path command for path names
>       defer: Centering figures of verbatim code examples
>       defer: Tweak font size of Figure 9.5
>       defer: Align left margins of Figurs 9.28, 9.29 and 9.30
>       defer: Use \path command for path names
>       Use \co{} properly to give room for line-breaks
>       datastruct: Centering figures of verbatim code examples
>       datastruct: Fix indent of Figure 'Alignment for 64-Byte Cache Lines'
>       datastruct: Use \path command for path names
>       debugging: Centering figures of verbatim code examples
>       debugging: Use \path command for path names
>       debugging: Enclose shell command example in \co{} macro
>       formal: Centering figures of verbatim code examples
>       formal: Use \path command for path names
>       together: Centering figures of verbatim code examples
>       advsync: Centering figures of verbatim code examples
>       advsync: Add \centering in some tables
>       advsync: Use \path command for path names
>       rt: Centering figures of verbatim code examples
>       rt: Use \path{} for path names
>       rt: Consistently use 'real-time' as adjective
>       rt & advsync: Typo fixes
>       howto: Miscellaneous fixes
> 
>  SMPdesign/SMPdesign.tex              |   4 +-
>  advsync/advsync.tex                  |  10 +-
>  advsync/memorybarriers.tex           |  34 ++++---
>  advsync/rcu.tex                      |  38 +++----
>  appendix/primitives/primitives.tex   |   8 +-
>  appendix/rcuimpl/srcu.tex            |  38 +++----
>  appendix/whymb/whymemorybarriers.tex | 102 +++++++++----------
>  datastruct/datastruct.tex            | 132 +++++++++++++++----------
>  debugging/debugging.tex              |  24 +++--
>  defer/hazptr.tex                     |   8 +-
>  defer/rcuapi.tex                     |  20 ++--
>  defer/rcuexercises.tex               |   2 +-
>  defer/rcufundamental.tex             |  60 ++++++-----
>  defer/rcuusage.tex                   |  56 ++++++-----
>  defer/refcnt.tex                     |  34 ++++---
>  defer/seqlock.tex                    |  26 +++--
>  defer/toyrcu.tex                     | 186 +++++++++++++++++++++--------------
>  formal/axiomatic.tex                 |  18 ++--
>  formal/dyntickrcu.tex                |  88 ++++++++++-------
>  formal/ppcmem.tex                    |  32 +++---
>  formal/sat.tex                       |   2 +-
>  formal/spinhint.tex                  | 142 +++++++++++++++-----------
>  howto/howto.tex                      |  16 +--
>  locking/locking-existence.tex        |  16 +--
>  locking/locking.tex                  |  66 ++++++++-----
>  rt/rt.tex                            |  76 +++++++-------
>  together/applyrcu.tex                |  48 +++++----
>  27 files changed, 750 insertions(+), 536 deletions(-)
> 

