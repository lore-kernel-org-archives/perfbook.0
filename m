Return-Path: <SRS0=6f8h=AU=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682806855; x=1685398855;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KVZ6RdFpP0uHybqCJfsPD9fHwPVE1FYp6L8s0+4yh0A=;
        b=aJ0tPSeKHuyxmlir1J0gjWGXHygEw1/0bbmYy3Q60L+BoaPacWcp0po3yb01FUOb0l
         v/hR3jSqzFE+uIgAwvI4+M0WQX1HkJXsJb4KwSRfaTsBf84fXg9/6FB5XLpXmHc1x8HY
         JuucqPLk7QMayOIOdz4IyX8NLJLyRGOmCMJNK0dXq4/lhAJvuniT7P26/0QGy1UuZWOo
         0QOkXXxX/81MoYKwsgrnndPGv7ZXWbrocrzxArFXuyZzxQn4ZBvVyNdCu6Xz8p6UHk5O
         9iIGTloJHhqosTZufBO8G90odtHV7eV5XKSz+yknrQ6aGxpNIaYOW6PBlcCigCwRY2nI
         SIgg==
Message-ID: <cf2f6f7e-b5cd-02eb-9c67-9ef9c1778e7b@gmail.com>
Date: Sun, 30 Apr 2023 07:20:48 +0900
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] together/refcnt: Use \tco{} for code quoting
References: <20230429170226.3640-1-sj@kernel.org>
 <20230429170226.3640-2-sj@kernel.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230429170226.3640-2-sj@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: SeongJae Park <sj@kernel.org>, paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi,

On Sat, 29 Apr 2023 10:02:25 -0700, SeongJae Park wrote:
> From: SeongJae Park <sj38.park@gmail.com>
> 
> Some sentences in refcnt.tex is using only quote for some code words.
> Use \tco{} instead, as it is intended to be used for the case.

\tco{} doesn't put quotes around it.
Didn't you mean \qco{} ?

        Thanks, Akira

> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> ---
>  together/refcnt.tex | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/together/refcnt.tex b/together/refcnt.tex
> index 56caed67..4abe1c60 100644
> --- a/together/refcnt.tex
> +++ b/together/refcnt.tex
> @@ -467,15 +467,15 @@ as shown below.
>  
>  \QuickQuiz{
>  	Why can't the check for a zero reference count be
> -	made in a simple ``if'' statement with an atomic
> -	increment in its ``then'' clause?
> +	made in a simple \tco{if} statement with an atomic
> +	increment in its \tco{then} clause?
>  }\QuickQuizAnswer{
> -	Suppose that the ``if'' condition completed, finding
> +	Suppose that the \tco{if} condition completed, finding
>  	the reference counter value equal to one.
>  	Suppose that a release operation executes, decrementing
>  	the reference counter to zero and therefore starting
>  	cleanup operations.
> -	But now the ``then'' clause can increment the counter
> +	But now the \tco{then} clause can increment the counter
>  	back to a value of one, allowing the object to be
>  	used after it has been cleaned up.
>  
