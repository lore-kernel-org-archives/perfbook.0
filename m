Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbhK3FA5 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 30 Nov 2021 00:00:57 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 781F6C061574
        for <perfbook@vger.kernel.org>; Mon, 29 Nov 2021 20:57:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 67801B8170C
        for <perfbook@vger.kernel.org>; Tue, 30 Nov 2021 04:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638248255;
        bh=k+wiT3q8IJJ83i20kgTyXj5Vmm5JgNmbME2Qd/cr3UE=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=JXsfOOHfdfaQpHfRxw2KFtt1KNAgINM18QVQtT9f2Beef+10VHjYN8xvAMGHEaNy4
         E8dqufC1vyx9iYa5XClBJSowyv1X/vThXzf+uBmwRnjiPLlJEEI0frAokNzY0CRHNl
         o2ERQn/4ummPeCKxPd8zclIChlVeJ7K2VWf1feGDEfTyBkH3ynZnJBMtD0uOheUuas
         E24adHj4nHa36f89oEV81LA2Q/qHVdnRwL1Df4F9uMnbR2Sc9pJ9g+Z8D46vnau7fp
         i9m3n98ajLoKVsKf6nsYGUvGHavJW9IZXZch5Ydb6Dw/cU3zPU2VU3X+OKCu/Y9AiH
         S1T+HQxxwtHSQ==
Date: Mon, 29 Nov 2021 20:57:34 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] defer/rcuusage: Tweak width of Figure 9.23 for
 1c builds
Message-ID: <20211130045734.GN641268@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <dd3981bd-fcee-e488-ad45-5ff55aa7d80a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd3981bd-fcee-e488-ad45-5ff55aa7d80a@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Nov 30, 2021 at 11:26:06AM +0900, Akira Yokosawa wrote:
> Width of 5.5in does not fit in eb and 1c builds.
> The width of .96\textwidth works for both of them.
> 
> Note:
>     Strictly speaking, 1c builds don't need the scaling factor of .96.
>     But an additional conditional for them would not change the result
>     so much.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  defer/rcuusage.tex | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
> index e4c478f1..bc0d8778 100644
> --- a/defer/rcuusage.tex
> +++ b/defer/rcuusage.tex
> @@ -201,7 +201,12 @@ that of the ideal synchronization-free workload.
>  
>  \begin{figure*}
>  \centering
> -\resizebox{5.5in}{!}{\includegraphics{defer/RCUusecases}}
> +\IfTwoColumn{
> +  \resizebox{5.5in}{!}{\includegraphics{defer/RCUusecases}}
> +}{
> +  \resizebox{.96\textwidth}{!}{\includegraphics{defer/RCUusecases}}
> +  % eb builds require .96
> +}
>  \caption{Relationships Between RCU Use Cases}
>  \label{fig:defer:Relationships Between RCU Use Cases}
>  \end{figure*}
> 
> base-commit: 7d9743376122167a9cdd9acc0decfe41e17a2a93
> -- 
> 2.17.1
> 
