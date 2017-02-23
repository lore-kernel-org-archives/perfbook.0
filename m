Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=gyJn2HG7ag0yKB6YA1nL7rB8RuQ9TYS3PaUnRvsnzOM=;
 b=LFgKjEO5buID07tbxqW0hhhlJX3IXd/7raLT9nSjPb8p/ocqzDCnEFutn4RWHQV4Vd
 qzMbqFqTRcJXvU1A4mcgy9yF2Eb2XFH+Xn33XiRZXkETD4u+AeUL4OTaFfIsHQui1bh9
 5YUMN4pNsiSCQamdIkiPYD3OK8tX+iF/vgcWg+6A3js7pAOXuQAOew6WsauumqW+7BqU
 uv5i/aPhJ2SlHweeOc2PQ1mkxnGAPb+eOiPuHRJjARl86KbEn+i8U3HNnybn6pZpIjbs
 D0k7ZZL+WzGkoOeOE5CyZWh34EU1/OzAQ8C4JwWFiWdatp1gLynsJkp0kKX5cAd89aD1
 fLHA==
Subject: Re: [PATCH] bib/syncrefs: Use consistent date format
References: <20170222152806.2313-1-sj38.park@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <984d694b-b448-e7e6-b67a-33668de5a5ba@gmail.com>
Date: Thu, 23 Feb 2017 21:49:50 +0900
MIME-Version: 1.0
In-Reply-To: <20170222152806.2313-1-sj38.park@gmail.com>
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
To: SeongJae Park <sj38.park@gmail.com>, paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On 2017/02/23 00:28:06 +0900 SeongJae Park wrote:
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> ---
>  bib/syncrefs.bib | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Thanks!

Acked-by: Akira Yokosawa <akiyks@gmail.com>

> diff --git a/bib/syncrefs.bib b/bib/syncrefs.bib
> index c702ac577774..f3495e1bc5d1 100644
> --- a/bib/syncrefs.bib
> +++ b/bib/syncrefs.bib
> @@ -1275,7 +1275,7 @@ Simple Locks in a Multiprocessor System"
>  ,number="6,842,809"
>  ,month="January"
>  ,url="https://www.google.com/patents/US6842809"
> -,lastchecked="December 07, 2016"
> +,lastchecked="December 7, 2016"
>  }
>  
>  @inproceedings{YossiLev2009SNZIrwlock
> 

