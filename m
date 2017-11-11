Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=O8Gyx5NcxgYW+pHl6rKaC3bXMWxLgzPjTc3i7gd6ZrA=;
 b=scaNshMyWmOfMVSyyEjbtZQdUqreIlIa5fgYJIWdt2qV9pceYh7R9BrkkcRtSndIdc
 czMs7EgBCFaG3EOw1fHF19H3K0COGwjdUmfV2i8v6E70osj74epvLX+sgf1mRidzhYMx
 u9oz4kGA1WrTuw+b+f4lRPLbKyyTEYm+r4FWhfflkwCpk/zs5SqJargoT8EExsgAP78o
 BwdHdFbHOnGcQTYtyqZEtaK6ab2s7Z1Qfr5nV9K/o/o+krh+1M2x03jQ5/Y9uwiOjgtE
 uTSf5piEDWsgH5RGBfe/3Ixgj5DfPJsZuR/ktPyRultX6EBZWutRMfqEIpxzSehkmIH0
 kSww==
Subject: Re: [PATCH 3/3] CodeSamples/formal: Get rid of warnings in cross
 compiling
References: <d39e4d4f-4c4a-b72a-0fcf-8e244aa91c1e@gmail.com>
 <61f6fcf3-480c-8ba4-a4b2-4af17546b53f@gmail.com>
 <488587ce-a895-3079-0578-ff31f128f7ea@gmail.com>
 <20171111164438.GU3624@linux.vnet.ibm.com>
 <20171111165723.GA26014@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <af50453a-e7a8-77a7-275e-8dbdcc797fea@gmail.com>
Date: Sun, 12 Nov 2017 08:26:21 +0900
MIME-Version: 1.0
In-Reply-To: <20171111165723.GA26014@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/11/11 08:57:23 -0800, Paul E. McKenney wrote:
> On Sat, Nov 11, 2017 at 08:44:38AM -0800, Paul E. McKenney wrote:
>> On Sat, Nov 11, 2017 at 08:56:01AM +0900, Akira Yokosawa wrote:
>>> On 2017/11/11 08:41:54 +0900, Akira Yokosawa wrote:
>>>> >From 6ecff66f2b5f95e914d90e29b6d0a2eb4d8901cc Mon Sep 17 00:00:00 2001
>>>> From: Akira Yokosawa <akiyks@gmail.com>
>>>> Date: Sat, 11 Nov 2017 08:25:34 +0900
>>>> Subject: [PATCH 3/3] CodeSamples/formal: Get rid of warnings in cross compiling
>>>>
>>>> Also fix corresponding code snippet.
>>>>
>>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>>> ---
>>>>  CodeSamples/formal/litmus/C-2+2W+o-wmb-o+o-wmb-o.litmus | 2 --
>>>
>>> By the way Paul, didn't you have a plan to mention these "C-2+2W" litmus tests
>>> somewhere in the memorder chapter?
>>
>> Good point, it is an odd corner case that is worth at least a quick quiz.
>> How about the following?
> 
> My fingers just keep automatically typing "Figure", so please see a
> corrected patch below.  Presumably my fingers will get with the program
> in a few months.  ;-)

;-) ;-)

Please see inline (nitpicking) comments below.

Thanks, Akira

> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> commit ac730edc868b6c8a9a71637fd205553e7ba88df2
> Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Date:   Sat Nov 11 08:41:47 2017 -0800
> 
>     memorder: Add a quick quiz for the 2+2W litmus tests
>     
>     Reported-by: Akira Yokosawa <akiyks@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 7d8e4978fa6d..2ef8363fba6a 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -2455,7 +2455,103 @@ same variable is not necessarily the store that started last.
>  This should not come as a surprise to anyone who carefully examined
>  Figure~\ref{fig:memorder:A Variable With More Simultaneous Values}.
>  
> -But sometimes time is on our side, as shown in the next section.
> +\begin{listing}[tbp]
> +{ \scriptsize
> +\begin{verbbox}[\LstLineNo]
> +C C-2+2W+o-wmb-o+o-wmb-o
> +{
> +}
> +
> +{
> +#include "api.h"
> +}

2nd parentheses should be removed in code snippets.

> +
> +P0(int *x0, int *x1)
> +{
> +	WRITE_ONCE(*x0, 1);
> +	smp_wmb();
> +	WRITE_ONCE(*x1, 2);
> +}

Need to convert "tab" -> "  ".

> +
> +
> +P1(int *x0, int *x1)
> +{
> +	WRITE_ONCE(*x1, 1);
> +	smp_wmb();
> +	WRITE_ONCE(*x0, 2);
> +}
> +
> +exists (x0=1 /\ x1=1)
> +\end{verbbox}
> +}
> +\centering
> +\theverbbox
> +\caption{2+2W Litmus Test With Write Barriers}
> +\label{lst:memorder:2+2W Litmus Test With Write Barriers}
> +\end{listing}
> +
> +\QuickQuiz{}
> +	But for litmus tests having only ordered stores, as shown in
> +	Listing~\ref{lst:memorder:2+2W Litmus Test With Write Barriers}
> +	(\path{C-2+2W+o-wmb-o+o-wmb-o.litmus}),
> +	research shows that the cycle is prohibited, even in weakly
> +	ordered systems such as ARM and Power~\cite{test6-pdf}.
> +	Given that, are store-to-store really \emph{always}
> +	counter-temporal???
> +\QuickQuizAnswer{
> +	This litmus test is indeed a very interesting curiosity.
> +	Its ordering apparently occurs naturally given typical
> +	weakly ordered hardware design, which would normally be
> +	considered a great gift from the relevant laws of physics
> +	and cache-coherency-protocol mathematics.
> +
> +	Unfortunately, no one has been able to come up with a software use
> +	case for this gift that does not have a much better alternative
> +	implementation.
> +	Therefore, neither the C11 nor the Linux kernel memory models
> +	provide any guarantee corresponding to
> +	Listing~\ref{lst:memorder:2+2W Litmus Test With Write Barriers}.

And the exists clause triggers by herd7 verification. (Redundant???)

> +
> +\begin{listing}[tbp]
> +{ \scriptsize
> +\begin{verbbox}[\LstLineNo]
> +C C-2+2W+o-o+o-o
> +{
> +}
> +
> +{
> +#include "api.h"
> +}

Ditto.

> +
> +P0(int *x0, int *x1)
> +{
> +	WRITE_ONCE(*x0, 1);
> +	WRITE_ONCE(*x1, 2);

Ditto.

> +}
> +
> +
> +P1(int *x0, int *x1)
> +{
> +	WRITE_ONCE(*x1, 1);
> +	WRITE_ONCE(*x0, 2);
> +}
> +
> +exists (x0=1 /\ x1=1)
> +\end{verbbox}
> +}
> +\centering
> +\theverbbox
> +\caption{2+2W Litmus Test Without Write Barriers}
> +\label{lst:memorder:2+2W Litmus Test Without Write Barriers}
> +\end{listing}%
> +%

These "%"s have no effect because of the blank line above the
"listing" environment. You can remove them if you are OK with
the following sentence starting a new paragraph.

> +	Of course, without the barrier, there are no ordering
> +	guarantees, even on real weakly ordered hardware, as shown in
> +	Listing~\ref{lst:memorder:2+2W Litmus Test Without Write Barriers}
> +	(\path{C-2+2W+o-o+o-o.litmus}).
> +} \QuickQuizEnd
> +
> +But sometimes time really is on our side.  Read on!
>  
>  \subsubsection{Happens-Before}
>  \label{sec:memorder:Happens-Before}
> 
> 

