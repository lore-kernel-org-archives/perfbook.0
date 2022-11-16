Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233296AbiKPQgT (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 16 Nov 2022 11:36:19 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B437F5BD53
        for <perfbook@vger.kernel.org>; Wed, 16 Nov 2022 08:29:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7AFA4B81DED
        for <perfbook@vger.kernel.org>; Wed, 16 Nov 2022 16:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668616144;
        bh=cBz9re6yc+EwxI3oq1jEtCJs+RQ4XCUj2yUzsWW/vrc=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=tt2tTx28aqy2CCstBKOyFoQy5WsszICPiC/ZLAgqZCchgZuktkiIgGEP4jXSOc2TK
         0CXaI5CrJgXKiM4d05LeFJIeOne42ctdicDsQYMjsnL7sOIe6DQUA6LKZbpKpyVE0K
         2BwOeJxw3Rtu7BeeQ/gnEz3SB+rve0WkZ99xj95OLIvI/HmA1ObEUUsYlbZO77L9ZY
         Aox5LNkiIJzZXXsJvdRZT8IDXELUjAhju7BWpG9qgEsJI2JWTxhup9vE5mB5IQgQ8e
         JZZEx4oL3fTJQcukUCC7Rw1hEvysxPlDU1Rp14RmV7FJTVpLXvD31vG5pqAp01mqdH
         zBIdWqQgxSCFg==
Date: Wed, 16 Nov 2022 08:29:03 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v2 -perfbook] CodeSamples: Add -fcommon to GCC_ARGS
Message-ID: <20221116162903.GO4001@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <a72f12a9-0b7a-b711-62c4-11bd76cfde65@qa2.so-net.ne.jp>
 <b636c9f8-31ad-599e-d75b-d23d2e1fdb4b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b636c9f8-31ad-599e-d75b-d23d2e1fdb4b@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Elad Lahav <e2lahav@gmail.com>, perfbook@vger.kernel.org

On Tue, Nov 15, 2022 at 06:43:59AM +0900, Akira Yokosawa wrote:
> An item on GCC 10 changes [1] reads:
> 
>   - GCC now defaults to -fno-common. As a result, global variable
>     accesses are more efficient on various targets. In C, global
>     variables with multiple tentative definitions now result in
>     linker errors. With -fcommon such definitions are silently
>     merged during linking.
> 
> This change affects builds under CodeSamples/ as reported by Elad [2].
> 
> As a band-aide fix, add -fcommon to GCC_ARGS where necessary.
> 
> Reported-by: Elad Lahav <e2lahav@gmail.com>
> Link: [1] https://gcc.gnu.org/gcc-10/changes.html
> Link: [2] https://www.spinics.net/lists/perfbook/msg03690.html
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued, thank you both!

							Thanx, Paul

> ---
> v2:
>  - Fix mismatch of From: and S-o-b.
> 
>         Thanks, Akira
> 
> --
>  CodeSamples/datastruct/Issaquah/Makefile | 2 ++
>  CodeSamples/datastruct/hash/Makefile     | 2 ++
>  CodeSamples/defer/Makefile               | 2 ++
>  3 files changed, 6 insertions(+)
> 
> diff --git a/CodeSamples/datastruct/Issaquah/Makefile b/CodeSamples/datastruct/Issaquah/Makefile
> index 51b91fd8dafa..c3b724d750b2 100644
> --- a/CodeSamples/datastruct/Issaquah/Makefile
> +++ b/CodeSamples/datastruct/Issaquah/Makefile
> @@ -32,6 +32,8 @@ endif
>  
>  include $(top)/recipes.mk
>  
> +GCC_ARGS += -fcommon
> +
>  # NOTE:  For decent scalability on update-side tests as of early 2015,
>  #	 use something like jemalloc() instead of glibc malloc().
>  #	 If you install jemalloc at /home/paulmck/jemalloc, you will
> diff --git a/CodeSamples/datastruct/hash/Makefile b/CodeSamples/datastruct/hash/Makefile
> index 80568cd11981..a56255a272eb 100644
> --- a/CodeSamples/datastruct/hash/Makefile
> +++ b/CodeSamples/datastruct/hash/Makefile
> @@ -32,6 +32,8 @@ endif
>  
>  include $(top)/recipes.mk
>  
> +GCC_ARGS += -fcommon
> +
>  hash_bkt: hash_bkt.c ../../api.h hashtorture.h
>  	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt hash_bkt.c $(LIB)/random.c -lpthread
>  
> diff --git a/CodeSamples/defer/Makefile b/CodeSamples/defer/Makefile
> index 46cb87a1c9dc..3cf3e5a5f134 100644
> --- a/CodeSamples/defer/Makefile
> +++ b/CodeSamples/defer/Makefile
> @@ -61,6 +61,8 @@ endif
>  
>  include $(top)/recipes.mk
>  
> +GCC_ARGS += -fcommon
> +
>  # Note that bug_srcu_a is disabled until completed.
>  bug_srcu_a: bug_srcu_a.c srcu.c ../api.h
>  	cc $(GCC_ARGS) -o bug_srcu_a -DTEST bug_srcu_a.c -lurcu -lpthread
> 
> base-commit: 7f7a2c25e3d2e87412d10bdb355b369eca524b1a
> -- 
> 2.25.1
> 
> 
