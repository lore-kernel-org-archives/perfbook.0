Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oo3bAY6uSYM24yttAFKgG+fEmXoPpWwOxDOjhhSANC0=;
 b=AdTeRFHhdm2rDOFZ7d9WKnxBWyIVlPDnazlcCBHDwxnDbjGqa/FZsKrl6DoD7jKyvH
 pUzV428nXamRvPicGtaRlyuqDhsoMnUuPDE1Dv/2txPkuXQMIPr8e8vnPGRQc7y5DjOn
 w4f71oo1H+iiFVqCCK6bjhczBCMd7+sg2wFYAJ/9zbrFNbERpuazlvl593l4qpPO+aaJ
 UWqpHPLOhJQZ2XEIg/Wx/NEZOWix0wY12RkgSIQg9MGPB4oX5k2bBncI9QhLQNZZ8QUr
 TbIdwkqNO/CYvPgsOfDmVXID1JoS8/jyaF6vZ5B2f5OWTXNB8+H1Y8O6qLnipPIK4H20
 Vahg==
Subject: Re: [PATCH] advsync: Fix store-buffering sequence table
References: <1e3fe2af-cce3-7327-488d-fb27ec7d9fc8@gmail.com>
 <20170704222138.GR2393@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <73696d24-1e3d-68cf-5bc2-f15390883bdc@gmail.com>
Date: Wed, 5 Jul 2017 23:22:52 +0900
MIME-Version: 1.0
In-Reply-To: <20170704222138.GR2393@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/07/04 15:21:38 -0700, Paul E. McKenney wrote:
> On Wed, Jul 05, 2017 at 12:23:09AM +0900, Akira Yokosawa wrote:
>> >From 2845eb208a6e63493997de47293a47ef774a9d49 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Tue, 4 Jul 2017 23:18:30 +0900
>> Subject: [PATCH] advsync: Fix store-buffering sequence table
>>
>> Row 6 of the table added in commit 2d5bf8d25a71 ("advsync: Add
>> memory-barriered store-buffering example") needs some context
>> adjustment.
>>
>> Also tweak horizontal spacing of wide tables for one-column layout.
>> Also add a few words to the footnote giving definition of
>> __atomic_thread_fence().
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> Good catches!  Queued and pushed.  I reworded the footnote a bit, so
> please let me know if I overdid it.

After your changes in commit 036372ac2573 ("advsync: Use gcc's C11-like
intrinsics to avoid data races"), this footnote seems verbose, doesn't it?

But, I'm not so much a fan of the changes of your commit.
It becomes hard to see the relation of lines in litmus tests and rows
in the tables. Also, those intrinsics have fairly large overheads.

How about using "volatile" in thread arg declaration such as the following?

---
C C-SB+o-o+o-o
{
}

P0(volatile int *x0, volatile int *x1)
{
	int r2;

	*x0 = 2;
	r2 = *x1;
}


P1(volatile int *x0, volatile int *x1)
{
	int r2;

	*x1 = 2;
	r2 = *x0;
}

exists (1:r2=0 /\ 0:r2=0)
---

If all you need is to prevent memory accesses from being optimized away,
they should suffice. But they might be unpopular among kernel community.

I checked the generated C code in cross-compiling mode of litmus7, and
the volatile-ness is reflected there.

Thoughts?

          Thanks, Akira

> 
> 							Thanx, Paul
> 
>> ---
>>  advsync/memorybarriers.tex | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
>> index 4ae3ca8..f26a7c5 100644
>> --- a/advsync/memorybarriers.tex
>> +++ b/advsync/memorybarriers.tex
>> @@ -174,7 +174,7 @@ Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}.
>>
>>  \begin{table*}
>>  \small
>> -\centering
>> +\centering\OneColumnHSpace{-.1in}
>>  \begin{tabular}{r||l|l|l||l|l|l}
>>  	& \multicolumn{3}{c||}{CPU 0} & \multicolumn{3}{c}{CPU 1} \\
>>  	\cline{2-7}
>> @@ -318,6 +318,8 @@ ordering and memory barriers work, read on!
>>  The first stop is
>>  Figure~\ref{fig:advsync:Memory Ordering: Store-Buffering Litmus Test},
>>  which has \co{__atomic_thread_fence()} directives\footnote{
>> +	One of GCC's atomic intrinsics briefly introduced in
>> +	Section~\ref{sec:toolsoftrade:Atomic Operations (C11)}.
>>  	Similar to the Linux kernel's \co{smp_mb()} full memory barrier.}
>>  placed between
>>  the store and load in both \co{P0()} and \co{P1()}, but is otherwise
>> @@ -339,7 +341,7 @@ Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}.
>>
>>  \begin{table*}
>>  \small
>> -\centering
>> +\centering\OneColumnHSpace{-0.75in}
>>  \begin{tabular}{r||l|l|l||l|l|l}
>>  	& \multicolumn{3}{c||}{CPU 0} & \multicolumn{3}{c}{CPU 1} \\
>>  	\cline{2-7}
>> @@ -362,8 +364,8 @@ Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}.
>>  	5 & (Finish store) & & \tco{x0==2} &
>>  		(Finish store) & & \tco{x1==2} \\
>>  	\hline
>> -	6 & \tco{r2 = *x1;} (2) & \tco{x0==2} & \tco{x1==0} &
>> -		\tco{r2 = *x0;} (2) & \tco{x1==2} & \tco{x0==0} \\
>> +	6 & \tco{r2 = *x1;} (2) & & \tco{x1==2} &
>> +		\tco{r2 = *x0;} (2) & & \tco{x0==2} \\
>>  \end{tabular}
>>  \caption{Memory Ordering: Store-Buffering Sequence of Events}
>>  \label{tab:advsync:Memory Ordering: Store-Buffering Sequence of Events}
>> -- 
>> 2.7.4
>>
> 
> 

