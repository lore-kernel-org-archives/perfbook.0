Return-Path: <SRS0=AKjH=77=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680947659; x=1683539659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oVWp6sS9QZcmsVRkGLQQ4Wwlk08SD4L3AoMkJBouHBM=;
        b=NfPcwQsIZb0NUFku1yyIdgPGV5POp8RUp47lqAWuYjx3Wur+dknpi+H2G5p2coWp/A
         Jpvx4xBSH2pTAAtN5pbElV/t9Q8yXFDhaOzRf6MMxPXwgTUKFvxgOMVwOBon2aUJNEoc
         SCzVPUzFkTnhBvTrzlOgSzHwNgQDCDJBPf3KQdbhFvRzD6ZVTjMO4yDOeYEr5MCVQSew
         DI3G/BVn9EKtlBSVTZoXfgsMm22igzl5M4MFbBe3nDJc/kS6TmSAOw3i0b4ljg2fMe/O
         GPlZVSUef1oFmpuQEukMxwNyjNpYNgJugVDYajy8lhe4sDaSuaApdKo1u0w6CyfkxF+k
         1EMA==
Message-ID: <d5b2fb69-9da7-68dc-ac2a-bc0d8fac368f@gmail.com>
Date: Sat, 8 Apr 2023 18:54:14 +0900
MIME-Version: 1.0
Subject: Re: [PATCH v4] CodeSamples/count: Remove unnecessary memory barriers
References: <20230408055753.1335821-1-mmpgouride@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230408055753.1335821-1-mmpgouride@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: Alan Huang <mmpgouride@gmail.com>, paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sat,  8 Apr 2023 01:57:53 -0400, Alan Huang wrote:
> In count_lim_sig.c, there is only one ordering required, that is
> writing to counter happens before setting theft to THEFT_READY in
> add_count/sub_count's fast path. Therefore, partial memory barrier
> will suffice.
> 
> Signed-off-by: Alan Huang <mmpgouride@gmail.com>

v3 of this patch already has this, but to be clear,

Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

        Thanks, Akira

> ---
>  CodeSamples/count/count_lim_sig.c | 10 +++-------
>  count/count.tex                   | 12 ++++++------
>  2 files changed, 9 insertions(+), 13 deletions(-)
> 
> diff --git a/CodeSamples/count/count_lim_sig.c b/CodeSamples/count/count_lim_sig.c
> index 59da8077..c2f61197 100644
> --- a/CodeSamples/count/count_lim_sig.c
> +++ b/CodeSamples/count/count_lim_sig.c
> @@ -56,12 +56,10 @@ static void flush_local_count_sig(int unused)	//\lnlbl{flush_sig:b}
>  {
>  	if (READ_ONCE(theft) != THEFT_REQ)	//\lnlbl{flush_sig:check:REQ}
>  		return;				//\lnlbl{flush_sig:return:n}
> -	smp_mb();				//\lnlbl{flush_sig:mb:1}
>  	WRITE_ONCE(theft, THEFT_ACK);		//\lnlbl{flush_sig:set:ACK}
>  	if (!counting) {			//\lnlbl{flush_sig:check:fast}
> -		WRITE_ONCE(theft, THEFT_READY);	//\lnlbl{flush_sig:set:READY}
> +		smp_store_release(&theft, THEFT_READY);	//\lnlbl{flush_sig:set:READY}
>  	}
> -	smp_mb();
>  }						//\lnlbl{flush_sig:e}
>  
>  static void flush_local_count(void)			//\lnlbl{flush:b}
> @@ -125,8 +123,7 @@ int add_count(unsigned long delta)			//\lnlbl{b}
>  	WRITE_ONCE(counting, 0);			//\lnlbl{clearcnt}
>  	barrier();					//\lnlbl{barrier:3}
>  	if (READ_ONCE(theft) == THEFT_ACK) {		//\lnlbl{check:ACK}
> -		smp_mb();				//\lnlbl{mb}
> -		WRITE_ONCE(theft, THEFT_READY);		//\lnlbl{READY}
> +		smp_store_release(&theft, THEFT_READY);		//\lnlbl{READY}
>  	}
>  	if (fastpath)
>  		return 1;				//\lnlbl{return:fs}
> @@ -164,8 +161,7 @@ int sub_count(unsigned long delta)
>  	WRITE_ONCE(counting, 0);
>  	barrier();
>  	if (READ_ONCE(theft) == THEFT_ACK) {
> -		smp_mb();
> -		WRITE_ONCE(theft, THEFT_READY);
> +		smp_store_release(&theft, THEFT_READY);
>  	}
>  	if (fastpath)
>  		return 1;
> diff --git a/count/count.tex b/count/count.tex
> index 8ab67e2e..bb24631c 100644
> --- a/count/count.tex
> +++ b/count/count.tex
> @@ -2425,12 +2425,11 @@ handler used in the theft process.
>  \Clnref{check:REQ,return:n} check to see if
>  the \co{theft} state is REQ, and, if not
>  returns without change.
> -\Clnref{mb:1} executes a \IX{memory barrier} to ensure that the sampling
> -of the theft variable happens before any change to that variable.
>  \Clnref{set:ACK} sets the \co{theft} state to ACK, and, if
>  \clnref{check:fast} sees that
>  this thread's fastpaths are not running, \clnref{set:READY} sets the \co{theft}
> -state to READY\@.
> +state to READY, with the release store ensuring any change to \co{counter} in
> +the fastpath happens before the change of \co{theft} to READY\@.
>  \end{fcvref}
>  
>  \begin{listing}
> @@ -2595,9 +2594,10 @@ handlers to undertake theft.
>  \Clnref{barrier:3} again disables compiler reordering, and then
>  \clnref{check:ACK}
>  checks to see if the signal handler deferred the \co{theft}
> -state-change to READY, and, if so, \clnref{mb} executes a memory
> -barrier to ensure that any CPU that sees \clnref{READY} setting state to
> -READY also sees the effects of \clnref{add:f}.
> +state-change to READY, and, if so, \clnref{READY} changes \co{theft} to
> +READY with the release store ensuring that
> +any CPU that sees the READY state also sees the effects
> +of \clnref{add:f}.
>  If the fastpath addition at \clnref{add:f} was executed, then
>  \clnref{return:fs} returns
>  success.
