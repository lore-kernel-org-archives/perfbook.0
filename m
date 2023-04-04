Return-Path: <SRS0=txm1=73=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680607699;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aDkb/AFBV8M4J1so5B08hiQy8u1Q33vuh6ZnN4HveTI=;
        b=BuEMMZJJbZVTF/3/k/ugjsRYzjwN81wuc0aVw0N9kYGq1UONwUjyxB+/BN7LYBEAOj
         8TxD7hojeFMdnGqXWhhJCae0QXirPJK+4fVxxFzFDlYkHGf2ldYQ3VjpZvVzzYOrjzYs
         cbaoCO259HmWl4E5mkMhkP1g4nzwebJ9OmfXoYy6qjTRipED7LeICknM76B+okC3yvbO
         IFYxRP4uTi4BjBrJ7C3S3o1EPvWtGzSguPRw06c4Y7IIZOLiSoOusF0bP14i3m0vFU2T
         DKrWQExdYJGrJ74AH0zLaZ46Mkic9VoFu+WhCw2GN48Vud62pO6Q+Ojs8yYHhiUPaN3n
         OirA==
Message-ID: <c84751a3-3237-a3f3-3c60-5d1caaff19db@gmail.com>
Date: Tue, 4 Apr 2023 20:28:12 +0900
MIME-Version: 1.0
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH] CodeSamples/count: change full memory barrier to partial
 one
References: <20230404051921.1305092-1-mmpgouride@gmail.com>
Content-Language: en-US
In-Reply-To: <20230404051921.1305092-1-mmpgouride@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: Alan Huang <mmpgouride@gmail.com>
Cc: perfbook@vger.kernel.org, paulmck@kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Alan,

Thanks for your continued efforts.
Unfortunately, I (as a LaTeX adviser) see a couple of problems.
Please see below.

On Tue,  4 Apr 2023 01:19:21 -0400, Alan Huang wrote:
> The original memory barriers in count_stat_eventual.c ensure
> writing to global_count happens before writing to stopflag and
> reading from stopflag happens before later reading from global_count.
> 
> Thus, smp_load_acquire and smp_store_release will suffice.
> 
> In count_lim_sig.c, there is only one ordering required, that is
> writing to counter happens before setting theft to THEFT_READY in
> add_count/sub_count's fast path. Therefore, partial memory barrier
> will suffice.
> 
> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
> ---
>  CodeSamples/count/count_lim_sig.c       | 10 +++-------
>  CodeSamples/count/count_stat_eventual.c |  6 ++----
>  2 files changed, 5 insertions(+), 11 deletions(-)
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

Removing a line that has //\lnlbl{foo} from a code snippet will cause
warnings of "Reference ... undefined on ...".

I think you will see warnings that look like:

    ----- Excerpt around remaining warning messages -----
    [63]
    <count/sig-theft.pdf, id=5442, 172.645pt x 234.8775pt>
    File: count/sig-theft.pdf Graphic file (type pdf)
    <use count/sig-theft.pdf>
    Package pdftex.def Info: count/sig-theft.pdf  used on input line 2303.
    (pdftex.def)             Requested size: 172.64456pt x 234.87692pt.
     [64 <./count/sig-theft.pdf>] (./CodeSamples/count/count_lim_sig@data.fcv)

    LaTeX Warning: Reference `ln:count:count_lim_sig:migration:flush_sig:mb:1' on p
    age 65 undefined on input line 2428.

    [...]

You need to update text-side references to the to-be-removed label.
You will likely need to adjust wording in surrounding text as well.

If you are wondering how these labels in code snippets can be
referenced from LaTeX sources, please see Appendix D.3.1.1.

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

Ditto.

Can you submit a v2 including text-side updates?

In the meantime, I'll review your code changes.

        Thanks, Akira


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
> diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
> index 967644de..7157ee0e 100644
> --- a/CodeSamples/count/count_stat_eventual.c
> +++ b/CodeSamples/count/count_stat_eventual.c
> @@ -51,8 +51,7 @@ void *eventual(void *arg)				//\lnlbl{eventual:b}
>  		WRITE_ONCE(global_count, sum);
>  		poll(NULL, 0, 1);
>  		if (READ_ONCE(stopflag)) {
> -			smp_mb();
> -			WRITE_ONCE(stopflag, stopflag + 1);
> +			smp_store_release(&stopflag, stopflag + 1);
>  		}
>  	}
>  	return NULL;
> @@ -73,9 +72,8 @@ void count_init(void)					//\lnlbl{init:b}
>  void count_cleanup(void)				//\lnlbl{cleanup:b}
>  {
>  	WRITE_ONCE(stopflag, 1);
> -	while (READ_ONCE(stopflag) < 3)
> +	while (smp_load_acquire(&stopflag) < 3)
>  		poll(NULL, 0, 1);
> -	smp_mb();
>  }							//\lnlbl{cleanup:e}
>  //\end{snippet}
>  
