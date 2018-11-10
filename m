Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TLHesxiTj8tN9rUenvX++0LkW6TiJuDI5jL+05RCdQI=;
        b=X4TPM+IP6RuxTcsphJ62+E0lGmwh5PSrbuRBNDgoRPiKyKLI/xlasGByBoN2Zi7RHj
         Fcc6+f5CBQNqRgH+VM6hLGr2+BrtlejG+9AxxPrr1jieZB5sdmbVsY2Se+VQcErPyDqO
         dgOTNRGBI05BF01qq9mbrakhhFX0lik9kXpJVY+epcrRXLtZYZ9JVWBAn/O7Em1r3iO6
         s9db0hLdxiM+IPEY7/HmA2noCC2EPMQFq0W6szkvHTtyqkrSHXD75scHXXubnbKd1ZQM
         hI4ZMfR8/gEf6+jblzZlQ6k9e+QZI//bv247ulFPs+7VmkCeZXqf6kmeJDLopch3Xals
         yq6A==
Subject: Re: [PATCH] tooloftrade: add missing subject of sentence
References: <1541854198-4649-1-git-send-email-junchangwang@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5497b7b6-b5cd-aae0-034f-02f6a7262737@gmail.com>
Date: Sun, 11 Nov 2018 08:55:12 +0900
MIME-Version: 1.0
In-Reply-To: <1541854198-4649-1-git-send-email-junchangwang@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Junchang Wang <junchangwang@gmail.com>, "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/11/10 20:49:58 +0800, Junchang Wang wrote:
> Signed-off-by: Junchang Wang <junchangwang@gmail.com>
> ---
> Hi Paul,
> 
> This is the only patch for Chapter Tools of Trade. Please take a look.
> 
> 
> Thanks,
> --Junchang
> 
> --
>  toolsoftrade/toolsoftrade.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> index 0844b4c..b4bc46a 100644
> --- a/toolsoftrade/toolsoftrade.tex
> +++ b/toolsoftrade/toolsoftrade.tex
> @@ -2043,8 +2043,8 @@ machine-sized and properly aligned.
>  It can also prevent load fusing, store fusing, invented loads, and
>  invented stores.
>  However, although it does prevent the compiler from reordering \co{volatile}
> -accesses with each other, does nothing to prevent the CPU from reordering
> -these accesses.
> +accesses with each other, \co{volatile} keyword does nothing to prevent the
> +CPU from reordering these accesses.

In this context, I think

+accesses with each other, it does nothing to prevent the CPU from reordering
 these accesses.

should be good enough.

        Thanks, Akira

>  Furthermore, it does nothing to prevent either compiler or CPU from
>  reordering non-\co{volatile} accesses with each other or with
>  \co{volatile} accesses.
> 

