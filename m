Return-Path: <SRS0=SV7w=A5=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683566877; x=1686158877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qBSxT5212J/Ezb+/NmqTDzhNv5UtHdpnYwLNb/0JMFc=;
        b=GkXKvyn8TVw0ahe1wly4Jr2bCBrpQv6YOjKaacq9qJAgEh+Nt8Cd9oTsJZchKqRng8
         jzMyUHk/5lAEvBhV5JfZSme8CtMRzRfnkVqTP8Qi4OpnYe6AabGoVCLUXbo0zulz4AYm
         lgeZeeYInjLWQhJ9h/RwRTTjG2B+23cplVxBCBN80Qa5N7U0GH7vxB0CPPLqubTyPei2
         tkL2Jzo19wHdpvoQmDfCrb7seAVc6GC3PLxw+Yq9QMQMskTpEd3HTCHA9pzz8Ve1bQS6
         hA5MnbDxAuGrXM04Zx5mPHSYBFy3NtRiSn5sz3pq/Vrgx3aTSVyRG/Mslm3EvaQTJ2ns
         4MKQ==
From: Alan Huang <mmpgouride@gmail.com>
Subject: [PATCH] datastruct: Remove outdated content
Date: Mon,  8 May 2023 17:27:48 +0000
Message-Id: <20230508172748.31803-1-mmpgouride@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Alan Huang <mmpgouride@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The code of resizable hash table has been updated so that it doesn't
need to compute the hash twice since 2019. Here are some related
commits:
	2ea492b,
	2a7f20d,
	  ...
So, the patch removes the outdated content.

Signed-off-by: Alan Huang <mmpgouride@gmail.com>
---
 datastruct/datastruct.tex | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 8c2bfc16..9aa04bb5 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -2017,28 +2017,6 @@ which could allow the compiler to inline the resulting fixed functions,
 eliminating not only the overhead of the call instruction, but the
 argument marshalling as well.
 
-In addition, the resizable hash table is designed to fit an API
-that segregates bucket selection from concurrency control.
-Although this allows a single torture test to exercise all the hash-table
-implementations in this chapter, it also means that many operations
-must compute the hash and interact with possible resize operations twice
-rather than just once.
-In a performance-conscious environment, the \co{hashtab_lock_mod()}
-function would also return a reference to the bucket selected, eliminating
-the subsequent call to \co{ht_get_bucket()}.
-
-\QuickQuizSeries{%
-\QuickQuizB{
-	Couldn't the \path{hashtorture.h} code be modified to accommodate
-	a version of \co{hashtab_lock_mod()} that subsumes the
-	\co{ht_get_bucket()} functionality?
-}\QuickQuizAnswerB{
-	It probably could, and doing so would benefit all of the
-	per-bucket-locked hash tables presented in this chapter.
-	Making this modification is left as an exercise for the
-	reader.
-}\QuickQuizEndB
-%
 \QuickQuizE{
 	How much do these specializations really save?
 	Are they really worth it?
@@ -2052,7 +2030,6 @@ the subsequent call to \co{ht_get_bucket()}.
 	Some use cases are extremely sensitive to performance and
 	scalability, while others are less so.
 }\QuickQuizEndE
-}
 
 All that aside, one of the great benefits of modern hardware compared
 to that available when I first started learning to program back in
-- 
2.34.1

