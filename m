Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53616 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726104AbfE2Naq (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 29 May 2019 09:30:46 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4TDTx0x138100
        for <perfbook@vger.kernel.org>; Wed, 29 May 2019 09:30:45 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2sst1vu19m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Wed, 29 May 2019 09:30:44 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x4TDU379138877
        for <perfbook@vger.kernel.org>; Wed, 29 May 2019 09:30:44 -0400
Date: Wed, 29 May 2019 06:30:41 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH] rcu_nest: Update description of rcu_nest.[hc]
Message-ID: <20190529133041.GY28207@linux.ibm.com>
Reply-To: paulmck@linux.ibm.com
References: <1559105262-6502-1-git-send-email-junchangwang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559105262-6502-1-git-send-email-junchangwang@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Junchang Wang <junchangwang@gmail.com>
Cc: akiyks@gmail.com, perfbook@vger.kernel.org

On Wed, May 29, 2019 at 12:47:42PM +0800, Junchang Wang wrote:
> Commit 61e0eb9cdb89 ("rcu_nest: Fix concurrency issues") fixes a few
> concurrency issues in rcu_nest.h and rcu_nest.c. This patch accordingly
> updates the description in Appendix B Toy RCU Implementations. Besides, the
> new scheme, which directly extracts snippet from rcu_nest.[hc], is applied.
> 
> 
> Signed-off-by: Junchang Wang <junchangwang@gmail.com>

Applied and pushed, thank you, Junchang!

							Thanx, Paul

> ---
> 
> Thanks again for writing and sharing perfbook. I can always find great
> pleasure in reading through a chapter of this book :-).
> 
>  CodeSamples/defer/rcu_nest.c |  35 ++++++++------
>  CodeSamples/defer/rcu_nest.h |  36 +++++++++------
>  appendix/toyrcu/toyrcu.tex   | 108 +++++++++++++++----------------------------
>  3 files changed, 81 insertions(+), 98 deletions(-)
> 
> diff --git a/CodeSamples/defer/rcu_nest.c b/CodeSamples/defer/rcu_nest.c
> index 362f466..7e36866 100644
> --- a/CodeSamples/defer/rcu_nest.c
> +++ b/CodeSamples/defer/rcu_nest.c
> @@ -21,45 +21,52 @@
>  #include "../api.h"
>  #include "rcu_nest.h"
>  
> -void synchronize_rcu(void)
> +//\begin{snippet}[labelbase=ln:defer:rcu_nest:synchronize,gobbleblank=yes,commandchars=\%\@\$]
> +void synchronize_rcu(void)				//\lnlbl{syn:b}
>  {
>  	int t;
> -
> +								//\fcvblank
>  	/* Memory barrier ensures mutation seen before grace period. */
>  
> -	smp_mb();
> +	smp_mb();					//\lnlbl{syn:mb1}
>  
>  	/* Only one synchronize_rcu() at a time. */
>  
> -	spin_lock(&rcu_gp_lock);
> +	spin_lock(&rcu_gp_lock);			//\lnlbl{syn:spinlock}
>  
>  	/* Advance to a new grace-period number, enforce ordering. */
>  
> -	WRITE_ONCE(rcu_gp_ctr, rcu_gp_ctr + RCU_GP_CTR_BOTTOM_BIT);
> -	smp_mb();
> +	WRITE_ONCE(rcu_gp_ctr, rcu_gp_ctr +		//\lnlbl{syn:incgp1}
> +			RCU_GP_CTR_BOTTOM_BIT);		//\lnlbl{syn:incgp2}
> +	smp_mb();					//\lnlbl{syn:mb2}
>  
>  	/*
>  	 * Wait until all threads are either out of their RCU read-side
>  	 * critical sections or are aware of the new grace period.
>  	 */
>  
> -	for_each_thread(t) {
> -		while (rcu_gp_ongoing(t) &&
> -		       ((READ_ONCE(per_thread(rcu_reader_gp, t)) -
> -			 rcu_gp_ctr) < 0)) {
> +	for_each_thread(t) {				//\lnlbl{syn:scan:b}
> +		while (rcu_gp_ongoing(t) &&		//\lnlbl{syn:ongoing}
> +		       ((READ_ONCE(per_thread(rcu_reader_gp, t)) -//\lnlbl{syn:lt1}
> +		          rcu_gp_ctr) < 0)) {		//\lnlbl{syn:lt2}
> +#ifndef FCV_SNIPPET
>  			/*@@@ poll(NULL, 0, 10); */
>  			barrier();
> +#else
> +			poll(NULL, 0, 10);      	//\lnlbl{syn:poll}
> +#endif
>  		}
> -	}
> +	}						//\lnlbl{syn:scan:e}
>  
>  	/* Let other synchronize_rcu() instances move ahead. */
>  
> -	spin_unlock(&rcu_gp_lock);
> +	spin_unlock(&rcu_gp_lock);			//\lnlbl{syn:spinunlock}
>  
>  	/* Ensure that any subsequent free()s happen -after- above checks. */
>  
> -	smp_mb();
> -}
> +	smp_mb();					//\lnlbl{syn:mb3}
> +}							//\lnlbl{syn:e}
> +//\end{snippet}
>  
>  #ifdef TEST
>  #define RCU_READ_NESTABLE
> diff --git a/CodeSamples/defer/rcu_nest.h b/CodeSamples/defer/rcu_nest.h
> index 7e7b7de..19a0956 100644
> --- a/CodeSamples/defer/rcu_nest.h
> +++ b/CodeSamples/defer/rcu_nest.h
> @@ -42,25 +42,28 @@ static void rcu_init(void)
>  	init_per_thread(rcu_reader_gp, 0);
>  }
>  
> -static void rcu_read_lock(void)
> +//\begin{snippet}[labelbase=ln:defer:rcu_nest:read_lock_unlock,gobbleblank=yes,commandchars=\%\@\$]
> +static void rcu_read_lock(void)				//\lnlbl{lock:b}
>  {
>  	unsigned long tmp;
>  	unsigned long *rrgp;
> -
> +								//\fcvblank
>  	/*
>  	 * If this is the outermost RCU read-side critical section,
>  	 * copy the global grace-period counter.  In either case,
>  	 * increment the nesting count held in the low-order bits.
>  	 */
>  
> -	rrgp = &__get_thread_var(rcu_reader_gp);
> +	rrgp = &__get_thread_var(rcu_reader_gp);	//\lnlbl{lock:readgp}
> +#ifndef FCV_SNIPPET
>  retry:
> -	tmp = *rrgp;
> -	if ((tmp & RCU_GP_CTR_NEST_MASK) == 0)
> -		tmp = READ_ONCE(rcu_gp_ctr);
> -	tmp++;
> -	WRITE_ONCE(*rrgp, tmp);
> -	smp_mb();
> +#endif
> +	tmp = *rrgp;					//\lnlbl{lock:wtmp1}
> +	if ((tmp & RCU_GP_CTR_NEST_MASK) == 0)		//\lnlbl{lock:checktmp}
> +		tmp = READ_ONCE(rcu_gp_ctr);		//\lnlbl{lock:wtmp2}
> +	tmp++;						//\lnlbl{lock:inctmp}
> +	WRITE_ONCE(*rrgp, tmp);				//\lnlbl{lock:writegp}
> +	smp_mb();					//\lnlbl{lock:mb1}
>  
>  	/*
>  	 * A reader could be suspended in between fetching the value of *rrgp
> @@ -71,14 +74,15 @@ retry:
>  	 * ULONG_MAX. To handle this correctly, we adopt the helper function
>  	 * ULONG_CMP_GE.
>  	 */
> -
> +#ifndef FCV_SNIPPET
>  	if (((tmp & RCU_GP_CTR_NEST_MASK) == 1) &&
>  	     ULONG_CMP_GE(READ_ONCE(rcu_gp_ctr), tmp + MAX_GP_ADV_DISTANCE)) {
>  		WRITE_ONCE(*rrgp, *rrgp - 1);
>  		goto retry;
>  	}
> +#endif
>  }
> -
> +								//\fcvblank
>  static void rcu_read_unlock(void)
>  {
>  	/*
> @@ -86,11 +90,15 @@ static void rcu_read_unlock(void)
>  	 * which had better not initially be zero.
>  	 */
>  
> -	smp_mb();
> +	smp_mb();					//\lnlbl{unlock:mb1}
> +#ifndef FCV_SNIPPET
>  #ifdef DEBUG_EXTREME
>  	BUG_ON((__get_thread_var(rcu_reader_gp) & RCU_GP_CTR_NEST_MASK) != 0);
> -#endif /* #ifdef DEBUG_EXTREME */
> -	__get_thread_var(rcu_reader_gp)--;
> +#endif /* #ifdef DEBUG_EXTREME */				//\fcvexclude
> +#endif
> +	__get_thread_var(rcu_reader_gp)--;		//\lnlbl{unlock:decgp}
>  }
> +								//\fcvblank
> +//\end{snippet}
>  
>  extern void synchronize_rcu(void);
> diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
> index ded754d..0e84b05 100644
> --- a/appendix/toyrcu/toyrcu.tex
> +++ b/appendix/toyrcu/toyrcu.tex
> @@ -1395,60 +1395,15 @@ variables.
>  \end{listing}
>  
>  \begin{listing}[tb]
> -{ \scriptsize
> -\begin{verbbox}
> - 1 static void rcu_read_lock(void)
> - 2 {
> - 3   long tmp;
> - 4   long *rrgp;
> - 5 
> - 6   rrgp = &__get_thread_var(rcu_reader_gp);
> - 7   tmp = *rrgp;
> - 8   if ((tmp & RCU_GP_CTR_NEST_MASK) == 0)
> - 9     tmp = ACCESS_ONCE(rcu_gp_ctr);
> -10   tmp++;
> -11   *rrgp = tmp;
> -12   smp_mb();
> -13 }
> -14 
> -15 static void rcu_read_unlock(void)
> -16 {
> -17   long tmp;
> -18 
> -19   smp_mb();
> -20   __get_thread_var(rcu_reader_gp)--;
> -21 }
> -22 
> -23 void synchronize_rcu(void)
> -24 {
> -25   int t;
> -26 
> -27   smp_mb();
> -28   spin_lock(&rcu_gp_lock);
> -29   ACCESS_ONCE(rcu_gp_ctr) +=
> -30     RCU_GP_CTR_BOTTOM_BIT;
> -31   smp_mb();
> -32   for_each_thread(t) {
> -33     while (rcu_gp_ongoing(t) &&
> -34            ((per_thread(rcu_reader_gp, t) -
> -35              rcu_gp_ctr) < 0)) {
> -36       poll(NULL, 0, 10);
> -37     }
> -38   }
> -39   spin_unlock(&rcu_gp_lock);
> -40   smp_mb();
> -41 }
> -\end{verbbox}
> -}
> -\centering
> -\theverbbox
> +\input{CodeSamples/defer/rcu_nest@read_lock_unlock.fcv}\vspace*{-11pt}\fvset{firstnumber=last}
> +\input{CodeSamples/defer/rcu_nest@synchronize.fcv}\fvset{firstnumber=auto}
>  \caption{Nestable RCU Using a Free-Running Counter}
>  \label{lst:app:toyrcu:Nestable RCU Using a Free-Running Counter}
>  \end{listing}
>  
>  Listing~\ref{lst:app:toyrcu:Nestable RCU Using a Free-Running Counter}
>  (\path{rcu_nest.h} and \path{rcu_nest.c})
> -show an RCU implementation based on a single global free-running counter,
> +shows an RCU implementation based on a single global free-running counter,
>  but that permits nesting of RCU read-side critical sections.
>  This nestability is accomplished by reserving the low-order bits of the
>  global \co{rcu_gp_ctr} to count nesting, using the definitions shown in
> @@ -1472,23 +1427,28 @@ reserves seven bits, for a maximum RCU read-side critical-section
>  nesting depth of 127, which should be well in excess of that needed
>  by most applications.
>  
> +\begin{lineref}[ln:defer:rcu_nest:read_lock_unlock:lock]
>  The resulting \co{rcu_read_lock()} implementation is still reasonably
>  straightforward.
> -Line~6 places a pointer to this thread's instance of \co{rcu_reader_gp}
> +Line~\lnref{readgp} places a pointer to
> +this thread's instance of \co{rcu_reader_gp}
>  into the local variable \co{rrgp}, minimizing the number of expensive
>  calls to the pthreads thread-local-state API.
> -Line~7 records the current value of \co{rcu_reader_gp} into another
> -local variable \co{tmp}, and line~8 checks to see if the low-order
> -bits are zero, which would indicate that this is the outermost
> -\co{rcu_read_lock()}.
> -If so, line~9 places the global \co{rcu_gp_ctr} into \co{tmp} because
> -the current value previously fetched by line~7 is likely to be obsolete.
> -In either case, line~10 increments the nesting depth, which you will
> -recall is stored in the seven low-order bits of the counter.
> -Line~11 stores the updated counter back into this thread's instance
> -of \co{rcu_reader_gp}, and, finally, line~12 executes a memory
> -barrier to prevent the RCU read-side critical section from bleeding out
> +Line~\lnref{wtmp1} records the current value of \co{rcu_reader_gp}
> +into another local variable \co{tmp}, and line~\lnref{checktmp} checks
> +to see if the low-order bits are zero, which would indicate that
> +this is the outermost \co{rcu_read_lock()}.
> +If so, line~\lnref{wtmp2} places the global \co{rcu_gp_ctr}
> +into \co{tmp} because the current value previously fetched by
> +line~\lnref{wtmp1} is likely to be obsolete.
> +In either case, line~\lnref{inctmp} increments the nesting depth,
> +which you will recall is stored in the seven low-order bits of the counter.
> +Line~\lnref{writegp} stores the updated counter back into this thread's
> +instance of \co{rcu_reader_gp}, and,
> +finally, line~\lnref{mb1} executes a memory barrier
> +to prevent the RCU read-side critical section from bleeding out
>  into the code preceding the call to \co{rcu_read_lock()}.
> +\end{lineref}
>  
>  In other words, this implementation of \co{rcu_read_lock()} picks up a copy
>  of the global \co{rcu_gp_ctr} unless the current invocation of
> @@ -1499,29 +1459,35 @@ Either way, it increments whatever value it fetched in order to record
>  an additional nesting level, and stores the result in the current
>  thread's instance of \co{rcu_reader_gp}.
>  
> +\begin{lineref}[ln:defer:rcu_nest:read_lock_unlock:unlock]
>  Interestingly enough, despite their \co{rcu_read_lock()} differences,
>  the implementation of \co{rcu_read_unlock()}
>  is broadly similar to that shown in
>  Section~\ref{sec:app:toyrcu:RCU Based on Free-Running Counter}.
> -Line~19 executes a memory barrier in order to prevent the RCU read-side
> +Line~\lnref{mb1} executes a memory barrier
> +in order to prevent the RCU read-side
>  critical section from bleeding out into code following the call
>  to \co{rcu_read_unlock()}, and
> -line~20 decrements this thread's instance of \co{rcu_reader_gp},
> +line~\lnref{decgp} decrements this thread's instance of \co{rcu_reader_gp},
>  which has the effect of decrementing the nesting count contained in
>  \co{rcu_reader_gp}'s low-order bits.
>  Debugging versions of this primitive would check (before decrementing!)
>  that these low-order bits were non-zero.
> +\end{lineref}
>  
> +\begin{lineref}[ln:defer:rcu_nest:synchronize:syn]
>  The implementation of \co{synchronize_rcu()} is quite similar to
>  that shown in
>  Section~\ref{sec:app:toyrcu:RCU Based on Free-Running Counter}.
>  There are two differences.
> -The first is that lines~29 and~30 adds \co{RCU_GP_CTR_BOTTOM_BIT}
> -to the global \co{rcu_gp_ctr} instead of adding the constant ``2'',
> -and the second is that the comparison on line~33 has been abstracted
> -out to a separate function, where it checks the bit indicated
> -by \co{RCU_GP_CTR_BOTTOM_BIT} instead of unconditionally checking
> -the low-order bit.
> +The first is that lines~\lnref{incgp1} and~\lnref{incgp2}
> +adds \co{RCU_GP_CTR_BOTTOM_BIT} to the global \co{rcu_gp_ctr}
> +instead of adding the constant ``2'',
> +and the second is that the comparison on line~\lnref{ongoing}
> +has been abstracted out to a separate function,
> +where it checks the bit indicated by \co{RCU_GP_CTR_BOTTOM_BIT}
> +instead of unconditionally checking the low-order bit.
> +\end{lineref}
>  
>  This approach achieves read-side performance almost equal to that
>  shown in
> @@ -1562,10 +1528,12 @@ overhead.
>  	how could you double the time required to overflow the global
>  	\co{rcu_gp_ctr}?
>  \QuickQuizAnswer{
> +	\begin{lineref}[ln:defer:rcu_nest:synchronize:syn]
>  	One way would be to replace the magnitude comparison on
> -	lines~33 and 34 with an inequality check of the per-thread
> -	\co{rcu_reader_gp} variable against
> +	lines~\lnref{lt1} and \lnref{lt2} with an inequality check of
> +	the per-thread \co{rcu_reader_gp} variable against
>  	\co{rcu_gp_ctr+RCU_GP_CTR_BOTTOM_BIT}.
> +	\end{lineref}
>  } \QuickQuizEnd
>  
>  \QuickQuiz{}
> -- 
> 2.7.4
> 

