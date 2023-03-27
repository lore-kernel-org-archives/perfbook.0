Return-Path: <SRS0=bjAq=7T=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679881584;
        h=content-transfer-encoding:in-reply-to:cc:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1djAEjkBqFgMX0yU+Nzq0+N6WZZIMKblgkDJCdG9ZhY=;
        b=FBHqkfVxiNMN9Ff8FjNB+tt/gNwNvvT6HD3Vj7gFGvbJC8DXqFKRf4iAiFWNdhzO1b
         Hq5WUejnmavTeD56FKAiDcqaBlMfZD2zbmyXeP8GXE+/7CTxDQ+1tqn6W1gvxPb7enwQ
         dKm0f/Po9hnTFK6kcN3YTlmIkgJnIkuyOHznMZ3FmTI3Nly38DgdvE3m4FYhZbZs9XfS
         aer5gMBzXewYpayfTfFVxf87TMuYR6j1ddrTXOIEDqPaRqYowI+6Zz0+I7Hwbg7ARoN4
         crn6EPUXC6o7ToKkwLNwVK2nDR2bZtOznKYa86bRVqqvjm0t/ZU/CeV+D5thqsfK/gK3
         GluQ==
Message-ID: <0a381404-e40d-268d-da91-f8c48753e39e@gmail.com>
Date: Mon, 27 Mar 2023 10:46:21 +0900
MIME-Version: 1.0
Subject: Re: [PATCH] CodeSamples/count: add necessary memory barrier
Content-Language: en-US
References: <20230326162828.165472-1-mmpgouride@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230326162828.165472-1-mmpgouride@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: Alan Huang <mmpgouride@gmail.com>
Cc: paulmck@kernel.org, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hello Alan,

On Sun, 26 Mar 2023 12:28:28 -0400, Alan Huang wrote:
> This patch add two necessary memory barriers, the first one added in
> flush_local_count makes sure the reading from theftp[t] happens before
> the reading from counterp[t]. The litmus testing below represents the
> pattern, and the result is "Sometimes":

Nice catch!

> 
> C counter_sig
> 
> {}
> 
> P0(int *theft, int *counter)
> {
>     int r0;
>     int r1;
> 
>     r0 = READ_ONCE(*theft);
>     r1 = READ_ONCE(*counter);
> }
> 
> P1(int *theft, int *counter)
> {
>     WRITE_ONCE(*counter, 1);
>     smp_mb();
>     WRITE_ONCE(*theft, 1);
> }
> 
> exists (0:r0=1 /\ 0:r1=0)

To address this, instead of heavy-weight smp_mb(),
P0() can use smp_load_acquire():

P0(int *theft, int *counter)
{
    int r0;
    int r1;

    r0 = smp_load_acquire(theft);
    r1 = READ_ONCE(*counter);
}

> 
> Second memory barrier is added to make sure that setting counterp[t]
> happens before the setting theftp[p] to THEFT_IDLE. Here is the litmus
> testing, The result is "Sometimes":
> 
> C counter_sig_2
> 
> {
>     int theft = 1;
>     int counter = 1;
> }
> 
> P0(int *theft, int *counter)
> {
>     WRITE_ONCE(*counter, 0);
>     WRITE_ONCE(*theft, 0);
> }
> 
> P1(int *theft, int *counter)
> {
>     if (READ_ONCE(*theft) == 0)
>     {
>         smp_mb();
>         WRITE_ONCE(*counter, READ_ONCE(*counter)+1);
>     }
> }
> 
> P2(int *counter)
> {
>     int r0;
> 
>     r0 = READ_ONCE(*counter);
> }
> 
> exists (2:r0=2)

Similarly, P0() can use smp_store_release():

P0(int *theft, int *counter)
{
    WRITE_ONCE(*counter, 0);
    smp_store_release(theft, 0);
}

        Thanks, Akira

> 
> Note that I added one smp_mb() in P1's "if" statement,
> because in add_count/sub_count's fast path, there is a
> control dependency.
> 
> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
> ---
>  CodeSamples/count/count_lim_sig.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/CodeSamples/count/count_lim_sig.c b/CodeSamples/count/count_lim_sig.c
> index 023d6215..7bfeb004 100644
> --- a/CodeSamples/count/count_lim_sig.c
> +++ b/CodeSamples/count/count_lim_sig.c
> @@ -86,10 +86,12 @@ static void flush_local_count(void)			//\lnlbl{flush:b}
>  			if (READ_ONCE(*theftp[t]) == THEFT_REQ)//\lnlbl{flush:check:REQ}
>  				pthread_kill(tid, SIGUSR1);//\lnlbl{flush:signal2}
>  		}					//\lnlbl{flush:loop3:e}
> +		smp_mb();
>  		globalcount += *counterp[t];		//\lnlbl{flush:thiev:b}
>  		*counterp[t] = 0;
>  		globalreserve -= *countermaxp[t];
>  		*countermaxp[t] = 0;			//\lnlbl{flush:thiev:e}
> +		smp_mb();
>  		WRITE_ONCE(*theftp[t], THEFT_IDLE);	//\lnlbl{flush:IDLE}
>  	}						//\lnlbl{flush:loop2:e}
>  }							//\lnlbl{flush:e}
