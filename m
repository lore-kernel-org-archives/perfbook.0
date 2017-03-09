Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37001 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1754691AbdCIRSQ (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Thu, 9 Mar 2017 12:18:16 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v29H8lP3013849
 for <perfbook@vger.kernel.org>; Thu, 9 Mar 2017 12:18:15 -0500
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 292mrm54ng-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Thu,
 09 Mar 2017 12:18:14 -0500
Received: from localhost by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Thu, 9 Mar 2017
 12:18:13 -0500
Date: Thu, 9 Mar 2017 09:18:10 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/5] Convert to "description" list
Reply-To: paulmck@linux.vnet.ibm.com
References: <97daedea-d454-cdf6-0111-8089ef0678c8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97daedea-d454-cdf6-0111-8089ef0678c8@gmail.com>
Message-Id: <20170309171810.GW30506@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Mar 10, 2017 at 12:18:19AM +0900, Akira Yokosawa wrote:
> >From e4a223315e3db9ffe303a95e15ee662935baaea9 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Thu, 9 Mar 2017 23:57:00 +0900
> Subject: [PATCH 0/5] Convert to "description" list
> 
> Hi Paul,
> 
> This is the follow-up set of patches. It includes:
> 
>   o Use "enumitem" instead of "enumerate"
>   o Convert to "description"
> 
> Conversion to "description" looks reasonable changes for me.
> Let me know what you think.

Nice improvements, thank you!  Queued and pushed.

							Thanx, Paul

> There are other candidates of similar conversions in Appendix B,
> But as you mentioned earlier that the appendix needs update
> (or replacement by a newer article you posted the other day),
> I'm not sure if it is worthwhile to do changes there, and stopped
> short of posting patches for the appendix.
> 
>                                    Thanks, Akira
> -- 
> Akira Yokosawa (5):
>   Use 'enumitem' package instead of 'enumerate'
>   intro: Move ':' to tail of 'description' label
>   debugging: Convert to 'description'
>   formal: Convert to 'description'
>   together: Covert to 'description'
> 
>  debugging/debugging.tex | 10 +++++-----
>  formal/dyntickrcu.tex   | 14 +++++++-------
>  formal/spinhint.tex     | 12 ++++++------
>  howto/howto.tex         |  2 +-
>  intro/intro.tex         | 10 +++++-----
>  perfbook.tex            |  4 +++-
>  together/refcnt.tex     | 30 +++++++++++++++---------------
>  7 files changed, 42 insertions(+), 40 deletions(-)
> 
> -- 
> 2.7.4
> 

