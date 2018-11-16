Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qstZ9DC1ieffqURZK5LTln4w6A73I/I/YP9T5+f7ylM=;
        b=OKdETVAvbQcKSw94LfIHYYXBePG/NNxp370PA12bL6GHevUzzMLug3VBHFTrl38dpZ
         iT8J2R8CbK7DVNFli/Drl3iAh5yPT0H+uMrv0szXjxOa18+wHL1HLM/nuyvMtWodzX+0
         FC2QgNsIJE8p3L9JXOtxCJ0gDHsvg0mmoQcAAjprudw8sZr6UgsAPEjOdz7SYhhtNthn
         BgfCw/W0E845on5tIfnk5YXs2Jal7ngIzV4ryk1kIvxIkuGLAhDFKpKOuyHBFVg5L9NN
         hEHeVP6JqPk6aIIsYdK1eABPM+a06lT9pZ0p6jnonPE2zppvhLlyALA0DegKE1/JmDk6
         +Utg==
Subject: Re: [PATCH] SMPdesign: fix typos
References: <1542356397-14343-1-git-send-email-junchangwang@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3cbec794-0a95-2248-adcf-bb35564881ad@gmail.com>
Date: Sat, 17 Nov 2018 00:01:11 +0900
MIME-Version: 1.0
In-Reply-To: <1542356397-14343-1-git-send-email-junchangwang@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Junchang Wang <junchangwang@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.ibm.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

(Cc: Paul's latest address)
Hi Junchang,

On 2018/11/16 16:19:57 +0800, Junchang Wang wrote:
> Signed-off-by: Junchang Wang <junchangwang@gmail.com>
> ---
> Hi list,
> 
> There are a few typos in Section Partitioning. Please take a look.
> 
> Thanks,
> --Junchang
> 
> --
>  SMPdesign/SMPdesign.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
> index 7b4f6eb..562c057 100644
> --- a/SMPdesign/SMPdesign.tex
> +++ b/SMPdesign/SMPdesign.tex
> @@ -936,7 +936,7 @@ We could simply assign each CPU one gigabyte of memory, and allow
>  each CPU to access its own private chunk of memory, without the
>  need for locking and its complexities and overheads.
>  Unfortunately, this simple scheme breaks down if an algorithm happens
> -to have CPU~0 allocate all of the memory and CPU~1 the free it, as
> +to have CPU~0 allocate all of the memory and CPU~1 free it, as

I guess Paul's intention was:

+to have CPU~0 allocate all of the memory and CPU~1 then free it, as

???

>  would happen in a simple producer-consumer workload.
>  
>  The other extreme, code locking, suffers from excessive lock contention
> @@ -1017,7 +1017,7 @@ smaller than the number of non-\co{NULL} pointers.
>  The allocation function \co{memblock_alloc()} may be seen in
>  Listing~\ref{lst:SMPdesign:Allocator-Cache Allocator Function}.
>  Line~\lnref{pick} picks up the current thread's per-thread pool,
> -and line~8 check to see if it is empty.
> +and line~\lnref{chk:empty} checks to see if it is empty.

Nice catch!

        Thanks, Akira

>  
>  If so, lines~\lnref{ack}-\lnref{rel} attempt to refill it
>  from the global pool
> 

