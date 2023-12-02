Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDB922098
	for <perfbook@vger.kernel.org>; Sat,  2 Dec 2023 23:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ibU2Ynmn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDDE7C433C8;
	Sat,  2 Dec 2023 23:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701560127;
	bh=wOhF8bkSdBiSFC5X2A2XDHEyq5FB0wUvJMEfT4we9g0=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=ibU2YnmnEt1YqoG6EBoT7yCy1YikRhAwvJdNLzOv0iXD9rvsgbFIjw+1a5wjDruSQ
	 pKunrsgGSL4TPvPanb2wrMZ4TwUg2wRULptcEd0YyveWUZNyagu+e1HB65ESgBAPNh
	 TTZhzotvIrvKFE84NH5kz2qY4+bsaUHUtx1Z9wiSeDhNrnivAuk1TcMetTiNbtS3C8
	 n/xcTIF/Ke/DYatl8n+3ZM5mDEqECDGfWw2BxCMTvBiHoUiNRA2eGpTxvwf9WBkhJr
	 29SFfGwjSDB431pAvAy/cH/mHq5x8gGc1KjWm61Fdrq6Im1Q34fTiKO+ny+CvzxXXu
	 Bsgbxh9rDTVbw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 849EECE1448; Sat,  2 Dec 2023 15:35:27 -0800 (PST)
Date: Sat, 2 Dec 2023 15:35:27 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH 7/7] future/formalregress: Use SEL4 consistently
Message-ID: <6e4f4019-ce9c-481f-b8bb-c352aa4658fa@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <50a43146-d9dd-45fe-8569-0e33314a4648@paulmck-laptop>
 <20231202213209.22836-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231202213209.22836-1-sj@kernel.org>

On Sat, Dec 02, 2023 at 01:32:09PM -0800, SeongJae Park wrote:
> On Sat, 2 Dec 2023 11:29:45 -0800 "Paul E. McKenney" <paulmck@kernel.org> wrote:
> 
> > On Sat, Dec 02, 2023 at 09:26:14AM -0800, SeongJae Park wrote:
> > > formalregress.tex is using mixed use of SEL4 and seL4.  SEL4 is used 8
> > > times, while seL4 is used twice over the entire repository.  Use SEL4
> > > for the consistency.  Note that use of seL4 in swtools.bib is not
> > > changed by this commit.
> > > 
> > > Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> > 
> > Nice, thank you!
> 
> You're very welcome, Paul!
> 
> > 
> > I queued and pushed all but this one.  Their website [1] says seL4.
> > At least I *think* that this is their website.
> 
> Agreed :)
> 
> > 
> > Either way, I agree that this should be consistent with their naming.
> 
> Sure, I will send a new revision soon.
> 
> > 
> > On the Promela/spin change, should a similar change be applied in the
> > Formal Verification chapter?
> 
> I already finished the translation of the chapter, but hopefully I will revisit
> it soon :)  Don't wait for me, though!

Fair enough!  ;-)

							Thanx, Paul

> Thanks,
> SJ
> 
> > 
> > 							Thanx, Paul
> > 
> > [1] https://sel4.systems/
> > 
> > > ---
> > >  future/formalregress.tex | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/future/formalregress.tex b/future/formalregress.tex
> > > index b1a39b29..40bf2b35 100644
> > > --- a/future/formalregress.tex
> > > +++ b/future/formalregress.tex
> > > @@ -701,7 +701,7 @@ so they are all yellow with question marks.
> > >  	Indeed there are!
> > >  	This table focuses on those that Paul has used, but others are
> > >  	proving to be useful.
> > > -	Formal verification has been heavily used in the seL4
> > > +	Formal verification has been heavily used in the SEL4
> > >  	project~\cite{ThomasSewell2013L4binaryVerification},
> > >  	and its tools can now handle modest levels of concurrency.
> > >  	More recently, Catalin Marinas used Lamport's
> > > -- 
> > > 2.17.1
> > > 
> > > 
