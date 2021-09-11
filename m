Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:50122 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230472AbhIKP3O (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sat, 11 Sep 2021 11:29:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631374081;
        bh=x6CrRwuRFZL19nuamSQbiuNCMBXg/lThxCZq1ajmiUU=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=HhinC32Le2e7+YhVcWlgYePVWrF95RRUK6rJr0/24xgopWj7Ajh0s9xO1Xu4vmIO2
         Q/WHAIgrC8H/fVvCJDGfPHPwCs1yAuYMKehWTqA3XSLIe9S6ce4ZKtsgfcVI69SoAA
         SPNtdS+mLfD4hMPw9eOgDApxq3odL76DBbxOD6qII5g52Os5YFKpJ26BfbUvNVOPk4
         pKfYMVxId/sar9ptL6GzrccSYZdbuufgou+I+6Kzp92tghvlbVjX7Q1zGSTF249KDh
         omlhsf5xJFwp867SsuVQbl39xoagGltQU6GkoborHftXfNoQjS/74w+9xUyEMplDlM
         hWv6c7Z9MbYEA==
Date: Sat, 11 Sep 2021 08:28:01 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 1/2] Makefile: Add patterns to ignore 'OLD'
 .eps files
Message-ID: <20210911152801.GI4156@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <72178e63-faf4-0853-1243-1bae45cbdd5f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72178e63-faf4-0853-1243-1bae45cbdd5f@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Sep 11, 2021 at 11:24:18PM +0900, Akira Yokosawa wrote:
> Add patterns to catch:
> 
>     "CodeSamples/defer/data/OLD-3a20/2007.11.19a/rwlockRCUperfdbg.eps"
> 
> and similar.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good catched, queues both, thank you!!!

							Thanx, Paul

> ---
>  Makefile | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 73b64e12..990ffe9e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -69,7 +69,9 @@ EPSSOURCES_DUP := \
>  
>  EPSSOURCES_OLD := \
>  	$(wildcard CodeSamples/*/*/OLD-*/*.eps) \
> -	$(wildcard CodeSamples/*/*/*/OLD-*/*.eps)
> +	$(wildcard CodeSamples/*/*/OLD-*/*/*.eps) \
> +	$(wildcard CodeSamples/*/*/*/OLD-*/*.eps) \
> +	$(wildcard CodeSamples/*/*/*/OLD-*/*/*.eps)
>  
>  EPSSOURCES := $(sort $(filter-out $(EPSSOURCES_OLD),$(filter-out $(OBSOLETE_FILES),$(EPSSOURCES_DUP))))
>  
> -- 
> 2.17.1
> 
