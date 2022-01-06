Return-Path: <SRS0=GtJ7=RW=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+yA8WBej5I+8GhLYSU+pBDqCWGHK5kVNruFIVu4cy2g=;
        b=G2O+kV7Ze7wwYRBQ5a144ssKtiMPq2/FPLQ6BBW8Cs3NALooVv5IklRxx9plFSTDuz
         YZ4c6S0eXmGlBkK4UEIzDW3il7DoSZh+Mb8Y7uYbCWBaGVK8+l1LH/xyWEVWh8jXZL91
         jByLCVuMVlLC8u1URSkgdra6pGquAMwB2+iGQdNRhO9929dumK8IInNLa1NU3zHrLVPP
         VHcyB6wQslPxB3JCs74t/lZTtj1YMUaumCcP30pXbD5BupSGzTTYE5vsWtcOBmCaiOYG
         tw2TOf8b891c/rdh49fJyjVZ7K5IkuIOrlG2sZHomvhWqloq9y/1kONKLX+eYg33zlhf
         9evQ==
Subject: [PATCH RESEND -perfbook 08/10] locking: Add index tags to APIs
References: <d61bf71a-d3ed-1561-62ee-15d4537443da@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <d5366591-9043-699d-f08f-86bb602fba88@gmail.com>
Date: Thu, 6 Jan 2022 16:41:53 +0900
MIME-Version: 1.0
In-Reply-To: <d61bf71a-d3ed-1561-62ee-15d4537443da@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

List of tagged APIs

  o call_rcu():            Linux kernel
  o pthread_cond_wait()    POSIX
  o pthread_mutex_t        POSIX
  o spin_trylock()         Linux kernel
  o pthread_mutex_lock()   POSIX
  o fork()                 POSIX
  o exec()                 POSIX
  o pthread_atfork()       POSIX

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 locking/locking.tex | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/locking/locking.tex b/locking/locking.tex
index 18d52e36..2a6068a7 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -461,7 +461,7 @@ Some alternatives to highly layered locking hierarchies are covered in
 
 One way to avoid deadlock is to defer acquisition of one of the
 conflicting locks.
-This approach is used in Linux-kernel RCU, whose \co{call_rcu()}
+This approach is used in Linux-kernel RCU, whose \apik{call_rcu()}
 function is invoked by the Linux-kernel scheduler while holding
 its locks.
 This means that \co{call_rcu()} cannot always safely invoke the scheduler
@@ -516,8 +516,8 @@ principle.
 One exception is functions that hand off some entity,
 where the caller's lock must be held until the handoff is complete,
 but where the lock must be released before the function returns.
-One example of such a function is the POSIX \co{pthread_cond_wait()}
-function, where passing an pointer to a \co{pthread_mutex_t}
+One example of such a function is the POSIX \apipx{pthread_cond_wait()}
+function, where passing an pointer to a \apipx{pthread_mutex_t}
 prevents hangs due to lost wakeups.
 
 \QuickQuiz{
@@ -583,7 +583,7 @@ conditionally, as shown in
 \cref{lst:locking:Avoiding Deadlock Via Conditional Locking}.
 \begin{fcvref}[ln:locking:Avoiding Deadlock Via Conditional Locking]
 Instead of unconditionally acquiring the layer-1 lock, \clnref{trylock}
-conditionally acquires the lock using the \co{spin_trylock()} primitive.
+conditionally acquires the lock using the \apik{spin_trylock()} primitive.
 This primitive acquires the lock immediately if the lock is available
 (returning non-zero), and otherwise returns zero without acquiring the lock.
 
@@ -730,7 +730,7 @@ and several others are presented in
 \label{sec:locking:Signal/Interrupt Handlers}
 
 Deadlocks involving signal handlers are often quickly dismissed by
-noting that it is not legal to invoke \co{pthread_mutex_lock()} from
+noting that it is not legal to invoke \apipx{pthread_mutex_lock()} from
 within a signal handler~\cite{OpenGroup1997pthreads}.
 However, it is possible (though often unwise) to hand-craft
 locking primitives that \emph{can} be invoked from signal handlers.
@@ -2350,7 +2350,7 @@ human intuition~\cite{StevenRostedt2011locdepCryptic}.
 \label{sec:locking:Library Functions Used Between fork() and exec()}
 
 As noted earlier, if a thread executing a library function is holding
-a lock at the time that some other thread invokes \co{fork()}, the
+a lock at the time that some other thread invokes \apipx{fork()}, the
 fact that the parent's memory is copied to create the child means that
 this lock will be born held in the child's context.
 The thread that will release this lock is running in the parent, but not
@@ -2364,7 +2364,7 @@ to \co{fork()} a child process while the process is still single-threaded,
 and have this child process remain single-threaded.
 Requests to create further child processes can then be communicated
 to this initial child process, which can safely carry out any
-needed \co{fork()} and \co{exec()} system calls on behalf of its
+needed \co{fork()} and \apipx{exec()} system calls on behalf of its
 multi-threaded parent process.
 
 Another rather less pragmatic and straightforward solution to this problem
@@ -2383,7 +2383,7 @@ However, this approach has a couple of vulnerabilities:
 	This could again result in arbitrary memory corruption.
 \end{enumerate}
 
-The \co{pthread_atfork()} function is provided to help deal with these situations.
+The \apipx{pthread_atfork()} function is provided to help deal with these situations.
 The idea is to register a triplet of functions, one to be called by the
 parent before the \co{fork()}, one to be called by the parent after the
 \co{fork()}, and one to be called by the child after the \co{fork()}.
-- 
2.17.1


