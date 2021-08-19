Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:45578 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232909AbhHSRaR (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Thu, 19 Aug 2021 13:30:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629394180;
        bh=n92pgImMSAS7QSTRxCuBNDllLjQ5m3igDlL2H+TrPvo=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=igKYChb7VXb8foZQhtx++p3dfaCOJaFREEUTwbe23w94VQ+ICGtP6gjmJrPo8OZXU
         F+PvJu2WmfNfFI4bJw9TWEtBNJT/Bj2uvhhBDJ1L/BsefbnlOJMgNmeAL1VFzY7YmA
         /xARWwi2F5ug721u3j1IVzzsRVNa30YeAdAiuHjPr790nJ3pWFzIO7NsyeQQQ1ihzI
         0XYsXM8aMxfQdBfarQKIn84BUOBABpoh9JxbLgoMReebnteYoMFBxyA2C7TrtsFIFU
         Mvs1jCSIHk5yn7O/LCmfE6Vqzp74Xs4GKT1gH+YQ18TJJzJCv0D85wRyxtfa2/2343
         hUeGoQiEgIRNA==
Date: Thu, 19 Aug 2021 10:29:40 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH-perfbook] Fix a little grammar mistake
Message-ID: <20210819172940.GD4126399@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <1629359518-3861-1-git-send-email-zhouzhouyi@gmail.com>
 <031ce7cf-750e-7a2d-f2ba-5e7b661df2c2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <031ce7cf-750e-7a2d-f2ba-5e7b661df2c2@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>, perfbook@vger.kernel.org, luyang.co@gmail.com

On Thu, Aug 19, 2021 at 07:54:30PM +0900, Akira Yokosawa wrote:
> Hello Zhouyi,
> 
> On Thu, 19 Aug 2021 15:51:58 +0800, Zhouyi Zhou wrote:
> > Hi Paul,
> > 
> > I think there is a little grammer mistake in answer to quick quiz 10.8,
> > I am not so sure because my English is not so well ;-)
> > 
> > Thanks
> > Zhouyi
> > 
> > Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> > ---
> >  datastruct/datastruct.tex | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
> > index adb102d..68341f2 100644
> > --- a/datastruct/datastruct.tex
> > +++ b/datastruct/datastruct.tex
> > @@ -963,1 +963,1 @@ not recommended for production use.
> >  	In theory, it isn't any safer, and a useful exercise would be
> > 	to run these programs on larger systems.
> >  	In practice, there are a lot more systems with more than 28~CPUs
> > -	than there are systems with more than 448 CPUs.
> 
> This can be parsed as follows:
> 
>     In practice, there are a lot more X than there are Y.
> 
> , where
> 
>     X: systems with more than 28~CPUs
>     Y: systems with more than 448 CPUs
> 
> So there is no grammatical error here.
> Three uses of "than" in a sentence might be confusing, though.
> 
> Paul might have an idea of a less-confusing sentence.

Three "than"s in one sentence is a bit excessive, now that you guys
mention it.

How about this?

	In practice, there are a lot more 28-CPU systems than there are
	448-CPU systems.

I do not believe that the "more than"s are really adding much here.

Thoughts?

							Thanx, Paul

>         Thanks, Akira 
> 
> > +	are systems with more than 448 CPUs.
> >  	In addition, other testing has shown that RCU read-side primitives
> >  	offer consistent performance and scalability up to at least 1024 CPUs.
> >  }\QuickQuizEnd
> > 
