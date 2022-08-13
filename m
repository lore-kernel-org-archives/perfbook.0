Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239714AbiHMXEw (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 13 Aug 2022 19:04:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54F6F816BC
        for <perfbook@vger.kernel.org>; Sat, 13 Aug 2022 16:04:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E497B60DD9
        for <perfbook@vger.kernel.org>; Sat, 13 Aug 2022 23:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660431891;
        bh=0wIYAZggakdnPchjwSdK51Hg88kMF7khTB0Bs72nbpI=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=AvtaPFjpOJVBvVroPu6+Jr9qCGbYQFaQ03oaGpH2OU3EyorHjQIBxXDeXAc6JX6Mc
         onfv6TqT3SSHs9Ib372we5On9d08S4HneX9zLNyO020uJLPlDViXsy/RnRHVavSJ82
         C8vTlRBaDkikaeUqmpIMu5K3t1p023fEOLdsgF6fHpb7XVefxKwi/FA2zH/4fDK3uX
         KWelnLh5ONG8YLrPbeBtzkfVukr2Tf00n3HXcQEcPZnv1ItEQvWqWV61HzUC74DSGW
         NITspfZCzBExWEdG8xb04FohvTUF8Q2aH6Znrg+//VLnLW9wptfPQiPrEkakfLTbBG
         eWloobHhix21A==
Date: Sat, 13 Aug 2022 16:04:50 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] CodeSamples: count_stat_eventual.c should use pthread_t
 with pthread_create()
Message-ID: <20220813230450.GK2125313@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220813111022.2069271-1-e2lahav@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220813111022.2069271-1-e2lahav@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Aug 13, 2022 at 07:10:22AM -0400, Elad Lahav wrote:
> Signed-off-by: Elad Lahav <e2lahav@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  CodeSamples/count/count_stat_eventual.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
> index 5179de9d..967644de 100644
> --- a/CodeSamples/count/count_stat_eventual.c
> +++ b/CodeSamples/count/count_stat_eventual.c
> @@ -61,7 +61,7 @@ void *eventual(void *arg)				//\lnlbl{eventual:b}
>  void count_init(void)					//\lnlbl{init:b}
>  {
>  	int en;
> -	thread_id_t tid;
> +	pthread_t tid;
>  
>  	en = pthread_create(&tid, NULL, eventual, NULL);
>  	if (en != 0) {
> -- 
> 2.25.1
> 
