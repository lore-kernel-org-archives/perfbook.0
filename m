Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:55214 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1731634AbeGNXvk (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sat, 14 Jul 2018 19:51:40 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w6ENTZwp157901
 for <perfbook@vger.kernel.org>; Sat, 14 Jul 2018 19:30:55 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2k7ataq1hy-1 (version=TLSv1.2
 cipher=AES256-GCM-SHA384 bits=256 verify=NOT) for <perfbook@vger.kernel.org>;
 Sat, 14 Jul 2018 19:30:54 -0400
Received: from localhost by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 14 Jul
 2018 19:30:54 -0400
Date: Sat, 14 Jul 2018 16:33:13 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Section 4.2: wrong error reporting for pthread functions
Reply-To: paulmck@linux.vnet.ibm.com
References: 
 <CAJbg=FVjq_rwhvSw3Y=7xOxUqN_kV4P=wD42HU9=1u3KGnyJpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAJbg=FVjq_rwhvSw3Y=7xOxUqN_kV4P=wD42HU9=1u3KGnyJpg@mail.gmail.com>
Message-Id: <20180714233313.GH12945@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Jul 14, 2018 at 08:59:48AM -0400, Elad Lahav wrote:
> Hello,
> 
> Throughout section 4.2 the following pattern is used for reporting
> errors returned by various pthread functions:
> 
> if (pthread_func() == 0) {
>     perror("pthread_func");
>     exit(-1);
> }
> 
> This is wrong, as pthread functions return the error number on failure
> and do not set errno, as demonstrated by the following program, which
> attempts to join with a detached thread:
> 
> #include <stdio.h>
> #include <errno.h>
> #include <pthread.h>
> 
> static void *
> my_thread(void *arg)
> {
>     return NULL;
> }
> 
> int
> main()
> {
>     pthread_attr_t  attr;
>     pthread_t       tid;
> 
>     pthread_attr_init(&attr);
>     pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_DETACHED);
> 
>     errno = 0;
> 
>     if (pthread_create(&tid, &attr, my_thread, NULL) != 0) {
>         perror("pthread_create");
>         return 1;
>     }
> 
>     if (pthread_join(tid, NULL) != 0) {
>         perror("pthread_join");
>         return 1;
>     }
> 
>     return 0;
> }
> 
> The result:
> # ./pthread_error
> pthread_join: Success
> 
> The correct way to report errors is to use strerror() on the returned code:
> 
> #include <string.h>
> ...
>     int rc;
>     rc = pthread_join(tid, NULL);
>     if (rc != 0) {
>         fprintf(stderr, "pthread_join: %s\n", strerror(rc));
>         return 1;
>     }
> 
> # ./pthread_error
> pthread_join: Invalid argument

Huh.  I haven't seen a failure.

But you are right, the documentation clearly states that these calls
return zero for success or errno otherwise.  Some systems explicitly
say that errno is unaffected, others guarantee setting errno as I was
naively expecting.  The standard is silent on the treatment of errno.
Some people suggest assigning the return value of the pthread_*()
functions to errno, while others argue that any use whatsoever of errno
is signal-unsafe (looks like saving and restoring errno in your signal
handlers is the right approach, which is a timely reminder for me).

Well, portability is worth a few lines of code, so I will make these
changes with your Reported-by.

Just out of curiosity, did you find these by inspection, or do they
actually fail in your environment?

> Also, using exit(-1) is likely to produce unexpected results for the
> parent process. Error codes returned from processes are small
> integers, with the range being platform-specific. This means that -1
> will get truncated to some unspecified value. It is customary to use 1
> to indicate a failure from a process (if no other specific code is
> defined). stdlib.h provides EXIT_SUCCESS and EXIT_FAILURE, which may
> be easier to read.

Also a fair point.

And yes, I did start C programming long before there was such a thing
as stdlib.h.  Why do you ask?  ;-)

Please see below for the first of a number of patches.  Thoughts?

							Thanx, Paul

------------------------------------------------------------------------

commit 2568586a3b09fa8f497e724e0e31ba020a37275a
Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Date:   Sat Jul 14 16:29:34 2018 -0700

    toolsoftrade: Standard pthread error handling and exit() arguments
    
    This commit uses the pthread library calls' return value to do error
    checking and handling, instead of the old reliance on errno, which for
    these functions is not guaranteed by the relevant standards.  This commit
    also uses EXIT_SUCCESS and EXIT_FAILURE to indicate exit status.
    
    Reported-by: Elad Lahav <e2lahav@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

diff --git a/CodeSamples/toolsoftrade/forkjoin.c b/CodeSamples/toolsoftrade/forkjoin.c
index d578221f6f40..b03b545f2987 100644
--- a/CodeSamples/toolsoftrade/forkjoin.c
+++ b/CodeSamples/toolsoftrade/forkjoin.c
@@ -34,7 +34,7 @@ int main(int argc, char *argv[])

 	if (argc != 2) {
 		fprintf(stderr, "Usage: %s nforks\n", argv[0]);
-		exit(-1);
+		exit(EXIT_FAILURE);
 	}
 	nforks = atoi(argv[1]);
 	printf("%d fork()s\n", nforks);
@@ -52,7 +52,7 @@ int main(int argc, char *argv[])
 		}
 		if (pid < 0) { /* parent, upon error */
 			perror("fork");
-			exit(-1);
+			exit(EXIT_FAILURE);
 		}
 	}

@@ -66,5 +66,5 @@ int main(int argc, char *argv[])
 		fprintf(stderr, "system(\"date\") failed: %x\n", stat_val);
 	}

-	return 0;
+	return EXIT_SUCCESS;
 }
diff --git a/CodeSamples/toolsoftrade/forkjoinperf.c b/CodeSamples/toolsoftrade/forkjoinperf.c
index c1438886e58a..19bad3e19acb 100644
--- a/CodeSamples/toolsoftrade/forkjoinperf.c
+++ b/CodeSamples/toolsoftrade/forkjoinperf.c
@@ -34,7 +34,7 @@ int main(int argc, char *argv[])

 	if (argc != 2) {
 		fprintf(stderr, "Usage: %s nforks\n", argv[0]);
-		exit(-1);
+		exit(EXIT_FAILURE);
 	}
 	nforks = atoi(argv[1]);
 	printf("%d fork()s\n", nforks);
@@ -44,11 +44,11 @@ int main(int argc, char *argv[])
 	for (i = 0; i < nforks; i++) {
 		pid = fork();
 		if (pid == 0) { /* child */
-			exit(0);
+			exit(EXIT_SUCCESS);
 		}
 		if (pid < 0) { /* parent, upon error */
 			perror("fork");
-			exit(-1);
+			exit(EXIT_FAILURE);
 		}
 		for (;;) {
 			pid = wait(&status);
@@ -56,7 +56,7 @@ int main(int argc, char *argv[])
 				if (errno == ECHILD)
 					break;
 				perror("wait");
-				exit(-1);
+				exit(EXIT_FAILURE);
 			}
 		}
 	}
@@ -64,5 +64,5 @@ int main(int argc, char *argv[])
 	fflush(stdout);
 	i = system("date");

-	return 0;
+	return EXIT_SUCCESS;
 }
diff --git a/CodeSamples/toolsoftrade/forkjoinvar.c b/CodeSamples/toolsoftrade/forkjoinvar.c
index 638558b726db..571acc14d8db 100644
--- a/CodeSamples/toolsoftrade/forkjoinvar.c
+++ b/CodeSamples/toolsoftrade/forkjoinvar.c
@@ -34,11 +34,11 @@ int main(int argc, char *argv[])
 	if (pid == 0) { /* child */
 		x = 1;
 		printf("Child process set x=1\n");
-		exit(0);
+		exit(EXIT_SUCCESS);
 	}
 	if (pid < 0) { /* parent, upon error */
 		perror("fork");
-		exit(-1);
+		exit(EXIT_FAILURE);
 	}

 	/* parent */
@@ -46,5 +46,5 @@ int main(int argc, char *argv[])
 	waitall();
 	printf("Parent process sees x=%d\n", x);

-	return 0;
+	return EXIT_SUCCESS;
 }
diff --git a/CodeSamples/toolsoftrade/lock.c b/CodeSamples/toolsoftrade/lock.c
index c5ad6ebf37f3..6bb3c23b43ba 100644
--- a/CodeSamples/toolsoftrade/lock.c
+++ b/CodeSamples/toolsoftrade/lock.c
@@ -33,14 +33,16 @@ int x = 0;

 void *lock_reader(void *arg)
 {
+	int en;
 	int i;
 	int newx = -1;
 	int oldx = -1;
 	pthread_mutex_t *pmlp = (pthread_mutex_t *)arg;

-	if (pthread_mutex_lock(pmlp) != 0) {
-		perror("lock_reader:pthread_mutex_lock");
-		exit(-1);
+	if ((en = pthread_mutex_lock(pmlp)) != 0) {
+		fprintf(stderr, "lock_reader:pthread_mutex_lock: %s\n",
+			strerror(en));
+		exit(EXIT_FAILURE);
 	}
 	for (i = 0; i < 100; i++) {
 		newx = READ_ONCE(x);
@@ -50,75 +52,80 @@ void *lock_reader(void *arg)
 		oldx = newx;
 		poll(NULL, 0, 1);
 	}
-	if (pthread_mutex_unlock(pmlp) != 0) {
-		perror("lock_reader:pthread_mutex_unlock");
-		exit(-1);
+	if ((en = pthread_mutex_unlock(pmlp)) != 0) {
+		fprintf(stderr, "lock_reader:pthread_mutex_lock: %s\n",
+			strerror(en));
+		exit(EXIT_FAILURE);
 	}
 	return NULL;
 }

 void *lock_writer(void *arg)
 {
+	int en;
 	int i;
 	pthread_mutex_t *pmlp = (pthread_mutex_t *)arg;

-	if (pthread_mutex_lock(pmlp) != 0) {
-		perror("lock_writer:pthread_mutex_lock");
-		exit(-1);
+	if ((en = pthread_mutex_lock(pmlp)) != 0) {
+		fprintf(stderr, "lock_writer:pthread_mutex_lock: %s\n",
+			strerror(en));
+		exit(EXIT_FAILURE);
 	}
 	for (i = 0; i < 3; i++) {
 		WRITE_ONCE(x, READ_ONCE(x) + 1);
 		poll(NULL, 0, 5);
 	}
-	if (pthread_mutex_unlock(pmlp) != 0) {
-		perror("lock_writer:pthread_mutex_unlock");
-		exit(-1);
+	if ((en = pthread_mutex_unlock(pmlp)) != 0) {
+		fprintf(stderr, "lock_writer:pthread_mutex_lock: %s\n",
+			strerror(en));
+		exit(EXIT_FAILURE);
 	}
 	return NULL;
 }

 int main(int argc, char *argv[])
 {
+	int en; 
 	pthread_t tid1;
 	pthread_t tid2;
 	void *vp;

 	printf("Creating two threads using same lock:\n");
-	if (pthread_create(&tid1, NULL, lock_reader, &lock_a) != 0) {
-		perror("pthread_create");
-		exit(-1);
+	if ((en = pthread_create(&tid1, NULL, lock_reader, &lock_a)) != 0) {
+		fprintf(stderr, "pthread_create: %s\n", strerror(en));
+		exit(EXIT_FAILURE);
 	}
-	if (pthread_create(&tid2, NULL, lock_writer, &lock_a) != 0) {
-		perror("pthread_create");
-		exit(-1);
+	if ((en = pthread_create(&tid2, NULL, lock_writer, &lock_a)) != 0) {
+		fprintf(stderr, "pthread_create: %s\n", strerror(en));
+		exit(EXIT_FAILURE);
 	}
-	if (pthread_join(tid1, &vp) != 0) {
-		perror("pthread_join");
-		exit(-1);
+	if ((en = pthread_join(tid1, &vp)) != 0) {
+		fprintf(stderr, "pthread_join: %s\n", strerror(en));
+		exit(EXIT_FAILURE);
 	}
-	if (pthread_join(tid2, &vp) != 0) {
-		perror("pthread_join");
-		exit(-1);
+	if ((en = pthread_join(tid2, &vp)) != 0) {
+		fprintf(stderr, "pthread_join: %s\n", strerror(en));
+		exit(EXIT_FAILURE);
 	}

 	printf("Creating two threads w/different locks:\n");
 	x = 0;
-	if (pthread_create(&tid1, NULL, lock_reader, &lock_a) != 0) {
-		perror("pthread_create");
-		exit(-1);
+	if ((en = pthread_create(&tid1, NULL, lock_reader, &lock_a)) != 0) {
+		fprintf(stderr, "pthread_create: %s\n", strerror(en));
+		exit(EXIT_FAILURE);
 	}
-	if (pthread_create(&tid2, NULL, lock_writer, &lock_b) != 0) {
-		perror("pthread_create");
-		exit(-1);
+	if ((en = pthread_create(&tid2, NULL, lock_writer, &lock_b)) != 0) {
+		fprintf(stderr, "pthread_create: %s\n", strerror(en));
+		exit(EXIT_FAILURE);
 	}
-	if (pthread_join(tid1, &vp) != 0) {
-		perror("pthread_join");
-		exit(-1);
+	if ((en = pthread_join(tid1, &vp)) != 0) {
+		fprintf(stderr, "pthread_join: %s\n", strerror(en));
+		exit(EXIT_FAILURE);
 	}
-	if (pthread_join(tid2, &vp) != 0) {
-		perror("pthread_join");
-		exit(-1);
+	if ((en = pthread_join(tid2, &vp)) != 0) {
+		fprintf(stderr, "pthread_join: %s\n", strerror(en));
+		exit(EXIT_FAILURE);
 	}

-	return 0;
+	return EXIT_SUCCESS;
 }
diff --git a/CodeSamples/toolsoftrade/mytrue.c b/CodeSamples/toolsoftrade/mytrue.c
index a6ee655c802c..59cbe48d32d3 100644
--- a/CodeSamples/toolsoftrade/mytrue.c
+++ b/CodeSamples/toolsoftrade/mytrue.c
@@ -23,5 +23,5 @@

 int main(int argc, char *argv[])
 {
-	return 0;
+	return EXIT_SUCCESS;
 }
diff --git a/CodeSamples/toolsoftrade/pcreate.c b/CodeSamples/toolsoftrade/pcreate.c
index feca73c4faf6..5241f8f96c76 100644
--- a/CodeSamples/toolsoftrade/pcreate.c
+++ b/CodeSamples/toolsoftrade/pcreate.c
@@ -37,21 +37,22 @@ void *mythread(void *arg)

 int main(int argc, char *argv[])
 {
+	int en;
 	pthread_t tid;
 	void *vp;

-	if (pthread_create(&tid, NULL, mythread, NULL) != 0) {
-		perror("pthread_create");
-		exit(-1);
+	if ((en = pthread_create(&tid, NULL, mythread, NULL)) != 0) {
+		fprintf(stderr, "pthread_join: %s\n", strerror(en));
+		exit(EXIT_FAILURE);
 	}

 	/* parent */

-	if (pthread_join(tid, &vp) != 0) {
-		perror("pthread_join");
-		exit(-1);
+	if ((en = pthread_join(tid, &vp)) != 0) {
+		fprintf(stderr, "pthread_join: %s\n", strerror(en));
+		exit(EXIT_FAILURE);
 	}
 	printf("Parent process sees x=%d\n", x);

-	return 0;
+	return EXIT_SUCCESS;
 }
diff --git a/CodeSamples/toolsoftrade/rwlockscale.c b/CodeSamples/toolsoftrade/rwlockscale.c
index 1bf487e7099c..136b799a160b 100644
--- a/CodeSamples/toolsoftrade/rwlockscale.c
+++ b/CodeSamples/toolsoftrade/rwlockscale.c
@@ -39,6 +39,7 @@ char goflag = GOFLAG_INIT;

 void *reader(void *arg)
 {
+	int en;
 	int i;
 	long long loopcnt = 0;
 	long me = (long)arg;
@@ -48,16 +49,16 @@ void *reader(void *arg)
 		continue;
 	}
 	while (READ_ONCE(goflag) == GOFLAG_RUN) {
-		if (pthread_rwlock_rdlock(&rwl) != 0) {
+		if ((en = pthread_rwlock_rdlock(&rwl)) != 0) {
 			perror("pthread_rwlock_rdlock");
-			exit(-1);
+			exit(EXIT_FAILURE);
 		}
 		for (i = 1; i < holdtime; i++) {
 			barrier();
 		}
-		if (pthread_rwlock_unlock(&rwl) != 0) {
+		if ((en = pthread_rwlock_unlock(&rwl)) != 0) {
 			perror("pthread_rwlock_unlock");
-			exit(-1);
+			exit(EXIT_FAILURE);
 		}
 		for (i = 1; i < thinktime; i++) {
 			barrier();
@@ -70,6 +71,7 @@ void *reader(void *arg)

 int main(int argc, char *argv[])
 {
+	int en;
 	long i;
 	int nthreads;
 	long long sum = 0LL;
@@ -79,7 +81,7 @@ int main(int argc, char *argv[])
 	if (argc != 4) {
 		fprintf(stderr,
 			"Usage: %s nthreads holdloops thinkloops\n", argv[0]);
-		exit(-1);
+		exit(EXIT_FAILURE);
 	}
 	nthreads = strtoul(argv[1], NULL, 0);
 	holdtime = strtoul(argv[2], NULL, 0);
@@ -88,12 +90,13 @@ int main(int argc, char *argv[])
 	tid = malloc(nthreads * sizeof(tid[0]));
 	if (readcounts == NULL || tid == NULL) {
 		fprintf(stderr, "Out of memory\n");
-		exit(-1);
+		exit(EXIT_FAILURE);
 	}
 	for (i = 0; i < nthreads; i++) {
-		if (pthread_create(&tid[i], NULL, reader, (void *)i) != 0) {
+		en = pthread_create(&tid[i], NULL, reader, (void *)i);
+		if (en != 0) {
 			perror("pthread_create");
-			exit(-1);
+			exit(EXIT_FAILURE);
 		}
 	}
 	while (READ_ONCE(nreadersrunning) < nthreads) {
@@ -104,9 +107,9 @@ int main(int argc, char *argv[])
 	goflag = GOFLAG_STOP;

 	for (i = 0; i < nthreads; i++) {
-		if (pthread_join(tid[i], &vp) != 0) {
+		if ((en = pthread_join(tid[i], &vp)) != 0) {
 			perror("pthread_join");
-			exit(-1);
+			exit(EXIT_FAILURE);
 		}
 	}
 	for (i = 0; i < nthreads; i++) {
@@ -116,5 +119,5 @@ int main(int argc, char *argv[])
 	printf("%s n: %d  h: %d t: %d  sum: %lld\n",
 	       argv[0], nthreads, holdtime, thinktime, sum);

-	return 0;
+	return EXIT_SUCCESS;
 }

