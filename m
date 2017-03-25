Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39186 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1753289AbdCYArL (ORCPT <rfc822;perfbook@vger.kernel.org>); Fri, 24
 Mar 2017 20:47:11 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v2P0d0KM088290
 for <perfbook@vger.kernel.org>; Fri, 24 Mar 2017 20:46:15 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 29cxexhqhm-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Fri,
 24 Mar 2017 20:46:15 -0400
Received: from localhost by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Fri, 24 Mar
 2017 20:46:14 -0400
Date: Fri, 24 Mar 2017 17:46:12 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 0/2] Follow up patches to FAQ-BUILD update
Reply-To: paulmck@linux.vnet.ibm.com
References: <d4e3f6ba-bdc9-fa85-7404-f189adfb6436@gmail.com>
 <20170323153558.GD3637@linux.vnet.ibm.com>
 <c7a6f457-3914-9e5e-a42a-29e9b8f67b77@gmail.com>
 <20170324181239.GJ3637@linux.vnet.ibm.com>
 <18798da1-60ed-a6b4-0a7b-e53a9f3b7fc0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18798da1-60ed-a6b4-0a7b-e53a9f3b7fc0@gmail.com>
Message-Id: <20170325004612.GN3637@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Mar 25, 2017 at 08:00:58AM +0900, Akira Yokosawa wrote:
> >From e2ffbd35e5a1121b953a2f7073ee50d6efc58cd3 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 25 Mar 2017 07:55:41 +0900
> Subject: [PATCH v4 0/2] Follow up patches to FAQ-BUILD update
> 
> Apologies. There was still a typo in v3. (v3 was aborted)
> Let me try again.

Much better!!!  Queued and pushed.

							Thanx, Paul

>                              Thanks, Akira
> --
> Akira Yokosawa (2):
>   FAQ-BUILD.txt: Fix misinformation crept in wordsmithing
>   Add another build error check
> 
>  FAQ-BUILD.txt              | 11 ++++++-----
>  utilities/runfirstlatex.sh |  6 ++++++
>  utilities/runlatex.sh      |  6 ++++++
>  3 files changed, 18 insertions(+), 5 deletions(-)
> 
> -- 
> 2.7.4
> 
> 

