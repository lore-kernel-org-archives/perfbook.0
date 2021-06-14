Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:36906 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229596AbhFNEm2 (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Mon, 14 Jun 2021 00:42:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623645626;
        bh=NtuLXE/+GaoiJojlWgnqjGLM0LaChxSuHyNb70lHg2I=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=b1HGsAfkqz9xvgVOdr0n0V3+p+kVFFJsdWwuVC4h/G+Jd6JHmT+H+RGOOrSGoZmol
         7D2OFJt51ulAuffMr+5R4Ie+FFua9UUX7IeSRkVkviqTclTz/DYal7tgIubXhuJ7va
         lRGdJ0Z+dnR6Aj8v5Ns7SO5hwdq/05nNsFE6vb5fD8tn4ktoPfzJErhPgJLfmQekKh
         HXPCXucf+7YDZlrGaJXmS7odp1oXWmwIK0qGmemSbcxcj0E609nQC6n82nPlFm3cmr
         RAcloZXtKuz3fYMrfIRIE/4rbRLG4qOqcWZOzYEHXO45FAZ+plNUgdy1h8RE2YcbKF
         oFxXa9jFhxaXQ==
Date: Sun, 13 Jun 2021 21:40:26 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v2 -perfbook] howto, intro, cpu: Break and capitalize
 after colon
Message-ID: <20210614044026.GP4397@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <70a41d88-1892-3937-3af5-d3db3657d74c@gmail.com>
 <20210609192347.GJ4397@paulmck-ThinkPad-P17-Gen-1>
 <a213855a-3357-0217-0973-cc76b11d40ad@gmail.com>
 <20210610212617.GW4397@paulmck-ThinkPad-P17-Gen-1>
 <b94fd29f-66a5-b4c8-cca5-6f81a75f20a7@gmail.com>
 <e6b2532d-3059-d6e4-5ae1-15feb70067f6@gmail.com>
 <20210613155725.GM4397@paulmck-ThinkPad-P17-Gen-1>
 <e7bd8e4b-c6ba-5eeb-6d6f-b56d29c75ff1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7bd8e4b-c6ba-5eeb-6d6f-b56d29c75ff1@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Jun 14, 2021 at 07:58:59AM +0900, Akira Yokosawa wrote:
> On Sun, 13 Jun 2021 08:57:25 -0700, Paul E. McKenney wrote:
> > On Sat, Jun 12, 2021 at 03:14:52PM +0900, Akira Yokosawa wrote:
> >> Fix violations detected by the check scripts at hand.
> >>
> >> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > 
> > I have pulled this in, thank you very much!
> > 
> > There is one mistake I made in my previous reply, and I have fixed
> > this.  Please see below.
> > 
> [...]
> >> diff --git a/cpu/hwfreelunch.tex b/cpu/hwfreelunch.tex
> >> index 92f04f16..68c6dd5f 100644
> >> --- a/cpu/hwfreelunch.tex
> >> +++ b/cpu/hwfreelunch.tex
> >> @@ -167,8 +167,9 @@ That said, they may be necessary steps on the path to the late Jim Gray's
> >>  \label{sec:cpu:Novel Materials and Processes}
> >>  
> >>  Stephen Hawking is said to have claimed that semiconductor manufacturers
> >> -have but two fundamental problems: (1) the finite speed of light and
> >> -(2) the atomic nature of matter~\cite{BryanGardiner2007}.
> >> +have but two fundamental problems:
> >> +(1)~The finite speed of light and
> >> +(2)~the atomic nature of matter~\cite{BryanGardiner2007}.
> > 
> > I should have capitalized the "the" in this last line.  I did so before
> > applying your patch.
> 
> Well, I'm afraid this pattern is well beyond the capability of the dumb
> perl script.  (Hint: It only looks at the next input line of colon.)

I cannot complain, given that you have taken the checking scripts far
beyond what I expected.  Having a few manual checks still required
is no dishonor.  ;-)

> Anyway, I'll update the other chapters in the same manner.

Thank you very much!

							Thanx, Paul
