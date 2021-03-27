Return-Path: <SRS0=mLoL=IZ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ARgo6YwTG+yRLlm8gGjMHitx5Z0XbBlOnaFLJMrPr9g=;
        b=BqlA1mJgr0gL3fh/pwqCKI3nItXpdrPCr3MTM66kve4n2Y6jyYHLlQjblsUc1qnovo
         joM3i+atQICaclQzHiMbM0wW+OCqWGmnkn4AxRW0HkqphwqxNlBXPHqzujvS1XfiZtWm
         UJsduwRKvONplTkEajo5mI5vAAue+kvkpiiLhyYdvbBkrqTRHQGO1NR2wohxZFE8gJLw
         0BRxh5QokiAnBYs4AidgDrUhaPFKPqh2brU02KOR7BZ9lAH9S9LPo+wzBr10SQQPtkfh
         yX8awrgjpinyr5u8Qla6crf5E0gZ/cliXWsulxSxx8elgib8vWTV6s5e+3CZAB68mflt
         NoTw==
Subject: Re: [PATCH 2/2] FAQ-BUILD: Add a description for the automated latex
 package install script
References: <20210327112124.29206-1-sj38.park@gmail.com>
 <20210327112124.29206-2-sj38.park@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <d5b99200-0954-8c76-5682-c22c24796786@gmail.com>
Date: Sun, 28 Mar 2021 07:57:17 +0900
MIME-Version: 1.0
In-Reply-To: <20210327112124.29206-2-sj38.park@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: SeongJae Park <sj38.park@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Sat, 27 Mar 2021 12:21:24 +0100, SeongJae Park wrote:
> This commit adds a description for the automated latex package install
> script, 'utilities/install_latex_package.sh'.
> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> ---
>  FAQ-BUILD.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
> index 0d3330b3..c0afc430 100644
> --- a/FAQ-BUILD.txt
> +++ b/FAQ-BUILD.txt
> @@ -210,6 +210,12 @@
>  	    2.	Install it by following instructions at:
>  		https://help.ubuntu.com/community/LaTeX#Installing_packages_manually
>  
> +	B.	Instead of above manual steps, you could install the package
> +		using a script in this repository,
> +		'./utilities/install_latex_package.sh'.  For example:
> +
> +			$ ./utilities/install_latex_package.sh epigraph
> +
>  11.	Is it possible to generate SyncTeX database file?
>  
>  	A.	Yes, it is. Setting an environment variable:
> 

For both 1/2 and 2/2,

Acked-by: Akira Yokosawa <akiyks@gmail.com>

        Thanks, Akira

