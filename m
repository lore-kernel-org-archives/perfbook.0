Return-Path: <SRS0=NH/g=A6=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683629605; x=1686221605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9D54KVLmUmkvPmiPUzf4uEVX/jFylW7UXJhvrhtaM3c=;
        b=aEPYorBvVWPqNSHWXBB95W8XmYMuFWArOwGmMrkfesUzqI+hl1HsigqskT8EFTgswE
         X0OyIRSRy2QhuHNQDUauzBgmKYGaLxPhcYvQQ/VwASejsqiWAqCRMI1Uk+PJ0XOInUcX
         GaZ1aJuMvMmgVauGTgYFJZIK+gTgPGTEkkSPR9yQjkxju/TDywMFWwXUqsvO52LPGIlG
         RVFS197asSV505zPOh3oLqeA0Kj97ZN8ycv8CYXX5xHCkQTmchC2GcpKS96eKgOswpIF
         gT/9okVRjsuxXno4gEBz76Nqhf5S5iTD7z4ADo1L67gCe0NBKjS9klkszRpDLjoiO7Do
         q7hg==
From: Alan Huang <mmpgouride@gmail.com>
Subject: [PATCH v2] datastruct: Remove outdated content
Date: Tue,  9 May 2023 10:53:18 +0000
Message-Id: <20230509105318.32998-1-mmpgouride@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org, akiyks@gmail.com
Cc: perfbook@vger.kernel.org, Alan Huang <mmpgouride@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The code of resizable hash table has been updated so that it doesn't
need to compute the hash twice since 2019. Here are some related
commits:
	2ea492bbab9d ("datatruct/hash: Don't recompute hashes in hashtab_add()")
	2a7f20d234e7 ("datastruct/hash: Don't recompute hashes in hashtab_del()")
	  ...
So, the patch removes the outdated content.

Signed-off-by: Alan Huang <mmpgouride@gmail.com>
Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
---
 datastruct/datastruct.tex | 29 +++--------------------------
 1 file changed, 3 insertions(+), 26 deletions(-)

diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 8c2bfc16..0242ccc7 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -2017,32 +2017,10 @@ which could allow the compiler to inline the resulting fixed functions,
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
-\QuickQuizE{
+\QuickQuiz{
 	How much do these specializations really save?
 	Are they really worth it?
-}\QuickQuizAnswerE{
+}\QuickQuizAnswer{
 	The answer to the first question is left as an exercise to
 	the reader.
 	Try specializing the resizable hash table and see how much
@@ -2051,8 +2029,7 @@ the subsequent call to \co{ht_get_bucket()}.
 	instead be answered with respect to a specific use case.
 	Some use cases are extremely sensitive to performance and
 	scalability, while others are less so.
-}\QuickQuizEndE
-}
+}\QuickQuizEnd
 
 All that aside, one of the great benefits of modern hardware compared
 to that available when I first started learning to program back in
-- 
2.34.1

