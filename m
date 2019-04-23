Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oDII+uYdFkxghb+7KROMu61k4DogNCj0a8NBp+IUrco=;
        b=bYX990NvJhdIb3SswCMQ3I7ouLrXdNYHCWMr0AG0k5UF//33872Woq6nDNLOQGiYjM
         qmh3bZO3Xxj1r/SEEk4LG2oBcCR2wIfmYii7iGhnA34gVhS0AS+PvJ8p3DCNwWHjlDjR
         8FgGfjJUy6FF+TszShWe/oW3+QsfC3R1pQyjEjSu5pDRFsMMnfm/zCih2Ciq3WiRSACg
         20FbnSQqqqjhbv3Ry4Shtt/t1OVjnC0BZEX3hY748VJuftVH/7NuIhHID9e2Ey2A1FCu
         QcssAhB6V7d8XDHjsZMBNybNu22bbLpzZduDGDJ+1ZSdQ9LhtfdbKMupUYqSlCiSq//2
         /FLA==
Subject: Re: [PATCH 1/4] rcu: Use READ_ONCE() and WRITE_ONCE() for shared
 variable rcu_reader_gp
References: <1556027825-21106-1-git-send-email-junchangwang@gmail.com>
 <1556027825-21106-2-git-send-email-junchangwang@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a99cc114-312b-2c28-9fdd-3106fe8bc9da@gmail.com>
Date: Wed, 24 Apr 2019 00:33:48 +0900
MIME-Version: 1.0
In-Reply-To: <1556027825-21106-2-git-send-email-junchangwang@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Junchang Wang <junchangwang@gmail.com>, paulmck@linux.ibm.com
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Junchang,

On Tue, 23 Apr 2019 21:57:02 +0800, Junchang Wang wrote:
> Replace the plain accesses and the use of ACCESS_ONCE() with
> READ_ONCE()/WRITE_ONCE(). And then update the tex file accordingly.
> 
> Signed-off-by: Junchang Wang <junchangwang@gmail.com>
> ---
>  CodeSamples/defer/rcu.c    | 5 +++--
>  CodeSamples/defer/rcu.h    | 5 +++--
>  appendix/toyrcu/toyrcu.tex | 8 ++++----
>  3 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/CodeSamples/defer/rcu.c b/CodeSamples/defer/rcu.c
> index 4b868cc..e4fddbc 100644
> --- a/CodeSamples/defer/rcu.c
> +++ b/CodeSamples/defer/rcu.c
> @@ -35,7 +35,7 @@ void synchronize_rcu(void)
>  
>  	/* Advance to a new grace-period number, enforce ordering. */
>  
> -	rcu_gp_ctr += 2;
> +	WRITE_ONCE(rcu_gp_ctr, READ_ONCE(rcu_gp_ctr) + 2);

This is inside of critical section protecting update of rcu_gp_ctr, and
READ_ONCE() is not necessary. On the other hand, WRITE_ONCE() is necessary
because other CPUs/threads can do racy read accesses.

>  	smp_mb();
>  
>  	/*
> @@ -45,7 +45,8 @@ void synchronize_rcu(void)
>  
>  	for_each_thread(t) {
>  		while ((per_thread(rcu_reader_gp, t) & 0x1) &&
> -		       ((per_thread(rcu_reader_gp, t) - rcu_gp_ctr) < 0)) {
> +		       ((per_thread(rcu_reader_gp, t) -
> +			 READ_ONCE(rcu_gp_ctr)) < 0)) {

This READ_ONCE() is not necessary, neither.

Please refer to Section 4.3.4.4 "Avoiding Data Races" for where to use
READ/WRITE_ONCE(). You might want to self review 2/4 and 3/4 of this patch
set.

>  			/*@@@ poll(NULL, 0, 10); */
>  			barrier();
>  		}
> diff --git a/CodeSamples/defer/rcu.h b/CodeSamples/defer/rcu.h
> index f493f8b..534709e 100644
> --- a/CodeSamples/defer/rcu.h
> +++ b/CodeSamples/defer/rcu.h
> @@ -41,7 +41,8 @@ static inline void rcu_read_lock(void)
>  	 * periodic per-thread processing.)
>  	 */
>  
> -	__get_thread_var(rcu_reader_gp) = rcu_gp_ctr + 1;
> +	__get_thread_var(rcu_reader_gp) =
> +		READ_ONCE(rcu_gp_ctr) + 1;
>  	smp_mb();
>  }
>  
> @@ -55,7 +56,7 @@ static inline void rcu_read_unlock(void)
>  	 */
>  
>  	smp_mb();
> -	__get_thread_var(rcu_reader_gp) = rcu_gp_ctr;
> +	__get_thread_var(rcu_reader_gp) = READ_ONCE(rcu_gp_ctr);
>  }
>  
>  extern void synchronize_rcu(void);
> diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
> index c0a45a8..d9a7055 100644
> --- a/appendix/toyrcu/toyrcu.tex
> +++ b/appendix/toyrcu/toyrcu.tex

Or you can extract the snippet by using \begin{snippet} meta commands.
That is a preferred way if there is code under CodeSamples/.
Examples of the scheme can be found in (not yet up-to-date) Style Guide
(D.3.1.1).

That said, you are not obliged to do so. Conversion to the new scheme is
on my to-do list anyway.

        Thanks, Akira

> @@ -1223,7 +1223,7 @@ thread-local accesses to one, as is done in the next section.
>   1 static void rcu_read_lock(void)
>   2 {
>   3   __get_thread_var(rcu_reader_gp) =
> - 4     ACCESS_ONCE(rcu_gp_ctr) + 1;
> + 4     READ_ONCE(rcu_gp_ctr) + 1;
>   5   smp_mb();
>   6 }
>   7 
> @@ -1231,7 +1231,7 @@ thread-local accesses to one, as is done in the next section.
>   9 {
>  10   smp_mb();
>  11   __get_thread_var(rcu_reader_gp) =
> -12     ACCESS_ONCE(rcu_gp_ctr);
> +12     READ_ONCE(rcu_gp_ctr);
>  13 }
>  14 
>  15 void synchronize_rcu(void)
> @@ -1240,12 +1240,12 @@ thread-local accesses to one, as is done in the next section.
>  18 
>  19   smp_mb();
>  20   spin_lock(&rcu_gp_lock);
> -21   ACCESS_ONCE(rcu_gp_ctr) += 2;
> +21   WRITE_ONCE(rcu_gp_ctr, READ_ONCE(rcu_gp_ctr) + 2);
>  22   smp_mb();
>  23   for_each_thread(t) {
>  24     while ((per_thread(rcu_reader_gp, t) & 0x1) &&
>  25             ((per_thread(rcu_reader_gp, t) -
> -26               ACCESS_ONCE(rcu_gp_ctr)) < 0)) {
> +26               READ_ONCE(rcu_gp_ctr)) < 0)) {
>  27       poll(NULL, 0, 10);
>  28     }
>  29   }
> 

