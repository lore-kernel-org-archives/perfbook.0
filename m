Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rVRYjt0gGDaoRFLl5b/0M/NeaejIlsE5hBznl4jCLKg=;
        b=boU+28sq4nKlrQsb0psnNUy4n7wim260Z15msMgxxgODhwCkfJ6YtjVdFFsEc2a+3W
         XKxwRLwjWr2wcgcrooU9fSzIbKgFXN60RizTg606GI5MG6dKthrmQG4QUrlbkqr1oy57
         31J6mL/TDpzmLxadlk7Cz2kjAnuVIqodSS3OzZHn3r01IxoRbnjJUsS8st6/nj8kMik8
         eQ3hqiHvcOI4X3IM+E+A6PDwSrIfw5UMOHCZVB/VtVYOuSsb/7+FkYWVUmX94J6EousL
         0EcQQ4yjxSI7CSX9x2FrPRzEDllQRn5YEOoWhjrC1gEcceCbqhGoRKtgT+l7oBuWIGNN
         WGiA==
Subject: Re: [PATCH] count: Employ new scheme for snippet of
 count_stat_eventual.c
References: <c89e5d7d-e0b4-6f4f-e986-1208f4c5ce8b@gmail.com>
 <20181006201606.GU2674@linux.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b1efae8a-03c7-e9b5-8b17-1c45c1a5ffdf@gmail.com>
Date: Sun, 7 Oct 2018 07:22:50 +0900
MIME-Version: 1.0
In-Reply-To: <20181006201606.GU2674@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/10/06 13:16:06 -0700, Paul E. McKenney wrote:
> On Sat, Oct 06, 2018 at 07:35:42AM +0900, Akira Yokosawa wrote:
>> >From 16fb7e39700268cd498f88c16b34170e3b91fd24 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Thu, 6 Oct 2018 07:20:06 +0900
>> Subject: [PATCH] count: Employ new scheme for snippet of count_stat_eventual.c
>>
>> Also omit READ_ONCE()s which access variables owned and modified
>> only by the owning thread.
>>
>> Read part of stopflag's increment in eventual() doesn't need
>> READ_ONCE() because once the "if" statement stands, stopflag
>> won't be modified by any other thread.
>>
>> Also modify code around pthread_create() in count_init() so that
>> the "if" statement won't be too wide for a code snippet in two-
>> column layout.
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> Queued and pushed, thank you!
> 
>> ---
>> Paul,
>>
>> I might be missing something in omitting READ_ONCE() of stopflag's
>> increment in eventual().
>> If this were kernel code, we wouldn't be able to make sure
>> that eventual() is the only updater after the particular point in
>> execution.
>>
>> Thoughts?
> 
> True enough!  If a given entity is the only thing that updates a
> given variable, then that entity (but only that entity) need not use
> READ_ONCE().

Now, I'm beginning to feel somewhat confident to tell the necessity
of READ_ONCE()/WRITE_ONCE(). ;-)

> 
> Hmmm... This applies to Figure 5.1 also, right?

You mean Listing 5.1?

I don't think so. inc_count() and read_count() can be called from
multiple threads and any updater thread modifies "counter". 

Listing 5.1 is not supposed to be "correct", but I think the rule of
where to use READ_ONCE()/WRITE_ONCE() still applies to it.
READ_ONCE() in read_count() avoids load tearing, doesn't it?

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>>         Thanks, Akira
>> --
>>
>>  CodeSamples/count/count_stat_eventual.c | 38 +++++++++-------
>>  count/count.tex                         | 81 +++++++--------------------------
>>  2 files changed, 37 insertions(+), 82 deletions(-)
>>
>> diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
>> index 324bc24..fa8972f 100644
>> --- a/CodeSamples/count/count_stat_eventual.c
>> +++ b/CodeSamples/count/count_stat_eventual.c
>> @@ -21,22 +21,24 @@
>>  
>>  #include "../api.h"
>>  
>> -DEFINE_PER_THREAD(unsigned long, counter);
>> -unsigned long global_count;
>> -int stopflag;
>> +//\begin{snippet}[labelbase=ln:count:count_stat_eventual:whole,commandchars=\$\[\]]
>> +DEFINE_PER_THREAD(unsigned long, counter);		//\lnlbl{per_thr_cnt}
>> +unsigned long global_count;				//\lnlbl{glb_cnt}
>> +int stopflag;						//\lnlbl{stopflag}
>>  
>> -void inc_count(void)
>> +static __inline__ void inc_count(void)			//\lnlbl{inc:b}
>>  {
>> -	WRITE_ONCE(__get_thread_var(counter),
>> -		   READ_ONCE(__get_thread_var(counter)) + 1);
>> -}
>> +	unsigned long *p_counter = &__get_thread_var(counter);
>>  
>> -__inline__ unsigned long read_count(void)
>> +	WRITE_ONCE(*p_counter, *p_counter + 1);
>> +}							//\lnlbl{inc:e}
>> +
>> +static __inline__ unsigned long read_count(void)	//\lnlbl{read:b}
>>  {
>>  	return READ_ONCE(global_count);
>> -}
>> +}							//\lnlbl{read:e}
>>  
>> -void *eventual(void *arg)
>> +void *eventual(void *arg)				//\lnlbl{eventual:b}
>>  {
>>  	int t;
>>  	unsigned long sum;
>> @@ -49,29 +51,31 @@ void *eventual(void *arg)
>>  		poll(NULL, 0, 1);
>>  		if (READ_ONCE(stopflag)) {
>>  			smp_mb();
>> -			WRITE_ONCE(stopflag, READ_ONCE(stopflag) + 1);
>> +			WRITE_ONCE(stopflag, stopflag + 1);
>>  		}
>>  	}
>>  	return NULL;
>> -}
>> +}							//\lnlbl{eventual:e}
>>  
>> -void count_init(void)
>> +void count_init(void)					//\lnlbl{init:b}
>>  {
>>  	int en;
>>  	thread_id_t tid;
>>  
>> -	if ((en = pthread_create(&tid, NULL, eventual, NULL)) != 0) {
>> +	en = pthread_create(&tid, NULL, eventual, NULL);
>> +	if (en != 0) {
>>  		fprintf(stderr, "pthread_create: %s\n", strerror(en));
>>  		exit(EXIT_FAILURE);
>>  	}
>> -}
>> +}							//\lnlbl{init:e}
>>  
>> -void count_cleanup(void)
>> +void count_cleanup(void)				//\lnlbl{cleanup:b}
>>  {
>>  	WRITE_ONCE(stopflag, 1);
>>  	while (READ_ONCE(stopflag) < 3)
>>  		poll(NULL, 0, 1);
>>  	smp_mb();
>> -}
>> +}							//\lnlbl{cleanup:e}
>> +//\end{snippet}
>>  
>>  #include "counttorture.h"
>> diff --git a/count/count.tex b/count/count.tex
>> index c36e7d8..aea7b93 100644
>> --- a/count/count.tex
>> +++ b/count/count.tex
>> @@ -785,94 +785,45 @@ converge on the true value---hence this approach qualifies as
>>  eventually consistent.
>>  
>>  \begin{listing}[tbp]
>> -{ \scriptsize
>> -\begin{verbbox}
>> - 1 DEFINE_PER_THREAD(unsigned long, counter);
>> - 2 unsigned long global_count;
>> - 3 int stopflag;
>> - 4
>> - 5 void inc_count(void)
>> - 6 {
>> - 7   WRITE_ONCE(__get_thread_var(counter),
>> - 8              READ_ONCE(__get_thread_var(counter)) + 1);
>> - 9 }
>> -10
>> -11 unsigned long read_count(void)
>> -12 {
>> -13   return READ_ONCE(global_count);
>> -14 }
>> -15
>> -16 void *eventual(void *arg)
>> -17 {
>> -18   int t;
>> -19   unsigned long sum;
>> -20
>> -21   while (READ_ONCE(stopflag) < 3) {
>> -22     sum = 0;
>> -23     for_each_thread(t)
>> -24       sum += READ_ONCE(per_thread(counter, t));
>> -25     WRITE_ONCE(global_count, sum);
>> -26     poll(NULL, 0, 1);
>> -27     if (READ_ONCE(stopflag)) {
>> -28       smp_mb();
>> -29       WRITE_ONCE(stopflag, READ_ONCE(stopflag) + 1);
>> -30     }
>> -31   }
>> -32   return NULL;
>> -33 }
>> -34
>> -35 void count_init(void)
>> -36 {
>> -37   int en;
>> -38   thread_id_t tid;
>> -39
>> -40   if ((en = pthread_create(&tid, NULL, eventual, NULL)) != 0) {
>> -41     fprintf(stderr, "pthread_create: %s\n", strerror(en));
>> -42     exit(-1);
>> -43   }
>> -44 }
>> -45
>> -46 void count_cleanup(void)
>> -47 {
>> -48   WRITE_ONCE(stopflag, 1);
>> -49   while (READ_ONCE(stopflag) < 3)
>> -50     poll(NULL, 0, 1);
>> -51   smp_mb();
>> -52 }
>> -\end{verbbox}
>> -}
>> -\centering
>> -\theverbbox
>> +\input{CodeSamples/count/count_stat_eventual@whole.fcv}
>>  \caption{Array-Based Per-Thread Eventually Consistent Counters}
>>  \label{lst:count:Array-Based Per-Thread Eventually Consistent Counters}
>>  \end{listing}
>>  
>> +\begin{lineref}[ln:count:count_stat_eventual:whole]
>>  The implementation is shown in
>>  Listing~\ref{lst:count:Array-Based Per-Thread Eventually Consistent Counters}
>>  (\path{count_stat_eventual.c}).
>> -Lines~1-2 show the per-thread variable and the global variable that
>> -track the counter's value, and line three shows \co{stopflag}
>> +Lines~\lnref{per_thr_cnt}-\lnref{glb_cnt}
>> +show the per-thread variable and the global variable that
>> +track the counter's value, and line~\lnref{stopflag} shows \co{stopflag}
>>  which is used to coordinate termination (for the case where we want
>>  to terminate the program with an accurate counter value).
>> -The \co{inc_count()} function shown on lines~5-9 is similar to its
>> +The \co{inc_count()} function shown on
>> +lines~\lnref{inc:b}-\lnref{inc:e} is similar to its
>>  counterpart in
>>  Listing~\ref{lst:count:Array-Based Per-Thread Statistical Counters}.
>> -The \co{read_count()} function shown on lines~11-14 simply returns the
>> +The \co{read_count()} function shown on
>> +lines~\lnref{read:b}-\lnref{read:e} simply returns the
>>  value of the \co{global_count} variable.
>>  
>> -However, the \co{count_init()} function on lines~35-44
>> -creates the \co{eventual()} thread shown on lines~16-33, which
>> +However, the \co{count_init()} function on
>> +lines~\lnref{init:b}-\lnref{init:e}
>> +creates the \co{eventual()} thread shown on
>> +lines~\lnref{eventual:b}-\lnref{eventual:e}, which
>>  cycles through all the threads,
>>  summing the per-thread local \co{counter} and storing the
>>  sum to the \co{global_count} variable.
>>  The \co{eventual()} thread waits an arbitrarily chosen one millisecond
>>  between passes.
>> -The \co{count_cleanup()} function on lines~46-52 coordinates termination.
>> +The \co{count_cleanup()} function on
>> +lines~\lnref{cleanup:b}-\lnref{cleanup:e} coordinates termination.
>>  
>>  This approach gives extremely fast counter read-out while still
>>  supporting linear counter-update performance.
>>  However, this excellent read-side performance and update-side scalability
>>  comes at the cost of the additional thread running \co{eventual()}.
>> +\end{lineref}
>>  
>>  \QuickQuiz{}
>>  	Why doesn't \co{inc_count()} in
>> -- 
>> 2.7.4
>>
> 

