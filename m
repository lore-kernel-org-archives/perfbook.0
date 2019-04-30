Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/gePwjU+VOhJt+QE57suTgR1JVGA9z/B3fORC0jRcCc=;
        b=N0r5c2rZWQr49iTRokVhze9Dcl+ExAha1LrJigm26O7uAuCdaKylEoCf2vBwVHT5yu
         fOOhlsXj7wLlRBX/jfg+z/vOvfHAGYyQtGO1SKn+TLU84BX8y4yF3doBztFjpB9KO2ot
         dQvlLAkRybkxfg+qJHuVMbKZMoo7wcH1UCxK7Ry4D7h/7fAmcS7ixxZ+p30wUnwfHj8Q
         /Bkapze1oDaLVw/n93INbSdPOlU3UDM4WmT0JBBXjkjNIGxvGBhxdTkE24o+ka4DffGO
         LF/ta+IErXljw3QyU+5EsVi2l3byxTFAIvze2adpF3fig2gI5easXuSMX+JZkKFGJyDH
         zx6Q==
Subject: Re: [PATCH v3 2/2] rcu_qs: Use READ_ONCE() AND WRITE_ONCE() for
 shared variable rcu_gp_ctr
References: <1556548724-17844-1-git-send-email-junchangwang@gmail.com>
 <1556548724-17844-3-git-send-email-junchangwang@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <0c9d589e-3f56-6b96-63b1-b477defe195f@gmail.com>
Date: Tue, 30 Apr 2019 17:53:17 +0900
MIME-Version: 1.0
In-Reply-To: <1556548724-17844-3-git-send-email-junchangwang@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Junchang Wang <junchangwang@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.ibm.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Junchang,

Please find inline comments below.

On Mon, 29 Apr 2019 22:38:44 +0800, Junchang Wang wrote:
> Replace the plain accesses with READ_ONCE()/WRITE_ONCE(). And then update

s/the plain/racy plain/

> the tex file accordingly. A new scheme, which directly extracts snippet
> from rcu_qs.[hc], is applied.
> 
> Signed-off-by: Junchang Wang <junchangwang@gmail.com>
> Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  CodeSamples/defer/rcu_qs.c |  29 ++++++------
>  CodeSamples/defer/rcu_qs.h |  42 +++++++++--------
>  appendix/toyrcu/toyrcu.tex | 114 ++++++++++++++++-----------------------------
>  3 files changed, 79 insertions(+), 106 deletions(-)
> 
> diff --git a/CodeSamples/defer/rcu_qs.c b/CodeSamples/defer/rcu_qs.c
> index 27e45f7..8dc174f 100644
> --- a/CodeSamples/defer/rcu_qs.c
> +++ b/CodeSamples/defer/rcu_qs.c
> @@ -27,44 +27,47 @@
>  #include "../api.h"
>  #include "rcu_qs.h"
>  
> -void synchronize_rcu(void)
> +//\begin{snippet}[labelbase=ln:defer:rcu_qs:synchronize,gobbleblank=yes,commandchars=\%\@\$]
> +void synchronize_rcu(void)			//\lnlbl{syn:b}
>  {
>  	int t;
> -
> +							//\fcvblank
>  	/* Memory barrier ensures mutation seen before grace period. */
>  
> -	smp_mb();
> +	smp_mb();				//\lnlbl{syn:mb1}
>  
>  	/* Only one synchronize_rcu() at a time. */
>  
> -	spin_lock(&rcu_gp_lock);
> +	spin_lock(&rcu_gp_lock);		//\lnlbl{syn:spinlock}
>  
>  	/* Advance to a new grace-period number, enforce ordering. */
>  
> -	rcu_gp_ctr += 2;
> -	smp_mb();
> +	WRITE_ONCE(rcu_gp_ctr, rcu_gp_ctr + 2);	//\lnlbl{syn:increasegp}
> +	smp_mb();				//\lnlbl{syn:mb2}
>  
>  	/*
>  	 * Wait until all threads are either out of their RCU read-side
>  	 * critical sections or are aware of the new grace period.
>  	 */
>  
> -	for_each_thread(t) {
> -		while (rcu_gp_ongoing(t) &&
> -		       ((per_thread(rcu_reader_qs_gp, t) - rcu_gp_ctr) < 0)) {
> +	for_each_thread(t) {			//\lnlbl{syn:scan:b}
> +		while (rcu_gp_ongoing(t) &&	//\lnlbl{syn:ongoing}
> +		       ((per_thread(rcu_reader_qs_gp, t)//\lnlbl{syn:gp1}
> +		         - rcu_gp_ctr) < 0)) {	//\lnlbl{syn:gp2}
>  			/* @@@ poll(NULL, 0, 10); */
> -			barrier();
> +			barrier();		//\lnlbl{syn:barrier}

So we need another "#ifndef FCV_SNIPPET" construct here...

>  		}
> -	}
> +	}					//\lnlbl{syn:scan:e}
>  
>  	/* Let other synchronize_rcu() instances move ahead. */
>  
> -	spin_unlock(&rcu_gp_lock);
> +	spin_unlock(&rcu_gp_lock);		//\lnlbl{syn:spinunlock}
>  
>  	/* Ensure that any subsequent free()s happen -after- above checks. */
>  
> -	smp_mb();
> +	smp_mb();				//\lnlbl{syn:mb3}
>  }
> +//\end{snippet}
>  
>  #ifdef TEST
>  #include "rcutorture.h"
> diff --git a/CodeSamples/defer/rcu_qs.h b/CodeSamples/defer/rcu_qs.h
> index 3bb45a4..26c3fb5 100644
> --- a/CodeSamples/defer/rcu_qs.h
> +++ b/CodeSamples/defer/rcu_qs.h
> @@ -48,31 +48,35 @@ static void rcu_init(void)
>  	init_per_thread(rcu_reader_qs_gp, rcu_gp_ctr);
>  }
>  
> -static void rcu_read_lock(void)
> +//\begin{snippet}[labelbase=ln:defer:rcu_qs:read_lock_unlock,gobbleblank=yes,commandchars=\%\@\$]
> +static void rcu_read_lock(void)			//\lnlbl{lock:b}
>  {
>  }
> -
> +							//\fcvblank
>  static void rcu_read_unlock(void)
>  {
> -}
> -
> -static void rcu_quiescent_state(void)
> +}						//\lnlbl{unlock:e}
> +							//\fcvblank
> +static void rcu_quiescent_state(void)		//\lnlbl{qs:b}
>  {
> -	smp_mb();
> -	__get_thread_var(rcu_reader_qs_gp) = ACCESS_ONCE(rcu_gp_ctr) + 1;
> -	smp_mb();
> -}
> -
> -static void rcu_thread_offline(void)
> +	smp_mb();				//\lnlbl{qs:mb1}
> +	__get_thread_var(rcu_reader_qs_gp) =	//\lnlbl{qs:gp1}
> +		READ_ONCE(rcu_gp_ctr) + 1;	//\lnlbl{qs:gp2}
> +	smp_mb();				//\lnlbl{qs:mb2}
> +}						//\lnlbl{qs:e}
> +							//\fcvblank
> +static void rcu_thread_offline(void)		//\lnlbl{offline:b}
>  {
> -	smp_mb();
> -	__get_thread_var(rcu_reader_qs_gp) = ACCESS_ONCE(rcu_gp_ctr);
> -	smp_mb();
> -}
> -
> -static void rcu_thread_online(void)
> +	smp_mb();				//\lnlbl{offline:mb1}
> +	__get_thread_var(rcu_reader_qs_gp) =	//\lnlbl{offline:gp1}
> +		READ_ONCE(rcu_gp_ctr);		//\lnlbl{offline:gp2}
> +	smp_mb();				//\lnlbl{offline:mb2}
> +}						//\lnlbl{offline:e}
> +							//\fcvblank
> +static void rcu_thread_online(void)		//\lnlbl{online:b}
>  {
> -	rcu_quiescent_state();
> -}
> +	rcu_quiescent_state();			//\lnlbl{online:qs}
> +}						//\lnlbl{online:e}
> +//\end{snippet}
>  
>  extern void synchronize_rcu(void);
> diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
> index f7fc07b..a7ce98a 100644
> --- a/appendix/toyrcu/toyrcu.tex
> +++ b/appendix/toyrcu/toyrcu.tex
> @@ -1349,8 +1349,10 @@ will ignore the subsequent RCU read-side critical section.
>  Third and finally, this implementation requires that the enclosing software
>  environment be able to enumerate threads and maintain per-thread
>  variables.
> +\end{lineref}
>  
>  \QuickQuiz{}
> +	\begin{lineref}[ln:defer:rcu:read_lock_unlock:lock]
>  	Is the possibility of readers being preempted in
>  	lines~\lnref{gp1}-\lnref{gp2} of
>  	Listing~\ref{lst:app:toyrcu:Free-Running Counter Using RCU}
> @@ -1359,6 +1361,7 @@ variables.
>  	If not, why not?
>  	If so, what is the sequence of events, and how can the
>  	failure be addressed?
> +	\end{lineref}
>  \QuickQuizAnswer{
>  	It is a real problem, there is a sequence of events leading to
>  	failure, and there are a number of possible ways of
> @@ -1370,7 +1373,6 @@ variables.
>  	added in that section greatly reduces the time required to
>  	overflow the counter.
>  } \QuickQuizEnd
> -\end{lineref}

These changes should be moved to 1/2.

>  
>  \section{Nestable RCU Based on Free-Running Counter}
>  \label{sec:app:toyrcu:Nestable RCU Based on Free-Running Counter}
> @@ -1673,50 +1675,19 @@ overhead.
>  \end{listing}
>  
>  \begin{listing}[tbp]
> -{ \scriptsize
> -\begin{verbbox}
> -  1 static void rcu_read_lock(void)
> -  2 {
> -  3 }
> -  4
> -  5 static void rcu_read_unlock(void)
> -  6 {
> -  7 }
> -  8
> -  9 rcu_quiescent_state(void)
> - 10 {
> - 11   smp_mb();
> - 12   __get_thread_var(rcu_reader_qs_gp) =
> - 13     ACCESS_ONCE(rcu_gp_ctr) + 1;
> - 14   smp_mb();
> - 15 }
> - 16
> - 17 static void rcu_thread_offline(void)
> - 18 {
> - 19   smp_mb();
> - 20   __get_thread_var(rcu_reader_qs_gp) =
> - 21     ACCESS_ONCE(rcu_gp_ctr);
> - 22   smp_mb();
> - 23 }
> - 24
> - 25 static void rcu_thread_online(void)
> - 26 {
> - 27   rcu_quiescent_state();
> - 28 }
> -\end{verbbox}
> -}
> -\centering
> -\theverbbox
> +\input{CodeSamples/defer/rcu_qs@read_lock_unlock.fcv}
>  \caption{Quiescent-State-Based RCU Read Side}
>  \label{lst:app:toyrcu:Quiescent-State-Based RCU Read Side}
>  \end{listing}
>  
> +\begin{lineref}[ln:defer:rcu_qs:read_lock_unlock]
>  Listing~\ref{lst:app:toyrcu:Quiescent-State-Based RCU Read Side}
>  (\path{rcu_qs.h})
>  shows the read-side primitives used to construct a user-level
>  implementation of RCU based on quiescent states, with the data shown in
>  Listing~\ref{lst:app:toyrcu:Data for Quiescent-State-Based RCU}.
> -As can be seen from lines~1-7 in the listing, the \co{rcu_read_lock()}
> +As can be seen from lines~\lnref{lock:b}-\lnref{unlock:e} in the listing,
> +the \co{rcu_read_lock()}
>  and \co{rcu_read_unlock()} primitives do nothing, and can in fact
>  be expected to be inlined and optimized away, as they are in
>  server builds of the Linux kernel.
> @@ -1724,11 +1695,14 @@ This is due to the fact that quiescent-state-based RCU implementations
>  \emph{approximate} the extents of RCU read-side critical sections
>  using the aforementioned quiescent states.
>  Each of these quiescent states contains a call to
> -\co{rcu_quiescent_state()}, which is shown from lines~9-15 in the listing.
> +\co{rcu_quiescent_state()}, which is shown from
> +lines~\lnref{qs:b}-\lnref{qs:e} in the listing.
>  Threads entering extended quiescent states (for example, when blocking)
> -may instead call \co{rcu_thread_offline()} (lines~17-23) when entering
> +may instead call \co{rcu_thread_offline()}
> +(lines~\lnref{offline:b}-\lnref{offline:e}) when entering
>  an extended quiescent state and then call
> -\co{rcu_thread_online()} (lines~25-28) when leaving it.
> +\co{rcu_thread_online()}
> +(lines~\lnref{online:b}-\lnref{online:e}) when leaving it.
>  As such, \co{rcu_thread_online()} is analogous to \co{rcu_read_lock()}
>  and \co{rcu_thread_offline()} is analogous to \co{rcu_read_unlock()}.
>  In addition, \co{rcu_quiescent_state()} can be thought of as a
> @@ -1741,13 +1715,16 @@ In addition, \co{rcu_quiescent_state()} can be thought of as a
>  	performance optimizations.}
>  It is illegal to invoke \co{rcu_quiescent_state()}, \co{rcu_thread_offline()},
>  or \co{rcu_thread_online()} from an RCU read-side critical section.
> +\end{lineref}
>  
> -In \co{rcu_quiescent_state()}, line~11 executes a memory barrier
> +\begin{lineref}[ln:defer:rcu_qs:read_lock_unlock:qs]
> +In \co{rcu_quiescent_state()}, line~\lnref{mb1} executes a memory barrier
>  to prevent any code prior to the quiescent state (including possible
>  RCU read-side critical sections) from being reordered
>  into the quiescent state.
> -Lines~12-13 pick up a copy of the global \co{rcu_gp_ctr}, using
> -\co{ACCESS_ONCE()} to ensure that the compiler does not employ any
> +Lines~\lnref{gp1}-\lnref{gp2} pick up
> +a copy of the global \co{rcu_gp_ctr}, using
> +\co{READ_ONCE()} to ensure that the compiler does not employ any
>  optimizations that would result in \co{rcu_gp_ctr} being fetched
>  more than once,
>  and then adds one to the value fetched and stores it into
> @@ -1756,15 +1733,20 @@ instance of \co{synchronize_rcu()} will see an odd-numbered value,
>  thus becoming aware that a new RCU read-side critical section has started.
>  Instances of \co{synchronize_rcu()} that are waiting on older
>  RCU read-side critical sections will thus know to ignore this new one.
> -Finally, line~14 executes a memory barrier, which prevents subsequent
> +Finally, line~\lnref{mb2} executes a memory barrier, which prevents subsequent
>  code (including a possible RCU read-side critical section) from being
> -re-ordered with the lines~12-13.
> +re-ordered with the lines~\lnref{gp1}-\lnref{gp2}.
> +\end{lineref}
>  
>  \QuickQuiz{}
> -	Doesn't the additional memory barrier shown on line~14 of
> +	\begin{lineref}[ln:defer:rcu_qs:read_lock_unlock:qs]
> +	Doesn't the additional memory barrier shown on line~\lnref{mb2} of
>  	Listing~\ref{lst:app:toyrcu:Quiescent-State-Based RCU Read Side}
>  	greatly increase the overhead of \co{rcu_quiescent_state}?
> +	\end{lineref}
>  \QuickQuizAnswer{
> +	\begin{lineref}[ln:defer:rcu_qs:read_lock_unlock:qs]
> +	Doesn't the additional memory barrier shown on line~\lnref{mb2} of

??? This line shouldn't have been pasted.

With these fixed,

Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

        Thanks, Akira

>  	Indeed it does!
>  	An application using this implementation of RCU should therefore
>  	invoke \co{rcu_quiescent_state} sparingly, instead using
> @@ -1772,9 +1754,11 @@ re-ordered with the lines~12-13.
>  	time.
>  
>  	However, this memory barrier is absolutely required so that
> -	other threads will see the store on lines~12-13 before any
> +	other threads will see the store on
> +	lines~\lnref{gp1}-\lnref{gp2} before any
>  	subsequent RCU read-side critical sections executed by the
>  	caller.
> +	\end{lineref}
>  } \QuickQuizEnd
>  
>  Some applications might use RCU only occasionally, but use it very heavily
> @@ -1794,17 +1778,22 @@ Any concurrent instances of \co{synchronize_rcu()} will thus know to
>  ignore this thread.
>  
>  \QuickQuiz{}
> -	Why are the two memory barriers on lines~19 and 22 of
> +	\begin{lineref}[ln:defer:rcu_qs:read_lock_unlock:qs]
> +	Why are the two memory barriers on lines~\lnref{mb1} and \lnref{mb2} of
>  	Listing~\ref{lst:app:toyrcu:Quiescent-State-Based RCU Read Side}
>  	needed?
> +	\end{lineref}
>  \QuickQuizAnswer{
> -	The memory barrier on line~19 prevents any RCU read-side
> +	\begin{lineref}[ln:defer:rcu_qs:read_lock_unlock:qs]
> +	The memory barrier on line~\lnref{mb1} prevents any RCU read-side
>  	critical sections that might precede the
>  	call to \co{rcu_thread_offline()} won't be reordered by either
> -	the compiler or the CPU to follow the assignment on lines~20-21.
> -	The memory barrier on line~22 is, strictly speaking, unnecessary,
> +	the compiler or the CPU to follow the assignment on
> +	lines~\lnref{gp1}-\lnref{gp2}.
> +	The memory barrier on line~\lnref{mb2} is, strictly speaking, unnecessary,
>  	as it is illegal to have any RCU read-side critical sections
>  	following the call to \co{rcu_thread_offline()}.
> +	\end{lineref}
>  } \QuickQuizEnd
>  
>  The \co{rcu_thread_online()} function simply invokes
> @@ -1812,30 +1801,7 @@ The \co{rcu_thread_online()} function simply invokes
>  quiescent state.
>  
>  \begin{listing}[tbp]
> -{ \scriptsize
> -\begin{verbbox}
> -  1 void synchronize_rcu(void)
> -  2 {
> -  3   int t;
> -  4
> -  5   smp_mb();
> -  6   spin_lock(&rcu_gp_lock);
> -  7   rcu_gp_ctr += 2;
> -  8   smp_mb();
> -  9   for_each_thread(t) {
> - 10     while (rcu_gp_ongoing(t) &&
> - 11            ((per_thread(rcu_reader_qs_gp, t) -
> - 12              rcu_gp_ctr) < 0)) {
> - 13       poll(NULL, 0, 10);
> - 14     }
> - 15   }
> - 16   spin_unlock(&rcu_gp_lock);
> - 17   smp_mb();
> - 18 }
> -\end{verbbox}
> -}
> -\centering
> -\theverbbox
> +\input{CodeSamples/defer/rcu_qs@synchronize.fcv}
>  \caption{RCU Update Side Using Quiescent States}
>  \label{lst:app:toyrcu:RCU Update Side Using Quiescent States}
>  \end{listing}
> 

