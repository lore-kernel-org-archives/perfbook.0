Return-Path: <SRS0=ctHB=AD=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681258570; x=1683850570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q17ZSuTIPGKR8/EjBO7lqxq5x5FG+4wIosT8kB4R2bk=;
        b=LJyi2UwdoGY49bDtkEybk0Ul4bHV0l07FAanF7oUS6hlNS6dS20i1bj/w+2KjiVwix
         ZNms0xhp8NpveXy1VNON4PfQsfkoKuMm02OJYupnGAK8JrBEFoBGpn6e2y847RltKgKu
         qVsU0DdVYQX5+0Gmo0wYK3RSS7tKNQ5sMq6SXzIZT0Pinn7pGur/bPiPAYCq+sJB5RLu
         xKLtmh1rt0ErLHvLTDKTepdk7JS9UUMARkfZJ9dJdNr9APgaSUZBBnsRqMelzjgfg4IH
         zv1EvRBZHXLUytpiSSj9GUALZdLLnDU1Ymv1g+z1gbF71Ve6IpXumMD6mkJH6+BuuwS+
         /DKQ==
Message-ID: <ee5d3aff-58ef-85a4-ee0f-9ce8fbe7bfd8@gmail.com>
Date: Wed, 12 Apr 2023 09:16:05 +0900
MIME-Version: 1.0
Subject: Re: [PATCH] SMPDesign: Remove duplicate item
References: <20230411162805.1343469-1-mmpgouride@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230411162805.1343469-1-mmpgouride@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: Alan Huang <mmpgouride@gmail.com>
Cc: perfbook@vger.kernel.org, paulmck@kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Alan,

On Tue, 11 Apr 2023 12:28:05 -0400, Alan Huang wrote:
> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
> ---
>  SMPdesign/criteria.tex | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/SMPdesign/criteria.tex b/SMPdesign/criteria.tex
> index d3d84506..bc4d3a77 100644
> --- a/SMPdesign/criteria.tex
> +++ b/SMPdesign/criteria.tex
> @@ -145,7 +145,7 @@ parallel program.
>  	The larger the gap between the number of CPUs
>  	and the actual speedup, the less efficiently the
>  	CPUs will be used.
> -	Similarly, the greater the desired efficiency, the smaller
> +	Similarly, the greater the desired efficiency, the bigger
>  	the achievable speedup.

I might not be fully woken up, but this change doesn't make
sense to me.

>  \item	If the available synchronization primitives have
>  	high overhead compared to the critical sections
> @@ -157,11 +157,6 @@ parallel program.
>  	using asymmetric primitives
>  	(see \cref{chp:Deferred Processing}),
>  	or by using a coarse-grained design such as \IXh{code}{locking}.
> -\item	If the critical sections have high overhead compared
> -	to the primitives guarding them, the best way
> -	to improve speedup is to increase parallelism
> -	by moving to reader/writer locking, \IXh{data}{locking}, asymmetric,
> -	or data ownership.

You mean, this and the next item says the same thing?
I don't think so.

Item 4:

    If the critical sections have high overhead compared to
    the primitives guarding them, the best way to improve
                                                  ^^^^^^^
    speedup is to increase parallelism by moving to reader/writer
    ^^^^^^^
    locking, data locking, asymmetric, or data ownership.
             ^^^^^^^^^^^^^                ^^^^^^^^^^^^^^

Item 5:

    If the critical sections have high overhead compared to
    the primitives guarding them and the data structure being
                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    guarded is read much more often than modified, the best way
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    to increase parallelism is to move to reader/writer locking
    or asymmetric primitives.

Are you sure they are duplicates ???

        Thanks, Akira

>  \item	If the critical sections have high overhead compared
>  	to the primitives guarding them and the data structure
>  	being guarded is read much more often than modified,

