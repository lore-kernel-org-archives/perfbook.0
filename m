Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51495 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750926AbdEOAbG (ORCPT <rfc822;perfbook@vger.kernel.org>); Sun, 14
 May 2017 20:31:06 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v4F0Sqn6058989
 for <perfbook@vger.kernel.org>; Sun, 14 May 2017 20:31:06 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2aevwp0ne5-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 14 May 2017 20:31:05 -0400
Received: from localhost by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 14 May
 2017 20:31:04 -0400
Date: Sun, 14 May 2017 17:31:04 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] count_stat_eventual: Switch from ACCESS_ONCE() to
 READ_ONCE()/WRITE_ONCE()
Reply-To: paulmck@linux.vnet.ibm.com
References: <1494515022-30278-1-git-send-email-junchangwang@gmail.com>
 <1494515022-30278-2-git-send-email-junchangwang@gmail.com>
 <61acaa88-abd6-58f5-4d1f-80a2ef58d53e@gmail.com>
 <20170513124556.GJ3956@linux.vnet.ibm.com>
 <831607d1-8169-ee2c-1d48-c70381481cda@gmail.com>
 <20170513225637.GL3956@linux.vnet.ibm.com>
 <45998636-1d97-3c44-1e89-543366637317@gmail.com>
 <223e58f6-0689-8357-e25d-a69dfb459d1a@gmail.com>
 <20170514042023.GN3956@linux.vnet.ibm.com>
 <356a1ef2-6ba6-aff4-e721-084a5a87316d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <356a1ef2-6ba6-aff4-e721-084a5a87316d@gmail.com>
Message-Id: <20170515003104.GR3956@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Junchang Wang <junchangwang@gmail.com>, perfbook@vger.kernel.org

On Mon, May 15, 2017 at 12:15:34AM +0900, Akira Yokosawa wrote:
> On 2017/05/13 21:20:23 -0700, Paul E. McKenney wrote:
> > On Sun, May 14, 2017 at 10:31:51AM +0900, Akira Yokosawa wrote:
> >> On 2017/05/14 9:58, Akira Yokosawa wrote:
> >>> On 2017/05/14 7:56, Paul E. McKenney wrote:
> >>>> On Sat, May 13, 2017 at 11:37:06PM +0900, Akira Yokosawa wrote:
> >>>>> On 2017/05/13 05:45:56 -0700, Paul E. McKenney wrote:
> >>>>>> On Sat, May 13, 2017 at 09:04:38PM +0900, Akira Yokosawa wrote:
> >>>>>>> Hi Jason & Paul,
> >>>>>>>
> >>>>>>> although this has already been applied, I have a comment.
> >>>>>>>
> >>>>>>> On 2017/05/11 23:03:41 +0800, Junchang Wang wrote:
> >>>>>>>> Signed-off-by: Junchang Wang <junchangwang@gmail.com>
> >>>>>>>> ---
> >>>>>>>>  CodeSamples/count/count_stat_eventual.c | 8 ++++----
> >>>>>>>>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>>>>>>>
> >>>>>>>> diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
> >>>>>>>> index 059ab8b..cbde4aa 100644
> >>>>>>>> --- a/CodeSamples/count/count_stat_eventual.c
> >>>>>>>> +++ b/CodeSamples/count/count_stat_eventual.c
> >>>>>>>> @@ -27,12 +27,12 @@ int stopflag;
> >>>>>>>>  
> >>>>>>>>  void inc_count(void)
> >>>>>>>>  {
> >>>>>>>> -	ACCESS_ONCE(__get_thread_var(counter))++;
> >>>>>>>> +	READ_ONCE(__get_thread_var(counter))++;
> >>>>>>>
> >>>>>>> This is OK because READ_ONCE() is defined as the same as ACCESS_ONCE()
> >>>>>>> in CodeSamples. However, the definition in the current Linux kernel
> >>>>>>> would not permit this.
> >>>>>>>
> >>>>>>> A read-modify-write access would need both READ_ONCE() and WRITE_ONCE().
> >>>>>>> However, since "counter" is thread local and updated only by its owner,
> >>>>>>> we don't need READ_ONCE() here. So:
> >>>>>>>
> >>>>>>> +	WRITE_ONCE(__get_thread_var(counter), __get_thread_var(counter) + 1);
> >>>>>>>
> >>>>>>> should have been sufficient.
> 
> So, I measured the performance after this change.
> Unfortunately, this change doubles the overhead of updater.
> 
> By inspecting the generated code, it looks like GCC (v5.4 for x86_64 with -O3 option)
> can't figure out two "__get_thread_var(counter)"s are identical, and uses two
> registers as pointers to access it. __get_thread_var() seems complex enough
> to obfuscate the compiler.
> 
> To avoid this performance regression, we can use a temporary pointer as a hint for
> optimization:
> 
> 	void inc_count(void)
> 	{
> 		unsigned long *p_cnt = &__get_thread_var(counter);
> 
> 		WRITE_ONCE(*p_cnt, *p_cnt + 1);
> 	}
> 
> Another idea is to restore ACCESS_ONCE().
> As long as the argument is properly aligned scalar type, ACCESS_ONCE() should be OK.
> 
> 	ACCESS_ONCE(__get_thread_var(counter))++;
> 
> will emit both load and store instructions, but in this short function,
> the compiler has no way to optimize away either access even if we don't use
> ACCESS_ONCE().
> 
> Thoughts?

I am tempted to deprecate ACCESS_ONCE(), but yes, it is hard for the
compiler to optimize.  Unless, that is, you allow the compiler to
inline the function.  Which is the case by default.

Getting back to READ_ONCE(), how does the following patch look?

							Thanx, Paul

------------------------------------------------------------------------

commit 85747990ec809f57d61d30cd27bdc18b58163681
Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Date:   Sun May 14 17:26:41 2017 -0700

    count: Don't in-place increment a READ_ONCE()
    
    This commit prohibits READ_ONCE(x)++ and fixes the occurrence of this
    in count_state_eventual.c.
    
    Reported-by: Akira Yokosawa <akiyks@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

diff --git a/CodeSamples/api-pthreads/api-pthreads.h b/CodeSamples/api-pthreads/api-pthreads.h
index b12c3e14911c..c6031f7d59b7 100644
--- a/CodeSamples/api-pthreads/api-pthreads.h
+++ b/CodeSamples/api-pthreads/api-pthreads.h
@@ -127,7 +127,7 @@ static __inline__ int spin_is_locked(spinlock_t *sp)
 #define spin_unlock_irqrestore(l, f) do { f = 0; spin_unlock(l); } while (0)

 #define ACCESS_ONCE(x) (*(volatile typeof(x) *)&(x))
-#define READ_ONCE(x) ACCESS_ONCE(x)
+#define READ_ONCE(x) ({ typeof(x) ___x = ACCESS_ONCE(x); ___x; })
 #define WRITE_ONCE(x, val) ({ ACCESS_ONCE(x) = (val); })
 #ifndef unlikely
 #define unlikely(x) x
diff --git a/CodeSamples/api.h b/CodeSamples/api.h
index a18c70f2346c..3b4bc1629c7a 100644
--- a/CodeSamples/api.h
+++ b/CodeSamples/api.h
@@ -243,7 +243,7 @@ static __inline__ int spin_is_locked(spinlock_t *sp)
 #define spin_unlock_irqrestore(l, f) do { f = 0; spin_unlock(l); } while (0)

 #define ACCESS_ONCE(x) (*(volatile typeof(x) *)&(x))
-#define READ_ONCE(x) ACCESS_ONCE(x)
+#define READ_ONCE(x) ({ typeof(x) ___x = ACCESS_ONCE(x); ___x; })
 #define WRITE_ONCE(x, val) ({ ACCESS_ONCE(x) = (val); })
 #ifndef unlikely
 #define unlikely(x) x
diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
index 2caebfd1fb26..464de30d7aa8 100644
--- a/CodeSamples/count/count_stat_eventual.c
+++ b/CodeSamples/count/count_stat_eventual.c
@@ -27,7 +27,8 @@ int stopflag;

 void inc_count(void)
 {
-	READ_ONCE(__get_thread_var(counter))++;
+	WRITE_ONCE(__get_thread_var(counter),
+		   READ_ONCE(__get_thread_var(counter)) + 1);
 }

 unsigned long read_count(void)
diff --git a/count/count.tex b/count/count.tex
index 096b53d1d2bb..ae624c650c11 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -746,56 +746,58 @@ eventually consistent.
 \begin{figure}[tbp]
 { \scriptsize
 \begin{verbbox}
-  1 DEFINE_PER_THREAD(unsigned long, counter);
-  2 unsigned long global_count;
-  3 int stopflag;
-  4 
-  5 void inc_count(void)
-  6 {
-  7   ACCESS_ONCE(__get_thread_var(counter))++;
-  8 }
-  9 
- 10 unsigned long read_count(void)
- 11 {
- 12   return ACCESS_ONCE(global_count);
- 13 }
- 14 
- 15 void *eventual(void *arg)
- 16 {
- 17   int t;
- 18   int sum;
- 19 
- 20   while (stopflag < 3) {
- 21     sum = 0;
- 22     for_each_thread(t)
- 23       sum += ACCESS_ONCE(per_thread(counter, t));
- 24     ACCESS_ONCE(global_count) = sum;
- 25     poll(NULL, 0, 1);
- 26     if (stopflag) {
- 27       smp_mb();
- 28       stopflag++;
- 29     }
- 30   }
- 31   return NULL;
- 32 }
- 33 
- 34 void count_init(void)
- 35 {
- 36   thread_id_t tid;
- 37 
- 38   if (pthread_create(&tid, NULL, eventual, NULL)) {
- 39     perror("count_init:pthread_create");
- 40     exit(-1);
- 41   }
- 42 }
- 43 
- 44 void count_cleanup(void)
- 45 {
- 46   stopflag = 1;
- 47   while (stopflag < 3)
- 48     poll(NULL, 0, 1);
- 49   smp_mb();
- 50 }
+ 1 DEFINE_PER_THREAD(unsigned long, counter);
+ 2 unsigned long global_count;
+ 3 int stopflag;
+ 4
+ 5 void inc_count(void)
+ 6 {
+ 7   WRITE_ONCE(__get_thread_var(counter),
+ 8              READ_ONCE(__get_thread_var(counter)) + 1);
+ 9 }
+10
+11 unsigned long read_count(void)
+12 {
+13   return READ_ONCE(global_count);
+14 }
+15
+16 void *eventual(void *arg)
+17 {
+18   int t;
+19   unsigned long sum;
+20
+21   while (READ_ONCE(stopflag) < 3) {
+22     sum = 0;
+23     for_each_thread(t)
+24       sum += READ_ONCE(per_thread(counter, t));
+25     WRITE_ONCE(global_count, sum);
+26     poll(NULL, 0, 1);
+27     if (READ_ONCE(stopflag)) {
+28       smp_mb();
+29       WRITE_ONCE(stopflag, READ_ONCE(stopflag) + 1);
+30     }
+31   }
+32   return NULL;
+33 }
+34
+35 void count_init(void)
+36 {
+37   thread_id_t tid;
+38
+39   if (pthread_create(&tid, NULL, eventual, NULL) != 0) {
+40     perror("count_init:pthread_create");
+41     exit(-1);
+42   }
+43 }
+44
+45 void count_cleanup(void)
+46 {
+47   WRITE_ONCE(stopflag, 1);
+48   smp_mb();
+49   while (READ_ONCE(stopflag) < 3)
+50     poll(NULL, 0, 1);
+51   smp_mb();
+52 }
 \end{verbbox}
 }
 \centering
@@ -811,20 +813,20 @@ Lines~1-2 show the per-thread variable and the global variable that
 track the counter's value, and line three shows \co{stopflag}
 which is used to coordinate termination (for the case where we want
 to terminate the program with an accurate counter value).
-The \co{inc_count()} function shown on lines~5-8 is similar to its
+The \co{inc_count()} function shown on lines~5-9 is similar to its
 counterpart in
 Figure~\ref{fig:count:Array-Based Per-Thread Statistical Counters}.
-The \co{read_count()} function shown on lines~10-13 simply returns the
+The \co{read_count()} function shown on lines~11-14 simply returns the
 value of the \co{global_count} variable.

-However, the \co{count_init()} function on lines~34-42
-creates the \co{eventual()} thread shown on lines~15-32, which
+However, the \co{count_init()} function on lines~35-43
+creates the \co{eventual()} thread shown on lines~16-33, which
 cycles through all the threads,
 summing the per-thread local \co{counter} and storing the
 sum to the \co{global_count} variable.
 The \co{eventual()} thread waits an arbitrarily chosen one millisecond
 between passes.
-The \co{count_cleanup()} function on lines~44-50 coordinates termination.
+The \co{count_cleanup()} function on lines~45-52 coordinates termination.

 This approach gives extremely fast counter read-out while still
 supporting linear counter-update performance.

