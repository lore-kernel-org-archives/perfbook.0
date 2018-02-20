Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:44738 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751329AbeBTQd0 (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 20
 Feb 2018 11:33:26 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w1KGUkpi107813
 for <perfbook@vger.kernel.org>; Tue, 20 Feb 2018 11:33:26 -0500
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2g8n5fekae-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 20 Feb 2018 11:33:25 -0500
Received: from localhost by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 20 Feb
 2018 11:33:24 -0500
Date: Tue, 20 Feb 2018 08:33:45 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] CodeSamples/formal/herd: Remove dependency on
 linux-kernel-hardware.cat
Reply-To: paulmck@linux.vnet.ibm.com
References: <f00d9adf-bbcd-79c1-1454-6c217cb9ec1b@gmail.com>
 <84105abb-b535-d177-efac-f5fe8abcb705@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84105abb-b535-d177-efac-f5fe8abcb705@gmail.com>
Message-Id: <20180220163345.GM3617@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Feb 21, 2018 at 12:29:53AM +0900, Akira Yokosawa wrote:
> >From 8ba8747211c2793fae6d280833190bbe74486198 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 20 Feb 2018 00:09:53 +0900
> Subject: [PATCH v2] CodeSamples/formal/herd: Remove dependency on linux-kernel-hardware.cat
> 
> The target "run-herd7" doesn't depend on linux-kernel-hardware.cat.
> So remove it from the dependency list.
> This change also makes the target compatible with the provisional
> memory-consistency model branch [1] intended to be merged into Linux
> mainline.
> 
> [1] git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git lkmm
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Applied and pushed, thank you!

							Thanx, Paul

> ---
> Changes in v2:
>     Rephrase change log to clarify the intention of the change.
> --
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
> 

