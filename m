Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IDZr5ufZw/5KJ/6xuKfTi7jAcCXSH4BnsFNVVyahWrw=;
        b=GPoxJnPIXV7WEU79mNZGNlcs/zGpStTlXSJA2kz7PF8C/KPrmKbAMtxxMUDQEttbQm
         H3QyzTB2c/bpcINt55DgJEXKzQMrg9hH6lf+Wky9Gsabj6s394CJl2okF6Qr/QrA462S
         xXxuNkaVDmJjezi1Q1SL2iQG8fYMEWI+wMuVjr2KPR/Wcs+ZlNEwoMPBBO6AIY9nMCrV
         UYZT/xR7oTYtHo+wZWRSdpyur/UarQGv8uv5JpmaWNQMjs/zignvNnimOcqq2mGxcGLO
         Nb1qdCyFgANFCxi025/Y3HVIq95FR+YU63s3I1mzmEsCyLPyVzw9GCpitffztWnwAfKH
         1grA==
Subject: Re: [PATCH 2/2] count: Adjust type of variable 'counter' with code
 snippet
References: <afb11222-c68a-22e6-a95c-bfb4d4b9344d@gmail.com>
 <549dac1f-17b7-5225-7d91-e7cd83b8b63b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a06d09f0-7c87-c0ed-f695-b25778aa4bfa@gmail.com>
Date: Wed, 3 Oct 2018 00:24:17 +0900
MIME-Version: 1.0
In-Reply-To: <549dac1f-17b7-5225-7d91-e7cd83b8b63b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/10/03 00:16:12 +0900, Akira Yokosawa wrote:
> From a9c276c3da87ed327d003a70d60777f41999b4fc Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 3 Oct 2018 00:08:49 +0900
> Subject: [PATCH 2/2] count: Adjust type of variable 'counter' with code snippet
> 
> In the actual code of count_stat.c, the per-thread variable
> "counter" has the type "unsigned long".
> 

And the other description on Listing 5.3 in the text needs some reworking
to reflect the changes in the snippet. Paul, can you have a look into
this?

        Thanks, Akira

> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  count/count.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/count/count.tex b/count/count.tex
> index 4f760a4..9f9fd0f 100644
> --- a/count/count.tex
> +++ b/count/count.tex
> @@ -487,7 +487,7 @@ Listing~\ref{lst:count:Array-Based Per-Thread Statistical Counters}
>  (\path{count_stat.c}).
>  \begin{lineref}[ln:count:count_stat:inc-read]
>  Line~\lnref{define} defines an array containing a set of per-thread counters of
> -type \co{long} named, creatively enough, \co{counter}.
> +type \co{unsigned long} named, creatively enough, \co{counter}.
>  
>  Lines~\lnref{inc:b}-\lnref{inc:e}
>  show a function that increments the counters, using the
> @@ -501,7 +501,7 @@ show a function that reads out the aggregate value of the counter,
>  using the \co{for_each_thread()} primitive to iterate over the list of
>  currently running threads, and using the \co{per_thread()} primitive
>  to fetch the specified thread's counter.
> -Because the hardware can fetch and store a properly aligned \co{long}
> +Because the hardware can fetch and store a properly aligned \co{unsigned long}
>  atomically, and because \GCC\ is kind enough to make use of this capability,
>  normal loads suffice, and no special atomic instructions are required.
>  \end{lineref}
> 

