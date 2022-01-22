Return-Path: <SRS0=2IHd=SG=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:cc:from:in-reply-to:content-transfer-encoding;
        bh=GiPJ0FMdy2626YUD8Of3CgDzvrjbf/Hwu6fLgJhEllw=;
        b=eZl1l8jtdPgeMlMDQdgCVtLsyBbUM+xDsUhbk++j0jR6rRMWjRPFhKvb+SQW3Ezp2A
         m8+D4fRKwXzMsWrVTe9ytXTZdOunWKgX8WdDW5e9CMpd94gVnTbm0loWfGP/Db8NQoX5
         n1UGSGY1M0eNPYsBiym7zy4QsArmgLdDhGW5cTYsofIbYA31fwSsUhu/YxBYd20+Zh0o
         3tGargsxwJf+inSSa3R8E4yKNw9d9QbAkz0i1iQLDwc4McYRM0ZJJnQ2ySjUdSsyqDLn
         tUCNor4IoJWhh48WFbglFjxnFh3O8mt7kN1gULTXuAgqw1ixRqFzZae9HJnVoc54E4KP
         /i7Q==
Message-ID: <48db8ed7-9739-9ab2-7021-ff94a3dcafaf@gmail.com>
Date: Sat, 22 Jan 2022 18:06:19 +0900
MIME-Version: 1.0
Subject: Re: [PATCH-perfbook v3] RFC: make some bibliography items better
Content-Language: en-US
References: <20220122033515.3260210-1-zhouzhouyi@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20220122033515.3260210-1-zhouzhouyi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Cc: paulmck@kernel.org, perfbook@vger.kernel.org, luyang.co@gmail.com, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sat, 22 Jan 2022 11:35:15 +0800,
Zhouyi Zhou wrote:
> make following bibliography items better
> 1. "Relativistic Red-Black Trees"
> 2. "Speculative Lock Elision: Enabling Highly Concurrent Multithreaded Execution"
> 3. "Architectural Support for Software Transactional Memory"
> 4. "Transactional Memory Architecture and Implementation for IBM System z"
> 
> Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com> 
> ---
> Thank Akira for your valuable advice!
> 
> I learned a lot during the process, thank you!
> 
> Following is my new version, further suggestions is very welcome ;-)
> 
> Many thanks
> 
> Sincerely
> Zhouyi
> --
>  bib/RCU.bib |  8 +++++---
>  bib/TM.bib  | 14 +++++++++-----
>  2 files changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/bib/RCU.bib b/bib/RCU.bib
> index 3e2bf423..12c37619 100644
> --- a/bib/RCU.bib
> +++ b/bib/RCU.bib
> @@ -2190,11 +2190,13 @@ lot of {Linux} into your technology!!!",
>   author = {Philip W. Howard and Jonathan Walpole},
>   title = {Relativistic Red-Black Trees},
>   journal = {Concurrency and Computation: Practice and Experience},
> - year = {2013},
> + year = {2014},
> + month = "November",
>   issn = {1532-0634},
> - pages = {n/a--n/a},
> + pages = {2684--2712},
> + volume = {26},
> + number = {16},
>   numpages = {29},
> - url = {http://dx.doi.org/10.1002/cpe.3157},
>   doi = {10.1002/cpe.3157},
>  }
>  
> diff --git a/bib/TM.bib b/bib/TM.bib
> index e4412afd..d468c691 100644
> --- a/bib/TM.bib
> +++ b/bib/TM.bib
> @@ -117,6 +117,7 @@ on Computer Architecture",
>   Title = "Speculative Lock Elision: Enabling Highly Concurrent Multithreaded
>  Execution",
>   Booktitle = "Proceedings of the 34\textsuperscript{th} Annual ACM/IEEE International Symposium on Microarchitecture",
> + series = {MICRO 34},
>   publisher="The Institute of Electrical and Electronics Engineers, Inc.",
>   month="December",
>   year="2001",
> @@ -372,7 +373,8 @@ Languages, Compilers, and Hardware Support for Transactional Computing},
>  @inproceedings{BratinSaha2006MICRO,
>   author = {Saha, Bratin and Adl-Tabatabai, Ali-Reza and Jacobson, Quinn},
>   title = {Architectural Support for Software Transactional Memory},
> - booktitle = {MICRO 39: Proceedings of the 39th Annual IEEE/ACM International Symposium on Microarchitecture},
> + booktitle = {Proceedings of the 39\textsuperscript{th} Annual IEEE/ACM International Symposium on Microarchitecture},
> + series = {MICRO 39},
>   year = {2006},
>   isbn = {0-7695-2732-9},
>   pages = {185--196},
> @@ -963,15 +965,17 @@ for Programming Languages and Operating Systems (ASPLOS '09)",
>   note="\url{https://paulmck.livejournal.com/tag/transactional%20memory%20everywhere}",
>  }
>  
> -@unpublished{ChristianJacobi2012MainframeTM,
> +@conference{ChristianJacobi2012MainframeTM,
>   author={Christian Jacobi and Timothy Slegel and Dan Greiner},
>   title="Transactional Memory Architecture and Implementation for {IBM} {System} z",
> + booktitle="Proceedings of the 45\textsuperscript{th} Annual IEEE/ACM International Symposium on Microarchitecture",
> + series = {MICRO 45},
> + pages = {25--36},
>   month="December",
>   year="2012",
> + address={Vancouver B.C. CANADA},

                            Canada ?

>   doi="10.1109/MICRO.2012.12",
> - note="The 45\textsuperscript{th} Annual IEEE/ACM International Symposium
> -on MicroArchitecture, URL: \url{https://www.microarch.org/micro45/talks-posters/3-jacobi-presentation.pdf}",
> - lastchecked="November 13, 2016",
> + note="\url{https://www.microarch.org/micro45/talks-posters/3-jacobi-presentation.pdf}",

As the "note" field is free format, what about

+ note="Presentation slides:
+\url{https://www.microarch.org/micro45/talks-posters/3-jacobi-presentation.pdf}",

?

        Thanks, Akira
>  }
>  
>  @conference{JustinGottschlich2013TMdebug,
