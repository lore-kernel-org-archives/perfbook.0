Return-Path: <SRS0=bdEo=GJ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vZ1nAo6txLgePo2mR3qgJYHLX1sSfHG1Xw42+cEu2ak=;
        b=ioJzdlPNBDAoB7C70gkbLgugbe9/Z2814Ri14zyFgyn6C3MbbnW01b/qIfJKfBsjZk
         2Gxj/FeyOB7szXGdUCqFvxfXetxqzhrYyvAXY7mdPccSELasNHxzgRHLGzmX4bCDtcDY
         N2kErgS8KcpUmMyAIldep/3j48FfX2T2dQ8+Z9uxL5oJtGEp/n7iVeeDXHqSPMMGETiB
         BtfuJHiRpe32X6jN5KEzxKHy4J9BZ+yEj5pwq36LqmfCUOUSZpgyQizGh9KUB/G8nbiY
         raM0tLjwgfGembKfglsrO5Fl6Oy9WBO9o0yb87OYVOv5z4V7N1d9VUuYe+xCDPI8ZL7V
         MMQA==
Subject: Re: [PATCH 2/2 -perfbook] FAQ-BUILD: Add Q&A on Docker image
References: <63638566-e9e8-4be6-2d25-b0919b3805d1@gmail.com>
 <831592e1-ffca-ac9e-920f-0f4b52b99bb1@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b36e6c73-b435-8c3c-b7ce-f4122107ba4d@gmail.com>
Date: Wed, 6 Jan 2021 23:36:14 +0900
MIME-Version: 1.0
In-Reply-To: <831592e1-ffca-ac9e-920f-0f4b52b99bb1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Wed, 6 Jan 2021 19:32:42 +0900, Akira Yokosawa wrote:
> From 165d967a252652e2ef5af82ce62536dbcf314600 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 6 Jan 2021 19:03:55 +0900
> Subject: [PATCH 2/2 -perfbook] FAQ-BUILD: Add Q&A on Docker image
> 
> The template Dockerfile and the usage explained is a tutorial level.
> Suggestions from Docker-savvy people are more than welcome.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  FAQ-BUILD.txt | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
> index 2eeb9fbb..d4c18424 100644
> --- a/FAQ-BUILD.txt
> +++ b/FAQ-BUILD.txt
> @@ -273,3 +273,25 @@
>  
>  		    sudo updmap-sys --syncwithtrees --force
>  		    sudo updmap-sys
> +
> +14.	I want a stable environment to build perfbook.pdf.
> +	Isn't some container image available in that regard?
> +
> +	A.	You can find a template Dockerfile under the docker/
> +		subdirectory.
> +		A docker image built from it can be pulled by:
> +
> +		    docker pull akiyks/perfbook-build-env:focal
> +
> +		It can be run with the command:
> +
> +		    docker run --rm -it -v <path to perfbook dir>:/work \
> +		      akiyks/perfbook-build-env:focal bash

If we add a "-u" option specifying host-side uid:gid to run the container,
it is safe to do Git operations from inside the container.
This is because the container does all the I/O to the mounted host directory.
So the following note can be removed.

I'll respin 2/2.

        Thanks, Akira

> +
> +		Note:
> +		    The directory to be mounted to /work you give to the
> +		    "-v" option should be a newly cloned git repository.
> +		    You should avoid using any git command from the container
> +		    that might modify repository meta data and change their
> +		    owner.
> +		    Git operations should be done from the host side.
> 
