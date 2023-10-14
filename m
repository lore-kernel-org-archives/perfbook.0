Return-Path: <SRS0=1PbI=F4=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697252825; x=1697857625; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sv5kzbwzyBSenGtF6tknD/ybQ872UM0CDWrqA5qSmyM=;
        b=AVAoot6CK4AH7vfWWCtL7sc/YzP8gIAZ+oumdEZUypUeCyUhEp+XSy9Pp8+B11hviH
         17f3bUPvM6oSGB3EFoyh8gCwi3ZQQMoYp5+VCtoTGjlY6X2Ho9n+98F1C0W9OaVjWnnP
         KN3vDTz56wphyEVHUcHAo1265gzWjlDpH0cCmAUWhCcg5xi93kG9uX76CUElNOLcH7rp
         EKDRo7+/Sqi/P7Xj3uIFqq6fLIhfMDK6jVFSsQTOx28XLy9pQlTnxxIcRYTtjB313tbi
         87+1lf2wCaVdkEtLuYVx7XitQs7+vVl8c+5+WT/g66BGin59VNH/z/UBy4d1bpT9w3WE
         3FqQ==
Message-ID: <04335cff-c0f8-41ff-912f-5da9d670786b@gmail.com>
Date: Sat, 14 Oct 2023 12:07:01 +0900
MIME-Version: 1.0
Subject: Re: [PATCH] memorder: Add info on recent x86 implemenation of
 smp_mb()
References: <20231013012238.1455140-1-joel@joelfernandes.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20231013012238.1455140-1-joel@joelfernandes.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: paulmck@kernel.org, Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Joel,

On 2023/10/13 10:22, Joel Fernandes (Google) wrote:
> smp_mb() uses lock;add for x86 in the linux kernel. Add information
> about the same.
> 
> Cc: paulmck@kernel.org
> Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> ---
> Not even build tested, just focused on the content and to keep my promise I'd
> send this out (better than never sending it) ;-). I appreciate maintainers of
> perfbook taking this forward ;-). Thanks!

I've just tested this...
And it failed to build.

I think I'll post a v2 which will build, with some wordsmithing
I can think of.

A few quick comments below.

> 
>  bib/hw.bib            | 8 ++++++++

bib/memorymodel.bib looks like a suitable destination.

>  memorder/memorder.tex | 8 ++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/bib/hw.bib b/bib/hw.bib
> index b0885e74..b1dfd119 100644
> --- a/bib/hw.bib
> +++ b/bib/hw.bib
> @@ -1159,3 +1159,11 @@ Luis Stevens and Anoop Gupta and John Hennessy",
>   note="\url{https://github.com/google/fuzzing/blob/master/docs/silifuzz.pdf}",
>  }
>  
> +@unpublished{Tsirkin2017,
> + Author="Michael S. Tsirkin",
> + Title="locking/x86: Use LOCK ADD for smp_mb() instead of MFENCE",
"_" in title needs an escape.

> + month="November",
> + day="10",
> + year="2017",
> + note="\url{https://lore.kernel.org/all/tip-450cbdd0125cfa5d7bbf9e2a6b6961cc48d29730@git.kernel.org/}",
> +}
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 5c978fbe..b28ac4f0 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -6081,6 +6081,14 @@ A few older variants of the x86 CPU have a mode bit that enables out-of-order
>  stores, and for these CPUs, \co{smp_wmb()} must also be defined to
>  be \co{lock;addl}.
>  
> +A 2017 kernel commit by Michael S. Tsirkin replaced \co{mfence} with
> +\co{lock add} in \co{smp_mb()}, achieving a 60 percent performance
> +boost~\cite{Tsirkin2017}. The change used a 4-byte negative offset from
                           ^
perfbook's LaTeX source convention needs a line break at the end of a
sentence.

> +the \co{SP} to avoid slowness due to false data-dependencies,
> +instead of directly modifying the \co{SP}. \co{clflush} users still
> +need to use \co{mfence} for ordering, so they have been converted to use
> +\co{mb} instead of \co{smp_mb}, which uses an \co{mfence} as before.
> +
>  Although newer x86 implementations accommodate self-modifying code
>  without any special instructions, to be fully compatible with
>  past and potential future x86 implementations, a given CPU must

Anyway, please wait for my v2.

        Thanks, Akira
