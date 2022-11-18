Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230035AbiKRVit (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 18 Nov 2022 16:38:49 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E2ED5E9C6
        for <perfbook@vger.kernel.org>; Fri, 18 Nov 2022 13:38:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B709AB82559
        for <perfbook@vger.kernel.org>; Fri, 18 Nov 2022 21:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668807526;
        bh=gly6HRXbJpYwr3tvfjZHTIoxRJZIwQPEZLXnP3YsyCE=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=illC0FD5Un3Xemr5D1qaHJxCus2X1S5ObK1yiTSqFkcnLaHXOv3No43VVWRbgaDB/
         qxYtpasItplAYmVeE8yV2WtJAR7n+A7OO1NzD+sdAWhg4zv41ns+/P1lPMsEfr77Mx
         3WRLYAOCE4laougGWZ9IjALx1vzTXSrjiNA0Ii3Q5YTTra8mJTxcGvGsaPeLseAHvv
         pDmbSH2YJ28W4j5kcl9OpsOaWHodr5sOczMm4bRr+1GnjJLAl+8TfHrEWji64h2rmu
         wG/6dn/Hvn4zGYfhnxtYbKMoyDwIuj7ruHHzEFahYldHu3JsWcs/VKX3ZcztJh8Avg
         mpr/He9uFjrag==
Date: Fri, 18 Nov 2022 13:38:46 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] CodeSamples/locking: Add rec_tree_itr to .gitignore
Message-ID: <20221118213846.GN4001@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <3b515cce-eef7-7ca5-2ffe-a1c92a8db44b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b515cce-eef7-7ca5-2ffe-a1c92a8db44b@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Elad Lahav <e2lahav@gmail.com>, perfbook@vger.kernel.org

On Fri, Nov 18, 2022 at 11:52:13PM +0900, Akira Yokosawa wrote:
> Commit a4e1d87b97f8 ("locking: Warn about state preservation when
> releasing and re-acquiring locks") added a make target of
> rec_tree_itr under CodeSamples/locking/, but failed to update
> .gitignore.
> 
> Add rec_tree_itr in the list.
> 
> Fixes: a4e1d87b97f8 ("locking: Warn about state preservation when releasing and re-acquiring locks")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Thank you for spotting this one!  Queued and pushed.

							Thanx, Paul

> ---
>  CodeSamples/locking/.gitignore | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/CodeSamples/locking/.gitignore b/CodeSamples/locking/.gitignore
> index 4cd08bfb256b..29a71f856d68 100644
> --- a/CodeSamples/locking/.gitignore
> +++ b/CodeSamples/locking/.gitignore
> @@ -1,3 +1,4 @@
>  locked_list
>  lockwakelatency
> +rec_tree_itr
>  xchglock
> 
> base-commit: ea5a893d74e27536fd1189905f9496fd4bc368f4
> -- 
> 2.25.1
> 
