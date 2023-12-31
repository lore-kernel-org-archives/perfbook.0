Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D21184C
	for <perfbook@vger.kernel.org>; Sun, 31 Dec 2023 00:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uiWVQJBl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F981C433C7;
	Sun, 31 Dec 2023 00:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703982326;
	bh=igS1w7n9ec+74WtHYeOteEVVmZB9WxmiYDLOuc1/5+s=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=uiWVQJBlFlpoaNRdn4U2R19GM62/E02upLZqhIcOcdGq0whT8wwWMLIa7HzHLaDhU
	 BN8qJQDfFSVzgvQoXFAMbUxKGSFS01FHesonrbeV9B89JAACvqSbUCAT9w3sj23ZH3
	 OQ54AlTQQ06FU0HI+fsgObheYneIKaci2ZtCKAbVs+v6pehaeC4u1nh9woIma+7Ydz
	 JK+VwmbKn6Q/+IOJHJBk57MTpMdkeEHQKglCJRlhZ5lyrB6ZKm+T9Yr4Tquma/64Jg
	 /f0neFzfY9YDnnQl9HZmq/3CK2eV0NW3b5J9bmFK4Ox6qDN0TFzViay8YiVtXAAnJM
	 WJbEf4qer8boQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 0227DCE0D18; Sat, 30 Dec 2023 16:25:25 -0800 (PST)
Date: Sat, 30 Dec 2023 16:25:25 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Cc: akiyks@gmail.com, perfbook@vger.kernel.org,
	Zhouyi Zhou <zhouyi.zhou@ucas.com.cn>
Subject: Re: [PATCH -perfbook] toolsoftrade: fix a typo: manpages should be
 man pages
Message-ID: <24c0a06b-d0e9-4c15-a0a7-9ccafecf3e79@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <1703926769-5124-1-git-send-email-zhouzhouyi@gmail.com>
 <cfa2e0c6-f3fc-45b0-a11a-2ebb5537f8c8@paulmck-laptop>
 <CAABZP2wZ=eJu2ymJpD667ivFn+w1isVA+gmw9ewT4OD8T3PGZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAABZP2wZ=eJu2ymJpD667ivFn+w1isVA+gmw9ewT4OD8T3PGZA@mail.gmail.com>

On Sun, Dec 31, 2023 at 08:11:07AM +0800, Zhouyi Zhou wrote:
> On Sun, Dec 31, 2023 at 7:59 AM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > On Sat, Dec 30, 2023 at 04:59:29PM +0800, zhouzhouyi@gmail.com wrote:
> > > From: Zhouyi Zhou <zhouyi.zhou@ucas.com.cn>
> > >
> > > According to [1][2], manpages should be man pages or man-pages.
> > >
> > > [1] https://en.wikipedia.org/wiki/Man_page
> > > [2] https://www.kernel.org/doc/man-pages/
> > > Signed-off-by: Zhouyi Zhou<zhouzhouyi@gmail.com>
> >
> > I am happy either way, having seen it spelled both ways for some decades.
> > But those two references are good standardization points.
> Thanks Paul for supporting my point of view ;-)
> >
> > And before I queue this, did this also come from our Chinese editor?
> > If so, should she be credited?
> This modification was proposed by me independently ;-)

Very good, queued and pushed, thank you!


                                                        Thanx, Paul

> Thanx, Zhouyi
> >
> > > ---
> > >  toolsoftrade/toolsoftrade.tex | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> > > index 645ee74b..097c18d6 100644
> > > --- a/toolsoftrade/toolsoftrade.tex
> > > +++ b/toolsoftrade/toolsoftrade.tex
> > > @@ -308,7 +308,7 @@ Parent process sees x=0
> > >       (such as \co{mmap()} and \co{shmget()}).
> > >       In the meantime, there are any number of textbooks that cover
> > >       these primitives in great detail,
> > > -     and the truly motivated can read manpages, existing parallel
> > > +     and the truly motivated can read man pages, existing parallel
> > >       applications using these primitives, as well as the
> > >       source code of the Linux-kernel implementations themselves.
> > >
> > > --
> > > 2.34.1
> > >
