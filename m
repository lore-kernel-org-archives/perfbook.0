Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=Vns6SJSQ5Yxkq/Yp/bqk2hGkYoDWHvvclgWOPcxGUAo=;
 b=KPTqe7Ha4KMo1WfdWdQXvHEMzEEYyDqaSKoVXF/7vGgMN4ociD+Oj2jXhhUZ8+wkbV
 Pl0+AEvYtcDWmat+jYVdyv+EXY0Oexwm36g+HGBzA9CTeDgZvZpK0lw1ZADJbkYEVDdh
 IMAJMJ3+OKA+wPBwNriza1y03LK608cbjvmmg4lSL4VwlTAZUHnzg8Y0MhUROQUUTgS4
 AVX2wjtMhqov7ZqbAicPGvwEAIQetnqcgtWf85LOZ8w5JNjQXqoKO8I2liWchAJleNfG
 VxctP+abrmIt6hwgmZWBpOmMNrItR5gWOzAG/ja4G09nHHnsDiX4vK/B/5+V5cSMkjop
 KCVw==
Subject: [RFC PATCH 09/12] advsync: Move footnote on transitivity forward
References: <b00db59a-a0b0-42d6-7546-01872ad3e404@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e7462be5-d7cf-9fd1-f16d-009ed036935d@gmail.com>
Date: Sat, 1 Apr 2017 11:21:08 +0900
MIME-Version: 1.0
In-Reply-To: <b00db59a-a0b0-42d6-7546-01872ad3e404@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From f747b77a00951868bb2ed54cc92fd25e6eb06f31 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 26 Mar 2017 17:00:35 +0900
Subject: [RFC PATCH 09/12] advsync: Move footnote on transitivity forward

The footnote appended in commit cc477e60a0ff ("advsync: Add
footnote on transitivity") should be where "transitivity" is
first mentioned in the section.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 173d7ad..942c430 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -2070,7 +2070,9 @@ In short, control dependencies apply only to the stores in the ``\co{then}''
 and ``\co{else}'' of the ``\co{if}'' in question (including functions
 invoked by those two clauses), not to code following that ``\co{if}''.

-Finally, control dependencies do \emph{not} provide transitivity.
+Finally, control dependencies do \emph{not} provide transitivity.\footnote{
+	Refer to Section~\ref{sec:advsync:Transitivity} for
+	the meaning of transitivity.}
 This is demonstrated by two related examples, with the initial values
 of~\co{x} and~\co{y} both being zero:

@@ -2166,9 +2168,7 @@ The following list of rules summarizes the lessons of this section:

 \item	Control dependencies pair normally with other types of barriers.

-\item	Control dependencies do \emph{not} provide transitivity.\footnote{
-		Refer to Section~\ref{sec:advsync:Transitivity} for
-		the meaning of transitivity.}
+\item	Control dependencies do \emph{not} provide transitivity.
 	If you need transitivity, use \co{smp_mb()}.
 \end{enumerate}

-- 
2.7.4


