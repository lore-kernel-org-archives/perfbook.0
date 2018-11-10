Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ItD3Z4aKOQpN7N01c6FwjgymsN/GnS5XIHcUOfSD9Us=;
        b=mA6ZExeJ25tprX2xa+69J9tdLzw4MfTfWld1uL+nN06tRV04ESqEFXAPI3r+5nOHQE
         Z1tDo2EqsH9cV2RE87SEwCJH/rPlXTzkOxGqYApb/3bFM7ntRghZnCOOI19Q2FgoFkiI
         lM44vpOfRftuXquwqU9FGeI763jUSop5kpKlS7z+ZpqAUGZi2JNxX91zT9TD2MCHKPua
         ziz03fRzsV2/NcVzNzzfuNoIh0cdRgXcQcjFV9ghKNFjqBRUtKMkg5UeMAPJOD6//eda
         D4WLSv5AdUVc0XPsQG8fmRIqhnz1Zmpvn7vgT7beUbLrQS8CqOnh49hbq9LLHi4rO8zu
         39vg==
Subject: Re: [PATCH] cpu: Fix typos
References: <1541854161-4556-1-git-send-email-junchangwang@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <52e466f0-b57a-ed04-2ac5-7fb2022e82c7@gmail.com>
Date: Sun, 11 Nov 2018 08:51:33 +0900
MIME-Version: 1.0
In-Reply-To: <1541854161-4556-1-git-send-email-junchangwang@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Junchang Wang <junchangwang@gmail.com>, "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/11/10 20:49:21 +0800, Junchang Wang wrote:
> Signed-off-by: Junchang Wang <junchangwang@gmail.com>
> ---
> Hi Paul,
> 
> This is the only patch for Chapter CPU. Please take a look.
> 
> 
> Thanks,
> --Junchang
> 
> --
>  cpu/overheads.tex | 4 ++--
>  cpu/overview.tex  | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/cpu/overheads.tex b/cpu/overheads.tex
> index 2474cfe..17b120b 100644
> --- a/cpu/overheads.tex
> +++ b/cpu/overheads.tex
> @@ -155,7 +155,7 @@ displayed in
>  Table~\ref{tab:cpu:Performance of Synchronization Mechanisms on 4-CPU 1.8GHz AMD Opteron 844 System}.
>  This system's clock period rounds to 0.6\,ns.
>  Although it is not unusual for modern microprocessors to be able to
> -retire multiple instructions per clock period, the operations's costs are
> +retire multiple instructions per clock period, the operations' costs are
>  nevertheless normalized to a clock period in the third column, labeled
>  ``Ratio''.
>  The first thing to note about this table is the large values of many of
> @@ -360,7 +360,7 @@ It is clear that the combination of speculative execution and cloud
>  computing needs more than a bit of rework!
>  
>  A fifth hardware optimization is large caches, allowing individual
> -CPUs to operate on larger datasets without incuring expensive cache
> +CPUs to operate on larger datasets without incurring expensive cache
>  misses.

Nice catches!

>  Although large caches can degrade energy efficiency and cache-miss
>  latency, the ever-growing cache sizes on production microprocessors
> diff --git a/cpu/overview.tex b/cpu/overview.tex
> index 071cf7c..9e91a7b 100644
> --- a/cpu/overview.tex
> +++ b/cpu/overview.tex
> @@ -15,7 +15,7 @@ where the race always goes to the swiftest.
>  \ContributedBy{Figure}{fig:cpu:CPU Performance at its Best}{Melissa Broussard}
>  \end{figure}
>  
> -Although there are a few CPU-bound benchmarks that approach the ideal
> +Although there are a few CPU-bound benchmarks that approach the ideal case
>  shown in Figure~\ref{fig:cpu:CPU Performance at its Best},

"ideal" can be used as a noun. I don't think this hunk is necessary.

        Thanks, Akira

>  the typical program more closely resembles an obstacle course than
>  a race track.
> 

