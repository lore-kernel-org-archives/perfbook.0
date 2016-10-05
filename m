Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:44280 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1754126AbcJENXQ (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Wed, 5 Oct 2016 09:23:16 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id u95DIbUP064594
 for <perfbook@vger.kernel.org>; Wed, 5 Oct 2016 09:23:15 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 25vy3r51b5-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 05 Oct 2016 09:23:15 -0400
Received: from localhost by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 5 Oct 2016
 07:23:14 -0600
Date: Wed, 5 Oct 2016 06:23:17 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/3] Margin lengths and microtype tweaks
Reply-To: paulmck@linux.vnet.ibm.com
References: <fb8777a9-a5f2-ede7-69b6-8882f05cdb81@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb8777a9-a5f2-ede7-69b6-8882f05cdb81@gmail.com>
Message-Id: <20161005132317.GD3640@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Oct 05, 2016 at 12:20:20AM +0900, Akira Yokosawa wrote:
> >From a37c36710b08dce3b4be06416a131b1f99aa327a Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 5 Oct 2016 00:00:59 +0900
> Subject: [PATCH 0/3] Margin lengths and microtype tweaks
> 
> Hi Paul,
> 
> This patch series makes tiny adjustments of margin lengths
> definitions and a workaround of slight miss-alignment of code
> snippets caused by the use of "microtype" package.

Queued and pushed, thank you!

							Thanx, Paul

>                                         Thanks, Akira
> ---
> Akira Yokosawa (3):
>   Rewrite custom margins for hardcover
>   Tweak oddside and evenside margins of onecolumn
>   Disable 'microtype' in code snippets
> 
>  perfbook.tex | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> -- 
> 2.7.4
> 

