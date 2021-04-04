Return-Path: <SRS0=kQd0=JB=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=If/vqLc7IM7uyCsi4lJLWS9FyKgxQJuofeFm1uMvLVQ=;
        b=ISIEdB6g48cl9GIJZepzKO8V+aj0Tj9p56PksJfBopEBECe0RG5sdvwfjz2ynKw5Sc
         F1m/e+n9q1dmhEflSYCJ+JOwG0DRH2f2rzB8IzEAr3/xRPZ5qc2EeK006HS5AqKtMgt5
         4EHrTpfrLOQLft3VAb8DABvMfVrt7/AFamNzacAI+vgXe1ekGouiwWj3vp4aBpauVCgk
         LIeUhXaoQbLIcXDiqjVz4Q2Op9LKgFk0kZkYpuwaLiSH1Di/Xe1T3dgZvHJFa0JaLlGT
         uSnRTtSLtnZKuab5eRWTjHt0zrFfSWLVtINnuyEOLV6Eq3/EFJTOVe/pumpAGd43bfO2
         T1nQ==
Subject: Re: [PATCH v3 1/4] howto: Use '\cref' and '\Cref' consistently
References: <20210404111044.27774-1-sj38.park@gmail.com>
 <20210404111044.27774-2-sj38.park@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6380a2ed-086a-eeb2-4851-15915ee1b8c4@gmail.com>
Date: Sun, 4 Apr 2021 20:29:18 +0900
MIME-Version: 1.0
In-Reply-To: <20210404111044.27774-2-sj38.park@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: SeongJae Park <sj38.park@gmail.com>, paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Sun, 4 Apr 2021 13:10:41 +0200, SeongJae Park wrote:
> This commit replaces 'Chapter~\ref', 'Listing~\ref', and 'Appendix~\ref'
> with smart alternatives, '\cref' and '\Cref'.
> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> ---
>  howto/howto.tex | 52 ++++++++++++++++++++++++-------------------------
>  1 file changed, 26 insertions(+), 26 deletions(-)
> 

Looks good to me!

Acked-by: Akira Yokosawa <akiyks@gmail.com>

        Thanks, Akira

> diff --git a/howto/howto.tex b/howto/howto.tex
> index 7de1dbd9..b60e3a9a 100644
> --- a/howto/howto.tex
> +++ b/howto/howto.tex
> @@ -56,22 +56,22 @@ that it has brought to us!
>  This book is a handbook of widely applicable and heavily
>  used design techniques, rather than
>  a collection of optimal algorithms with tiny areas of applicability.
> -You are currently reading Chapter~\ref{chp:How To Use This Book}, but
> +You are currently reading \cref{chp:How To Use This Book}, but
>  you knew that already.
> -Chapter~\ref{chp:Introduction} gives a high-level overview of parallel
> +\Cref{chp:Introduction} gives a high-level overview of parallel
>  programming.
>  

[...]
