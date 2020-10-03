Return-Path: <SRS0=fk0E=DK=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZNsB9nds+VI8Z5E47NufpV6LSUJ/ywlLmlJcJB0sd30=;
        b=JaidKZi2jShWo7/r98TkdI/jvzP9bIYMzCjIVddCm7T5hL1E88Ay4blOSLmudRya1X
         L/DHWTQUFeNo9LZ3VmMSaGfF1YF7Ripkq7LTzww5jJzWrDCPNm//yrt7GQtSxzreNQGg
         bl7bQCmlstocGtEPcetztDCi5ZLv/zpOIyAoq1JEXGyG8/s21GBptqUhvJQBytZk1vwZ
         6NECLT6CubF19JxhIeHUisIVniNX1nEkMW8wjOS9bERNjIr8241ZG1Z1vLyUyHdVgYZX
         xBiG9Ae29FMQLb0xi0yivLwNMX3eueFhtiFzM37ALUZr/I5jNNMJIjfjI7Mka58/+pb2
         jmvw==
Subject: Re: [PATCH] api-gcc.h: fix typos in the functions atomic_add_*
References: <20200929084006.GA31703@HongKong.localdomain>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <d634acb5-f4b4-4e76-fecf-91a0ca541e79@gmail.com>
Date: Sat, 3 Oct 2020 11:24:52 +0900
MIME-Version: 1.0
In-Reply-To: <20200929084006.GA31703@HongKong.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Junchang Wang <junchang2020@gmail.com>, paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Junchang,

On Tue, 29 Sep 2020 16:40:06 +0800, Junchang Wang wrote:
> The typo in atomic_add_return() incurs tricky bugs. For example, the current
> atomic_dec_return() is indeed an atomic_add_return(). A similar typo appears
> in the function atomic_add_negative().

Nice catches!

You mean the current atomic_add_return(), atomic_sub_return(), and
atomic_dec_return() actually are atomic_inc_return(), don't you?

I wondered if these typos have affected code under CodeSamples.

Looks like atomic_add_negative(), atomic_add_return(), and
atomic_dec_return() are defined in api-gcc.h, but not used in anywhere
under CodeSamples.

On the other hand, atomic_sub_return() is used in SMPdesign/lockrwdeq.c.

./SMPdesign/lockrwdeq.c:100:	if (atomic_sub_return(2, &d->counter) < 1) {
./SMPdesign/lockrwdeq.c:116:	if (atomic_sub_return(2, &d->counter) < 1) {
./SMPdesign/lockrwdeq.c:131:	if (atomic_sub_return(1, &d->counter) < 1) {
./SMPdesign/lockrwdeq.c:143:	if (atomic_sub_return(1, &d->counter) < 1) {

All of them are actually atomic_inc_return(&d->counter)s!

Building lockrwdeq and running it at current master sometimes segfaults or deadlocks.

Applying Junchang's patch makes it much stable.
I've never looked into lockrqdeq.c (because it is not cited from perfbook text)
and don't have any clue.

Paul, what is your expectation of lockrwdeq's behavior?

        Thanks, Akira

> 
> Signed-off-by: Junchang Wang <junchang2020@gmail.com>
> ---
>  CodeSamples/api-pthreads/api-gcc.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/CodeSamples/api-pthreads/api-gcc.h b/CodeSamples/api-pthreads/api-gcc.h
> index fbbedf2..9ad8a68 100644
> --- a/CodeSamples/api-pthreads/api-gcc.h
> +++ b/CodeSamples/api-pthreads/api-gcc.h
> @@ -140,7 +140,7 @@ static __inline__ int atomic_inc_and_test(atomic_t *v)
>   */
>  static __inline__ int atomic_add_negative(int i, atomic_t *v)
>  {
> -	return __atomic_add_fetch(&v->counter, 1, __ATOMIC_SEQ_CST) < 0;
> +	return __atomic_add_fetch(&v->counter, i, __ATOMIC_SEQ_CST) < 0;
>  }
>  
>  /**
> @@ -152,7 +152,7 @@ static __inline__ int atomic_add_negative(int i, atomic_t *v)
>   */
>  static __inline__ int atomic_add_return(int i, atomic_t *v)
>  {
> -	return __atomic_add_fetch(&v->counter, 1, __ATOMIC_SEQ_CST);
> +	return __atomic_add_fetch(&v->counter, i, __ATOMIC_SEQ_CST);
>  }
>  
>  static __inline__ int atomic_sub_return(int i, atomic_t *v)
> 
