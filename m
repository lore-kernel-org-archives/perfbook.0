Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiAAF7E (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 1 Jan 2022 00:59:04 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C549C061574
        for <perfbook@vger.kernel.org>; Fri, 31 Dec 2021 21:59:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A6065B80E64
        for <perfbook@vger.kernel.org>; Sat,  1 Jan 2022 05:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641016740;
        bh=YiX5/Sq8Y+ryb1lkhKjPdYNNI7tMnNPGwmFLqzQ2aLc=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=G5OnAIZT3HMCaX9E1ULq58qL33WkmiYjlKzZUwVISzXDacffKuqg2YlSYQOi3yFR1
         ceNDLfrfipmTuwqkG1NFCxBPpiG/XTzUmy0KOtviGvUgYz+gyxnJaz25IxKLEIGHyX
         3QClFQbJMJ8OwPkC4fzFqS8R3IbxkWboGq98W56t/4rOp18Ph/i4PAopjVXS2IGEcf
         9MF1Pp+T071LWIsuq8QelDdzI9Zy1260J3cRggzieqSwszblrznRbXyADpk1o7HKy7
         PLqChIonxOlLD3e3ewpAj9B+OW6i0hGC6Te8ldPsR9VvTk8iLrH7p62dGJURD07VUh
         zzWJuAtCHtAOQ==
Date: Fri, 31 Dec 2021 21:59:00 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] Fix svg in chapter7: change incorrect "Lock B" in
 `qsort` to "Lock C".
Message-ID: <20220101055900.GH4109570@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20211231092937.45331-1-maplewish117@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211231092937.45331-1-maplewish117@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Xuwei FU <maplewish117@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Dec 31, 2021 at 05:29:38PM +0800, Xuwei FU wrote:
> From: Xuwei Fu <maplewish117@gmail.com>
> 
> Signed-off-by: Xuwei Fu <maplewish117@gmail.com>

Good eyes, applied and pushed, thank you!

							Thanx, Paul

> ---
> 
> Hi, paul.
> 
> In Chapter7's "Local Locking Hierarchies", 
>  the "Lock B" in `qsort` is confusing, qsort 
>  should acquire "Lock C" rather than "Lock B".
> 
> In this patch, "Lock B" in `qsort`  in svg is 
>  changed to "Lock C".
> 
>    Thanks, Xuwei
> 
> --
>  locking/LayeredLockHierarchy.svg  | 2 +-
>  locking/LocalLockHierarchy.svg    | 2 +-
>  locking/NoLockHierarchy.svg       | 2 +-
>  locking/NonLocalLockHierarchy.svg | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/locking/LayeredLockHierarchy.svg b/locking/LayeredLockHierarchy.svg
> index 05f0682f..49773940 100644
> --- a/locking/LayeredLockHierarchy.svg
> +++ b/locking/LayeredLockHierarchy.svg
> @@ -334,7 +334,7 @@
>               id="tspan3715-6-2-5"
>               x="42.601532"
>               y="70.638107"
> -             style="font-size:4.93888903px;stroke-width:0.26458332">Lock B</tspan></text>
> +             style="font-size:4.93888903px;stroke-width:0.26458332">Lock C</tspan></text>
>        </g>
>        <text
>           id="text3717-3-7-3-9"
> diff --git a/locking/LocalLockHierarchy.svg b/locking/LocalLockHierarchy.svg
> index e4100879..bbe3bc92 100644
> --- a/locking/LocalLockHierarchy.svg
> +++ b/locking/LocalLockHierarchy.svg
> @@ -321,7 +321,7 @@
>               id="tspan3715-6-2-5"
>               x="42.601532"
>               y="70.638107"
> -             style="font-size:4.93888903px;stroke-width:0.26458332">Lock B</tspan></text>
> +             style="font-size:4.93888903px;stroke-width:0.26458332">Lock C</tspan></text>
>        </g>
>        <text
>           id="text3717-3-7-3-9"
> diff --git a/locking/NoLockHierarchy.svg b/locking/NoLockHierarchy.svg
> index f892037d..7479ee62 100644
> --- a/locking/NoLockHierarchy.svg
> +++ b/locking/NoLockHierarchy.svg
> @@ -298,7 +298,7 @@
>               id="tspan3715-6-2-5"
>               x="42.601532"
>               y="70.638107"
> -             style="font-size:4.93888903px;stroke-width:0.26458332">Lock B</tspan></text>
> +             style="font-size:4.93888903px;stroke-width:0.26458332">Lock C</tspan></text>
>        </g>
>        <text
>           id="text3717-3-7-3-9"
> diff --git a/locking/NonLocalLockHierarchy.svg b/locking/NonLocalLockHierarchy.svg
> index 264f6f14..fb686d23 100644
> --- a/locking/NonLocalLockHierarchy.svg
> +++ b/locking/NonLocalLockHierarchy.svg
> @@ -321,7 +321,7 @@
>               id="tspan3715-6-2-5"
>               x="42.601532"
>               y="70.638107"
> -             style="font-size:4.93888903px;stroke-width:0.26458332">Lock B</tspan></text>
> +             style="font-size:4.93888903px;stroke-width:0.26458332">Lock C</tspan></text>
>        </g>
>        <text
>           id="text3717-3-7-3-9"
> -- 
> 2.27.0
> 
