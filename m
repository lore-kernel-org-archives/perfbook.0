Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:39092 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726309AbgIZOjN (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sat, 26 Sep 2020 10:39:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601131152;
        bh=R1FMM8LIjfbj4BQ/DeajkFNqYuiE8x9s6FcXwoxttho=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=mWJd4/2UBeZ6cuufxVi7qa9B+HJMp/4PwdkEq1EZb0UrdSzp6xc0HN3sDB+LH/yKa
         Y4Nrc3Cv34uAZqiaHWAkGN2NDwjQ3fItx7z/jMP8fy0oxNLkKKeXJ7d+IlGxVn0S2g
         iYj6khuwXGxetCI/96iDEmlb/GKB9vq1COKClBOI=
Date: Sat, 26 Sep 2020 07:39:12 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] CodeSamples/formal: Add pointer cast in WRITE_ONCE() for
 Linux v5.8 compat
Message-ID: <20200926143912.GJ29330@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <2cbc9fb0-2e93-a8bd-bed3-4cea039e88ca@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2cbc9fb0-2e93-a8bd-bed3-4cea039e88ca@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Sep 26, 2020 at 12:32:28PM +0900, Akira Yokosawa wrote:
> >From 456d16d1450416bbd4eeea175a4bc0c2f819062d Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 26 Sep 2020 12:11:37 +0900
> Subject: [PATCH] CodeSamples/formal: Add pointer cast in WRITE_ONCE() for Linux v5.8 compat
> 
> On Linux v5.8, "make" under klitmus/ after "make cross-klitmus" at
> CodeSamples/formal/herd/ doesn't complete with the following error:
> 
>     In file included from ./include/linux/export.h:43,
>                      from ./include/linux/linkage.h:7,
>                      from ./include/linux/kernel.h:8,
>                      from ./include/linux/list.h:9,
>                      from ./include/linux/module.h:12,
>                      from [...]/CodeSamples/fromal/herd/klitmus/litmus030.c:11:
>     [...]/CodeSamples/formal/herd/klitmus/litmus030.c: In function 'code0':
>     ./include/linux/compiler.h:297:30: error: assignment to 'int * volatile'
>     from incomatible pointer type 'int **' [-Werror=incompatible-pointer-types]
>       297 |  *(volatile typeof(x) *)&(x) = (val);   \
>           |                              ^
> 
>     ./include/linux/compiler.h:303:2: note: in expansion of macro '__WRITE_ONCE'
>       303 |  __WRITE_ONCE(x, val);    \
>           |  ^~~~~~~~~~~~
> 
>     [...]/CodeSamples/formal/herd/klitmus/litmus030.c:363:2: note: in expansion
>     of macro 'WRITE_ONCE'
>       363 |  WRITE_ONCE(*x, x);
>           |  ^~~~~~~~~~
> 
>     cc1: some warnings being treated as errors
> 
> This is due to the simplification of WRITE_ONCE() [1].
> Now WRITE_ONCE() catches type mismatch of its arguments.
> 
> Adding a pointer cast to the WRITE_ONCE() argumant:
> 
>     WRITE_ONCE(*x, (int*)x);
> 
> makes the compiler happy.
> 
> [1]: https://git.kernel.org/linus/a5460b5e5fb8
>      ("READ_ONCE: Simplify implementations of {READ,WRITE}_ONCE()")
> 
> NOTE1: These litmus tests are converted from those under
>        CodeSamples/formal/litmus/.
> NOTE2: They were once presented as code snippets in perfbook.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good catch, queued and pushed, thank you!!!

							Thanx, Paul

> ---
>  CodeSamples/formal/litmus/C-WWC+o+o-data-o+o-addr-o.litmus | 2 +-
>  CodeSamples/formal/litmus/C-WWC+o+o-r+o-addr-o.litmus      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/CodeSamples/formal/litmus/C-WWC+o+o-data-o+o-addr-o.litmus b/CodeSamples/formal/litmus/C-WWC+o+o-data-o+o-addr-o.litmus
> index cd9df060..3525e033 100644
> --- a/CodeSamples/formal/litmus/C-WWC+o+o-data-o+o-addr-o.litmus
> +++ b/CodeSamples/formal/litmus/C-WWC+o+o-data-o+o-addr-o.litmus
> @@ -13,7 +13,7 @@ int *y = &b;
>  
>  P0(int **x)
>  {
> -	WRITE_ONCE(*x, x);
> +	WRITE_ONCE(*x, (int*)x);
>  }
>  
>  P1(int **x, int **y)
> diff --git a/CodeSamples/formal/litmus/C-WWC+o+o-r+o-addr-o.litmus b/CodeSamples/formal/litmus/C-WWC+o+o-r+o-addr-o.litmus
> index 6a65d674..0d16b2f7 100644
> --- a/CodeSamples/formal/litmus/C-WWC+o+o-r+o-addr-o.litmus
> +++ b/CodeSamples/formal/litmus/C-WWC+o+o-r+o-addr-o.litmus
> @@ -13,7 +13,7 @@ int *y = &b;
>  
>  P0(int **x)
>  {
> -	WRITE_ONCE(*x, x);
> +	WRITE_ONCE(*x, (int*)x);
>  }
>  
>  P1(int **x, int **y)
> -- 
> 2.17.1
> 
