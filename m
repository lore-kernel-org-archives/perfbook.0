Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LYu1iNGrrq1nWRw5QLlNsSDMa3MlCRXz47DK/gLmtYQ=;
        b=UUlX6+K9UUKxx0n3amjg/GFx+akqR86Gy452Sit8y1oudEjbST1MeA+uXvs9y6oJDQ
         IV6WlYR0oBs2IYA/XO8+g+qu2ANJp37jVNQRR0dQMFa1K2sKSt55Y3NGaHKZ0F4c52wa
         mBKCiLYFsbRJPRlcf2t2ouCsM51V6zlmk/7CIkMg4P4x6gQ5FYeYbQFuR6e15aOCYfhh
         r7NWVIB+smdUkydF5S3mZO2W6OOx3nqtisl38obQcC6XX2dREjFsDuF3JI/hmThbSx7X
         OAxOEFKgJ4WziYlxHQsKhUgqYufiFqaPLEMgqLqy47p6rE4hOqR/hrw6RCBg1oatxIra
         O8oQ==
Subject: [PATCH 1/6] count: Employ new scheme for snippet of count_lim_app
References: <a20c67f0-db94-7e03-ed69-d09fd51899dd@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <eacfc629-64e2-a5bc-42da-0e26bf44b311@gmail.com>
Date: Sat, 13 Oct 2018 23:53:58 +0900
MIME-Version: 1.0
In-Reply-To: <a20c67f0-db94-7e03-ed69-d09fd51899dd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From ea84d6ff5dd7e0a0f89d8eacf844d920298584b9 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 8 Oct 2018 16:08:59 +0900
Subject: [PATCH 1/6] count: Employ new scheme for snippet of count_lim_app

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/count/count_lim_app.c | 11 ++++++++---
 count/count.tex                   | 40 ++++++---------------------------------
 2 files changed, 14 insertions(+), 37 deletions(-)

diff --git a/CodeSamples/count/count_lim_app.c b/CodeSamples/count/count_lim_app.c
index 0bdf6b0..1817c19 100644
--- a/CodeSamples/count/count_lim_app.c
+++ b/CodeSamples/count/count_lim_app.c
@@ -21,6 +21,7 @@
 
 #include "../api.h"
 
+//\begin{snippet}[labelbase=ln:count:count_lim_app:variable,commandchars=\\\@\$]
 unsigned long __thread counter = 0;
 unsigned long __thread countermax = 0;
 unsigned long globalcountmax = 10000;
@@ -29,6 +30,7 @@ unsigned long globalreserve = 0;
 unsigned long *counterp[NR_THREADS] = { NULL };
 DEFINE_SPINLOCK(gblcnt_mutex);
 #define MAX_COUNTERMAX 100
+//\end{snippet}
 
 static void globalize_count(void)
 {
@@ -38,18 +40,21 @@ static void globalize_count(void)
 	countermax = 0;
 }
 
+//\begin{snippet}[labelbase=ln:count:count_lim_app:balance,commandchars=\\\[\]]
 static void balance_count(void)
 {
-	countermax = globalcountmax - globalcount - globalreserve;
+	countermax = globalcountmax -
+	             globalcount - globalreserve;
 	countermax /= num_online_threads();
-	if (countermax > MAX_COUNTERMAX)
-		countermax = MAX_COUNTERMAX;
+	if (countermax > MAX_COUNTERMAX)	//\lnlbl{enforce:b}
+		countermax = MAX_COUNTERMAX;	//\lnlbl{enforce:e}
 	globalreserve += countermax;
 	counter = countermax / 2;
 	if (counter > globalcount)
 		counter = globalcount;
 	globalcount -= counter;
 }
+//\end{snippet}
 
 int add_count(unsigned long delta)
 {
diff --git a/count/count.tex b/count/count.tex
index 3598aac..90d0936 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -1759,44 +1759,13 @@ This task is undertaken in the next section.
 \label{sec:count:Approximate Limit Counter Implementation}
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 unsigned long __thread counter = 0;
-  2 unsigned long __thread countermax = 0;
-  3 unsigned long globalcountmax = 10000;
-  4 unsigned long globalcount = 0;
-  5 unsigned long globalreserve = 0;
-  6 unsigned long *counterp[NR_THREADS] = { NULL };
-  7 DEFINE_SPINLOCK(gblcnt_mutex);
-  8 #define MAX_COUNTERMAX 100
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/count/count_lim_app@variable.fcv}
 \caption{Approximate Limit Counter Variables}
 \label{lst:count:Approximate Limit Counter Variables}
 \end{listing}
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 static void balance_count(void)
-  2 {
-  3   countermax = globalcountmax -
-  4                globalcount - globalreserve;
-  5   countermax /= num_online_threads();
-  6   if (countermax > MAX_COUNTERMAX)
-  7     countermax = MAX_COUNTERMAX;
-  8   globalreserve += countermax;
-  9   counter = countermax / 2;
- 10   if (counter > globalcount)
- 11     counter = globalcount;
- 12   globalcount -= counter;
- 13 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/count/count_lim_app@balance.fcv}
 \caption{Approximate Limit Counter Balancing}
 \label{lst:count:Approximate Limit Counter Balancing}
 \end{listing}
@@ -1813,12 +1782,15 @@ Listing~\ref{lst:count:Simple Limit Counter Variables},
 with the addition of \co{MAX_COUNTERMAX}, which sets the maximum
 permissible value of the per-thread \co{countermax} variable.
 
+\begin{lineref}[ln:count:count_lim_app:balance]
 Similarly,
 Listing~\ref{lst:count:Approximate Limit Counter Balancing}
 is identical to the \co{balance_count()} function in
 Listing~\ref{lst:count:Simple Limit Counter Utility Functions},
-with the addition of lines~6 and~7, which enforce the
+with the addition of
+lines~\lnref{enforce:b} and~\lnref{enforce:e}, which enforce the
 \co{MAX_COUNTERMAX} limit on the per-thread \co{countermax} variable.
+\end{lineref}
 
 \subsection{Approximate Limit Counter Discussion}
 
-- 
2.7.4


