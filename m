Return-Path: <SRS0=OpVS=GO=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iNxRjMrpVclwuzD/Y5lDCmuGia1xmSuO2o5+gYNv7DU=;
        b=Lgxa4TVZdzrvt2xCT5um80iQcUNmMYYOBdLcK8STWjT2CgpHCN/4v1QAbk3aFYEKuV
         1U3NDGtAWIzo238DtZH0wyzyQVHr0UwfKv7SYVGpk3cqHnPj+pS3bSDyJwlyqxAa3Moo
         +mZH08CH17ahTfU2DsKSjkHLdYJAaYBuBKH1MYbolqqpI+970Cf7rzyNkTcRfItMfXRj
         RtzWHyQ0Vv9T9meU95Q3NE4lHAofRiY5P+0EhtF65UN/zZbsBCE6+t6nIwljgvNZwER7
         KuMjR3Cu9Ypd8Tpge2gVR+0eAIduP+C+il7yP+gqf8WKvtEjunJGrKiIVgnzD+ho1sMW
         qBbg==
Subject: Re: [PATCH -perfbook] Add Fedora-based Dockerfile
References: <8643e9db-be44-edd9-df06-c9f87348d669@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <0d374dd3-542e-046c-789a-559e997ccb2c@gmail.com>
Date: Mon, 11 Jan 2021 10:50:08 +0900
MIME-Version: 1.0
In-Reply-To: <8643e9db-be44-edd9-df06-c9f87348d669@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Mon, 11 Jan 2021 08:08:39 +0900, Akira Yokosawa wrote:
> From d37f98e4ca6cd968af2248d3c719b07ce313a7ec Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 11 Jan 2021 07:57:58 +0900
> Subject: [PATCH -perfbook] Add Fedora-based Dockerfile
> 
> For those who prefer Fedora, add an alternative Dockerfile as
> docker/Dockerfile.fedora and mention it in FAQ-BUILD.txt.
> Also add a few commands in the Focal-based Dockerfile.
> 
> Other updates in FAQ-BUILD.txt:
>   o Add "texlive-collection-fontutils" to the Fedora package list,
>     which includes "epstopdf".

Hi Paul,

You might be wondering where epstopdf came from.
It is another alternative to a2ping I'm experimenting with.
On Ubuntu, the existing list of packages covers it.

FWIW, a2ping was forked from early version of epstopdf.
Current maintainer of epstopdf is Karl Berry, who is a key maintainer
of upstream TeX Live.
So in case Ghostscript breaks backward compatibility ever again,
I expect epstopdf would get updated soon.

        Thanks, Akira

>   o Omit some options to "docker run" as they are specified in
>     both Dockerfiles.
>   o For those who prefer "podman", add instructions to use the
>     images with podman.
>   o Substitutions:
>       "Docker container" -> "container image"
>       "docker image"" -> "container image"
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---

[...]
