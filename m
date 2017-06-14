Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:57948 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751714AbdFNRwi (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Wed, 14 Jun 2017 13:52:38 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v5EHoLJO085626
 for <perfbook@vger.kernel.org>; Wed, 14 Jun 2017 13:52:37 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2b37vmp5d9-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 14 Jun 2017 13:52:37 -0400
Received: from localhost by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 14 Jun
 2017 13:52:37 -0400
Date: Wed, 14 Jun 2017 10:52:34 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/5] Updating Section Deferred Processing
Reply-To: paulmck@linux.vnet.ibm.com
References: <1497455104-14102-1-git-send-email-junchangwang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1497455104-14102-1-git-send-email-junchangwang@gmail.com>
Message-Id: <20170614175234.GQ3721@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Junchang Wang <junchangwang@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Jun 14, 2017 at 11:44:59PM +0800, Junchang Wang wrote:
> Hi Paul,
> 
> Most of the following patches switch from ACCESS_ONCE to READ_ONCE/WRITE_ONCE in
> Section Deferred Processing. Please take a look.

Applied and pushed, thank you!

And good catch on the redundant assignment!  ;-)

							Thanx, Paul

> Thanks,
> --Jason
> 
> Junchang Wang (5):
>   hazptr: Switch from ACCESS_ONCE() to READ_ONCE()/WRITE_ONCE()
>   route_rcu: Switch from ACCESS_ONCE() to READ_ONCE()/WRITE_ONCE()
>   route_rcu: Remove redundant assignment statement to rep->re_freed
>   seqlocktorture: Switch from ACCESS_ONCE() to READ_ONCE()/WRITE_ONCE()
>   rcu_rcpls: Switch from ACCESS_ONCE() to READ_ONCE()/WRITE_ONCE()
> 
>  CodeSamples/defer/hazptr.h         |  8 ++++----
>  CodeSamples/defer/hazptrtorture.h  |  6 +++---
>  CodeSamples/defer/rcu_rcpls.c      |  6 +++---
>  CodeSamples/defer/rcu_rcpls.h      |  2 +-
>  CodeSamples/defer/rcutorture.h     |  2 +-
>  CodeSamples/defer/route_rcu.c      |  5 ++---
>  CodeSamples/defer/seqlocktorture.c |  8 ++++----
>  appendix/toyrcu/toyrcu.tex         | 14 +++++++-------
>  defer/rcuusage.tex                 |  4 ++--
>  9 files changed, 27 insertions(+), 28 deletions(-)
> 
> -- 
> 2.7.4
> 

