Return-Path: <SRS0=opCU=SJ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Q8n5SPHVUDU95a4GLt+5d/fCf7Q2xWeRSo/Y9B8YbtA=;
        b=GqNQRUOEu6iWECn6FMyNqnzw9JJHV0GuonNDJTz1YuzFMR/t+iWQKTWtg29Rtjlw+h
         z41uCpIZmBNzFW06U4twxoHzqLjXYk+iw17giQMpF27LlAg3/sTqSPfC5xOM+I7pdDWO
         bGFAvI+X13Td0622wt6z+qWxAg/wXd9Tsx01Vv3nsgYH6PghnVgtS+Z2n2tDW4qkqtqU
         43m2NrqNoO4PYIcEpSTv3D3P1M1DJIsCt2IwxeA0Lu1GRSCOqu0fl793lZnpdIV1RTiD
         60/if0zfnq576isCQoks3GlljEKzCkYSoUXxOs0lV/qD0boGcP1GOSL+ASw/ngVVRkvD
         c1Ug==
Message-ID: <628a3c58-3745-7ac3-417c-78ac912d742d@gmail.com>
Date: Tue, 25 Jan 2022 18:58:35 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 1/6] advsync: Add major indexing tags to 'NBS' and
 'forward-progress guarantee'
Content-Language: en-US
References: <5baa07e6-7936-4d3a-d2be-75508899f8ac@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <5baa07e6-7936-4d3a-d2be-75508899f8ac@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Also increment number of classes.
Enum item of "Bounded population-oblivious wait-free" was added
in commit 6abfa973f401 ("glossary: Additions from index, F-K").

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/advsync.tex | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/advsync/advsync.tex b/advsync/advsync.tex
index 2d1f316c..d39e0f01 100644
--- a/advsync/advsync.tex
+++ b/advsync/advsync.tex
@@ -30,7 +30,7 @@ Memory ordering is also quite important, but it warrants its own
 \cref{chp:Advanced Synchronization: Memory Ordering}.
 
 The second form of advanced synchronization provides the stronger
-\IXpl{forward-progress guarantee} needed for parallel real-time computing,
+forward-progress guarantees needed for parallel real-time computing,
 which is the topic of
 \cref{sec:advsync:Parallel Real-Time Computing}.
 
@@ -80,9 +80,9 @@ them, please re-read
 	  it's supposed to do.}
 	 {\emph{Robert A. Heinlein}}
 
-The term \IXacrfst{nbs}~\cite{MauriceHerlihy90a}
-describes seven classes of \IX{linearizable} algorithms with differing
-\emph{\IXpl{forward-progress guarantee}}~\cite{DanAlitarh2013PracticalProgress},
+The term \IXBacrfst{nbs}~\cite{MauriceHerlihy90a}
+describes eight classes of \IX{linearizable} algorithms with differing
+\emph{\IXBpl{forward-progress guarantee}}~\cite{DanAlitarh2013PracticalProgress},
 which are as follows:
 
 \begin{enumerate}
-- 
2.17.1


