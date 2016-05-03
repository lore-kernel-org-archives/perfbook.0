Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=JFdnEjCw4iBQYRhXt9CpaSY44hizSiQE9YhV58rAW/k=;
 b=VNYAhMwxoerRPgHAXsiqNCdKzFezFj1aNkoMB+ozO6xd9qQXMHX1gDYy40Z4eCrNrl
 NzHcmhHBAfMf4wg19ccaNKJcLyQAvqXbx99fc+dm03/Pb+K6QGH6kaKcRjwD3DACe/gz
 Geh2QM2s0l7ulgFah5rSp0ZzyVQmkdGRpIZbnUZ8QG+q7nSR9rqn0Qj2jpAzatiV9QLC
 +ZYcEhvDVLMc+6Ia2ze53gyVK2FnJY3w5XdoIRMywzlFwEfhwtbqlB1S7/IO9NGQU4nB
 rzdKiCzFwpNVll8sJrIS4oUxY187yXsUzFhxFKwC4oz5xk2l+h74s/2h7NCI2ZkhZcZ+
 trRA==
Subject: Re: [PATCH] Makefile: Denote phony targets explicitly
References: <8c5ebd01-e036-0e4e-bb73-35095ce6d6eb@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <97a0a2b3-27a2-c262-3559-4936a71d6500@gmail.com>
Date: Wed, 4 May 2016 00:18:09 +0900
MIME-Version: 1.0
In-Reply-To: <8c5ebd01-e036-0e4e-bb73-35095ce6d6eb@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/05/04 0:14, Akira Yokosawa wrote:
>>From a79124b5e603b3961242e882910e713d7ce0149a Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiysw@gmail.com>
> Date: Wed, 4 May 2016 00:00:30 +0900
> Subject: [PATCH] Makefile: Denote phony targets explicitly
> 
> By this change, even if a file having the same name is created
> accidentally, behavior of the Makefile won't be affected any more.
> 
> Signed-off-by: Akira Yokosawa <akiysw@gmail.com>
> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Makefile b/Makefile
> index 1b508b1..7653c80 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -167,6 +167,7 @@ BIBSOURCES = \
>  	bib/swtools.bib \
>  	bib/syncrefs.bib
>  
> +.PHONY: all extraction embedfonts clean distclean neatfreak
>  all: perfbook.pdf
>  
>  perfbook.pdf: perfbook.bbl $(LATEXSOURCES) $(EPSSOURCES) extraction embedfonts
> 

Hi,

I want this one to be pulled before start working on v2 of "Another round of
build script tweaks" series.

                                                 Thanks, Akira

