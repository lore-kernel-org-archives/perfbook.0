Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjEEAqm (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 4 May 2023 20:46:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B590812496
        for <perfbook@vger.kernel.org>; Thu,  4 May 2023 17:46:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5386B638D0
        for <perfbook@vger.kernel.org>; Fri,  5 May 2023 00:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683247600;
        bh=UgflVBE2EG+k5Mxuian+sjFqxXWlU8ba9hZetkyJQwI=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=SWwfoa4FI3IqhkcPx72jwPYvGlDUrOZvoN4CaxumY59qr19rSX52BxfrHC9N0Saie
         p6W8Z5Ky4CLh0HcKZKZ81ZGrD45BZz/XpXSuR8D/3NF17nj7ZRvcrfaALZA8h6zhgF
         64y06K3levsXy2xAmAx9jBeDk/YgjjuEp3TNUIkr7kPJ7lV3K4MGBM9nrUpjVv5MSA
         Dsy2rr4ZTWKkBaErskRaWrn9mgZOB+042qJqDCwfBzHfavMM5c6cieoJowkaZiAqTf
         9TeiHlh37Egn6/aCRbhWtn+Th0l2x/QfX0VOEZKijxv2b0qZGW1F70EWylP/3JlUQm
         y763uymZMG7yg==
Date: Thu, 4 May 2023 17:46:40 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 1/4] CodeSample/formal/rcutorture.sh: Ignore
 Makefile and Kconfig*
Message-ID: <3ebc2653-67b2-42b0-b280-8ee0d10a86d2@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <0d6a6549-6292-d30b-c1a3-19b42f672480@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d6a6549-6292-d30b-c1a3-19b42f672480@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, May 04, 2023 at 08:41:03AM +0900, Akira Yokosawa wrote:
> kernel/rcu/Makefile was new to Linux v3.13 when RCU related code were
> moved under kernel/rcu/.
> kernel/rcu/Kconfig was new to Linux v4.13.
> 
> Up until v3.12, RCU-related lines in Makefile and Kconfig were not
> counted.  So, the extra counts result in a small disjoint of bar height,
> especially between v4.11 and v4.13.
> (v4.12 was an outlier due to code duplication of old and new SRCU.)
> 
> Exclude those files from RCU LOC to be fair.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Looks good, queued and pushed, thank you!

							Thanx, Paul

> ---
>  CodeSamples/formal/rcutorture.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/CodeSamples/formal/rcutorture.sh b/CodeSamples/formal/rcutorture.sh
> index bc9a2855b623..236868054e47 100644
> --- a/CodeSamples/formal/rcutorture.sh
> +++ b/CodeSamples/formal/rcutorture.sh
> @@ -25,7 +25,7 @@ tags="`git tag -l | grep '^v' | grep -v -e - | grep -v '\..*\..*\.' | grep -v '2
>  for t in $tags
>  do
>  	git reset --hard $t > /dev/null 2>&1
> -	nontorture="`ls kernel/*rcu*.* kernel/rcu/* include/linux/*rcu* 2> /dev/null | grep -v torture | grep -v rcuperf | grep -v refperf | grep -v rcuscale | grep -v refscale`"
> +	nontorture="`ls kernel/*rcu*.* kernel/rcu/* include/linux/*rcu* 2> /dev/null | grep -v torture | grep -v rcuperf | grep -v refperf | grep -v rcuscale | grep -v refscale | grep -v Makefile | grep -v Kconfig`"
>  	ntn="`wc -l $nontorture 2> /dev/null | tail -1 | awk '{ print $1 }'`"
>  	tn="`wc -l tools/testing/selftests/rcutorture/configs/*/*.sh kernel/rcutorture.c kernel/rcu/torture.c kernel/rcu/rcutorture.c kernel/rcu/rcuperf.c kernel/rcu/refperf.c kernel/rcu/rcuscale.c kernel/rcu/refscale.c kernel/torture.c tools/testing/selftests/rcutorture/bin/* 2> /dev/null | tail -1 | awk '{ print $1 }'`"
>  	frac="`awk -v ntn=$ntn -v tn=$tn 'END { printf "%.1f", 100 * tn / (tn + ntn) "%"; }' < /dev/null`"
> 
> base-commit: f8354eceed493a403160202591c6c383387c4ddc
> -- 
> 2.25.1
> 
