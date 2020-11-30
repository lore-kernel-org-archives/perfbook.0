Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:54850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727795AbgK3QYe (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Mon, 30 Nov 2020 11:24:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606753433;
        bh=ZCwiXvxItWXquAVrM0dHlTU+NNbV5DDctXj44/jLSrI=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Wf8X714u/+B6VaT2A9TG6NvobC9m6L8vwlABvEo9cAIPwgxNdfSCapWmlam0bmhjf
         PVl0W0obDkoHtWEg5fqQz+6OAdClpd2NF91OhSy1Ou7bYQJ6qDz9ybIcCunoYtR3pA
         3N/DW8YvERjQkJVBvXA92ibsHzjWsMMPOXbgJA3I=
Date: Mon, 30 Nov 2020 08:23:53 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 2/2] Makefile: Extend wildcard pattern to catch
 .eps files under CodeSamples
Message-ID: <20201130162353.GE1437@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <ee4f6b1e-fd90-819a-5ff8-681d6a2e680c@gmail.com>
 <1f652999-02ce-39a0-6880-6303bc017ce4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f652999-02ce-39a0-6880-6303bc017ce4@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Nov 30, 2020 at 09:04:04PM +0900, Akira Yokosawa wrote:
> >From 8306e360c789e4063f027c2862658764a2f531be Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 30 Nov 2020 20:14:16 +0900
> Subject: [PATCH -perfbook 2/2] Makefile: Extend wildcard pattern to catch .eps files under CodeSamples
> 
> Some of the files have not been bounding-box adjusted for some time.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed both, thank you!  I also queued another commit that
removes the explicit piping through gnuplotepsfix from the new plots.sh.
I knew that this was supposed to be converted implicitly somehow, but
took the easy way out.  ;-)

							Thanx, Paul

> ---
>  Makefile | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 07c6616a..56ce62bf 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -55,6 +55,9 @@ OBSOLETE_FILES = extraction $(FAKE_EPS_FROM_SVG) CodeSamples/snippets.mk
>  EPSSOURCES_DUP := \
>  	$(wildcard */*.eps) \
>  	$(wildcard */*/*.eps) \
> +	$(wildcard */*/*/*.eps) \
> +	$(wildcard */*/*/*/*.eps) \
> +	$(wildcard */*/*/*/*/*.eps) \
>  	$(EPSSOURCES_FROM_TEX) \
>  	$(EPSSOURCES_FROM_DOT) \
>  	$(EPSSOURCES_FROM_FIG)
> -- 
> 2.17.1
> 
> 
