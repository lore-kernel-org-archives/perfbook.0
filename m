Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:41352 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1756542AbdEKQvI (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Thu, 11 May 2017 12:51:08 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v4BGmcep099436
 for <perfbook@vger.kernel.org>; Thu, 11 May 2017 12:51:07 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2ac4f00815-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Thu,
 11 May 2017 12:51:07 -0400
Received: from localhost by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Thu, 11 May
 2017 12:51:07 -0400
Date: Thu, 11 May 2017 09:51:04 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] Use READ_ONCE() and WRITE_ONCE in
 count_stat_eventual.c
Reply-To: paulmck@linux.vnet.ibm.com
References: <1494515022-30278-1-git-send-email-junchangwang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1494515022-30278-1-git-send-email-junchangwang@gmail.com>
Message-Id: <20170511165104.GJ3956@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Junchang Wang <junchangwang@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, May 11, 2017 at 11:03:40PM +0800, Junchang Wang wrote:
> Hi Paul,
> 
> Please check the updated patch. The first patch is to replace existing
> ACCESS_ONCE to new READ/WRITE_ONCE primitives, and the second to protect global
> share variable stopflag.
> 
> BTW, I didn't see any performance differences between versions using volatile
> and READ/WRITE_ONCE primitives on my 16 cores Intel machine. I guess the major
> reason is that the sample code is simple such that registers are enough even if
> keyword volatile is used.

Very nice, sometimes we get lucky.  ;-)

Queue and pushed, thank you!

							Thanx, Paul

> Junchang Wang (2):
>   count_stat_eventual: Switch from ACCESS_ONCE() to
>     READ_ONCE()/WRITE_ONCE()
>   count_stat_eventual: Add READ_ONCE() to protect global shared variable
>     stopflag
> 
>  CodeSamples/count/count_stat_eventual.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> -- 
> 2.7.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

