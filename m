Return-Path: <SRS0=B+Zt=57=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K2e+UTGwx+YezuWws7wSQbe9feRib1ewHrjgdUsiQLc=;
        b=ZBqcO6w9+ov1yWZrdCpX4mhLuP/zxlc+Br94FDD5wEVM6GqjYQ3dG8ivj45kOKe2Ia
         QUXCIDuCVtzbMV2TgqGwuyjboP5sQRj+lzBs/EXFOGWf8pJCk6Wspg1vPCKXs2bg9oNE
         0UkieiRY3KQuxqIPYgAYXlkDnPWXptBzemkL9iASofBKNbnXHqALotcKHLDEQrMBGYck
         zKcqQSxfJ1gIpv8YEPPULXo99aE/zOEbANL7RtqlR9Kmcgmx3UYjDzzUJ1ImadvupwNA
         XMkmzo5UPIG8IvCX+OLzZ5k7HZuMDFp8aldF735FEkLM+NTwikmSEFYfXkzWNfnmhygb
         hIWQ==
Message-ID: <265b0793-78bc-d8b4-5a4a-8198854b2f01@gmail.com>
Date: Fri, 3 Feb 2023 12:03:18 +0900
MIME-Version: 1.0
Subject: Re: [PATCH v2] Add utilities/gitlab-ci.yml for pdf generation and
 testing on Gitlab.
References: <20230203021853.34207-1-leobras.c@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230203021853.34207-1-leobras.c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: Leonardo Bras <leobras.c@gmail.com>, "Paul E . McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Thu,  2 Feb 2023 23:18:55 -0300, Leonardo Bras wrote:
> For Gitlab repositories mirroring the original repository, trigger the
> Gitlab-CI after every push to the original repo.
> 
> For the pipeline to run, the Gitlab repo needs to configure:
> - Settings -> CI/CD -> General Pipelines -> CI/CD configuration file to
>   utilities/gitlab-ci.yml
> 
> What the pipeline does:
> - Compile-test CodeSamples
> - IF pass, build PDFs: regular, 1c, eb
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> ---
>  utilities/gitlab-ci.yml | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 utilities/gitlab-ci.yml

Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

> 
> diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
> new file mode 100644
> index 00000000..acc12fb2
> --- /dev/null
> +++ b/utilities/gitlab-ci.yml
> @@ -0,0 +1,33 @@
> +image: archlinux:latest
> +
> +stages:
> +  - test
> +  - build
> +
> +test_codesamples:
> +    stage: test
> +
> +    before_script:
> +        - pacman --noconfirm -Sy make gcc liburcu
> +
> +    script:
> +        - make -C CodeSamples/
> +
> +generate_pdfs:
> +    stage: build
> +
> +    before_script:
> +        - pacman --noconfirm -Sy texlive-most fig2dev ghostscript graphviz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts
> +        - mkdir -p ~/.local/share/fonts && cp fonts/steel-city-comic.regular.ttf ~/.local/share/fonts/ && fc-cache
> +        - wget https://sourceforge.net/projects/fig2ps/files/latest/download -O /dev/shm/fig2ps.tbz
> +        - mkdir /dev/shm/build && tar -xjf /dev/shm/fig2ps.tbz -C /dev/shm/build --strip-components=1
> +        - make install -C /dev/shm/build
> +
> +    script:
> +        - make perfbook.pdf perfbook-1c.pdf perfbook-eb.pdf
> +
> +    artifacts:
> +      paths:
> +          - perfbook.pdf
> +          - perfbook-1c.pdf
> +          - perfbook-eb.pdf


