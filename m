Return-Path: <SRS0=uPPM=B2=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686023538; x=1688615538;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P2VzWQSE4TLYc9a0Emu7vuxCeKIn62tk9PGi0omJxaA=;
        b=jaEas1lQuCloOzWDmQjo2TNhDulnSu2iudxW2iBUZij2p4mXeEBjCLQlWnnMDnf7eZ
         jBRK6Gnb/l8sowYpod0JOfSzymJSTuOeb8k3kCdIGd9neBmTcjz0giMt8B/egCJnDqCt
         lw1u7LvpH9NtlKfbNlhREwvtuIhGjm7QQXytQ4Z7eteIw0u2euWTMj0PtYuglxO1+p49
         a78ms7h0JsX8uZeh9aqclQBJ+DJROQ5OKS6ItYxbVy93VMCGVm3jOiwJ61ZbAWjkERJg
         5PW3fTwzSCPhogBc5oe3kH8v16hYUo+LDvETINUsV1xVAdbTghjMjqiPUxK19l6SfTYd
         9eRA==
Message-ID: <918699e4-d788-e891-5853-30d782631ff8@gmail.com>
Date: Tue, 6 Jun 2023 12:52:13 +0900
MIME-Version: 1.0
Subject: Re: [PATCH] utilities/gitlab-ci: Remove custom build of fig2ps
References: <20230603175548.12944-1-leobras.c@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230603175548.12944-1-leobras.c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: Leonardo Bras <leobras.c@gmail.com>, "Paul E . McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sat,  3 Jun 2023 14:55:37 -0300, Leonardo Bras wrote:
> Since commit 1f907f3d77dd ("Use fig2dev as fallback to fig2eps"),
> there is no need to install fig2ps in the container for building the pdfs.
> 
> Remove those steps to simplify the building process.
> 
> Suggested-by: Akira Yokosawa <akiyks@gmail.com>
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> ---
> 
> Tested on Gitlab Pipeline:
> https://gitlab.com/linux-kernel/perfbook/-/pipelines/888505608

Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

> 
>  utilities/gitlab-ci.yml | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
> index 6c3ec1e6..544b9373 100644
> --- a/utilities/gitlab-ci.yml
> +++ b/utilities/gitlab-ci.yml
> @@ -21,9 +21,6 @@ generate_pdfs:
>      before_script:
>          - pacman --noconfirm -Sy texlive-meta fig2dev ghostscript graphviz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts ttf-liberation
>          - mkdir -p ~/.local/share/fonts && cp fonts/steel-city-comic.regular.ttf ~/.local/share/fonts/ && fc-cache
> -        - wget https://sourceforge.net/projects/fig2ps/files/latest/download -O /dev/shm/fig2ps.tbz
> -        - mkdir /dev/shm/build && tar -xjf /dev/shm/fig2ps.tbz -C /dev/shm/build --strip-components=1
> -        - make install -C /dev/shm/build
>  
>      script:
>          - make perfbook.pdf perfbook-1c.pdf perfbook-eb.pdf
