Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234430AbiDQQzQ (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 17 Apr 2022 12:55:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55F662717C
        for <perfbook@vger.kernel.org>; Sun, 17 Apr 2022 09:52:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D9E2161248
        for <perfbook@vger.kernel.org>; Sun, 17 Apr 2022 16:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650214360;
        bh=Mtz5ZnBdmR2RCQqdq4u3bPNgi3KQNubJ7EM6IC93QBM=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=fZt+kBhfsWLaoc1IvkZZHEyzMAUJDKSx9594iqFHRhC+Ua+Vr804ucPy3YmDRMdlK
         jaZ/6w8aN8ABxH1OnSrx1S/RW1DT5CYIaBLXPB8k2ZLX7/vkZzChkOoAvTHqC4fmXz
         nM0/j2Utlw5V34UYeuIp+5hUGWsvpj9I8xja2HQYatzdfzJ+Nq8/FVe5WzjU+VoCT7
         bkQM8vEjLG0KW+oBTknjBl+RZMHvOVNSLQPTtM69G7ioI3A2dR3GvihBQz78ShT28x
         3A58+q/JG9PzhvxN+EBfARYxYyu4nM8P8r6dx2ouLw/1NoALne1DJn0jL2a77Xsym6
         SoJqvGlrv8U0A==
Date: Sun, 17 Apr 2022 09:52:39 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] whymb: fix description in DMA coherence
Message-ID: <20220417165239.GP4285@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220417110947.GA27447@haolee.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220417110947.GA27447@haolee.io>
List-ID: <perfbook.vger.kernel.org>
To: Hao Lee <haolee.swjtu@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Apr 17, 2022 at 11:09:47AM +0000, Hao Lee wrote:
> CPU caches need to be flushed before DMA operations to avoid data
> overwriting.
> 
> Signed-off-by: Hao Lee <haolee.swjtu@gmail.com>
> ---
>  appendix/whymb/whymemorybarriers.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
> index b49d5fe8..4ec27962 100644
> --- a/appendix/whymb/whymemorybarriers.tex
> +++ b/appendix/whymb/whymemorybarriers.tex
> @@ -1640,7 +1640,7 @@ future such problems:
>  	in any DMA buffer before presenting that buffer to the
>  	I/O device.

The paragraph above is before the I/O starts.  Any changes to the buffer
need to be flushed to memory so that the I/O device's DMA actually
sees them.

The next paragraph is the other end of I/O request, after it completes.
So we cannot have "before".  But maybe we need "invalidate" instead of
"flush".  With a note that itcan be more efficient to both flush and
invalidate prior to presenting the DMA buffer to the device.

The point is that any pre-DMA data in the CPU caches must be gotten
rid of in order for the CPUs to see the data that was actually DMA'ed
into memory.

>  	Similarly, you need to flush the CPU caches of any location
> -	in any DMA buffer after DMA to that buffer completes.
> +	in any DMA buffer before DMA to that buffer completes.
>  	And even then, you need to be \emph{very} careful to avoid
>  	pointer bugs, as even a misplaced read to an input buffer
>  	can result in corrupting the data input!

And this last clause could just wordsmithed a bit.

Thoughts?

							Thanx, Paul
