Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ncxaRmSQZ7stKXIygoWpficiCSMcAUaHkBKToWMpTIQ=;
 b=GXC1uEG7arOmLH+y/lOhDHlSN87qV0Bm91JB9+NFTuvzqQnEUiyBQAO33mWzRPgEbM
 n6mM9RnKK0imEH2AoCzfZDos2SjggEq2+NDWVgHnp9b7yy9XG28my63FpJv0V9IEFQ1B
 O3PuPu9I1O2LCWdk4gIjeoOmmEw5BlN1zO8ean5rHqo887KMdFSss1+RND5MfXmUJy8y
 V4n6v3jNLbFAPCpvqjr0N9vYSVB4IGzQodVjkqd/DuiMlpg3pyir3AfGHVqS57Q4tdZl
 20jiX/nhZdpwabr6QrPxQab8G1rb2JBEHVZlUXj0yLmUos9P1GSlffMDaKM36sVE6QO/
 fCHQ==
Subject: Re: [PATCH 1/2] count_stat_eventual: Switch from ACCESS_ONCE() to
 READ_ONCE()/WRITE_ONCE()
References: <1494515022-30278-1-git-send-email-junchangwang@gmail.com>
 <1494515022-30278-2-git-send-email-junchangwang@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <61acaa88-abd6-58f5-4d1f-80a2ef58d53e@gmail.com>
Date: Sat, 13 May 2017 21:04:38 +0900
MIME-Version: 1.0
In-Reply-To: <1494515022-30278-2-git-send-email-junchangwang@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Junchang Wang <junchangwang@gmail.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Jason & Paul,

although this has already been applied, I have a comment.

On 2017/05/11 23:03:41 +0800, Junchang Wang wrote:
> Signed-off-by: Junchang Wang <junchangwang@gmail.com>
> ---
>  CodeSamples/count/count_stat_eventual.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
> index 059ab8b..cbde4aa 100644
> --- a/CodeSamples/count/count_stat_eventual.c
> +++ b/CodeSamples/count/count_stat_eventual.c
> @@ -27,12 +27,12 @@ int stopflag;
>  
>  void inc_count(void)
>  {
> -	ACCESS_ONCE(__get_thread_var(counter))++;
> +	READ_ONCE(__get_thread_var(counter))++;

This is OK because READ_ONCE() is defined as the same as ACCESS_ONCE()
in CodeSamples. However, the definition in the current Linux kernel
would not permit this.

A read-modify-write access would need both READ_ONCE() and WRITE_ONCE().
However, since "counter" is thread local and updated only by its owner,
we don't need READ_ONCE() here. So:

+	WRITE_ONCE(__get_thread_var(counter), __get_thread_var(counter) + 1);

should have been sufficient.

Problem with this change is that the line gets too wide when applied to
the code snippet in 2-column layout.

Hmm...

                                 Thanks, Akira

>  }
>  
>  unsigned long read_count(void)
>  {
> -	return ACCESS_ONCE(global_count);
> +	return READ_ONCE(global_count);
>  }
>  
>  void *eventual(void *arg)
> @@ -43,8 +43,8 @@ void *eventual(void *arg)
>  	while (stopflag < 3) {
>  		sum = 0;
>  		for_each_thread(t)
> -			sum += ACCESS_ONCE(per_thread(counter, t));
> -		ACCESS_ONCE(global_count) = sum;
> +			sum += READ_ONCE(per_thread(counter, t));
> +		WRITE_ONCE(global_count, sum);
>  		poll(NULL, 0, 1);
>  		if (stopflag) {
>  			smp_mb();
> 

