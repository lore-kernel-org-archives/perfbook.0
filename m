Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B4xJXe3aNWm6tObSgfco/B/1Unw47uKgekkmWKJjqno=;
 b=F+3mjWtPRhc9zyDQLcDl5mokUHnfyFnc1x1KTyt99XyXm0RuM82zEVfK9ksoJF1GAt
 CurMk9vZnkHYsKqmY8K4Lmv8fb1KOJ3WhOmDcLwuWGhHe+D2+STcFnBKoKgVitzz1nN3
 JlwqTurhPVCxEmIYz7QYmb9GEyHMLx9t6VKuMOLHMYy7/xoO+sFhxxK4oFgnD3Rx8JLO
 FT+Q5asK/dAj6v1YVaMepjFmwBZd7r3wDA+MlAbIt63OXfOJlaeY0A8rOtj4BpLub2tS
 +KqhLogSmoLByTbthB6cuJSsDWeH2WO+ByKq1BjJ58dEpYaHwwRkpCwGexq29Ri+V2/E
 9afQ==
Subject: Re: [PATCH] advsync: Fix typo
References: <80b3d435-7485-0e5c-ba2d-c2d8c463f4a7@gmail.com>
 <20170824165035.GR11320@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <bac516e4-2fb7-d39c-e596-ff667fcbd41f@gmail.com>
Date: Fri, 25 Aug 2017 07:17:09 +0900
MIME-Version: 1.0
In-Reply-To: <20170824165035.GR11320@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/08/24 09:50:35 -0700, Paul E. McKenney wrote:
> On Thu, Aug 24, 2017 at 11:49:54PM +0900, Akira Yokosawa wrote:
>> >From 8d70beda36d683ee6869581155db91153b68338c Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Thu, 24 Aug 2017 23:30:50 +0900
>> Subject: [PATCH] advsync: Fix typo
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> ---
>> Hi Paul,
>>
>> This patch fixes a few typos after your self-review.
>> I'm not sure if the 1st hunk of "stop -> step" is necessary.
>> If "stop" was your intended word choice, please omit it.
> 
> I took your second and third changes, and added words in a separate commit
> to (hopefully) clarify "stop" as in "stop along a journey".  Please let
> me know what you think!

Now it is obvious "stop" is the word in your analogy.
Thanks,

       Akira

> 
> 							Thanx, Paul
> 
>>      Thanks, Akira
>> --
>>  advsync/memorybarriers.tex | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
>> index dd8acf8..db6d486 100644
>> --- a/advsync/memorybarriers.tex
>> +++ b/advsync/memorybarriers.tex
>> @@ -341,7 +341,7 @@ exists (1:r2=0 /\ 0:r2=0)
>>  However, if you need to implement the synchronization primitives
>>  themselves, or if you are simply interested in understanding how memory
>>  ordering and memory barriers work, read on!
>> -The first stop is
>> +The first step is
>>  Listing~\ref{lst:advsync:Memory Ordering: Store-Buffering Litmus Test}
>>  (\path{C-SB+o-mb-o+o-mb-o.litmus}),
>>  which the \co{smp_mb()} Linux-kernel full memory barrier placed between
>> @@ -613,7 +613,7 @@ Section~\ref{sec:advsync:Memory Ordering and Memory Barriers}
>>  showed that even relatively strongly ordered systems like x86
>>  can reorder prior stores with later loads, at least when the
>>  store and load are to different variables.
>> -This section buids on that result, looking at the other combinations of
>> +This section builds on that result, looking at the other combinations of
>>  loads and stores.
>>
>>  % @@@ Rationale for further reordering.
>> @@ -665,7 +665,7 @@ but no ordering is specified for the reads.
>>  Relatively strongly ordered architectures, such as x86, do enforce ordering.
>>  However, weakly ordered architectures often do
>>  not~\cite{JadeAlglave2011ppcmem}.
>> -Therefore, the \co{exists} clause on line~25 of the figure \emph{can}
>> +Therefore, the \co{exists} clause on line~25 of the listing \emph{can}
>>  trigger.
>>
>>  \begin{listing}[tbp]
>> -- 
>> 2.7.4
>>
> 
> 

