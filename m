Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=RvhOma1Ctv/2l7Rbhk6xT4ULWF6Tl+Epsc32GmTrnRc=;
 b=xMs7tqRVb8IGjBVwznUYfdEmOVqMQHC5IWcsus8gyYOk6pDCurL1biLdImXusqJn2n
 UHZsOuHIrPXn+bD9m7JdHELIvxEhKP2Fij/N3lt4OYvnVUUMcj6R/QXGJv9xBRxDeDoI
 ilynRjopqhdV7Ceu96cclejTFaRgSgrxun2hbTdm1qPymCzynAW0/wjWHqFNqkX9i7uy
 006drw7oFNTeOFY9XbZXqkHDPhGfVQhTTu8C/DGK6hGShMBCg1/qshZ6esHoUfL5xx8Y
 jMchzGTaB/fVnJ5XhbGijbzIMZOG75dqOEA2lurRLHc/SLrqA5DQ9wSbgyq0LOpxpzDs
 VJlA==
Subject: Re: [PATCH] .gitignore: Add planned empty targets
References: <37282858-f590-1eed-457e-7f825634ee9d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <9f3461a6-7257-1c4c-68f5-fb66644992e4@gmail.com>
Date: Wed, 4 May 2016 08:10:53 +0900
MIME-Version: 1.0
In-Reply-To: <37282858-f590-1eed-457e-7f825634ee9d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/05/04 8:06, Akira Yokosawa wrote:
>>From f0be4630d38992d2f247678914c208113c437509 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiysw@gmail.com>
> Date: Wed, 4 May 2016 07:38:30 +0900
> Subject: [PATCH] .gitignore: Add planned empty targets
> 
> This change will prevent "git status" from complaining when you
> switch from a planned test branch to other branches.
> Note: Target names 'extraction' and 'embedfonts' are now denoted
> as phony targets on the master branch. Therefore, it is safe to
> change them to empty targets of the same names on the planned test
> branch.
> 
> Signed-off-by: Akira Yokosawa <akiysw@gmail.com>
> ---
>  .gitignore | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/.gitignore b/.gitignore
> index 39fd69d..18b3d63 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -25,6 +25,12 @@ perfbook-1c.tex
>  perfbook-1c.out
>  perfbook-hb.tex
>  perfbook-hb.out
> +qqz_first
> +perfbook_aux
> +perfbook-1c_aux
> +perfbook-hb_aux
> +extraction
> +embedfonts
>  
>  RCS
>  
> 

Hi,
I also want this one to be pulled before I start working on
v2 of "Another round of build script tweaks" series.

                                         Thanks, Akira

