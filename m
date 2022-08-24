Return-Path: <SRS0=Ahii=Y4=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc;
        bh=0MIQbl01wE5kIm4Ct9gmMjVMw0KyPT72mRYhUC/cq7Q=;
        b=obP7mazkCUhrCUAQd5hXoC+aztdjL1TUj+vg5yZidCiDxwH6zZoJz+IAvN0ptfgfK2
         yN9ChVztlXui5lSP1Au+S8giW96chBow/EqieFPYYT+SCBhfNopk6c0xKQf8x9lwFgB3
         jNLwXCzy7hwBcD+8KZNPooaXIh5nSmUfR4qOIUf2J2jwEItqi/WVl3mFPPmVEa70Sb9V
         17VyZw77g51lR5aGrF6H4NuM0ZPdDvb9aKnZgZDt+7oiOTbN0J39O8h5nmErK/U+RrV4
         BiHKWUfnAywZF2hU2DdXD7R1/JLv0Ru2/vMA2tzlGvSU5XxtO1P9Yf7BjY1/kzhqybrd
         HVZA==
Message-ID: <f96b6945-0727-b9f2-c34b-0c58a508cd92@gmail.com>
Date: Wed, 24 Aug 2022 11:43:38 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] count: Adjust index marker of _Thread_local
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Elad Lahav <e2lahav@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

\apic{} is there for ISO C std APIs.  Use it.

While we are here, fix a couple of minor nits:
   - align //\lnlbl{var:b} in count_end.c;
   - not line-break in front of \footnote{}, indent footnote text.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Fixes: 24e8f711d2cf ("count: Switch from GCC to C11 thread-local storage")
Cc: Elad Lahav <e2lahav@gmail.com>
---
 CodeSamples/count/count_end.c |  2 +-
 count/count.tex               | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/CodeSamples/count/count_end.c b/CodeSamples/count/count_end.c
index 5e7b9ee1025c..b6ed851c35a9 100644
--- a/CodeSamples/count/count_end.c
+++ b/CodeSamples/count/count_end.c
@@ -23,7 +23,7 @@
 #include "../api.h"
 
 //\begin{snippet}[labelbase=ln:count:count_end:whole,commandchars=\\\@\$]
-unsigned long _Thread_local counter = 0;		//\lnlbl{var:b}
+unsigned long _Thread_local counter = 0;	//\lnlbl{var:b}
 unsigned long *counterp[NR_THREADS] = { NULL };
 unsigned long finalcount = 0;
 DEFINE_SPINLOCK(final_mutex);			//\lnlbl{var:e}
diff --git a/count/count.tex b/count/count.tex
index 775cf77e90a8..b2de4646b18f 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -721,12 +721,12 @@ This is the topic of the next section.
 \subsection{Per-Thread-Variable-Based Implementation}
 \label{sec:count:Per-Thread-Variable-Based Implementation}
 
-The C language, since C11, features a \apig{_Thread_local} storage class that
-provides per-thread storage.
-\footnote{\GCC\ provides its own \apig{__thread} storage class, which was used
-in previous versions of this book.
-The two methods for specifying a thread-local variable are interchangeable
-when using \GCC\@.}
+The C language, since C11, features a \apic{_Thread_local} storage class that
+provides per-thread storage.\footnote{
+	\GCC\ provides its own \apig{__thread} storage class, which was used
+	in previous versions of this book.
+	The two methods for specifying a thread-local variable are
+	interchangeable when using \GCC\@.}
 This can be used as shown in
 \cref{lst:count:Per-Thread Statistical Counters} (\path{count_end.c})
 to implement

base-commit: ba01403b34de88d3060e119f899f5eb053c5f162
-- 
2.25.1

