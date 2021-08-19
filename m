Return-Path: <SRS0=KBDY=NK=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=ZH9kxZK6vMMpOScvHrMEFVPS/BNP+s6BWT4wrQVSoVs=;
        b=OSWrJlZ4g/gJEYzEPBRa8OQk3AqJ9C71K6V7tjK2NHKSf6SS+l4VIHW2Yy2TGCFpSw
         0O5fXyeNhlEOUnsc+G2UKrw/yCmo5sUCh59qKIoWdsm3rJBADx2WyNx1dg1T7905xWVU
         Nhl3mZwYM58EiCFgf5JxQRPbtuj0LqCLqLfJ+1m1AZoaMuMHzAm3KMT9UWunVJ9dd6pY
         a/hzmATPMhH6Us3LNJnSH937eByey3ve90EbQpcFt1RVSdcRUYJxVbBbPt4U+6V6g2g+
         lnB5K6Tw1fZ1zFw76IIw42SSa90DGSvwLI5s194JMI/EwV1U4/qRogP4aMF5xCaGF8V0
         Y4sA==
Subject: Re: [PATCH-perfbook] Fix a little grammar mistake
References: <1629359518-3861-1-git-send-email-zhouzhouyi@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <031ce7cf-750e-7a2d-f2ba-5e7b661df2c2@gmail.com>
Date: Thu, 19 Aug 2021 19:54:30 +0900
MIME-Version: 1.0
In-Reply-To: <1629359518-3861-1-git-send-email-zhouzhouyi@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Zhouyi Zhou <zhouzhouyi@gmail.com>, paulmck@kernel.org, perfbook@vger.kernel.org, luyang.co@gmail.com, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hello Zhouyi,

On Thu, 19 Aug 2021 15:51:58 +0800, Zhouyi Zhou wrote:
> Hi Paul,
> 
> I think there is a little grammer mistake in answer to quick quiz 10.8,
> I am not so sure because my English is not so well ;-)
> 
> Thanks
> Zhouyi
> 
> Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> ---
>  datastruct/datastruct.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
> index adb102d..68341f2 100644
> --- a/datastruct/datastruct.tex
> +++ b/datastruct/datastruct.tex
> @@ -963,1 +963,1 @@ not recommended for production use.
>  	In theory, it isn't any safer, and a useful exercise would be
> 	to run these programs on larger systems.
>  	In practice, there are a lot more systems with more than 28~CPUs
> -	than there are systems with more than 448 CPUs.

This can be parsed as follows:

    In practice, there are a lot more X than there are Y.

, where

    X: systems with more than 28~CPUs
    Y: systems with more than 448 CPUs

So there is no grammatical error here.
Three uses of "than" in a sentence might be confusing, though.

Paul might have an idea of a less-confusing sentence.

        Thanks, Akira 

> +	are systems with more than 448 CPUs.
>  	In addition, other testing has shown that RCU read-side primitives
>  	offer consistent performance and scalability up to at least 1024 CPUs.
>  }\QuickQuizEnd
> 
