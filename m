Return-Path: <SRS0=c7w1=4Y=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FDfhSnq3A/TxDJinTIZcK1IiNBouYRN8GY5Qv91NA9A=;
        b=DTLRk/wlxGnHlmljLQva2JdRd/C7iHuy68ix1qHmF+QSSkSxtIc9HLJL/rDBk97Cgi
         i8es/xUZXJ9DnyDPqV1FDa8yssPPqwuKhJ/xWxgeAokQfoJOoifkbJrVVdA6r1YizE7D
         laRn360jzdtt74b2lPxoXNkW/LHote0AfqwETG0r74OCXdZeRU0pGxX0hRU2/HEvb9Yj
         cKK2Nghm0iZpTglQxxF8b1DpICH4AN8ImgLCdYNsT8JPo6v7kDIf+3Al10cAQxMD/Ff1
         eScyyTDrOCAXsXIupqB5VBjMxJX8DBOL07olk9Cbu4ahkOCWd735gmBMCrnJaQZ606pR
         3JVA==
Message-ID: <c85aa561-e046-b666-bce2-42c5648822d5@gmail.com>
Date: Tue, 27 Dec 2022 08:41:10 +0900
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] datastruct: Add missed unbreakable spaces
References: <20221226181639.10795-1-sj@kernel.org>
 <20221226181639.10795-3-sj@kernel.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20221226181639.10795-3-sj@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: SeongJae Park <sj@kernel.org>, paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi,

On Mon, 26 Dec 2022 10:16:32 -0800, SeongJae Park wrote:
> From: SeongJae Park <sj38.park@gmail.com>
> 
> Add missing unbreakable spaces for 'CPUs' and 'elements'.
> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> ---
>  datastruct/datastruct.tex | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
> index 99c92d9a..40ea6995 100644
> --- a/datastruct/datastruct.tex
> +++ b/datastruct/datastruct.tex
[...]
> @@ -775,8 +775,8 @@ to about half again faster than that of either QSBR or RCU\@.
>  
>  	Still unconvinced?
>  	Then look at the log-log plot in
> -	\cref{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schr\"odinger's Zoo at 448 CPUs; Varying Table Size},
> -	which shows performance for 448 CPUs as a function of the
> +	\cref{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schr\"odinger's Zoo at 448~CPUs; Varying Table Size},
> +	which shows performance for 448~CPUs as a function of the
>  	hash-table size, that is, number of buckets and maximum number
>  	of elements.
>  	A hash-table of size 1,024 has 1,024~buckets and contains

This hunk caused an error for me.

-----
l.6047 ...r's Zoo at 448~CPUs; Varying Table Size}
                                                  ,
? 
! Emergency stop.
<to be read again> 
                   \protect 
l.6047 ...r's Zoo at 448~CPUs; Varying Table Size}
                                                  ,
End of file on the terminal!
-----

Please remove the unbreakable space in \cref{}.

        Thanks, Akira

[...]

