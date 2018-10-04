Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:47104 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726277AbeJDKX2 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 4 Oct 2018 06:23:28 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w943Sr6P141565
        for <perfbook@vger.kernel.org>; Wed, 3 Oct 2018 23:32:16 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2mw8b7vxay-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Wed, 03 Oct 2018 23:32:16 -0400
Received: from localhost
        by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Wed, 3 Oct 2018 23:32:15 -0400
Date: Wed, 3 Oct 2018 20:32:12 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH] CodeSamples/Makefile: Add conditional for liburcu on
 Ubuntu Bionic
Reply-To: paulmck@linux.ibm.com
References: <2bdaa0c0-3a0a-83a7-ee1b-2747bae2cb03@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2bdaa0c0-3a0a-83a7-ee1b-2747bae2cb03@gmail.com>
Message-Id: <20181004033212.GX4222@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Oct 03, 2018 at 11:52:54PM +0900, Akira Yokosawa wrote:
> >From 91e27d8066e353966b4c35de15f70e278fbcb8ce Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 3 Oct 2018 23:29:29 +0900
> Subject: [PATCH] CodeSamples/Makefile: Add conditional for liburcu on Ubuntu Bionic
> 
> On Ubuntu Bionic, header files of liburcu-dev are installed under
> an arch dependent directory such as /usr/include/x86_64-linux-gnu/.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Applied and pushed, thank you!

							Thanx, Paul

> ---
>  CodeSamples/Makefile   | 4 +++-
>  CodeSamples/depends.mk | 7 +++++++
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/CodeSamples/Makefile b/CodeSamples/Makefile
> index 036fc66..3a96f5c 100644
> --- a/CodeSamples/Makefile
> +++ b/CodeSamples/Makefile
> @@ -39,7 +39,9 @@ endif
>  	echo "" >> api.h
>  	cat api-pthreads/api-gcc.h >> api.h
>  	echo "" >> api.h
> -	if test -f /usr/include/urcu-call-rcu.h -o -f /usr/local/include/urcu-call-rcu.h ; \
> +	if test -f /usr/include/urcu-call-rcu.h -o \
> +		-f /usr/local/include/urcu-call-rcu.h -o \
> +		-f /usr/include/$(subdir_ub)/urcu-call-rcu.h ; \
>  	then \
>  		echo "#define _LGPL_SOURCE" >> api.h; \
>  		echo "#include <urcu/rculist.h>" >> api.h; \
> diff --git a/CodeSamples/depends.mk b/CodeSamples/depends.mk
> index 77a76bf..31a8daf 100644
> --- a/CodeSamples/depends.mk
> +++ b/CodeSamples/depends.mk
> @@ -4,18 +4,25 @@ endif
>  
>  ifeq ($(arch),i686)
>  target := x86
> +subdir_ub := i386-linux-gnu
>  else ifeq ($(arch),x86_64)
>  target := x86
> +subdir_ub := x86_64-linux-gnu
>  else ifeq ($(arch),ppc64)
>  target := ppc64
> +subdir_ub :=
>  else ifeq ($(arch),ppc64le)
>  target := ppc64
> +subdir_ub := powerpc64le-linux-gnu
>  else ifeq ($(arch),aarch64)
>  target := arm64
> +subdir_ub := aarch64-linux-gnu
>  else ifneq (,$(findstring arm,$(arch)))
>  target := arm
> +subdir_ub := arm-linux-gnueabihf
>  else
>  target :=
> +subdir_ub :=
>  endif
>  
>  api_depend_common := $(top)/linux/common.h \
> -- 
> 2.7.4
> 

