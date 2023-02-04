Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjBDEvQ (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 3 Feb 2023 23:51:16 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 810EC6187F
        for <perfbook@vger.kernel.org>; Fri,  3 Feb 2023 20:51:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EE19D60917
        for <perfbook@vger.kernel.org>; Sat,  4 Feb 2023 04:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675486274;
        bh=jk3hB7+UDmVDEf/j7d90rvz3ae3qnvUuxmZJwEj1mr4=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=uj1zdV8Y0KP75mBzxpG5k9i4sLFnpMKgUJYJiQbtyX1uUPbmhg/wJwkS6upsvFRZz
         DFTHr06fxgjp2RI+9y6HNvTj+m4L0fSBZRAV6EHzbiS2J5EIheKzcHHEiEXiRJydBQ
         dVVHYHgh3bdwT/K9nRgTsLKJe5KbYgc7+7yUIDMxGxBwXHrRYtCE9PB6fMV6JMBXHr
         VA8AxIJLactCwu+OxB4bARIQvhUpD9gwjTXepI8jYp3xxQzDZtm7GSNjFsvNQqDQvf
         Ezv1PUtVqYo1pldmDGDs3Rd35rVnyv2aWQbDwgq/wWWm0SUauIC/qL1T/OIiFD0naH
         KdX7Fr/SeQoKg==
Date: Fri, 3 Feb 2023 20:51:13 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v1 2/2] utilities/gitlab-ci.yml: Add 'make check' on
 test_codesamples
Message-ID: <20230204045113.GV2948950@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20230204033627.67980-1-leobras.c@gmail.com>
 <20230204033627.67980-2-leobras.c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230204033627.67980-2-leobras.c@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Leonardo Bras <leobras.c@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Feb 04, 2023 at 12:36:27AM -0300, Leonardo Bras wrote:
> Call make -C CodeSamples/ check on test_codesamples, so any runtime error
> can be detected by Gitlab-CI.
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>

I queued and pushed all three, thank you!

							Thanx, Paul

> ---
>  utilities/gitlab-ci.yml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
> index f2cb1c8e..7f50f12a 100644
> --- a/utilities/gitlab-ci.yml
> +++ b/utilities/gitlab-ci.yml
> @@ -12,6 +12,7 @@ test_codesamples:
>  
>      script:
>          - make -C CodeSamples/
> +        - make -C CodeSamples/ check
>  
>  generate_pdfs:
>      stage: build
> -- 
> 2.39.1
> 
