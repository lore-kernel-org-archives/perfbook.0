Return-Path: <SRS0=8VNs=44=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GINhvIRSngG6y10qvZ6fHRql/TctgjnTn51mNDjUMoA=;
        b=cC5fIJpdWBYzCCBR+a7A5YJo8UXfU2axVzSpkSxXc9D2+MG+QQedX/ya4b21vavUee
         arKz7aKF6xYHuIZ9rufdd9L5A/cZmMFyIpkqTZ9nyqDsI7AqPYCU36zoKiWTWbfGk+6F
         cnB9IAOdc98nWIhMgBGQuT773NJa9oQdEy5tBYU7dSFw82HTL2ZpE2fkn3fkKhAe/1ow
         6sBD9Vy4cXeeF/f4zeJ5doGzyH3uT95oWFLyPx55rfKdN5ILZWBsMgXCVy95ek0vRu1+
         v+mGj8HjjmSq12/YXycNG8MwaE18aFYUMVcA0T0shr3llqWxPhq7ofCHxFkyaPd0vtJy
         fh6A==
Subject: Re: [PATCH 2/2] cpu/overheads: Typo fixes and wording improvement
References: <db66a177-0ae2-14a2-0ec7-854531a2a62a@gmail.com>
 <77c7810f-4a8d-811d-eddb-8fff92dafe65@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6a95f31e-facf-b856-3bea-0aaa44fc381b@gmail.com>
Date: Thu, 12 Mar 2020 00:31:45 +0900
MIME-Version: 1.0
In-Reply-To: <77c7810f-4a8d-811d-eddb-8fff92dafe65@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Wed, 11 Mar 2020 20:49:10 +0900, Akira Yokosawa wrote:
> From 9256445a646099df48b3f6af7ad232dd228f3039 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 10 Mar 2020 22:12:45 +0900
> Subject: [PATCH 2/2] cpu/overheads: Typo fixes and wording improvement
> 
> Also flag suspicious raws in Table E.1 as comments.

Obvious typo:
                   ... rows ...
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> Think of this as a reminder rather than a patch to be applied as is.

So I'm not submitting v2 of this one.

        Thanks, Akira

> Updated Table E.1 looks inconsistent to me.
> 
>         Thanks, Akira
> --
>  cpu/overheads.tex | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/cpu/overheads.tex b/cpu/overheads.tex
> index d1b4f596..e5ea0803 100644
> --- a/cpu/overheads.tex
> +++ b/cpu/overheads.tex
> @@ -189,7 +189,7 @@ atomic operations on the lock data structure, one for acquisition and
>  the other for release.
>  
>  In-core operations involving interactions between the hardware threads
> -sharing a single core are about the same cost and same-CPU operations.
> +sharing a single core are about the same cost as same-CPU operations.
>  This should not be too surprising, given that these two hardware threads
>  also share the full cache hierarchy.
>  CAS stands for an atomic compare-and-swap operation, where the hardware
> @@ -198,9 +198,9 @@ compares the contents of the specified memory location to a specified
>  in which case the CAS operation is said to have succeeded.
>  If they compare unequal, the memory location keeps its (unexpected) value,
>  and the CAS operation is said to have failed.
> -The operation is atomic is that the hardware guarantees that the memory
> +The operation is atomic in that the hardware guarantees that the memory
>  location will not be changed between the compare and the store.
> -CAS functionality is provided by the x86 \co{lock;cmpxchg} instruction.
> +CAS functionality is provided by the \co{lock;cmpxchg} instruction on x86.
>  
>  In the case of the blind CAS, the software specifies the old value
>  without looking at the memory location.
> @@ -317,15 +317,15 @@ thousand clock cycles.
>  	Clock period		&           0.4	&           1.0 \\
>  	Same-CPU CAS		&          12.2	&          33.8 \\
>  	Same-CPU lock		&          25.6	&          71.2 \\
> -	Blind CAS		&          12.9	&          35.8 \\
> -	CAS			&           7.0	&          19.4 \\
> +	Blind CAS		&          12.9	&          35.8 \\ % CAS?
> +	CAS			&           7.0	&          19.4 \\ % Blind CAS?
>  	\midrule
>  	Off-Core		&		&		\\
> -	Blind CAS		&          31.2	&          86.6 \\
> +	Blind CAS		&          31.2	&          86.6 \\ % Realy Blind?
>  	CAS			&          31.2	&          86.5 \\
>  	\midrule
>  	Off-Socket		&		&		\\
> -	Blind CAS		&          92.4	&         256.7 \\
> +	Blind CAS		&          92.4	&         256.7 \\ % Realy Blind?
>  	CAS			&          95.9	&         266.4 \\
>  	\midrule
>  	Off-System		&		&		\\
> 
