Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rquD8Gs8LOruUBS/Z3xzL249B+oQReGgMuF8D06PtZ0=;
        b=JhSEXzj+NCo902NAqVWB0mVmsX9fYbgiF71cYy1RBZ9v7LPIBU0N+I+WuTYcYOy/wu
         /D3LuWlmyWRy+AY92ffixC+BFI2MlyYEGE9c1BWGBLo6kvYwAueUVAs2k1Mzl7Bn0YWZ
         Auks5BootGxAZET5rouJVlOThXwNF9XXu69u8UatsPk0ZqqoeTHqSO6CnCNzHIRkOhNS
         7OdPtbKs2AcDieov+eNWo6AaE4TJVdvbk6f5HOCLWbIA0HnqwQ4Z2E/ePe7+/yW7cULG
         0F7y2nqDcV3w/+j4H8qDp3/MSidlh8kDrEhsoN3/LnHn9wVUKj+uUVZRAig5NN36bAkX
         M3Ag==
Subject: Re: POSIX Proess Creation and Destruction nit-picking
References: <CAJbg=FVgUTZqD2Xda17Lbk-6xc_GkRX8c_iqYx8W-vuBnfyutA@mail.gmail.com>
 <5ed234bd-dcc8-692f-544e-50413cffa73d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7b419fda-7543-04a7-eb4a-3e93090a3b2a@gmail.com>
Date: Sun, 28 Apr 2019 08:00:28 +0900
MIME-Version: 1.0
In-Reply-To: <5ed234bd-dcc8-692f-544e-50413cffa73d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@linux.ibm.com>, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sun, 28 Apr 2019 01:19:25 +0900, Akira Yokosawa wrote:
> Hello Elad,
> 
> On Fri, 26 Apr 2019 07:23:20 -0400, Elad Lahav wrote:
>> The following issues may not be deemed important enough to fix, but
>> I'll point them out nevertheless:
>>
> [...]
>> - Listing 4.2 could have just used waitpid() instead of the loop.
> 
> Listing 4.2 shows our implementation of waitall() function used under
> CodeSamples/ directory of perfbook's repository.
> Your feedback prompted me to review the listing and I noticed that
> the name of the function is missing there.
> 
> I fixed the position of extraction markers in api-pthreads.h 
> 
> Please find the patch below.

Hi Elad,

I might not be clear enough, but could you let me know if you think
the patch looks reasonable.  I mean, if you think this change is not
related to your feed back, I'll drop the Reported-by tag.

        Thanks, Akira

> 
>> If I were really a nit-picking person I would have pointed out the
>> various places in chapters 2 and 3 where infinitives are being split,
>> but I'm not so I won't ;-).
> 
> As far as I am concerned, I like the colloquial tone of perfbook
> and have no trouble seeing split infinitives as long as they are easy
> to understand. Just a non-native speaker's opinion.
> 
>         Thanks, Akira
> 
>> --Elad
>>
> 
> ----------8<------------------
> From fec0187d2cb12fdf13a8c040c447c37c1bd5e183 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 28 Apr 2019 00:41:02 +0900
> Subject: [PATCH] toolsoftrade: Fix extraction range of waitall()
> 
> Commit 29d0c7c185f2 ("toolsoftrade: Add labels in code samples as
> comments") failed to include the function name and the closing brace
> in the snippet of waitall() extracted from api-pthreads.h.
> 
> The original snippet removed in commit a62cf8469280 ("toolsoftrade:
> Reference line in code snippets by label") contained those
> lines.
> 
> Restore them by repositioning meta commands in api-pthreads.h
> 
> Reported-by: Elad Lahav <e2lahav@gmail.com>
> Fixes: 29d0c7c185f2 ("toolsoftrade: Add labels in code samples as comments")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  CodeSamples/api-pthreads/api-pthreads.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/CodeSamples/api-pthreads/api-pthreads.h b/CodeSamples/api-pthreads/api-pthreads.h
> index f5510f01..5d17a9bd 100644
> --- a/CodeSamples/api-pthreads/api-pthreads.h
> +++ b/CodeSamples/api-pthreads/api-pthreads.h
> @@ -287,9 +287,9 @@ static __inline__ void wait_all_threads(void)
>  /*
>   * Wait on all child processes.
>   */
> +// \begin{snippet}[labelbase=ln:api-pthreads:api-pthreads:waitall,commandchars=\%\[\]]
>  static __inline__ void waitall(void)
>  {
> -// \begin{snippet}[labelbase=ln:api-pthreads:api-pthreads:waitall,commandchars=\%\[\]]
>  	int pid;
>  	int status;
>  
> @@ -303,8 +303,8 @@ static __inline__ void waitall(void)
>  		}
>  		poll(NULL, 0, 1);		//\fcvexclude
>  	}					//\lnlbl{loopb}
> -// \end{snippet}
>  }
> +// \end{snippet}
>  
>  static __inline__ void run_on(int cpu)
>  {
> 

