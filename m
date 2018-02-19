Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46622 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1753371AbeBSRxe (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Mon, 19 Feb 2018 12:53:34 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w1JHnFFE121674
 for <perfbook@vger.kernel.org>; Mon, 19 Feb 2018 12:53:33 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2g7yv92aj9-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 19 Feb 2018 12:53:33 -0500
Received: from localhost by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 19 Feb
 2018 12:53:32 -0500
Date: Mon, 19 Feb 2018 09:53:53 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] CodeSamples/formal/herd: Remove dependency to
 linux-kernel-hardware.cat
Reply-To: paulmck@linux.vnet.ibm.com
References: <f00d9adf-bbcd-79c1-1454-6c217cb9ec1b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f00d9adf-bbcd-79c1-1454-6c217cb9ec1b@gmail.com>
Message-Id: <20180219175353.GX3617@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Feb 20, 2018 at 12:14:24AM +0900, Akira Yokosawa wrote:
> >From 9ef0701c8f161c8582bd6084e5d2706a0ad92d00 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 20 Feb 2018 00:09:53 +0900
> Subject: [PATCH] CodeSamples/formal/herd: Remove dependency to linux-kernel-hardware.cat
> 
> linux-kernel-hardware.cat is not present in the branch expected
> to be merged in 4.17 window.

Good point, but it might be added at some later date.  This does raise
the question of whether it makes any sense to try to keep up with the
Linux-kernel memory model once that model is in mainline.  ;-)

							Thanx, Paul

> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  CodeSamples/formal/herd/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/CodeSamples/formal/herd/Makefile b/CodeSamples/formal/herd/Makefile
> index 8e0635a..3162659 100644
> --- a/CodeSamples/formal/herd/Makefile
> +++ b/CodeSamples/formal/herd/Makefile
> @@ -31,7 +31,7 @@
> 
>  LKMM_DIR     := memory-model
>  LKMM_FILES   := linux-kernel.bell linux-kernel.cat linux-kernel.cfg \
> -		linux-kernel.def linux-kernel-hardware.cat lock.cat
> +		linux-kernel.def lock.cat
>  LKMM_LIST    := $(addprefix $(LKMM_DIR)/,$(LKMM_FILES))
>  HERD_DIR     := $(shell pwd)
>  HERD7_CMD    := $(shell which herd7)
> -- 
> 2.7.4
> 

