Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbiEWEtv (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 23 May 2022 00:49:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B1501209C
        for <perfbook@vger.kernel.org>; Sun, 22 May 2022 21:49:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B39356112C
        for <perfbook@vger.kernel.org>; Mon, 23 May 2022 04:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653281388;
        bh=VeOl4H578n6A7JeZPgvFHp0UMkLiVdM3WE4wzUF30EY=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=nzcmKpetMmD86Y+hwmbWmpkao3gfS+12UTzuhGgzSGV4MXU6ePPelwSLZ5IMRufBS
         HOMsq96Stga7Wjf9McUn92IaETw9CcI+PjI0X2ZDR1AtofTMMVnKkXnpcWs5Rc5WYf
         tmpjql1jBadl+0zDRXhKpM26xBoSNYD51H3OmSCJhy2auZpGd4cerVh59W4j1NvFO+
         N5PaXX2JSWSx9itymL5jQnmo/3WX+x0GnK092XUI0z8O8tinylxckW0p8Xe4Df70mZ
         ebLJx49M0+oIPTcT4uD0v6Lmd+W0R7AgLTzswXUaPZ95z/YmusPN4cE9/9ZYLahiGy
         d2kGWNRz1PfDQ==
Date: Sun, 22 May 2022 21:49:47 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 1/2] glossary: Capitalize 'Release store'
Message-ID: <20220523044947.GT1790663@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <1865d37a-ee66-97ef-87c9-8224d7dc0394@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1865d37a-ee66-97ef-87c9-8224d7dc0394@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, May 23, 2022 at 10:18:46AM +0900, Akira Yokosawa wrote:
> Make it consistent with other terms.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Both are queued and pushed, and thank you!

							Thanx, Paul

> ---
>  glossary.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/glossary.tex b/glossary.tex
> index d488670d8b25..87db763b7be4 100644
> --- a/glossary.tex
> +++ b/glossary.tex
> @@ -620,7 +620,7 @@
>  	entity.
>  	Reference counters provide existence guarantees and are sometimes
>  	used to implement garbage collectors.
> -\item[\IXG{Release store}:]
> +\item[\IXG{Release Store}:]
>  	A write to memory that has release semantics.
>  	Normal use cases pair an acquire load with a release store,
>  	in which case if the load returns the value stored, then all
> 
> base-commit: 3783abdc439f1652ec710ca2dabd99fc0fd65fca
> -- 
> 2.25.1
> 
