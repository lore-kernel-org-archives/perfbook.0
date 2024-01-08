Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABF8A42
	for <perfbook@vger.kernel.org>; Mon,  8 Jan 2024 14:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jNyUsBPH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 301EAC433CB;
	Mon,  8 Jan 2024 14:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704724592;
	bh=PQVtlleidxMZwlK00SQIcEIqa3p8liVn3BXiTYUiHL8=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=jNyUsBPHBH73k21TQFIpY1mI9taMNYnu+FCdvy2wVnegO9+dsW8hT+J9l1zl2RwZh
	 DWR9WNjKGM4yiSH8PRoIqdPMeRAGV3pnInYhFYi2spgMchqverudvvTJA2ORkkOHAt
	 B3UW5vn98KYA4agc1IJyVTuB+yyNLuwVLIVSmrlrle91X5vOmtVUXtQn/zLzHOcHfZ
	 M9uLRhlKdqnR/hFotPBqzWyWvcaatbfFObWCC6fWUNtO6sF98EHihIhHa8NKDOB4Yn
	 85SMh77y9WUZ+R4pZvP565rhtFZDYUTPoD7BIavvTTOzKa2KOlAd2TBBoHJqv2VUH5
	 rOLuCEsH2cZ/A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id C7206CE1466; Mon,  8 Jan 2024 06:36:31 -0800 (PST)
Date: Mon, 8 Jan 2024 06:36:31 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH 0/3] appendix/toyrcu: Trivial fixups
Message-ID: <7a2fa097-3f04-4b87-bba5-24e99ba3adf0@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20240107170122.18010-1-sj38.park@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240107170122.18010-1-sj38.park@gmail.com>

On Sun, Jan 07, 2024 at 09:01:19AM -0800, SeongJae Park wrote:
> This patchset contains trivial fixups for appendix/toyrcu/, which found
> while doing Korean translation[1].
> 
> [1] https://github.com/sjp38/perfbook-ko_KR
> 
> SeongJae Park (3):
>   appendix/toyrcu: Add missing parentheses
>   appendix/toyrcu: Use \co{} for spin tool
>   appendix/toyrcu: Add missing parentheses for rcu_quiescent_state()

Queued and pushed, thank you!

							Thanx, Paul

>  appendix/toyrcu/toyrcu.tex | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> -- 
> 2.17.1
> 
