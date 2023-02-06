Return-Path: <SRS0=8Upf=6C=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GVxReyZfr1SOQFNd6pj70eiDPh6tnt0vwo2XAkh8bgc=;
        b=o6PuqqD2cqfQPjd+rPsi2QpuR6+gJpwwBK3YwkX2RA2rP1GamFDwV3hfJd1Ze2zdwr
         +YW27fJDYi1uCDbHhIf2S9+O/l1itJRh1wyHY8bf9HPz80T4TcqvhUVJzc8sMNHaswOg
         3fyj1KD3ETt7YHzAylHHmeSKxdb09hfJQ1mjHzGLPqoS3RNgNIz8cemvzxpDINZ6PbLg
         GZpAo6NHfoH8M4bUcpV7iA8V6tMCXv+IZGP0oEq8U6+beL+RcEsGtjZXFTr+VlJEtzuo
         2lkPjq2bdtHxQuY0TR+qIfjgP+WM+a84Z59dU+k38BFf4nGEB/m59ZUlV+qNwGtMuQk0
         fqKw==
Message-ID: <e75a1d50-704f-d2fc-2e2f-3644ddcd27fd@gmail.com>
Date: Mon, 6 Feb 2023 11:38:58 +0900
MIME-Version: 1.0
Subject: Re: [PATCH 2/5] debugging: Use \co{} for 'git' and 'Fixes:'
Content-Language: en-US
References: <20230205182128.19044-1-sj@kernel.org>
 <20230205182128.19044-3-sj@kernel.org>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230205182128.19044-3-sj@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: SeongJae Park <sj@kernel.org>, paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sun,  5 Feb 2023 10:21:25 -0800, SeongJae Park wrote:
> From: SeongJae Park <sj38.park@gmail.com>
> 
> In 'debugging/', 'git' is a command and 'Fixes:' is a string in command
> output, which usually enclosed via '\co{}', but those are enclosed with
> '\emph{}'.  Use '\co{}' instead for being more consistent.
> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> ---
>  debugging/debugging.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/debugging/debugging.tex b/debugging/debugging.tex
> index 3104bb95..3ce74469 100644
> --- a/debugging/debugging.tex
> +++ b/debugging/debugging.tex
> @@ -862,8 +862,8 @@ by the author's invalid assumptions, and who might also test the code.
>  	hackers of harboring???
>  }\QuickQuizAnswer{
>  	Those wishing a complete answer to this question are encouraged
> -	to search the Linux kernel \emph{git} repository for commits

I often see "Linux kernel git repository" everywhere, and in this case,
I suppose emphasizing "git" was the author's intention. Paul might have
a different opinion, though.

> -	containing the string ``Fixes:''.
> +	to search the Linux kernel \co{git} repository for commits
> +	containing the string \co{Fixes:}.

As this is mentioned as a "string", \qco{} might be a better choice.

        Thanks, Akra

>  	There were many thousands of them just in the year 2020, including
>  	fixes for the following invalid assumptions:
>  
