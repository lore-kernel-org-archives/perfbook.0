Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2XumAIEynlEbJx8RrUysGbvwjHAoEUECgmoJObp+l6c=;
        b=hH9hgJFk60aAUOaCTXLHOwNXuvvKI5ZoITZRl0oBdWYujR49E2477Q8+cwx86XxIOo
         ZHlGqDubxXzdJGcvM3vff9maSoSViSSp45o8W7kL6faS8Cx8ZR3mDf2ICfeu9QKFH7F8
         zxyYtBKceKUrObcYDN+RDjs3ibFTnw2GUrc5inRRVO0vBHBrC565LlqUGf6ege2lU1Kd
         9y0sRN8htEhYFC9DfvmDrIiaSn2Icf1kHy4mdmsU++bxHztT5ifCRnznRy5iWh69A24R
         90dxn5y8RCSQenfN+elErS71yapvuzhyeWK5DcAI+051J8ni0GNxBULfqBcoDOy57ogI
         ThaA==
MIME-Version: 1.0
References: <72e3ed43-25f8-288e-ee9e-6349de4916dc@gmail.com>
In-Reply-To: <72e3ed43-25f8-288e-ee9e-6349de4916dc@gmail.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Sun, 18 Nov 2018 08:05:13 +0800
Message-ID: <CABoNC81VxNW=4K0Dz4XSwoyiX=eRSisGyXWW_0rL37SQsVJwfg@mail.gmail.com>
Subject: Re: [PATCH] memorder: Fix typo (Figure -> Table)
Content-Type: text/plain; charset="UTF-8"
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Paul McKenney <paulmck@linux.ibm.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Sat, Nov 17, 2018 at 11:19 PM Akira Yokosawa <akiyks@gmail.com> wrote:
>
> From 57730b6cd92ed03f1f7c32defa19fc8a57586950 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 18 Nov 2018 00:17:47 +0900
> Subject: [PATCH] memorder: Fix typo (Figure -> Table)
>
> "Summary of Memory Ordering" referred from the footnote added in
> commit efc3ce7e8d5d ("memorder: Add a brief description of the use
> of multicopy atomicity") is actually a table. Fix it.
>
> Cc: Junchang Wang <junchangwang@gmail.com>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  memorder/memorder.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 69ce196..943c3af 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -1905,7 +1905,7 @@ CPUs agree on the order of all stores.\footnote{
>         As of late 2018, ARMv8 and x86 provide other-multicopy atomicity,
>         IBM mainframe provides fully multicopy atomicity, and PPC does
>         not provide multicopy atomicity at all. More detail is shown in
> -       Figure~\ref{tab:memorder:Summary of Memory Ordering}.}
> +       Table~\ref{tab:memorder:Summary of Memory Ordering}.}

Indeed! That's my fault. Thanks, Akira!

--Junchang

>  This means that if only a subset of CPUs are doing stores, the
>  other CPUs will agree on the order of stores, hence the ``other''
>  in ``other-multicopy atomicity''.
> --
> 2.7.4
>

