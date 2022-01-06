Return-Path: <SRS0=GtJ7=RW=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sW3D0Sk3cI2UreLSO9UZBmn7orUfLZK4snP5+l9g/ug=;
        b=bM0tlQf8D8Rnl9xK8cQ4PqX/bZiWuouNpafA9rTbpPcLI8iXygrZs2CGLgWJRiHBWU
         BETPgB261hhqU30GlVji3NE45qlnfbyXNhuvRMkiPT/fTwjrm8Y8hrc7Yt5gaWqi7tcP
         FUFg4Jn8EKvh9kaB4iHW8K6aLvAtZDAnS+sXbVSwKqiYiIAy91TH/73l2mfkmBU/ygvS
         Qp6nu0XQs0HO91+dXIIEa6SSDdQLdWMGfQ41Dp7dRKhmaGzxdSAnjsMqRBcdRf8zYarJ
         vwrpUMQ5hWmzwYbnJkcAz32SpsMmwNtHEMVOY+qDXOYZxJzAPlFktsbkiabPU2xuUNij
         f7yA==
Subject: [PATCH RESEND -perfbook 07/10] count: Add index tags to APIs
References: <d61bf71a-d3ed-1561-62ee-15d4537443da@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <d4ffad5b-0d2c-3447-4d4e-c2441ebed0ce@gmail.com>
Date: Thu, 6 Jan 2022 16:40:53 +0900
MIME-Version: 1.0
In-Reply-To: <d61bf71a-d3ed-1561-62ee-15d4537443da@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

List of tagged APIs:
  o __get_thread_var(): perfbook's own
  o for_each_thread():  perfbook's own
  o per_thread():       perfbook's own
  o __thread:           GCC extension
  o atomic_t:           Linux kernel
  o atomic_cmpxchg()    Linux kernel
  o pthread_kill()      POSIX

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 count/count.tex | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/count/count.tex b/count/count.tex
index 2870506b..d2b39904 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -510,7 +510,7 @@ type \co{unsigned long} named, creatively enough, \co{counter}.
 
 \Clnrefrange{inc:b}{inc:e}
 show a function that increments the counters, using the
-\co{__get_thread_var()} primitive to locate the currently running
+\apipf{__get_thread_var()} primitive to locate the currently running
 thread's element of the \co{counter} array.
 Because this element is modified only by the corresponding thread,
 non-atomic increment suffices.
@@ -538,8 +538,8 @@ The use of \co{WRITE_ONCE()} prevents this optimization and others besides.
 
 \Clnrefrange{read:b}{read:e}
 show a function that reads out the aggregate value of the counter,
-using the \co{for_each_thread()} primitive to iterate over the list of
-currently running threads, and using the \co{per_thread()} primitive
+using the \apipf{for_each_thread()} primitive to iterate over the list of
+currently running threads, and using the \apipf{per_thread()} primitive
 to fetch the specified thread's counter.
 This code also uses \co{READ_ONCE()} to ensure that the compiler doesn't
 optimize these loads into oblivion.
@@ -721,7 +721,7 @@ This is the topic of the next section.
 \subsection{Per-Thread-Variable-Based Implementation}
 \label{sec:count:Per-Thread-Variable-Based Implementation}
 
-\GCC\ provides an \co{__thread} storage class that provides
+\GCC\ provides an \apig{__thread} storage class that provides
 per-thread storage.
 This can be used as shown in
 \cref{lst:count:Per-Thread Statistical Counters} (\path{count_end.c})
@@ -1914,7 +1914,7 @@ The \co{counter} and \co{countermax} variables in earlier algorithms
 are combined into the single variable \co{counterandmax} shown on
 \clnref{candmax}, with \co{counter} in the upper half and \co{countermax} in
 the lower half.
-This variable is of type \co{atomic_t}, which has an underlying
+This variable is of type \apik{atomic_t}, which has an underlying
 representation of \co{int}.
 
 \Clnrefrange{def:b}{def:e} show the definitions for \co{globalcountmax}, \co{globalcount},
@@ -2007,7 +2007,7 @@ shows the \co{add_count()} and \co{sub_count()} functions.
 with the remainder of the function being the slowpath.
 \Clnrefrange{fast:b}{loop:e} of the fastpath form a compare-and-swap
 (CAS) loop, with
-the \co{atomic_cmpxchg()} primitive on
+the \apik{atomic_cmpxchg()} primitive on
 \clnrefrange{atmcmpex}{loop:e} performing the
 actual CAS\@.
 \Clnref{split} splits the current thread's \co{counterandmax} variable into its
@@ -2625,7 +2625,7 @@ left as an exercise for the reader, as is the analysis of
 \cref{lst:count:Signal-Theft Limit Counter Initialization Functions}
 show \co{count_init()}, which set up \co{flush_local_count_sig()}
 as the signal handler for \co{SIGUSR1},
-enabling the \co{pthread_kill()} calls in \co{flush_local_count()}
+enabling the \apipx{pthread_kill()} calls in \co{flush_local_count()}
 to invoke \co{flush_local_count_sig()}.
 The code for thread registry and unregistry is similar to that of
 earlier examples, so its analysis is left as an exercise for the
-- 
2.17.1


