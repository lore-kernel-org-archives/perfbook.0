Return-Path: <SRS0=+SQ7=BX=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685768547; x=1688360547;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9GqP0YlR/u2sQfgB88/n2vE+4yVu5Byf6ojKPgDHlrI=;
        b=e4akgNOaf/eZmgLKfU4gXAXump/lCKYbj0UvL4S6copwO+6mUgMoVubslNRgQczako
         c/bFCmHd5CwnG7wxmlS0RjHBC8TvZbSaZgYQQFznf6GojZR650UAzJiYby9n5/gkw1rA
         6NLXVTgodOr2xdMTxYO/8J30r1bVdXbLMoQgQTuwVd4Wp6RykG56stsPFJiaobYV9scN
         Md0IGGEPxSUEVvxY9/c4lO3pAP1ygyE0XoxbTJySu0JxWZ9vfUV4Rkxs9/sZGxetIPNV
         ENQVsYVxdAHPkbCfhe0Zruq1ZAK3YeBojvoNZ1Dl14FJXQN4gMwpTSABH8VrmlzdUhUK
         uQCg==
Message-ID: <2274e683-8b17-f974-5f6c-2a2b51d13cff@gmail.com>
Date: Sat, 3 Jun 2023 14:02:23 +0900
MIME-Version: 1.0
Subject: Re: [RFC PATCH 1/1] utilities/gitlab-ci: Fix gitlab-ci due to Arch
 Linux deprecating texlive-most
References: <20230601203816.996788-1-leobras.c@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230601203816.996788-1-leobras.c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: Leonardo Bras <leobras.c@gmail.com>, "Paul E . McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Leo,

Why is this "RFC" ??? :-)

On Thu,  1 Jun 2023 17:38:16 -0300, Leonardo Bras wrote:
> Arch Linux folks deprecated the texlive-most package group in favor of
> texlive-meta, which should contain the same packages with an aditional
> tool.
> 
> Fix this script to use texlive-meta, so the gitlab pipeline is able to
> build the pdfs.
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> ---
>  utilities/gitlab-ci.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
> index 42eda60f..6c3ec1e6 100644
> --- a/utilities/gitlab-ci.yml
> +++ b/utilities/gitlab-ci.yml
> @@ -19,7 +19,7 @@ generate_pdfs:
>      stage: build
>  
>      before_script:
> -        - pacman --noconfirm -Sy texlive-most fig2dev ghostscript graphviz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts ttf-liberation
> +        - pacman --noconfirm -Sy texlive-meta fig2dev ghostscript graphviz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts ttf-liberation
>          - mkdir -p ~/.local/share/fonts && cp fonts/steel-city-comic.regular.ttf ~/.local/share/fonts/ && fc-cache
>          - wget https://sourceforge.net/projects/fig2ps/files/latest/download -O /dev/shm/fig2ps.tbz
>          - mkdir /dev/shm/build && tar -xjf /dev/shm/fig2ps.tbz -C /dev/shm/build --strip-components=1

I don't think there is anybody who bothers with gitlab-ci
other than you.  You can do whatever you'd like, I guess.

FWIW,

Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

Sidenote:

Since commit 1f907f3d77dd ("Use fig2dev as fallback to fig2eps"),
there is no need to install fig2ps in the container.

        Thanks, Akira

