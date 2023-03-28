Return-Path: <SRS0=+rL7=7U=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680047036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PBEdrApKZY/c5aqBni2mWCSBZzAJx/FM7H66cUIhFLw=;
        b=m21o9xtjsmQCZS+Cfc0Q17FJSm/gnnNwB4H+VJo7RxDn7hNUI0/7SMdOYkPp2Pimvx
         9LgB1W6mxLGga26ZfOb+zUTBnlqRLHs7NfyuzuLuaDVAV4BpDfAUknqjt1j/2quutvpq
         qPJRGwZQQoMJMhCFf7deErAyl5frVAS9mTdkFNHQQxrm+EC2ESoulnpMj7wBwhoZ8zw3
         9mVsZHIQH5SblhhFj3FTw+Kes/Syq0n3UXBBb6pIqg4TD4QN2g3vzmHMWAdCAW+kfv7t
         2fVNPk0EcmG1YI0AcsUdRk/ghceMewYqIfksmKSjGGM8+ElzbKpR8k6pI7T7BL0X+qh0
         msHw==
Message-ID: <116de201-9df8-aa40-46a3-eb872bdfb9d9@gmail.com>
Date: Wed, 29 Mar 2023 08:43:33 +0900
MIME-Version: 1.0
Subject: Re: [PATCH v3] CodeSamples/count: add necessary partial memory
 barriers
References: <20230328145824.632910-1-mmpgouride@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230328145824.632910-1-mmpgouride@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: Alan Huang <mmpgouride@gmail.com>, paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Tue, 28 Mar 2023 10:58:24 -0400, Alan Huang wrote:
> This patch add several necessary partial memory barriers, the first one
> change READ_ONCE to smp_load_acquire to makes sure the reading from theftp[t]
> happens before the reading from counterp[t]. The litmus testing below
> represents the original code pattern, and the result is "Sometimes":
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
> 
> Second one change WRITE_ONCE to smp_store_release to make sure that setting
> counterp[t] happens before the setting theftp[p] to THEFT_IDLE. Here is the
> litmus testing, The result is "Sometimes":
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
> 
> Note that I also changed the reading of theft variable
> to smp_load_acquire in add_count/sub_count's fast path
> to make sure that reading theft happens before reading
> counter.
> 
> Signed-off-by: Alan Huang <mmpgouride@gmail.com>

Looks good to me.
Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

Paul, there is a question for you.
Please see below.

> ---
>  CodeSamples/count/count_lim_sig.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/CodeSamples/count/count_lim_sig.c b/CodeSamples/count/count_lim_sig.c
> index 023d6215..59da8077 100644
> --- a/CodeSamples/count/count_lim_sig.c
> +++ b/CodeSamples/count/count_lim_sig.c
> @@ -81,7 +81,7 @@ static void flush_local_count(void)			//\lnlbl{flush:b}
>  	for_each_tid(t, tid) {				//\lnlbl{flush:loop2:b}
>  		if (theftp[t] == NULL)			//\lnlbl{flush:skip:nonexist}
>  			continue;			//\lnlbl{flush:next2}
> -		while (READ_ONCE(*theftp[t]) != THEFT_READY) {//\lnlbl{flush:loop3:b}
> +		while (smp_load_acquire(theftp[t]) != THEFT_READY) {//\lnlbl{flush:loop3:b}
>  			poll(NULL, 0, 1);		//\lnlbl{flush:block}
>  			if (READ_ONCE(*theftp[t]) == THEFT_REQ)//\lnlbl{flush:check:REQ}
>  				pthread_kill(tid, SIGUSR1);//\lnlbl{flush:signal2}
> @@ -90,7 +90,7 @@ static void flush_local_count(void)			//\lnlbl{flush:b}
>  		*counterp[t] = 0;
>  		globalreserve -= *countermaxp[t];
>  		*countermaxp[t] = 0;			//\lnlbl{flush:thiev:e}
> -		WRITE_ONCE(*theftp[t], THEFT_IDLE);	//\lnlbl{flush:IDLE}
> +		smp_store_release(theftp[t], THEFT_IDLE);	//\lnlbl{flush:IDLE}
>  	}						//\lnlbl{flush:loop2:e}
>  }							//\lnlbl{flush:e}
>  
> @@ -116,7 +116,7 @@ int add_count(unsigned long delta)			//\lnlbl{b}
>  
>  	WRITE_ONCE(counting, 1);			//\lnlbl{fast:b}
>  	barrier();					//\lnlbl{barrier:1}
> -	if (READ_ONCE(theft) <= THEFT_REQ &&		//\lnlbl{check:b}
> +	if (smp_load_acquire(&theft) <= THEFT_REQ &&		//\lnlbl{check:b}
>  	    countermax - counter >= delta) {		//\lnlbl{check:e}
>  		WRITE_ONCE(counter, counter + delta);	//\lnlbl{add:f}
>  		fastpath = 1;				//\lnlbl{fasttaken}
> @@ -155,7 +155,7 @@ int sub_count(unsigned long delta)
>  
>  	WRITE_ONCE(counting, 1);
>  	barrier();
> -	if (READ_ONCE(theft) <= THEFT_REQ &&
> +	if (smp_load_acquire(&theft) <= THEFT_REQ &&
>  	    counter >= delta) {
>  		WRITE_ONCE(counter, counter - delta);
>  		fastpath = 1;

In add_count() and sub_count(), is the plain accesses to counter
guaranteed to see the value stored in flush_local_count()?

I'm asking because counter is declared as a thread-local variable:

In this code, as each of the plain loads of counter is the first
access to the variable in each function, there is not much room
for compilers to exploit the plainness, I suppose.

What do you think?

        Thanks, Akira

