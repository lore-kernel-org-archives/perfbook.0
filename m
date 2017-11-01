Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jNHOXilbUK4ozYoKoDNtQLg8CSh1MQDId6Mb7am/q2A=;
 b=ap7ahqIC7VEaOW7B1C+tH+qLN6225/OZkmupCiw6jKo0mfoikFNpraDfMki9q1PuB0
 qJ1l1udA4HD3EyBcsJ4ohisb5CuWcCulaEEAj+fK4upfucwV32K1NNcUPVnSPM4WOxgG
 2QOL9QSEn4d8joib4BzT0ySFOU2VOi6NavR9koU3Xf4JiAhlUhu02xH95JIqJcMAIdIq
 ZxDRwoPVuiwYJjYkRobchTNgTosDV3LXiPNCHxGPAgHY+VSybABHnLseyWLkZmflE2Xt
 17UNlugD5rXDmBQBwAP+hvCnr+UiRS8PFBJpL2RUgdIDvHvl+3maejnWBKx8k9UExTmG
 +18w==
Subject: Re: ARMv8 != arm64
References: <2ce74586-5ac7-db14-f4e0-2aad297d8481@gmail.com>
 <20171101225251.GZ3659@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <73ab3c41-132f-56e0-8647-9fe1ee526d58@gmail.com>
Date: Thu, 2 Nov 2017 08:22:46 +0900
MIME-Version: 1.0
In-Reply-To: <20171101225251.GZ3659@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/11/01 15:52:51 -0700, Paul E. McKenney wrote:
> On Thu, Nov 02, 2017 at 07:34:28AM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> In Section 15.4.3, you are treating ARMv8 as 64-bit CPU.
>> However, ARMv8 has 32-bit modes A32 and T32.
>> Instructions for load-acquire/store-release are also available in A32
>> and T32 modes of ARMv8.
>>
>> The opening paragraph of Section 15.4.3 needs some rework, I guess.
> 
> Ah, thank you!  How about the following?

Looks good to me!

Acked-by: Akira Yokosawa <akiyks@gmail.com>

    Thanks, Akira

> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> commit 1a41fa1352ff77c3a09a4d182649e571735d7f1c
> Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Date:   Wed Nov 1 15:51:06 2017 -0700
> 
>     memorder: ARMv8 includes 32-bit capability
>     
>     Reported-by: Akira Yokosawa <akiyks@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 94e125ab3412..446f4804af53 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -4485,10 +4485,11 @@ lines~3 and~4 would enforce ordering between lines~1 and~5.
>  \ContributedBy{Figure}{fig:memorder:Half Memory Barrier}{Melissa Brossard}
>  \end{figure}
>  
> -ARMv8 is ARM's 64-bit CPU~\cite{ARMv8A:2017},
> -in contrast to their 32-bit CPU described in
> +ARMv8 is ARM's new CPU family~\cite{ARMv8A:2017}
> +which includes 64-bit capabilities,
> +in contrast to their 32-bit-only CPU described in
>  Section~\ref{sec:memorder:ARMv7-A/R}.
> -ARMv8's memory model closely resembles its 32-bit counterpart,
> +ARMv8's memory model closely resembles its ARMv7 counterpart,
>  but adds load-acquire (\co{LDLARB}, \co{LDLARH}, and \co{LDLAR})
>  and store-release (\co{STLLRB}, \co{STLLRH}, and \co{STLLR})
>  instructions.
> @@ -4569,7 +4570,7 @@ being weakly ordered by default, but respecting dependencies.
>  MIPS has a wide variety of memory-barrier instructions, but ties them
>  not to hardware considerations, but rather to the use cases provided
>  by the Linux kernel and the C++11 standard~\cite{RichardSmith2015N4527}
> -in a manner similar to the ARM64 additions:
> +in a manner similar to the ARMv8 additions:
>  
>  \begin{description}[style=nextline]
>  \item[\tco{SYNC}]
> 
> 

