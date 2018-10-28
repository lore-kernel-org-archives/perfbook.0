Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36480 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728899AbeJ1Ivs (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 28 Oct 2018 04:51:48 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w9RNxHUw166857
        for <perfbook@vger.kernel.org>; Sat, 27 Oct 2018 20:09:01 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2nd1kn14h8-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Sat, 27 Oct 2018 20:09:01 -0400
Received: from localhost
        by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Sat, 27 Oct 2018 20:09:01 -0400
Date: Sat, 27 Oct 2018 17:08:59 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH] CodeSamples: Add api-pthreads/api-gcc.h in depends.mk
Reply-To: paulmck@linux.ibm.com
References: <3244d38a-5ac7-657f-83c4-38d0adf2a7c8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3244d38a-5ac7-657f-83c4-38d0adf2a7c8@gmail.com>
Message-Id: <20181028000859.GI4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Oct 28, 2018 at 08:14:37AM +0900, Akira Yokosawa wrote:
> >From ce0f6785bd5e059a29a3d647287bcf93648f66f8 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 28 Oct 2018 08:02:09 +0900
> Subject: [PATCH] CodeSamples: Add api-pthreads/api-gcc.h in depends.mk
> 
> While testing change in cmpxchg() commited as cda0234ccd2c
> ("atomic_cmpxchg: Handle spurious failure of
> __atomic_compare_exchange_n"), api.h was not updated
> automatically by "make".  Fix this by adding the dependency
> (api-pthreads/api-gcc.h -> api.h)
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Applied and pushed, thank you!

							Thanx,  Paul

> ---
>  CodeSamples/depends.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/CodeSamples/depends.mk b/CodeSamples/depends.mk
> index 31a8daf..a6db993 100644
> --- a/CodeSamples/depends.mk
> +++ b/CodeSamples/depends.mk
> @@ -26,7 +26,9 @@ subdir_ub :=
>  endif
>  
>  api_depend_common := $(top)/linux/common.h \
> -	$(top)/api-pthreads/api-pthreads.h
> +	$(top)/api-pthreads/api-pthreads.h \
> +	$(top)/api-pthreads/api-gcc.h
> +
>  ifeq ($(target),x86)
>  api_depend := $(top)/arch-x86/arch-x86.h
>  arch_depend := $(top)/arch-x86/Makefile.arch
> -- 
> 2.7.4
> 

