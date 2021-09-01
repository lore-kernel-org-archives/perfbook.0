Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:47598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229560AbhIASCd (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Wed, 1 Sep 2021 14:02:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630519296;
        bh=ybQpEK12XRI/D4FLUBdhoTzYIEYTvM21+UpwxGv9kLY=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=H1IPmXkbCLlXuYy+xMBUUjxx8yPI7qLWwOmh7M76MvVJmBspH5XoTipyXFeL9YMV3
         4XRNQq9iJmHktxGShdhh0QPsvdeV8cbyy34L7CP3Zw2qGEQwBZXB4Ra7ZlYLbOeThN
         fiTc3Xu1J3S+HOTXXrJByk4rQMRUmlV7ZrQ/0pllPfFqoJIgiAipD79SPEuaFhZPik
         cDBiABVDzgqiaHXtKfnPYxtFTi4RnIZkXWctOlarPk+CCpz9amigwBEZC9VKPO0hrN
         f6uab3WfJU4+sbLkh5CtnA8jHsPeHBBfMmXDo+vEfVxizKbvU7HQJBUuG48siv/chI
         hzSyQdlYkX72A==
Date: Wed, 1 Sep 2021 11:01:36 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 1/2] together/applyrcu: Shrink Listing 13.10 in
 ebook-size builds
Message-ID: <20210901180136.GI4156@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <29232571-1ee0-db14-cde9-f90d8b21b584@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29232571-1ee0-db14-cde9-f90d8b21b584@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Sep 01, 2021 at 10:07:39PM +0900, Akira Yokosawa wrote:
> Listing 13.10 added in commit 42d9b5f32956
> ("together/applyrcu: Add example of retriggering a grace period")
> is too tall for ebook-size builds.
> 
> As the \ebresizeverb command used to shrink code snippets requires
> a verbatim element to be fed via \input{}, move the snippet into
> CodeSamples/together/retrigger-gp.c.
> The code snippet is now handled by fcvextract.pl.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Even better!  Thank you, queued and pushed both!

							Thanx, Paul

> ---
>  CodeSamples/together/retrigger-gp.c | 60 ++++++++++++++++++++++++++++
>  together/applyrcu.tex               | 61 +----------------------------
>  2 files changed, 61 insertions(+), 60 deletions(-)
>  create mode 100644 CodeSamples/together/retrigger-gp.c
> 
> diff --git a/CodeSamples/together/retrigger-gp.c b/CodeSamples/together/retrigger-gp.c
> new file mode 100644
> index 00000000..9b315220
> --- /dev/null
> +++ b/CodeSamples/together/retrigger-gp.c
> @@ -0,0 +1,60 @@
> +//\begin{snippet}[labelbase=ln:together:retrigger-gp:whole,commandchars=\\\@\$,tabsize=8]
> +#define RTRG_CLOSED    0
> +#define RTRG_OPEN      1
> +#define RTRG_CLOSING   2
> +#define RTRG_REOPENING 3
> +#define RTRG_RECLOSING 4
> +
> +int rtrg_status;
> +DEFINE_SPINLOCK(rtrg_lock);
> +struct rcu_head rtrg_rh;
> +
> +void close_cb(struct rcu_head *rhp)
> +{
> +	spin_lock(rtrg_lock);
> +	if (rtrg_status = RTRG_CLOSING) {
> +		close_cleanup();
> +		rtrg_status = RTRG_CLOSED;
> +	} else if (rtrg_status == RTRG_REOPENING) {
> +		rtrg_status = RTRG_OPEN;
> +	} else if (rtrg_status == RTRG_RECLOSING) {
> +		rtrg_status = RTRG_CLOSING;
> +		call_rcu(&rtrg_rh, close_cb);
> +	} else {
> +		WARN_ON_ONCE(1);
> +	}
> +	spin_unlock(rtrg_lock);
> +}
> +
> +int open(void)
> +{
> +	spin_lock(rtrg_lock);
> +	if (rtrg_status == RTRG_CLOSED) {
> +		rtrg_status = RTRG_OPEN;
> +	} else if (rtrg_status == RTRG_CLOSING ||
> +		   rtrg_status == RTRG_RECLOSING) {
> +		rtrg_status = RTRG_REOPENING;
> +	} else {
> +		spin_unlock(rtrg_lock);
> +		return -EBUSY;
> +	}
> +	do_open();
> +	spin_unlock(rtrg_lock);
> +}
> +
> +int close(void)
> +{
> +	spin_lock(rtrg_lock);
> +	if (rtrg_status == RTRG_OPEN) {
> +		rtrg_status = RTRG_CLOSING;
> +		call_rcu(&rtrg_rh, close_cb);
> +	} else if (rtrg_status == RTRG_REOPENING) {
> +		rtrg_status = RTRG_RECLOSING;
> +	} else {
> +		spin_unlock(rtrg_lock);
> +		return -ENOENT;
> +	}
> +	do_close();
> +	spin_unlock(rtrg_lock);
> +}
> +//\end{snippet}
> diff --git a/together/applyrcu.tex b/together/applyrcu.tex
> index f9116055..769250ae 100644
> --- a/together/applyrcu.tex
> +++ b/together/applyrcu.tex
> @@ -701,66 +701,7 @@ either of the CLOSING or the OPEN state, depending on which of the
>  RECLOSING or REOPENING states the callback was invoked in.
>  
>  \begin{listing}
> -\begin{VerbatimL}[tabsize=8]
> -#define RTRG_CLOSED    0
> -#define RTRG_OPEN      1
> -#define RTRG_CLOSING   2
> -#define RTRG_REOPENING 3
> -#define RTRG_RECLOSING 4
> -
> -int rtrg_status;
> -DEFINE_SPINLOCK(rtrg_lock);
> -struct rcu_head rtrg_rh;
> -
> -void close_cb(struct rcu_head *rhp)
> -{
> -	spin_lock(rtrg_lock);
> -	if (rtrg_status = RTRG_CLOSING) {
> -		close_cleanup();
> -		rtrg_status = RTRG_CLOSED;
> -	} else if (rtrg_status == RTRG_REOPENING) {
> -		rtrg_status = RTRG_OPEN;
> -	} else if (rtrg_status == RTRG_RECLOSING) {
> -		rtrg_status = RTRG_CLOSING;
> -		call_rcu(&rtrg_rh, close_cb);
> -	} else {
> -		WARN_ON_ONCE(1);
> -	}
> -	spin_unlock(rtrg_lock);
> -}
> -
> -int open(void)
> -{
> -	spin_lock(rtrg_lock);
> -	if (rtrg_status == RTRG_CLOSED) {
> -		rtrg_status = RTRG_OPEN;
> -	} else if (rtrg_status == RTRG_CLOSING ||
> -		   rtrg_status == RTRG_RECLOSING) {
> -		rtrg_status = RTRG_REOPENING;
> -	} else {
> -		spin_unlock(rtrg_lock);
> -		return -EBUSY;
> -	}
> -	do_open();
> -	spin_unlock(rtrg_lock);
> -}
> -
> -int close(void)
> -{
> -	spin_lock(rtrg_lock);
> -	if (rtrg_status == RTRG_OPEN) {
> -		rtrg_status = RTRG_CLOSING;
> -		call_rcu(&rtrg_rh, close_cb);
> -	} else if (rtrg_status == RTRG_REOPENING) {
> -		rtrg_status = RTRG_RECLOSING;
> -	} else {
> -		spin_unlock(rtrg_lock);
> -		return -ENOENT;
> -	}
> -	do_close();
> -	spin_unlock(rtrg_lock);
> -}
> -\end{VerbatimL}
> +\ebresizeverb{.88}{\input{CodeSamples/together/retrigger-gp@whole.fcv}}
>  \caption{Retriggering a Grace Period (Pseudocode)}
>  \label{lst:together:Retriggering a Grace Period}
>  \end{listing}
> -- 
> 2.17.1
> 
