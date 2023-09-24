Return-Path: <SRS0=Vo2u=FI=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695513777; x=1696118577; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9HiZC+S6AaLKi8RSX0sMizDncSx1vM0yQf6hpfX/v3s=;
        b=HmTqFk2/RM2vvxnBTR6OsI/gO2VbyDKY35fhe021g0fg7YoGMq5A9knkO0wMzkT2u+
         OUjyRSRrlS5tE7IKtmglj7B2jHHKQsi47cLfDpZ1z16WFXT9q9UPhtx48IuIMnrZ/d4b
         PKZtYL5rSL+8w9bvVGPOtvC5o19Bf/TuluAuNyDrvbGLKRA76lwRLJbwAfqb2RPHSmVg
         NDynAn2TxbVaoSDpzVWT40Pr8Wx1aRKNj1H3/DdoAf163viqviLuXVyn1klUupViD416
         O2lN/KRXvudX92tmIO+yf3jlxR5Uv9JNAHrk8brSMZdos1sffignXihzGl2DrjYWmBJn
         1MBg==
Message-ID: <9783529e-b974-8f64-c2f0-4fc52b04746e@gmail.com>
Date: Sun, 24 Sep 2023 09:02:53 +0900
MIME-Version: 1.0
Subject: Re: [PATCH 10/10] memorder: Fix wrong primitive names in a quick
 quizz
References: <20230923163204.14558-1-sj@kernel.org>
 <20230923163204.14558-11-sj@kernel.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230923163204.14558-11-sj@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: SeongJae Park <sj@kernel.org>, paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi,

On 2023/09/24 1:32, SeongJae Park wrote:
> From: SeongJae Park <sj38.park@gmail.com>
> 
> memorder.tex explains READ_ONCE() is having smp_mb(), but the following
> quick quizz asks why it has mb() instead of rmb().  Fix the wrong names
> in the quick quizz.
> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> ---
>  memorder/memorder.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 5c978fbe..b3acc14a 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -5491,7 +5491,7 @@ Alpha is the only CPU whose \co{READ_ONCE()} includes an \co{smp_mb()}.
>  \QuickQuizSeries{%
>  \QuickQuizB{
>  	Why does Alpha's \co{READ_ONCE()} include an
> -	\co{mb()} rather than \co{rmb()}?
> +	\co{smp_mb()} rather than \co{smp_rmb()}?

Definition in Linux kernel's arch/alpha/include/asm/rwonce.h reads:

#define __READ_ONCE(x)							\
({									\
	__unqual_scalar_typeof(x) __x =					\
		(*(volatile typeof(__x) *)(&(x)));			\
	mb();								\
	(typeof(x))__x;							\
})

So I don't think this change is needed.

As this quiz is talking about Alpha ISA, how about rewording the
quiz to:

    Why does Alpha's \co{READ_ONCE()} include an
    \co{mb} instruction rather than a \co{rmb}?

        Thanks, Akira

>  }\QuickQuizAnswerB{
>  	Alpha has only \co{mb} and \co{wmb} instructions,
>  	so \co{smp_rmb()} would be implemented by the Alpha \co{mb}
> -- 
> 2.17.1



