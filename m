Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462271878
	for <perfbook@vger.kernel.org>; Sat, 27 Jul 2024 03:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722051471; cv=none; b=gnkG6mmoq08sxrxW69JEluqnpx4d39opHXIrGSIZ4tu7WIGGmaaVaUZkt2jMN2YIe83PGZc4ck1to8sdqdhW2CBAreaCOZLCN33s23uwKIW+/lGtDe3UPDJIB83V8HoicNdpXhyXTgdaFvzVJ8lhHsv71U2jCHvODE4AJUPtnTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722051471; c=relaxed/simple;
	bh=s9LfE2IBbtJoXwBsEceggPYqollTK579SJ7P0+/ogGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CJFoyV3uEkLbvmztwPpMb2GctgabUmDohdjXdNTbEvzkIUzHigHdcxvuQ+D4nMMEJ9WR02C7LxthTx9XLSqJg/0nd6Bj9okg40nEPyBhPsBjRI43JIWQTTrIekFYXoF5z7QZ3h9xzQBDMWNKopSxLkox+XodFZK1aFAzDj2vP6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ywmtgrmx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ywmtgrmx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C94D8C32781;
	Sat, 27 Jul 2024 03:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722051470;
	bh=s9LfE2IBbtJoXwBsEceggPYqollTK579SJ7P0+/ogGA=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Ywmtgrmxg00qErISeLKz83lQsSAjGHPPud3xd1+mndb2BHJL/iAeN6NQoq/ImwmA4
	 PRns/JVbyibpd2JI8k0vetmDsyeYcx7f0c2sW+yS3fVPjuXzE4f5FBFkPPL9TzpgD1
	 Wb1bLAfV5TB+lbJ46kujUNiBfCm66JHzUiZ0vGJevBSoyb2+jnj1KYZtAieu/FFiPg
	 ttEOlQdpN2AYf/IceI85VPwdab2d7pNiVSggM0yHzQndlw2IwhTTlcPmScc0Pmg1Oy
	 ingF4QuYDwCHtiKAi2YVFicuiVPoSYt1ymXHku5f22MKqpdZJ901nvuyXLTS5T2H5D
	 laZFoyBZB7ZKQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 722C9CE09D8; Fri, 26 Jul 2024 20:37:50 -0700 (PDT)
Date: Fri, 26 Jul 2024 20:37:50 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook 1/2] CodeSamples/formal: Update rcu-test.dat
 for v6.10
Message-ID: <642e1eb0-2b35-4793-a0ba-d58d994e87f1@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <0b5765df-1ff2-4fff-ba1f-704c4087e437@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b5765df-1ff2-4fff-ba1f-704c4087e437@gmail.com>

On Sat, Jul 27, 2024 at 12:20:30PM +0900, Akira Yokosawa wrote:
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  CodeSamples/formal/data/rcu-test.dat | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/CodeSamples/formal/data/rcu-test.dat b/CodeSamples/formal/data/rcu-test.dat
> index 12aa01fc..4a958dfc 100644
> --- a/CodeSamples/formal/data/rcu-test.dat
> +++ b/CodeSamples/formal/data/rcu-test.dat
> @@ -97,3 +97,4 @@ v6.4  21444 11748 33192 35.4
>  ""    21957 12064 34021 35.5
>  v6.8  22018 12071 34089 35.4
>  ""    22108 12076 34184 35.3
> +v6.10 22579 12085 34664 34.9
> 
> base-commit: f823b459645b872ef3481d746fa82b7ff1a91da8
> -- 
> 2.34.1
> 
