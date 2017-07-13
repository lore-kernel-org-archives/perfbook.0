Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53190 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751157AbdGMSDs (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Thu, 13 Jul 2017 14:03:48 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v6DHsHlO075349
 for <perfbook@vger.kernel.org>; Thu, 13 Jul 2017 14:03:47 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2bpafm9342-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Thu,
 13 Jul 2017 14:03:47 -0400
Received: from localhost by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Thu, 13 Jul
 2017 14:03:47 -0400
Date: Thu, 13 Jul 2017 11:03:43 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/6] advsync: Misc. fixes around litmus tests
Reply-To: paulmck@linux.vnet.ibm.com
References: <1dd8bb1c-ce48-1de0-0032-fdab3bd68b46@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1dd8bb1c-ce48-1de0-0032-fdab3bd68b46@gmail.com>
Message-Id: <20170713180343.GN2393@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Jul 13, 2017 at 12:07:18AM +0900, Akira Yokosawa wrote:
> >From de45acd5a73354cbe03abaf3130177687c77e4cb Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 12 Jul 2017 23:45:17 +0900
> Subject: [PATCH 0/6] advsync: Misc. fixes around litmus tests
> 
> Hi Paul,
> 
> This patch set tries to cleanup recently updated material in advsync.
> 
> Patches 1 to 3 are fixes of litmus tests under CodeSamples/advsync/herd
> and their corresponding snippets in memorybarriers.tex.
> 
> Patch 4 is trivial fixes.
> 
> Patch 5 is my attempt for the sentence to make sense.
> 
> Patch 6 updates the usage of x0 and x1 in the tables of Store-Buffering
> Sequence of Events. I stopped short of using READ_ONCE() and WRITE_ONCE()
> in the "Instruction" columns. The change seems unnecessary for me.
> I think we can assume a reader of this section can easily translate
> READ_ONCE() and WRITE_ONCE() to simple assignments in his/her mind.
> Also, you are calling x0 and x1 as if they are variables in the text.
> But I don't think the current way of description is ambiguous.
> 
> So, Patches 1 to 4 should be all right. You might feel otherwise to
> Patches 5 and 6.

Good catches, thank you!!!

The only think I didn't take was the addition of indirection to the
variables in the tables.  The litmus tests have the indirection on
the function parameters, and omit it in the exists clause.  So there
is potential for confusion either way.  So I came down on the side of
the shortest way, that is, omitting the indirection.

And yes, my original tables were inconsistent!  ;-)

I also took your 7/6 patch, and thank you again.

							Thanx, Paul

> Thoughts?
> 
>             Thanks, Akira
> -- 
> Akira Yokosawa (6):
>   advsync: Fix typo of litmus name
>   advsync: Fix typos in load-buffering litmus tests
>   advsync: Fix remaining typo in exists condition
>   advsync: Trivial typo fixes
>   advsync: Fix grammatical error
>   advsync: Adjust value expressions in Tables 14.1 and 14.2
> 
>  CodeSamples/advsync/herd/C-LB+o-o+o-o.litmus       |   2 +-
>  CodeSamples/advsync/herd/C-LB+o-r+a-o.litmus       |   4 +-
>  .../advsync/herd/C-MP+o-wmb-o+o-rmb-o.litmus       |   2 +-
>  advsync/memorybarriers.tex                         | 103 ++++++++++-----------
>  4 files changed, 55 insertions(+), 56 deletions(-)
> 
> -- 
> 2.7.4
> 

