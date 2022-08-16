Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232426AbiHPTHj (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 16 Aug 2022 15:07:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 837126C128
        for <perfbook@vger.kernel.org>; Tue, 16 Aug 2022 12:07:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 12A7A61366
        for <perfbook@vger.kernel.org>; Tue, 16 Aug 2022 19:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660676857;
        bh=UyMqCvQkH9SURm7N4ryLVhaHXV89Sto2m4DbL031ilo=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=e2GEGW+n3kAgdmMTEkHlSSFa/S9Ec3V0JVI6dF8MvleZ24j46Gh/hvycehDn/hhpc
         tBDxcvlAzU8Qn6Ndhler9KgVRE6WILLi0m1DK7IAzaFZqdJWSXFglGAXRwxxl0d7E3
         L5clQiG/zuScSf4fEgQWeqiWv9y/tHaJQKF9ypKXcX+JfpafJkFxBeScJeY/CfNwGj
         z4CYJog/KmCpMe4nF31hMSAplOLmjTfD1N6mHTG9npixMnY+sDOJV9kd8WCzINU3ra
         Y+WdoJpq6ksLNs2AWUxFoZrEt5p9dWdi/G82KvjPKGE8A0PbtTpnVhgJ2nTE2x1+C/
         sbFs1eShYardg==
Date: Tue, 16 Aug 2022 12:07:37 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v3] CodeSamples: Support for building on different
 operating systems
Message-ID: <20220816190737.GE2125313@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220816002224.33347-1-e2lahav@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220816002224.33347-1-e2lahav@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Aug 15, 2022 at 08:22:25PM -0400, Elad Lahav wrote:
> Signed-off-by: Elad Lahav <e2lahav@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  CodeSamples/Makefile                    |  4 ++-
>  CodeSamples/api-pthreads/api-linux.h    | 36 ++++++++++++++++++++++++
>  CodeSamples/api-pthreads/api-pthreads.h | 13 ---------
>  CodeSamples/api-pthreads/api-qnx.h      | 37 +++++++++++++++++++++++++
>  CodeSamples/arch-arm64/arch-arm64.h     |  4 +++
>  CodeSamples/depends.mk                  | 29 ++++++++++++++++++-
>  6 files changed, 108 insertions(+), 15 deletions(-)
>  create mode 100644 CodeSamples/api-pthreads/api-linux.h
>  create mode 100644 CodeSamples/api-pthreads/api-qnx.h
> 
> diff --git a/CodeSamples/Makefile b/CodeSamples/Makefile
> index 3a96f5cf..38143638 100644
> --- a/CodeSamples/Makefile
> +++ b/CodeSamples/Makefile
> @@ -38,10 +38,12 @@ endif
>  		sed '/end{snippet}/d' >> api.h
>  	echo "" >> api.h
>  	cat api-pthreads/api-gcc.h >> api.h
> +	cat api-pthreads/api-$(os_compat).h >> api.h
>  	echo "" >> api.h
>  	if test -f /usr/include/urcu-call-rcu.h -o \
>  		-f /usr/local/include/urcu-call-rcu.h -o \
> -		-f /usr/include/$(subdir_ub)/urcu-call-rcu.h ; \
> +		-f /usr/include/$(subdir_ub)/urcu-call-rcu.h -o \
> +		-f $(QNX_TARGET)/usr/include/urcu-call-rcu.h ; \
>  	then \
>  		echo "#define _LGPL_SOURCE" >> api.h; \
>  		echo "#include <urcu/rculist.h>" >> api.h; \
> diff --git a/CodeSamples/api-pthreads/api-linux.h b/CodeSamples/api-pthreads/api-linux.h
> new file mode 100644
> index 00000000..03522a54
> --- /dev/null
> +++ b/CodeSamples/api-pthreads/api-linux.h
> @@ -0,0 +1,36 @@
> +/*
> + * api-linux.h: Linux-specific functions
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.  However, please note that much
> + * of the code in this file derives from the Linux kernel, and that such
> + * code may not be available except under GPLv2.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, you can access it online at
> + * http://www.gnu.org/licenses/gpl-2.0.html.
> + *
> + * Copyright (c) 2006-2019 Paul E. McKenney, IBM.
> + * Copyright (c) 2019 Paul E. McKenney, Facebook.
> + */
> +
> +static __inline__ void run_on(int cpu)
> +{
> +	cpu_set_t mask;
> +	int ret;
> +
> +	CPU_ZERO(&mask);
> +	CPU_SET(cpu, &mask);
> +	ret = sched_setaffinity(0, sizeof(mask), &mask);
> +	if (ret) {
> +		perror("sched_setaffinity");
> +		abort();
> +	}
> +}
> diff --git a/CodeSamples/api-pthreads/api-pthreads.h b/CodeSamples/api-pthreads/api-pthreads.h
> index 44e55c0d..3e21fdb9 100644
> --- a/CodeSamples/api-pthreads/api-pthreads.h
> +++ b/CodeSamples/api-pthreads/api-pthreads.h
> @@ -308,19 +308,6 @@ static __inline__ void waitall(void)
>  }
>  // \end{snippet}
>  
> -static __inline__ void run_on(int cpu)
> -{
> -	cpu_set_t mask;
> -	int ret;
> -
> -	CPU_ZERO(&mask);
> -	CPU_SET(cpu, &mask);
> -	ret = sched_setaffinity(0, sizeof(mask), &mask);
> -	if (ret) {
> -		perror("sched_setaffinity");
> -		abort();
> -	}
> -}
>  
>  /*
>   * Timekeeping, using monotonic globally coherent clock.
> diff --git a/CodeSamples/api-pthreads/api-qnx.h b/CodeSamples/api-pthreads/api-qnx.h
> new file mode 100644
> index 00000000..ed2fb543
> --- /dev/null
> +++ b/CodeSamples/api-pthreads/api-qnx.h
> @@ -0,0 +1,37 @@
> +/*
> + * api-qnx.h: QNX-specific functions
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.  However, please note that much
> + * of the code in this file derives from the Linux kernel, and that such
> + * code may not be available except under GPLv2.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, you can access it online at
> + * http://www.gnu.org/licenses/gpl-2.0.html.
> + *
> + * Copyright (c) 2022 Elad Lahav
> + */
> +
> +#include <stdint.h>
> +#include <sys/neutrino.h>
> +
> +static inline void run_on(int cpu)
> +{
> +	uintptr_t runmask;
> +	int ret;
> +
> +	runmask = (1UL << cpu);
> +	ret = ThreadCtl(_NTO_TCTL_RUNMASK, (void *)runmask);
> +	if (ret) {
> +		perror("sched_setaffinity");
> +		abort();
> +	}
> +}
> diff --git a/CodeSamples/arch-arm64/arch-arm64.h b/CodeSamples/arch-arm64/arch-arm64.h
> index 0e724740..f45d8bdc 100644
> --- a/CodeSamples/arch-arm64/arch-arm64.h
> +++ b/CodeSamples/arch-arm64/arch-arm64.h
> @@ -46,6 +46,10 @@
>  #include <stdlib.h>
>  #include <time.h>
>  
> +#ifndef CLOCK_MONOTONIC_RAW
> +#define CLOCK_MONOTONIC_RAW CLOCK_MONOTONIC
> +#endif
> +
>  /*
>   * Generate 64-bit timestamp.
>   */
> diff --git a/CodeSamples/depends.mk b/CodeSamples/depends.mk
> index a6db993f..30810339 100644
> --- a/CodeSamples/depends.mk
> +++ b/CodeSamples/depends.mk
> @@ -1,7 +1,13 @@
>  ifeq ($(strip $(arch)),)
> -arch := $(shell uname -m)
> +arch := $(shell uname -p)
>  endif
>  
> +ifeq ($(strip $(os)),)
> +os := $(shell uname)
> +endif
> +
> +ifeq ($(os),Linux)
> +# Linux
>  ifeq ($(arch),i686)
>  target := x86
>  subdir_ub := i386-linux-gnu
> @@ -23,6 +29,27 @@ subdir_ub := arm-linux-gnueabihf
>  else
>  target :=
>  subdir_ub :=
> +endif
> +os_compat := linux
> +
> +else ifeq ($(os),QNX)
> +# QNX
> +ifeq ($(arch),x86_64)
> +target := x86
> +else ifeq ($(arch),aarch64le)
> +target := arm64
> +else
> +target :=
> +endif
> +subdir_ub :=
> +os_compat := qnx
> +
> +else
> +# Other OS
> +target :=
> +subdir_ub :=
> +os_compat :=
> +
>  endif
>  
>  api_depend_common := $(top)/linux/common.h \
> -- 
> 2.25.1
> 
