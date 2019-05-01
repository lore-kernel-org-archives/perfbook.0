Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60070 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726005AbfEARPI (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 1 May 2019 13:15:08 -0400
Date: Wed, 1 May 2019 10:15:03 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH v2] toolsoftrade: Fix extraction range of waitall()
Message-ID: <20190501171503.GU3923@linux.ibm.com>
Reply-To: paulmck@linux.ibm.com
References: <CAJbg=FVgUTZqD2Xda17Lbk-6xc_GkRX8c_iqYx8W-vuBnfyutA@mail.gmail.com>
 <5ed234bd-dcc8-692f-544e-50413cffa73d@gmail.com>
 <063cfc13-f047-59d1-8679-be56f1735f80@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <063cfc13-f047-59d1-8679-be56f1735f80@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Elad Lahav <e2lahav@gmail.com>, perfbook@vger.kernel.org

On Tue, Apr 30, 2019 at 09:12:16AM +0900, Akira Yokosawa wrote:
> >From 23e640facc8198d97ec712e5b79aa3a69a270eb7 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 28 Apr 2019 00:41:02 +0900
> Subject: [PATCH v2] toolsoftrade: Fix extraction range of waitall()
> 
> Commit 29d0c7c185f2 ("toolsoftrade: Add labels in code samples as
> comments") failed to include the function name and the closing brace
> in the snippet of waitall() extracted from api-pthreads.h.
> 
> The original snippet removed in commit a62cf8469280 ("toolsoftrade:
> Reference line in code snippets by label") contained those
> lines.
> 
> Fix it by moving meta commands in api-pthreads.h
> 
> Fixes: 29d0c7c185f2 ("toolsoftrade: Add labels in code samples as comments")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
> v1 -> v2: As per Elad's POV, remove Reported-by tag.
> 
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
> -- 
> 2.17.1
> 
> 

