Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD3C14AA1
	for <perfbook@vger.kernel.org>; Fri, 29 Dec 2023 23:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZoRRbHw/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61FC7C433C8;
	Fri, 29 Dec 2023 23:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703892147;
	bh=V61IpQovvm62G4p0RGZV+4kKRR1YdxLU3rGZSOq450Y=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=ZoRRbHw/vzjb6dm8FZPoBjYC/w1nYPjHdDmlBkl2tiW/HW3c+I9mvAV04UycSMXiQ
	 aYVQNv80+rrrMOg4n7qme9eE36nYhcRR9JorkkMhySyjXK2i3+vFXOS94jZspARBie
	 o8e8RkmiYZkaf+kBXnh/ojVHTan1Orqhu+87ZOnZbEcGsKViIT/Qf+59NtwMLrjxLR
	 wM7fULDTcanRKJFkajLltpm+p10K7uX55QzKg113WrYvH8glkr/NS+pXfp5t8HW6mP
	 4XNr/GgiM3RpIgqR6iR/6wxu3NKCMAXdk61fy5yenWR3NG/n6hlkTL2cSSgqjpMdIA
	 nr6pKxXFzdOfg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id ECBB2CE095F; Fri, 29 Dec 2023 15:22:26 -0800 (PST)
Date: Fri, 29 Dec 2023 15:22:26 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Cc: akiyks@gmail.com, perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook] cpu: make Quick Quiz 3.6 more explicit
Message-ID: <6bbba502-bb0b-42fa-a77a-f86cee8f93c3@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <1703735700-611-1-git-send-email-zhouzhouyi@gmail.com>
 <1b63ce71-8fad-4f43-9ccf-f857f6604c1e@paulmck-laptop>
 <CAABZP2zMfHzY1wBEXTk4Q_ZtoMt8EU1_mCBE-y1FcJcqbfS_TQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAABZP2zMfHzY1wBEXTk4Q_ZtoMt8EU1_mCBE-y1FcJcqbfS_TQ@mail.gmail.com>

On Sat, Dec 30, 2023 at 07:15:56AM +0800, Zhouyi Zhou wrote:
> On Sat, Dec 30, 2023 at 7:09 AM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > On Thu, Dec 28, 2023 at 11:55:00AM +0800, zhouzhouyi@gmail.com wrote:
> > > From: Zhouyi Zhou <zhouzhouyi@gmail.com>
> > >
> > > Rewrite Quick Quiz 3.6 for clarity and explicitness, so that the
> > > firsttime reader know that another choice is CPU 0 sharing a core
> > > with CPU 1.
> > >
> > > Signed-off-by: Zhouyi Zhou<zhouzhouyi@gmail.com>
> > > ---
> > > hi Paul and Akira
> > >
> > > This minor fix is also reported by our Chinese version editor
> > > Yunjing Li.
> >
> > I have pulled this in, thanks to both you and the editor!  Would it be
> > appropriate to have the editor's reported-by?  (I trust your judgment
> > on this.  I am only asking, not in any way suggesting a change.)
> I think I should have the editor's report-by, but she is too modest to
> offer her email-address,
> because she thinks this is her job.
> 
> Could we add reported-by without an email address ? ;-)

We could just add a line saying something like:

	This change was identified by XXX YYYYY in the course of
	translating the book to Chinese.

Or something similar.  What would our editor like best?

For another option, I do sometimes do "Reported-by: LWN user xxxx"
or similar.

							Thanx, Paul

> Thanx, Zhouyi
> >
> >                                                         Thanx, Paul
> >
> > > Thanks
> > > Zhouyi
> > > --
> > >  cpu/overheads.tex | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/cpu/overheads.tex b/cpu/overheads.tex
> > > index 1ee9c52f..a2ec2998 100644
> > > --- a/cpu/overheads.tex
> > > +++ b/cpu/overheads.tex
> > > @@ -262,7 +262,8 @@ CAS and lock, respectively.
> > >  \QuickQuiz{
> > >       \Cref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
> > >       shows CPU~0 sharing a core with CPU~224.
> > > -     Shouldn't that instead be CPU~1???
> > > +     However, isn't it more logical for CPU 0
> > > +     to share a core with CPU 1 instead of CPU 224???
> > >  }\QuickQuizAnswer{
> > >       It is easy to be sympathetic to this view, but the file
> > >       \path{/sys/devices/system/cpu/cpu0/cache/index0/shared_cpu_list}
> > > --
> > > 2.34.1
> > >
> 
