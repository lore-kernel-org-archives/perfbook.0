Return-Path: <SRS0=+wkL=IY=gmail.com=bsingharora@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mob0Rbr12vpNsK8OV5yvjLdW01uyC0i1fhPzSGpcG1g=;
        b=talgRSXu/YZ598dkyC+ttXqeg62+QTaqg8ZiPfMh8DZ6ra7wdt67oVeobvmHiBMxJa
         00KT14vqREhCvFnc4VooJRUpIEtkuf9ZG8jN0HF0sZg2ua3S7jKrS7YEwKW6SRjI2KVC
         A/MGGaQDyL1Rczu2Xyt8+eTaOEiA9woVqsTxSyVELL4Kwr8tYXIRvxfbP/8PPAVrI1JA
         AYN/wicNI84qsYK8cZUoeuT3+6UeVCm+4uJ7sP8f4yIFePDrbKVqdfFgIXgQT7At9NQ3
         z8JFGru99fZepAF+DoMrna7zyrhKNsqABjkg5LC8Ma53xBJVW5TJglqOhNBbQYNlHbhq
         IpHg==
Date: Fri, 26 Mar 2021 17:35:03 +1100
From: Balbir Singh <bsingharora@gmail.com>
Subject: Re: [PATCH -perfbook 5/5] Makefile: Add info on ebooksize build in
 help and help-full
Message-ID: <20210326063503.GO77072@balbir-desktop>
References: <20210323010153.GH77072@balbir-desktop>
 <64419413-f54f-a737-bcae-e03b8ecaf606@gmail.com>
 <7c31e637-8a04-672d-71e5-3a3009e182f3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c31e637-8a04-672d-71e5-3a3009e182f3@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Thu, Mar 25, 2021 at 08:00:07PM +0900, Akira Yokosawa wrote:
> "(WIP)" will be removed size adjustments of floats are done.
> 
> Also promote paper-size specific targets to "make help".
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  Makefile | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 415bcef3..16c85edf 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -500,8 +500,15 @@ help: help-official
>  	@echo "Set env variable PERFBOOK_PAPER to change paper size:"
>  	@echo "   PERFBOOK_PAPER=A4: a4paper"
>  	@echo "   PERFBOOK_PAPER=HB: hard cover book"
> +	@echo "   PERFBOOK_PAPER=EB: ebook reader, always 1c layout (WIP)"
>  	@echo "   other (default):   letterpaper"
>  	@echo
> +	@echo "Paper size variations (independent of PERFBOOK_PAPER):"
> +	@echo "  perfbook-lt.pdf,   lt:   2-column layout on letterpaper"
> +	@echo "  perfbook-hb.pdf,   hb:   2-column layout for hard cover book"
> +	@echo "  perfbook-a4.pdf,   a4:   2-column layout on a4paper"
> +	@echo "  perfbook-eb.pdf,   eb:   1-column layout for ebook reader (WIP)"
> +	@echo
>  	@echo "\"make help-full\" will show the full list of available targets."
>  
>  help-full: help-official
> @@ -510,6 +517,7 @@ help-full: help-official
>  	@echo "  perfbook-lt.pdf,   lt:   2-column layout on letterpaper"
>  	@echo "  perfbook-hb.pdf,   hb:   2-column layout for hard cover book"
>  	@echo "  perfbook-a4.pdf,   a4:   2-column layout on a4paper"
> +	@echo "  perfbook-eb.pdf,   eb:   1-column layout for ebook reader (WIP)"
>  	@echo
>  	@echo "Experimental targets:"
>  	@echo "  Full,              Abbr."
> @@ -540,8 +548,9 @@ help-full: help-official
>  	@echo "  - Set env variable PERFBOOK_PAPER to change paper size:"
>  	@echo "      PERFBOOK_PAPER=A4: a4paper"
>  	@echo "      PERFBOOK_PAPER=HB: hard cover book"
> +	@echo "      PERFBOOK_PAPER=EB: ebook reader, always 1c layout (WIP)"
>  	@echo "      other (default):   letterpaper"
> -	@echo "    (PERFBOOK_PAPER has no effect on targets \"lt\", \"hb\", and \"a4\".)"
> +	@echo "    (PERFBOOK_PAPER has no effect on targets \"lt\", \"hb\", \"a4\", and \"eb\".)"
>  
>  clean:
>  	find . -name '*.aux' -o -name '*.blg' \
> -- 
> 2.17.1
>

Acked-by: Balbir Singh <bsingharora@gmail.com> 
