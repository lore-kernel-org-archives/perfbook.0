Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:54016 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751297AbcJKHbC (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Tue, 11 Oct 2016 03:31:02 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id u9B7SQlW086147
 for <perfbook@vger.kernel.org>; Tue, 11 Oct 2016 03:31:01 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 260rwvq9g6-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 11 Oct 2016 03:31:01 -0400
Received: from localhost by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 11 Oct
 2016 01:31:01 -0600
Date: Tue, 11 Oct 2016 00:31:08 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/8] Fixups for together/ directory
Reply-To: paulmck@linux.vnet.ibm.com
References: <20161010230738.14452-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161010230738.14452-1-sj38.park@gmail.com>
Message-Id: <20161011073108.GB29518@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Oct 11, 2016 at 08:07:30AM +0900, SeongJae Park wrote:
> This patchset fixes few trivial problems under together/ directory that found
> by Korean translation work.
> 
> SeongJae Park (8):
>   together: Add missing NBSPs for line numbers
>   together: Fix a wrong code line quotation
>   together: Fix wrong function name quotations
>   together: Add a missing comma
>   together: Append `()` suffix to function name quotation
>   together: Fix a wrong field citation
>   together: Fix a contextual typo
>   together: Improve struct field quotation readability
> 
>  together/applyrcu.tex | 14 +++++++-------
>  together/refcnt.tex   | 10 +++++-----
>  2 files changed, 12 insertions(+), 12 deletions(-)

Queued and pushed, thank you!

							Thanx, Paul

