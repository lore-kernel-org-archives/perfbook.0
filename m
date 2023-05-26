Return-Path: <SRS0=Z4VS=BP=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685108937; x=1687700937;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MevsHnND2sCvYbGOW2Kklx2GJAsQOMp7yej/1TkmFyc=;
        b=onZQExBVFFnjlBddJA2IXgn5kj1TbAJxQYibhoTkb4arEwecMp9aXVqORP44oX4IfF
         NupqOApATv4q6PznhUa9lhMgNGrYf56Pu9hKtzLCxiX8RBAAYpMDMSyPRouSITT2ZoOg
         +MA0CySWw2eC7Vyqw5fRH+MIT+T94y8EQ3PUhmk25TvdQyYJW85+LiRwDacVgHzZo5py
         ij5S3eUphhuWM1NOpCjKJO/KbFZrSmMMSP1gqEt11M5f/K6t60sUVhmcBX2bLAajoZN0
         m+EIqaj17sVZmx3PlA/adVOzWQqdDx7ZHacRBHdNaU4Pcvc9A0WA/9IW+FAa0W/ZZxpW
         WFpQ==
Message-ID: <8712984b-8cf9-8cfe-c5f5-fa1ff9d726de@gmail.com>
Date: Fri, 26 May 2023 22:48:49 +0900
MIME-Version: 1.0
Subject: Re: [PATCH] formal: Fix references
References: <20230521162417.3751-1-mmpgouride@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230521162417.3751-1-mmpgouride@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Alan Huang <mmpgouride@gmail.com>, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

On 2023/05/22 1:24, Alan Huang wrote:
> The two references are misplaced, this patch fixes that.
> 
> Signed-off-by: Alan Huang <mmpgouride@gmail.com>

Looks like you've lost this one.
Please holler if you need a resend.

        Thanks, Akira

> ---
>  formal/dyntickrcu.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
> index 42c0c55c..2d118e69 100644
> --- a/formal/dyntickrcu.tex
> +++ b/formal/dyntickrcu.tex
> @@ -1132,7 +1132,7 @@ This effort provided some lessons (re)learned:
>  	In this case, the documentation effort located
>  	a misplaced memory barrier in
>  	\co{rcu_enter_nohz()} and \co{rcu_exit_nohz()},
> -	as shown by the following patch~\cite{PaulEMcKenney2008commit:d7c0651390b6}.
> +	as shown by the following patch~\cite{PaulEMcKenney2008commit:ae66be9b71b1}.
>  
>  \begin{VerbatimU}
>   static inline void rcu_enter_nohz(void)
> @@ -1155,7 +1155,7 @@ This effort provided some lessons (re)learned:
>  	This effort located one subtle bug in
>  	\co{rcu_try_flip_waitack_needed()}
>  	that would have been quite difficult to test or debug, as
> -	shown by the following patch~\cite{PaulEMcKenney2008commit:ae66be9b71b1}.
> +	shown by the following patch~\cite{PaulEMcKenney2008commit:d7c0651390b6}.
>  
>  \begin{VerbatimU}
>  -       if ((curr - snap) > 2 || (snap & 0x1) == 0)
