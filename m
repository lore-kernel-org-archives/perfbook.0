Return-Path: <SRS0=8Upf=6C=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gwWW+V0ndWJPnkTeNoIcT2nf+bswyLEDpwt87oAetRw=;
        b=LfrWXAHheqdhhGxaCv9GcYEDTDFyhDWRQYVGF5dZkNcHWd6AQile/k6nWCBW0wAvSS
         prd7uv74COLxRUPywOjwPAcfCzgfzCZ+l228B6zSCREgbjz6Ci4ijAgFvsKjtY3r3wWb
         xOeRSjezWy3ZTkIiQiDrjYXSd1WGpgYbsEgXnqsEboocs/AH7WxpQHiCGCq4CndUfDde
         cxoN0hTsUoYUN213Q4rMhWqpHXGO7wlW84xR0YOYsejLLN5fD8kSzBh3rsf3zfB83x+T
         r/UX3DuXG4YntG8dMwDvsvr5a5ohAct0RG1p0LNp2djMvWuOOonLTWtMMEb2zd24/T3m
         00fQ==
Message-ID: <8e71d5af-7da0-29ce-977a-531800616d68@gmail.com>
Date: Mon, 6 Feb 2023 11:53:54 +0900
MIME-Version: 1.0
Subject: Re: [PATCH 4/5] debugging: Remove unnecessary space in a sentence
Content-Language: en-US
References: <20230205182128.19044-1-sj@kernel.org>
 <20230205182128.19044-5-sj@kernel.org>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230205182128.19044-5-sj@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: SeongJae Park <sj@kernel.org>, paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Date:   Sun,  5 Feb 2023 10:21:27 -0800, SeongJae Park wrote:
> From: SeongJae Park <sj38.park@gmail.com>
> 
> Two spaces are usually used between sentences, but a sentence in
> debugging is using two spaces inside a sentence.  Make it uses only one
> space for consistency.

FWIW, in perfbook's .tex source files, sentence ending periods must
be at the end of lines. Violation to this rule is flagged by
"make punctcheck" now a days.

        Thanks, Akira

> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> ---
>  debugging/debugging.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/debugging/debugging.tex b/debugging/debugging.tex
> index 1903c5db..53c7fb94 100644
> --- a/debugging/debugging.tex
> +++ b/debugging/debugging.tex
> @@ -2153,7 +2153,7 @@ serve four major purposes:
>  	against your competitors' offerings.
>  \end{enumerate}
>  
> -Of course,  the only completely fair framework is the intended
> +Of course, the only completely fair framework is the intended
>  application itself.
>  So why would anyone who cared about fairness in benchmarking
>  bother creating imperfect benchmarks rather than simply
