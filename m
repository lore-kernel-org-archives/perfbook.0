Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3293545971
	for <perfbook@vger.kernel.org>; Sun, 17 Dec 2023 20:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lSiV3RJg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97041C433C7;
	Sun, 17 Dec 2023 20:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702846212;
	bh=f49l+hUTlS+VAJOZZ0PWS6s6FJ8yyQplpDOqDfTfyrY=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=lSiV3RJgyDrq0n/uESAtIVHQ19k/ETxEZ8fvq9l2XWsQ/njZdE6Cnl8ITWbb7pTIH
	 pk3Gtf7TJSmfgMRdHl2h57EPFU5JVPdErciFVHeJOoC7xXgcnIS8/05DOjf5vh000Z
	 Yg5tyxUoC+ldVsdksh8Wrtutwnnj/qF5GpqDOH0o6nKJHL0IZKu6tts8Ch4tb7Ko70
	 0zZAfeU6GYtDMMe6PusIt1sSSp5PjVDJPnJWBwBWgc2HrPbnsa3YCyj941afBWrT19
	 ZmurhT29oq4WaSM8KXZ8I9+nSZ90b/21FQ+CxyaasdKv+CyXSWJKMD1i/wURC0rzKY
	 l07s+o/Edt2zQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 35AD6CE0906; Sun, 17 Dec 2023 12:50:12 -0800 (PST)
Date: Sun, 17 Dec 2023 12:50:12 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH 0/2] appendix/questions: Trivial fixup
Message-ID: <d6cb7ef0-da83-4d99-9766-cb77b83d2548@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20231217174117.6714-1-sj38.park@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231217174117.6714-1-sj38.park@gmail.com>

On Sun, Dec 17, 2023 at 09:41:15AM -0800, SeongJae Park wrote:
> This patchset contains trivial fixups for appendix/questions/, which
> found while doing Korean translation[1].
> 
> [1] https://github.com/sjp38/perfbook-ko_KR
> 
> SeongJae Park (2):
>   appendix/questions/after: Use \qco{} for quoting code
>   appendix/questions/after: Use \co{}
> 
>  appendix/questions/after.tex | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Queued, and thank you!

							Thanx, Paul
