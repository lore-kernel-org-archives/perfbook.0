Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52237 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1753274AbcIRRoc (ORCPT <rfc822;perfbook@vger.kernel.org>); Sun, 18
 Sep 2016 13:44:32 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id u8IHcFi6034691
 for <perfbook@vger.kernel.org>; Sun, 18 Sep 2016 13:44:31 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 25h059b7wj-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 18 Sep 2016 13:44:31 -0400
Received: from localhost by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 18 Sep
 2016 11:44:30 -0600
Date: Sun, 18 Sep 2016 10:44:27 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] Add rules in hyphen2endash.sh
Reply-To: paulmck@linux.vnet.ibm.com
References: <2247f46e-3c0a-89a5-f13f-b9ba591bc570@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2247f46e-3c0a-89a5-f13f-b9ba591bc570@gmail.com>
Message-Id: <20160918174427.GI10850@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Sep 18, 2016 at 11:24:42PM +0900, Akira Yokosawa wrote:
> >From ec548ecfa8846f40731a0945853d3ac9018b4d71 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 18 Sep 2016 23:09:34 +0900
> Subject: [PATCH 0/2] Add rules in hyphen2endash.sh
> 
> This is an update of scripts added in commit dd08907f289d
> ("Trial of replacing hyphens with en-dashes for number ranges").
> 
> 1st patch adds patterns for the following:
>   o CPUs~nn--mm
>   o \co{xxx}--\co{yyy}
> 
> It also fixes typo in the authors email address.
> 
> 2nd patch merges several rules by using "[abc]" regex patterns.

Applied and pushed, thank you!

							Thanx, Paul

> Akira Yokosawa (2):
>   hyphen2endash.sh: Add substitution patterns
>   hyphen2endash.sh: Merge subst patterns
> 
>  utilities/dohyphen2endash.sh |  2 +-
>  utilities/hyphen2endash.sh   | 23 +++++++++++------------
>  2 files changed, 12 insertions(+), 13 deletions(-)
> 
> -- 
> 1.9.1
> 

