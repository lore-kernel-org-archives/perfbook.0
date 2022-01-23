Return-Path: <SRS0=FUB1=SH=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=5BpQdJ5+kzvuZASNw7hbYBvMDl8s6gt4vosI4exUbhI=;
        b=IjU2LGyxeW/haT0dKEKNqYqp49I0L7AQoWpyo5f+9fpeb9BXImoSv/8fQZIEISP0XV
         DM95ibjF3fJXTSWqHRPOfy0alU/2DX+y32HciJPdGshNmfyYzdj86qEfJNsXjoNnD0pM
         LSOyyNOcTDVUm3++/xr40hKa5fb8UmmTe1kJlhjOTQuIOXzALBFojsrhmsjPVYF1S8/i
         w6BbaHiKRd7JzUoZveWRFCrCeyYZAYMaGlfVuCDC0H93iHKcvUcRfqukcij/KRhxQqu7
         8tAGMTmCIcxUy1gB+C6zji6DZK1/671JjYo2DbIbt8LJzdMk557NDv/rTL6QhLGEOuF7
         HxIg==
Message-ID: <bbb86a86-1656-95c6-36a3-e7dbfa030d22@gmail.com>
Date: Mon, 24 Jan 2022 08:44:17 +0900
MIME-Version: 1.0
Subject: Re: [PATCH -perfbook] bib/perfmeas: Fix doi of McKenney99b
Content-Language: en-US
References: <9d07bd21-9988-9b1f-d7f1-c7dae07d7a51@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <9d07bd21-9988-9b1f-d7f1-c7dae07d7a51@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Zhouyi Zhou <zhouzhouyi@gmail.com>, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Fri, 21 Jan 2022 22:32:13 +0900, Akira Yokosawa wrote:
> Escape sequences of "%3C" and "%3E" in doi cause a build error when
> "inlinelinks" option in alphapf.bst is set #0 (URLs explicit).
> 
> Fix the error by using non-escaped symbols of "<" and ">" instead.
> 
> Fixes: 62c6a33781d9 ("bib: url/doi updates")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Paul,

You might be confused but I expected you would apply this fix as
well.

        Thanks, Akira

> ---
> Hi Zhouyi,
> 
> Prompted by your patch "RFC: make some bibliography items better",
> I tested an option in alphapf.bst (bibliography style file of
> perfbook), namely "inlinelinks".
> By setting "#0" to inlinelink (URLs explicit), URL and DOI info
> in .bib files should be printed in Bibliography.
> 
> However, the build failed with McKenney99b.
> 
> This patch should fix the build error.
> 
> You still need to manually edit alphapf.bst, but please try
> setting "#0" to inlinelink.
> 
> As you will see, if a bibliography has DOI info, URL info in
> the note field is redundant when the URL is the one reachable
> via the DOI.
> 
>         Thanks, Akira
> --
>  bib/perfmeas.bib | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/bib/perfmeas.bib b/bib/perfmeas.bib
> index 9ba80cfc..51f63bb7 100644
> --- a/bib/perfmeas.bib
> +++ b/bib/perfmeas.bib
> @@ -83,7 +83,7 @@ Machine Language Rewriting",
>   year = {1999},
>   pages = {219-234},
>   bibsource = {DBLP, http://dblp.uni-trier.de},
> - doi = {10.1002/(SICI)1097-024X(199903)29:3%3C219::AID-SPE230%3E3.0.CO;2-0}
> + doi = {10.1002/(SICI)1097-024X(199903)29:3<219::AID-SPE230>3.0.CO;2-0}
>  }
>  
>  @Book{Menasce94,
> 
> base-commit: cd891db680ae978f5efa362cbdc074483f07042a
