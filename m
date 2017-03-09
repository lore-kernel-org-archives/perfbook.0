Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=LqmmhYnflBrdLUjn0Q7XovRVN0ijoEHAzKabn3FiE5g=;
 b=E+vrFUdXa5XLVgH3nOIFM1mI9IJdOWk7YpWlwmQtMdKC+pw7cEg9y6rl58Y6bBfFlq
 70vCXVgtGKohqC2XQGA/r2NxJU3t0+TixHpw/b29KoHNkGgcMdG6kDSCZKSCF6ANJ+4o
 dNyod9W292lr6GGY4TAFpsfA5E7ayanjKibtpSYHmRELo0j7htr7n1graoRSdFzEUpfN
 Q7FZC3gQkDcseeGtmgp5DfuuYBLNb9Yu+XZG0zgOYkEMDNHcM68yLWTgqA/I0QrgvSh/
 aqnIsMwPPJt7hMtgGSDlDey7/ZHlsF7qFLg0EkcATx4wWR1rUEDiPWjcd+Hiil51010g
 OMBQ==
Subject: [PATCH 2/5] intro: Move ':' to tail of 'description' label
References: <97daedea-d454-cdf6-0111-8089ef0678c8@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5bfa6eda-1047-333b-b69e-3bb1169fc1c3@gmail.com>
Date: Fri, 10 Mar 2017 00:23:31 +0900
MIME-Version: 1.0
In-Reply-To: <97daedea-d454-cdf6-0111-8089ef0678c8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From de0da3d0e4ae3ee76c56672295b9cfefc0c61a2c Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 9 Mar 2017 23:51:37 +0900
Subject: [PATCH 2/5] intro: Move ':' to tail of 'description' label

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 intro/intro.tex | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/intro/intro.tex b/intro/intro.tex
index 413525b..0b8659e 100644
--- a/intro/intro.tex
+++ b/intro/intro.tex
@@ -524,32 +524,32 @@ To see this more generally, consider the following popular parallel
 programming environments:

 \begin{description}
-\item[C/C++ ``Locking Plus Threads'']: This category, which includes
+\item[C/C++ ``Locking Plus Threads'':] This category, which includes
 	POSIX Threads (pthreads)~\cite{OpenGroup1997pthreads},
 	Windows Threads, and numerous
 	operating-system kernel environments, offers excellent performance
 	(at least within the confines of a single SMP system)
 	and also offers good generality.
 	Pity about the relatively low productivity.
-\item[Java]: This general purpose and inherently multithreaded
+\item[Java:] This general purpose and inherently multithreaded
 	programming environment	is widely believed to offer much higher
 	productivity than C or C++, courtesy of the automatic garbage collector
 	and the rich set of class libraries.
 	However, its performance, though greatly improved in the early
 	2000s, lags that of C and C++.
-\item[MPI]: This Message Passing Interface~\cite{MPIForum2008} powers
+\item[MPI:] This Message Passing Interface~\cite{MPIForum2008} powers
 	the largest scientific and technical computing clusters in
 	the world and offers unparalleled performance and scalability.
 	In theory, it is general purpose, but it is mainly used
 	for scientific and technical computing.
 	Its productivity is believed by many to be even lower than that
 	of C/C++ ``locking plus threads'' environments.
-\item[OpenMP]: This set of compiler directives can be used
+\item[OpenMP:] This set of compiler directives can be used
 	to parallelize loops.  It is thus quite specific to this
 	task, and this specificity often limits its performance.
 	It is, however, much easier to use than MPI or C/C++
 	``locking plus threads.''
-\item[SQL]: Structured Query Language~\cite{DIS9075SQL92} is
+\item[SQL:] Structured Query Language~\cite{DIS9075SQL92} is
 	specific to relational database queries.
 	However, its performance is quite good as measured by the
 	Transaction Processing Performance Council (TPC)
-- 
2.7.4


