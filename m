Return-Path: <SRS0=3esZ=IR=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7FnagnG31KFqHag1Re57Ghv9YfHMxgcm/AyMAW/1tbk=;
        b=fEL9Q5WEUu5XqvVWVMO3cN+JEmO2rBp8Y1sualm+uGz94rhgbBulf7H8kIdKdvC1rJ
         CYvx9YYEr7I3ligSEFfoX+qWTpHqPWTy8f+Rfdu6pX4D3QhTRpGnYCMmTnJH0Bkw14UD
         2V/2GBQZQNfB49Tab5Kdv96lQZrKiD933MI4BodEQuSJLrNGcK8S3Rv/FTZhpvMr3v+a
         cnAIp5zty+ewnrLm4L/03MpGqvW3QEW1bGIrzau6GSjxvSK8hM9vxkoO0qNBOWALU11C
         mn6SbGE3akvvGaV2iORueOO4p1/YUo93ZErr9EQD8lphbFLFwWxhfLRD0/9So7RuzJbv
         56zA==
Subject: Re: [GIT PULL -perfbook] Minor fixes and update for Edition 2, take 5
References: <6e94b800-3cc0-3837-6fc7-4d330dad45d2@gmail.com>
 <20210319192136.GP2696@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <9c3d6825-c9a6-5a00-df1f-089876ccf6a5@gmail.com>
Date: Sat, 20 Mar 2021 08:34:01 +0900
MIME-Version: 1.0
In-Reply-To: <20210319192136.GP2696@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Fri, 19 Mar 2021 12:21:36 -0700, Paul E. McKenney wrote:
> On Sat, Mar 20, 2021 at 12:01:45AM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> Today's pull request consists of minor typo fixes and an update only.
>>
>> However, I'm not sure if Patches 6/7 and 7/7 are really the right fixes
>> or not.
>> So please have a closer look at them.
> 
> They look good, thank you!  I have pulled this series and pushed it out.
> 
>>         Thanks, Akira
>>
>> (Please find a PS. part at the bottom.)
>>
>> ---------------
>> The following changes since commit 82599ee517da15ce3957bc94b82f8702a2357d14:
>>
>>   memorder: Fix typos and grammar, take two (2021-03-18 17:29:17 -0700)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/akiyks/perfbook.git tags/for-paul-2021.03.19a
>>
>> for you to fetch changes up to 0b1692098fb87a4c1d5f2fec9c078ee4462aac85:
>>
>>   advsync: Use Oxford comma (2021-03-19 22:19:10 +0900)
>>
>> ----------------------------------------------------------------
>> Akira Yokosawa (7):
>>       memorder: Fix staccato of 'another'
>>       count: Fix typo
>>       count: Move ',' to proper position
>>       toolsoftrade: Fix typo
>>       toolstotrade: Use path of atomic_t.txt under Linux-kernel source tree
>>       advsync: Fix typo
>>       advsync: Use Oxford comma
>>
>>  advsync/advsync.tex           | 4 ++--
>>  count/count.tex               | 6 +++---
>>  memorder/memorder.tex         | 2 +-
>>  toolsoftrade/toolsoftrade.tex | 8 +++++---
>>  4 files changed, 11 insertions(+), 9 deletions(-)
>>
>> ---------------------
>> PS.
>>
>> Looking at the Glossaries, I thought entries of "Concurrent"
>> and "Parallel" were missing.
>>
>> And you use these words almost interchangeably.
>>
>> (In-)distinction of them is the topic of Appendix A.2.
>>
>> So maybe it might help readers to put a footnote near the first use
>> of "parallel" telling that in this book, parallel and concurrent are
>> used as synonyms, and cite Appendix A.2.
>>
>> To make this point even clearer, adding entries like
>>
>>   Concurrent: In this book, synonym of parallel.
>>
>>   Parallel: In this book, synonym of concurrent.
>>
>> in the Glossaries might help readers.
>>
>> Thoughts?
> 
> Like this?

Looks good to me.

        Thanks, Akira

> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> diff --git a/glossary.tex b/glossary.tex
> index da54482..c6c9c62 100644
> --- a/glossary.tex
> +++ b/glossary.tex
> @@ -145,6 +145,12 @@
>  \item[Communication Miss:]\index{Communication miss}
>  	A cache miss incurred because some other CPU has written to
>  	the cache line since the last time this CPU accessed it.
> +\item[Concurrent:]\index{Concurrent}
> +	In this book, a synonym of parallel.
> +	Please see \cref{sec:app:questions:What is the Difference Between ``Concurrent'' and ``Parallel''?}
> +	on \cpageref{sec:app:questions:What is the Difference Between ``Concurrent'' and ``Parallel''?}
> +	for a discussion of the recent distinction between these two
> +	terms.
>  \item[Critical Section:]\index{Critical section}
>  	A section of code guarded by some synchronization mechanism,
>  	so that its execution constrained by that primitive.
> @@ -348,6 +354,12 @@
>  	directly to the work that must be accomplished.
>  	For example, lock acquisition and release is normally considered
>  	to be overhead, and specifically to be synchronization overhead.
> +\item[Parallel:]\index{Parallel}
> +	In this book, a synonym of concurrent.
> +	Please see \cref{sec:app:questions:What is the Difference Between ``Concurrent'' and ``Parallel''?}
> +	on \cpageref{sec:app:questions:What is the Difference Between ``Concurrent'' and ``Parallel''?}
> +	for a discussion of the recent distinction between these two
> +	terms.
>  \item[Performance:]\index{Performance}
>  	Rate at which work is done, expressed as work per unit time.
>  	If this work is fully serialized, then the performance will
> 
