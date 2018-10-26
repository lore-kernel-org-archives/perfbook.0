Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=366Bd5ZnbENJ9hOIuHAZyiKhNiZ6FLhXelwDRy2ipJQ=;
        b=K8CGizeUu66tz8YRJeIxqHCTE0C1BHJZPPRzwX2oMkCeCVmR6vZXUf3TXz2G1FudmX
         FSvUvAW7rNll4qdnlPrNoFcmgwvB/XsTfwv2KfrUymKQZszjCPHhHDAO5TpGEXqe2MoT
         f522JluihsS4RWHUF2mZQUkIOdaRRwmaPdoSGNzPNPsnqLdt6UuHIljjF2RilrrnHPTi
         iX6z/byY69D/jzmlBuOe1Orx+hvr2x6AyOEDAx2x9jhmf0hlXBquuKc0Wg+tRguvbsOn
         73CxIB6jqmp8EYp3iOMxZ+FKk8oXSAEGUG2cch5coUQTRRR/hD9rJsbcDNgHQT5u60qV
         QeFA==
Subject: Re: [PATCH 0/7] count, toolsoftrade: Employ new code-snippet scheme
 (cont.)
References: <f6c72461-722d-71d2-b8a6-a2add234e323@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5342e889-ee54-cb5d-c498-b887bcb79863@gmail.com>
Date: Sat, 27 Oct 2018 00:35:10 +0900
MIME-Version: 1.0
In-Reply-To: <f6c72461-722d-71d2-b8a6-a2add234e323@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/10/27 00:22:37 +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> This is a set of simple conversions of code snippets to the new scheme
> in count and toolsoftrade.  There is no change in the code under CodeSamples,
> but there are a few visual changes in the pdf output which reflect the
> actual code samples.

I forgot to mention that Patch #3 contains minor changes in the code to
reduce width of code snippets.

        Thanks, Akira

> 
> Patch #7 fixes an unintended change in indent width made in the previous
> patch set.
> 
>         Thanks, Akira
> --
> Akira Yokosawa (7):
>   count: Employ new scheme for inline code snippets
>   toolsoftrade: Use 'VerbatimU' for inline snippets
>   toolsoftrade: Employ new scheme for snippets of lock.c
>   toolsoftrade: Employ new scheme for snippet of rwlockscale.c
>   toolsoftrade: Employ new scheme for snippet of compiler barriers
>   toolsoftrade: Employ new scheme for snippets of threadcreate.c
>   count: Fix indent in count_lim_atomic.c
> 
>  CodeSamples/api-pthreads/api-pthreads.h |   7 +-
>  CodeSamples/count/count_lim_atomic.c    |   2 +-
>  CodeSamples/intro/threadcreate.c        |  20 +-
>  CodeSamples/toolsoftrade/lock.c         |  76 +++---
>  CodeSamples/toolsoftrade/rwlockscale.c  |  54 ++--
>  count/count.tex                         |  89 +++---
>  toolsoftrade/toolsoftrade.tex           | 460 ++++++++------------------------
>  7 files changed, 253 insertions(+), 455 deletions(-)
> 

