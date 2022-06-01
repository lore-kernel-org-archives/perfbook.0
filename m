Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234905AbiFAEsC (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 1 Jun 2022 00:48:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0A2F3969C
        for <perfbook@vger.kernel.org>; Tue, 31 May 2022 21:48:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6BE05611CE
        for <perfbook@vger.kernel.org>; Wed,  1 Jun 2022 04:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654058880;
        bh=jh9dje0BAbQ2zgIokVHHpGUDGUkjLLUoiQCHj1AW3Qg=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=LURZoohe/FXTg0gdjMeK5RSjCb3ikykuzWai+UG/Oq+1N4LzECtd2RXcLM6n7zb8F
         bY6dwR1GQh96hARa3xT1RJVsicbLFVRN+LVHUMpciRbSl9AopVuAUsa0v6uL3sEsFh
         ZY50ct/a7abvSCsfK3VttEi52Wya1y/vSeRh36sXcz/gXGDnT+U4l7erb3/MUS1YsC
         rbiiDMwibFYw0vzp+/rjch1VZ1O1d2nz5yvvvEosPVZHUZd0VFlzBA7MzmDDm/geLU
         piArAkZXFh8Xx6wf2ksc5J92iWXi4958sdcX0ILQsR/asGULVUa3jsg2sVsyDzWu9K
         0xuMQgjv5GNwg==
Date: Tue, 31 May 2022 21:48:00 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] epstopdf-rule.mk: Add -dNOSAFER to eps2eps for
 .eps -> .pdf (from .tex)
Message-ID: <20220601044800.GM1790663@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <6b69a285-0996-db50-d053-a402713e879c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b69a285-0996-db50-d053-a402713e879c@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Jun 01, 2022 at 08:25:31AM +0900, Akira Yokosawa wrote:
> Somehow, eps2eps doesn't have -dNOSAFER while epstopdf has
> --nosafer in the same recipe.
> On CentOS stream 8, ghostscript 9.27 complains about the lack of
> -dNOSAFER.
> 
> Add the missing option.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  epstopdf-rule.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/epstopdf-rule.mk b/epstopdf-rule.mk
> index 4efad17a78a6..d248ce750d68 100644
> --- a/epstopdf-rule.mk
> +++ b/epstopdf-rule.mk
> @@ -28,7 +28,7 @@ ifeq ($(GS_953_OR_LATER),1)
>  	@eps2eps -dALLOWPSTRANSPARENCY $< $(basename $<)__.eps
>  	@epstopdf --gsopt=-dALLOWPSTRANSPARENCY $(GS_OPT) $(basename $<)__.eps $@
>  else
> -	@eps2eps $< $(basename $<)__.eps
> +	@eps2eps -dNOSAFER $< $(basename $<)__.eps
>  	@epstopdf --nosafer $(GS_OPT) $(basename $<)__.eps $@
>  endif
>  	@rm -f $(basename $<)__.eps
> 
> base-commit: f19269d216ef6ebcfb417e87d040bd8374754c33
> -- 
> 2.25.1
> 
