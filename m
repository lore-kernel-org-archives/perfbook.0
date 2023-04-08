Return-Path: <SRS0=AKjH=77=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680927960; x=1683519960;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6r22fQXoCy4ml9rywcaHJeRzPD8+IG+E4y8Djy2iZ5c=;
        b=FQhvKYI2VyJkKkdkc4tI4qekouBXG7wpy/aFyiY9Ulqe/M+aE5hRS+SejGsvK/nAjR
         dqKD7EdPInG0dsBGMtSbUv8L2HCOZrkBlMJp972v7wIsTnTXIC4MEw5m39Wl6f1lpMbq
         nhc/dmznTtf55oCXTTMiyVACNCQFjbiICiIuF+ZJu6MbUBBzETT2LlHs8qhPoEBh2dHb
         ZXHC03qrkTJ6LH4iepugv2KWZRky+lmK1mfz8ac3re7GyFRHPpOCzcjet0k9mLtJyCLy
         SkdtgIcsRTuaSJr8b132EVhdg1woEXUJDgFoW+zzEMZ1Mrd1AfeseQYf0u15MCEMMlge
         +FhA==
Message-ID: <71f63305-0d90-1ebf-fa91-0ec33e657904@gmail.com>
Date: Sat, 8 Apr 2023 13:25:56 +0900
MIME-Version: 1.0
Subject: Re: [PATCH] CodeSamples/count: Remove unnecessary memory barriers
References: <20230407175813.1334028-1-mmpgouride@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230407175813.1334028-1-mmpgouride@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: Alan Huang <mmpgouride@gmail.com>, paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Alan,

Maybe I was not clear enough, but there are minor inconsistencies in
PDF rendering.  Please see below.

On Fri,  7 Apr 2023 13:58:13 -0400, Alan Huang wrote:
> In count_lim_sig.c, there is only one ordering required, that is
> writing to counter happens before setting theft to THEFT_READY in
> add_count/sub_count's fast path. Therefore, partial memory barrier
> will suffice.
> 
> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
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
> index 8ab67e2e..4c139d63 100644
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
> +state to READY, with the release store ensuring any change to counter in
                                                                 \co{counter}

> +the fastpath happens before the change of theft to READY\@.
                                             \co{theft}

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
> +state-change to READY, and, if so, \clnref{READY} changes theft to
                                                             \co{theft}

> +READY with the release store ensuring that
> +any CPU that sees the READY state also sees the effects
> +of \clnref{add:f}.
>  If the fastpath addition at \clnref{add:f} was executed, then
>  \clnref{return:fs} returns
>  success.

With those addressed,

Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

        Thanks, Akira

