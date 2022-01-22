Return-Path: <SRS0=2IHd=SG=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:cc:in-reply-to:content-transfer-encoding;
        bh=XZZcRUq6LWSHqfdCbzwRlJ4Jwb8qpxsGcJu4gr0po+o=;
        b=oQunhvjGRfrkSMf4AkIFN8Xa9ETp0H7jqZ38Vi8suVxfxLuLv8rziSphplM1tXrfgJ
         y9tQLMstkBm6mVulL1EL8gxFHhHqOjbkeLuJd5LvBHwOXu9ks4eiCA8gx4wr0IjxgW+s
         mkbZrV5FgLg+u1PeV/iBw1BuOKffuZzOFKKWjIz6ldGp8QmrlsA771hyttLIlB0nqcFQ
         gyUehoq2uKvp52RKTtTf24ZtA2MCeeQXsEVE/jtKAbF/nR6RWT4QQwTUGNVomkX9dPkP
         bk548TeAAJqQVGC4VhnMUFIJOaPMVQjGDSh3s5FHs4GG+wtYHF0ipa+k8f42oZOzmgZU
         MX4w==
Message-ID: <b1b54ec1-8cfd-65f7-89e3-abd0b9551d1b@gmail.com>
Date: Sat, 22 Jan 2022 11:18:17 +0900
MIME-Version: 1.0
Subject: Re: [PATCH-perfbook v2] RFC: make some bibliography items better
Content-Language: en-US
References: <20220121154933.11778-1-zhouzhouyi@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20220121154933.11778-1-zhouzhouyi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Cc: paulmck@kernel.org, perfbook@vger.kernel.org, luyang.co@gmail.com
List-ID: <perfbook.vger.kernel.org>

Hi Zhouyi,

On Fri, 21 Jan 2022 23:49:33 +0800,
Zhouyi Zhou wrote:
> make following bibliography items better
> 1. "Relativistic Red-Black Trees"
> 2. "Speculative Lock Elision: Enabling Highly Concurrent Multithreaded                                                             Execution"
> 3. "Architectural Support for Software Transactional Memory"
> 4. "Transactional Memory Architecture and Implementation for IBM System z"

Please find inline comments below.

> 
> Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com> 
> ---
> Hi Paul and Akira
> 
> I try to make some bibliography items better.
> Also avoid include URL info when the item has DOI info. 
> 
> I have double checked the changes. 
> 
> Many thanks
> Zhouyi
> --
>  bib/RCU.bib |  8 +++++---
>  bib/TM.bib  | 15 +++++++++------
>  2 files changed, 14 insertions(+), 9 deletions(-)
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
> index e4412afd..87c7a95a 100644
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
> @@ -963,15 +965,16 @@ for Programming Languages and Operating Systems (ASPLOS '09)",
>   note="\url{https://paulmck.livejournal.com/tag/transactional%20memory%20everywhere}",
>  }
>  
> -@unpublished{ChristianJacobi2012MainframeTM,
> +@conference{ChristianJacobi2012MainframeTM,
>   author={Christian Jacobi and Timothy Slegel and Dan Greiner},
> - title="Transactional Memory Architecture and Implementation for {IBM} {System} z",
> + title= "Transactional Memory Architecture and Implementation for IBM System z",

Please keep {IBM} and {System} so that upper-case letters in
trademarks are preserved.

> + booktitle="Proceedings of the 45\textsuperscript{th} Annual IEEE/ACM International Symposium on Microarchitecture",
> + series = {MICRO 45},
> + pages = {25--36},
>   month="December",
>   year="2012",
> + address={Vancouver B.C. CANADA},
>   doi="10.1109/MICRO.2012.12",
> - note="The 45\textsuperscript{th} Annual IEEE/ACM International Symposium
> -on MicroArchitecture, URL: \url{https://www.microarch.org/micro45/talks-posters/3-jacobi-presentation.pdf}",

I'm not sure but this PDF looks like presentation slides.
Are you sure the DOI points to the identical material?
Otherwise, it is better to mention the slide in the note.

        Thanks, Akira

> - lastchecked="November 13, 2016",
>  }
>  
>  @conference{JustinGottschlich2013TMdebug,
