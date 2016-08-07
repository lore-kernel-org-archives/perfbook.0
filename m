Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58630 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)	by vger.kernel.org
 with ESMTP id S1751712AbcHGSZY (ORCPT	<rfc822;perfbook@vger.kernel.org>);
 Sun, 7 Aug 2016 14:25:24 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])	by
 mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u77IOMUm041000
 for <perfbook@vger.kernel.org>; Sun, 7 Aug 2016 14:25:24 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])	by
 mx0b-001b2d01.pphosted.com with ESMTP id 24nc2xwffg-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Sun,
 07 Aug 2016 14:25:23 -0400
Received: from localhost	by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sun, 7 Aug 2016
 14:25:23 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28])	by d01dlp01.pok.ibm.com (Postfix) with ESMTP id C075738C8041
 for <perfbook@vger.kernel.org>; Sun, 7 Aug 2016 14:25:21 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u77IPNmI2097446	for <perfbook@vger.kernel.org>; Sun, 7 Aug 2016 18:25:23 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u77IPLOA016202	for <perfbook@vger.kernel.org>; Sun, 7 Aug 2016 14:25:21 -0400
Date: Sun, 7 Aug 2016 11:25:22 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/3] Polish rcutorture.h
Reply-To: paulmck@linux.vnet.ibm.com
References: <1470541287-12588-1-git-send-email-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1470541287-12588-1-git-send-email-sj38.park@gmail.com>
Message-Id: <20160807182522.GF3482@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Aug 07, 2016 at 12:41:24PM +0900, SeongJae Park wrote:
> This patchset contains few fixups for trivial nitpicks of rcutorture.

Good catches, applied and pushed.

								Thanx, Paul

> SeongJae Park (3):
>   rcutorture: Update usage
>   rcutorture: Remove redundant n_read_pt initialization
>   rcutorture: Protect fake workload from compiler optimization
> 
>  CodeSamples/defer/rcutorture.h | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> -- 
> 1.9.1
> 

