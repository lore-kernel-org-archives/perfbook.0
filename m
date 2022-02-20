Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236144AbiBTRlQ (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 20 Feb 2022 12:41:16 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D70AC4A930
        for <perfbook@vger.kernel.org>; Sun, 20 Feb 2022 09:40:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 741D260E14
        for <perfbook@vger.kernel.org>; Sun, 20 Feb 2022 17:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645378853;
        bh=VOsLzgQocQXSKgg4B5vKZ1fLAQbaVk8t3K6kS7XYtIc=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=XGI4WKRVAaJqjd9b2qx3CeYDImWhg6L2l+I7dHOog3ZqDVSsbh9b2T3C8au68PHs+
         WGsGixO4ahqBRHiVH1bYFsuWMKsC5B8/5Hl3b7ob23fQyjPsxbS0P1ALAOZhQ4/6lP
         NeOQN6MdJCYo0zqo8oXOiA2BUeIYBCKhPH5A/6R4hzTZiif26dOxHpi4DpuJKLwo/E
         WFovjbRiwFn0D7EOBSOUVYttsGybCw5dR3DWwAeU4LbD/Ku2zsFGoEPGVS66NJVI8z
         oTtlNlp3UbN84z6l0l09+3ZTJeXVdEKJacxnSs7yOtyKnsBdoi49S3A4BHe8hIekho
         tPdmOdlFdjPoA==
Date: Sun, 20 Feb 2022 09:40:53 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [Q -perfbook] Extra \midrule in Table 9.2
Message-ID: <20220220174053.GA4285@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <f00893a2-bf04-8473-2268-530bf24f715c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f00893a2-bf04-8473-2268-530bf24f715c@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Feb 20, 2022 at 08:51:21PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> In commit 9c0c058db09d ("defer/rcuapi: Describe SRCU initialization and
> cleanup"), you added a row in Table 9.2.
> 
> > --- a/defer/rcuapi.tex
> 
> > +++ b/defer/rcuapi.tex
> > @@ -148,6 +148,14 @@ API~\cite{PaulEMcKenney2019RCUAPI}.\footnote{
> >  		{\bf Tasks RCU Rude}: Free idle-task tracing trampolines &
> >  		    {\bf Tasks RCU Trace}: Protect sleepable BPF programs \\
> >  \midrule
> > +{\bf Initialization and Cleanup} &
> > +    &
> > +	\tco{DEFINE_SRCU()} \tco{DEFINE_STATIC_SRCU()}
> > +	\tco{init_srcu_struct()} \tco{cleanup_srcu_struct()} &
> > +	    &
> > +		&
> > +		    \\
> > +\midrule
> 
> Did you add this \midrule intentionally?
> The added row looks similar to the rows below it.

Now that you mention it, that does look rather silly.  Thank you for
checking, and I have pushed out a fix with your Reported-by.

							Thanx, Paul

>         Thanks, Akira
> 
> >  {\bf Read-side critical-section markers} &
> >      \tco{rcu_read_lock()}~! \tco{rcu_read_unlock()}~!
> >      \tco{rcu_read_lock_bh()} \tco{rcu_read_unlock_bh()}
> 
