Return-Path: <SRS0=nUow=JS=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=h9k4qb2MtXVOucXSlZl9C/4zLEK2DSaIA3bp7UgfhGY=;
        b=mjhFYla1r11WBcOsiPW5sxUioFmRmUXf4T49iAEhe+0mUO8Mgy+jTBRqZggF4mTAHo
         ouHBMAsIBxbJQXGZf9FlvDrcC7685qKomITIL368lY9iYuDCmbbUNLcwG3dIQSSBq6cu
         yeqRTX+KKfwSOaZX//4mVgSCXwlS9EUWtR0PNi4FipSmU8xVZznb5vFL7kUoV7KRJEQL
         RZ7QVtk7MVpFnC/jOH0tE+7um14JsuEMDZ0f5ajjTqbXwDRC7MG7DNlkM9hdn8nHjwDR
         2jSU1aAtaN5arG81pl0+xEI40Y9hr/CxTmrIdahN6xoYC4q9PD/+Wn4wVNy5943f54Cc
         8EPw==
Subject: [PATCH -perfbook 3/4] questions: Reference Tables 17.1 and 17.2
 instead of Table 17.3 in -eb build
References: <5a17ce08-9c5d-5e87-6cae-793c6a49c147@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <401ad976-8bda-85d2-bffc-39369043e4eb@gmail.com>
Date: Thu, 22 Apr 2021 00:29:06 +0900
MIME-Version: 1.0
In-Reply-To: <5a17ce08-9c5d-5e87-6cae-793c6a49c147@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

As Table 17.3 (merged large table) is not available in -eb build due
to its size, reference Tables 17.1 and 17.2 instead.

Also use \cpageref{} for "page~\pageref{}".

Fixes: 2db0c0f61ea1 ("appendix/questions: Address and remove "@@@" todo flags, take two")
[conflicts with 1704b2b83177 ("treewide: Shrink floats for ebook-size build"),
whose change log mentions "Figure 17.3" meaning *Table* 17.3]
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/questions/removelocking.tex | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/appendix/questions/removelocking.tex b/appendix/questions/removelocking.tex
index 6678e7a2..f87bdf41 100644
--- a/appendix/questions/removelocking.tex
+++ b/appendix/questions/removelocking.tex
@@ -19,9 +19,17 @@ Furthermore, as a general rule, the more complex the algorithm,
 the greater the advantage of combining locking with selected
 lockless techniques, even with significant hardware support,
 as shown in
+\IfEbookSize{
+\cref{tab:future:Comparison of Locking and HTM,%
+tab:future:Comparison of Locking (Augmented by RCU or Hazard Pointers) and HTM}
+on
+\cpageref{tab:future:Comparison of Locking and HTM,%
+tab:future:Comparison of Locking (Augmented by RCU or Hazard Pointers) and HTM}.
+}{
 \cref{tab:future:Comparison of Locking (Plain and Augmented) and HTM}
 on
-page~\pageref{tab:future:Comparison of Locking (Plain and Augmented) and HTM}.
+\cpageref{tab:future:Comparison of Locking (Plain and Augmented) and HTM}.
+}
 \Cref{sec:advsync:Non-Blocking Synchronization}
 looks more deeply at non-blocking synchronization, which is a popular
 lockless methodology.
-- 
2.17.1


