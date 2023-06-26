Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjFZAXT (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 25 Jun 2023 20:23:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C20AA1BB
        for <perfbook@vger.kernel.org>; Sun, 25 Jun 2023 17:23:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 456A960C4D
        for <perfbook@vger.kernel.org>; Mon, 26 Jun 2023 00:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687738997;
        bh=u7WAVT/mFqx7FE4mOm/ftSJJcNwuucDyEh3fPmHvjO0=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=DlaFiKmSm4U96F37iTEZv2Of7npX8S94vvQxRg3QgG2PWgBeQqC3/1RN8CJqVfQD/
         2ZAwseg9VEiGecnWxpbR2poQrypye5vQAUDGimzvtizONVS0YPpbxEytPQhEx0i4bo
         eXyFaT7HfiARm6Rcmi9SsqhvHvaNmjwJpQD4XnC7yzSV+oLkVW5hPhSsth3tv4IHi/
         YUUdkJFY/zyYjc1rPKKzMxaXW4B/zoTjegUGO03PWwy7y1gPZciqsU8UDoK+JxT/gK
         AUbWknrJunmeIZkCDloyTJpOyZ5x/heUwrcQCu+wc8duls33YL/wMzA+yLdTnSa3Xc
         PYSI+XSnCSbTw==
Date: Sun, 25 Jun 2023 17:23:16 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v2] CodeSamples/tree: Fix compiler warning on free
Message-ID: <e9d0005c-14ba-4cbe-ad97-0663c20f9d8c@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <b87a066b68747d3f22257355459734b759159516.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b87a066b68747d3f22257355459734b759159516.camel@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Leonardo =?iso-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Wed, Jun 21, 2023 at 02:18:31AM -0300, Leonardo Brás wrote:
> While building the CodeSamples/datastruct/Issaquah/ directory, I can see
> a couple instances of this warning:
> 
> In function ‘free_treenode_cache’,
>     inlined from ‘tree_remove_all’ at tree.c:102:2,
>     inlined from ‘tree_free’ at tree.c:128:2:
> tree.c:251:9: warning: ‘free’ called on pointer ‘trp’ with nonzero offset 96 [-Wfree-nonheap-object]
>   251 |         free(tnp);
>       |         ^~~~~~~~~
> 
> I took a look and tried to understand what was happening:
> - tree_remove_all() calls free_treenode_cache() on it's input, which ends
>   up free()'ing it (!BAD_MALLOC)
> - It makes sense in most treenodes, since they are allocated with
>   alloc_treenode_cache() and the malloc() output is the same as the free()
>   input.
> - tree_free() calls tree_remove_all() on &trp->max, which ends up trying
>   to free() this same address.
> - trp is a struct treeroot, which is composed of 2 treenodes: min & max
> - The output of malloc() for trp ends up being different from the address
>   used for free(), since &trp->max is used instead, and there is an offset
>   since max is the second element of struct treeroot.
> 
> To solve this while keeping the tree_remove_all() generic, add a boolean
> free_node parameter to tree_remove_all() so the caller can decide if the
> node should be freed. The new boolean is true for normal treenodes, and
> false if the pointed treenode is contained in the struct treeroot.
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>

Applied, thank you!!!

I really should get this code described in the book at some point...

							Thanx, Paul

> ---
>  CodeSamples/datastruct/Issaquah/tree.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/CodeSamples/datastruct/Issaquah/tree.c b/CodeSamples/datastruct/Issaquah/tree.c
> index 052fa870..26600118 100644
> --- a/CodeSamples/datastruct/Issaquah/tree.c
> +++ b/CodeSamples/datastruct/Issaquah/tree.c
> @@ -89,17 +89,19 @@ struct treeroot *tree_alloc(void)
>   * readers accessing the tree.
>   */
>  static void tree_remove_all(struct treenode *cur,
> -			    void (*freefunc)(void *p))
> +			    void (*freefunc)(void *p),
> +			    bool free_node)
>  {
>  	if (cur == NULL)
>  		return;
> -	tree_remove_all(cur->lc, freefunc);
> -	tree_remove_all(cur->rc, freefunc);
> +	tree_remove_all(cur->lc, freefunc, true);
> +	tree_remove_all(cur->rc, freefunc, true);
>  	if (cur->perm)
>  		return;
>  	if (cur->data && freefunc)
>  		freefunc(cur->data);
> -	free_treenode_cache(cur);
> +	if (free_node)
> +		free_treenode_cache(cur);
>  }
>  
>  /*
> @@ -125,7 +127,7 @@ static void tree_check_insertion(struct treeroot *trp, struct treenode *new)
>   */
>  void tree_free(struct treeroot *trp, void (*freefunc)(void *p))
>  {
> -	tree_remove_all(&trp->max, freefunc);
> +	tree_remove_all(&trp->max, freefunc, false);
>  	free(trp);
>  }
>  
> -- 
> 2.41.0
> 
