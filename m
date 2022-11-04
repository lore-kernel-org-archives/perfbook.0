Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbiKDAbU (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 3 Nov 2022 20:31:20 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9A4F22B18
        for <perfbook@vger.kernel.org>; Thu,  3 Nov 2022 17:31:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 537BBCE29CF
        for <perfbook@vger.kernel.org>; Fri,  4 Nov 2022 00:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667521875;
        bh=fbwQOb8leVAy/saKzBykZ8Ftyfl/rJpCWVF4hc7FKYY=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=m7A8QBPeW8MARKL1S7v24xW3xM5SNhlqyQdfrcZdwUfgOuE5K+qUWrNKkfIqvUEg6
         j5VZEWBUf3xYWOC+XE7OgyFtKF/X808/GeylADp55vUK25qmgLFUlQC44yunBumGME
         F+BmWr5/gOrkHmWlBM/qTGK6yUkg3JQvRrKF2zVgQ5OEd87mbW+L3HyVk9drt9TegG
         RwPNiapvF7SCErU3tt3J5ZhGemhM7bas4OJc6k8r8IRGfzwvbNVuX/XR0X/+g7qmsX
         Ob/K2zAvAwojzyVBiTB7MOmPpHySNwdhzwT6ycNQA1niRsz8RVzLy09PbRl6GpCb2R
         soqt3wTAslF7w==
Date: Thu, 3 Nov 2022 17:31:15 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] cpu: Add end-of-sentence markers
Message-ID: <20221104003115.GI5600@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <73f50953-6605-bda9-e37d-589550ba7c3d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73f50953-6605-bda9-e37d-589550ba7c3d@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Nov 04, 2022 at 09:20:44AM +0900, Akira Yokosawa wrote:
> Silence complaints from "make punctcheck".
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good catch, thank you!  Queued and pushed.

You know, I scrolled back up to look at the output of my last "make",
and there that error message was.  I was apparently so focused on the
cartoon that I missed it completely.  :-/

							Thanx, Paul

> ---
>  cpu/overview.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/cpu/overview.tex b/cpu/overview.tex
> index feaef5f3589b..c3302669b1a5 100644
> --- a/cpu/overview.tex
> +++ b/cpu/overview.tex
> @@ -298,8 +298,8 @@ Welcome to modern thermal throttling.
>  
>  If you reduced the number of clock cycles by making more effective
>  use of the CPU's functional units, you will have increased the
> -power consumed by that CPU.
> -This will in turn increase the amount of heat dissipated by that CPU.
> +power consumed by that CPU\@.
> +This will in turn increase the amount of heat dissipated by that CPU\@.
>  If this heat dissipation exceeds the cooling system's capacity, the
>  system will thermally throttle that CPU, for example, by reducing
>  its clock frequency, as fancifully depicted by the snow penguin in
> 
> base-commit: 06ef1f7ba437647df5913fdfc89276da4e0bf9c1
> -- 
> 2.25.1
> 
