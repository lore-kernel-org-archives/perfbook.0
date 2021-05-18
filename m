Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:45130 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1351277AbhERRgn (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 18 May 2021 13:36:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621359324;
        bh=/Go/B+KKjuToWcz+8GmXPRNUnY7lWF1+cEOJ1yGn0BA=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=giTXTffJ/+EXndlQZ+3PRNxaSKUQNxjRIzOGJQOQUuHipBIj8XNvo0vKmIopAvyh2
         jamGwfhUK9gd7Z55DAYOirzQjKXhAnyLJsbnbZH2w8sm+LJ6ynD1Qa9JNJWx1VtTdu
         H9k3k6yqMl/TTfjlURXvMExgSVcdx3cZ1nuk2IA/E0KOONmqGfXG08SNDJcTCr24+L
         yvjB/l2vQeFuu1dKS7g7e3ZAegYh68Xrx6F3E5/NNtDfBlMSpmiq2TcbgxvOxBYzV4
         fogbmNXQLvTpLYjBy8kkcnJx5EGuquCNTurvme38jf5CPV3qHo/8RHuHLTnduqgEge
         oRJDKT2fxJZiA==
Date: Tue, 18 May 2021 10:35:24 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] RFC: possible fixing a preposition
Message-ID: <20210518173524.GN4441@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20210518161244.7340-1-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210518161244.7340-1-zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Cc: luyang.co@gmail.com, perfbook@vger.kernel.org

On Wed, May 19, 2021 at 12:12:44AM +0800, Zhouyi Zhou wrote:
> hi, Paul
> 
> In appendix B.7: "Lines 3 and 4 simply add one to
>  the global free-running rcu_gp_ctr variable"
> 
> I looked up webster online dictionary
> https://www.merriam-webster.com/dictionary/add%20to
> it says "Definition of add to" is "to make (something) larger, 
> better, or greater"
> meanwhile rcu_gp_ctr is not changed in this statement.

In this case, "add" as in "addition" as in arithmetic, similar to the
C-language "+=" operator.  But...

> My native language is not English, I try to search the web
> for an example, and I think if replace 'to' with 'and' maybe a
> better choice.
> 
> Maybe my proposal is not necessary.
> 
> Thanks for your time.

...this one falls into the "correct but confusing" bucket.

Would "add the value one to the global free-running rcu_gp_ctr variable"
work better for you?

							Thanx, Paul

> Best Wishes
> Zhouyi
> ---
>  appendix/toyrcu/toyrcu.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
> index be77c045..dd759ba7 100644
> --- a/appendix/toyrcu/toyrcu.tex
> +++ b/appendix/toyrcu/toyrcu.tex
> @@ -976,7 +976,7 @@ The resulting \co{rcu_read_lock()} implementation is extremely
>  straightforward.
>  \begin{fcvref}[ln:defer:rcu:read_lock_unlock:lock]
>  \Clnref{gp1,gp2} simply
> -add one to the global free-running \co{rcu_gp_ctr}
> +add one and the global free-running \co{rcu_gp_ctr}
>  variable and stores the resulting odd-numbered value into the
>  \co{rcu_reader_gp} per-thread variable.
>  \Clnref{mb} executes a memory barrier to prevent the content of the
> -- 
> 2.25.1
> 
