Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbiJKJCS (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 11 Oct 2022 05:02:18 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2355179A51
        for <perfbook@vger.kernel.org>; Tue, 11 Oct 2022 02:02:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 790FEB81263
        for <perfbook@vger.kernel.org>; Tue, 11 Oct 2022 09:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665478931;
        bh=llzx3BLGvwzXngjbOCT9jKCbPPQ/AMCiBjx/ie9+mjk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=miYAqlyuBPBR0ug5iLILoTkk2KjmAHg9ith7FDy7Yy2C9khGaJE37xM6gqVwnHerJ
         u/w8LrxkTrORI+KodRkK9GJE0ISW0DiaCdwhPhz/oUKXKcVqUlqeL3t8lX6Y7Z88Gr
         p9KfDnlxu1bhW/4pt8MwRjRq6Ra+vXGkmuTm/Q977lk6MSCOad5m8MNdBuLbRahB+e
         lmxfFjwzbeGBYlT+CQ8F+6Riq43Ez1LMS66yLUHIkblLaKk83DfBLNWdE9SmcDfHXs
         RcPeDNntHaukFXHOnPL97skAmlD9RTOMHLyJQGvD6gwNMWKTrQLtxxdR19avi5cruf
         53mvrovCl6dAA==
Date: Tue, 11 Oct 2022 02:02:08 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] memorder.tex: correct the transformed code by compiler.
Message-ID: <20221011090208.GF4221@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <CANJ3EgF8SzbAy8Wd7JANT20DCMtC7U3Z6Pzix3z9zJ-A3hYn+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANJ3EgF8SzbAy8Wd7JANT20DCMtC7U3Z6Pzix3z9zJ-A3hYn+Q@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Patrick Yingxi Pan <pyxchina92929@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Oct 11, 2022 at 11:20:49AM +0800, Patrick Yingxi Pan wrote:
> Hello!
> 
> I have added the missing READ_ONCE(). Please take a look. Thanks.
> 
> Signed-off-by: Patrick Pan <pyxchina92929@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  memorder/memorder.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index a0a87d0a..50ff2882 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -2869,7 +2869,7 @@ An equals comparison on \clnref{equ} might lead
> the compiler to (incorrectly)
>  conclude that both pointers are equivalent, when in fact they carry
>  different dependencies.
>  This means that the compiler might well transform \clnref{pc} to instead
> -be \co{r2 = q->c}, which might well cause the value 44 to be loaded
> +be \co{r2 = READ_ONCE(q->c)}, which might well cause the value 44 to be loaded
>  instead of the expected value 144.
>  \end{fcvref}
> 
> 
> base-commit: 7f12a9358e220f3d0c3a0880d01bc283113d7a5b
> --
