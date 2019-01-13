Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JXRsqy8v5D/InAAg0iOZO1h9hYm6V+gRQCsi0AZeqis=;
        b=IPqYgATxtiPyrrGb/jIooX7GwUK3Zf+h7pAVb191D4LnnWIZuK6Tq4vcUZWfgkAcii
         DCvKBW6blqQX8BeASkcE7eVmpqGVTFSMb+WwTst+NZYlinNnqD/rFaH6nykPL6KEbX+6
         LGmAJCNKKwCNplMTByxs3Aw16PDcANQXn2CWQdAsobADXYGMiCf/MnljxQwhnU/mP72q
         ByxdkaMlFMu5fL8c1zrkKXoRAJnpHTNVxSb9KZUosyECyhMsSnyXg9as1pyVaQa35nsb
         DifBBSaHxGPOlswVezcpfbtU8k5QFR/79lWHtFIa5HFA2qu+BF72H01slZvP6DILvzWJ
         DqHg==
Subject: [PATCH 4/6] datastruct/hash: Adjust context to updated code in
 hash_resize.c
References: <dff55e7c-6e93-8f4a-79fd-f400ed3b38f8@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <c3a15056-e212-b94e-c53f-e9512c1f594a@gmail.com>
Date: Mon, 14 Jan 2019 08:35:07 +0900
MIME-Version: 1.0
In-Reply-To: <dff55e7c-6e93-8f4a-79fd-f400ed3b38f8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From fd50eec2691a61abd52b038c750e173ab1160b02 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 13 Jan 2019 20:00:20 +0900
Subject: [PATCH 4/6] datastruct/hash: Adjust context to updated code in hash_resize.c

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 datastruct/datastruct.tex | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index f344842..6d8350a 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -952,7 +952,7 @@ In contrast, when resizing, it is also necessary to determine which
 of the old and new sets of buckets to select from.
 If the bucket that would be selected from the old table has already
 been distributed into the new table, then the bucket should be selected
-from the new table.
+from the new table as well as from the old table.
 Conversely, if the bucket that would be selected from the old table
 has not yet been distributed, then the bucket should be selected from
 the old table.
@@ -1073,15 +1073,14 @@ section.
 
 \QuickQuiz{}
 	Suppose that one thread is inserting an element into the
-	new hash table during a resize operation.
+	hash table during a resize operation.
 	What prevents this insertion from being lost due to a subsequent
 	resize operation completing before the insertion does?
 \QuickQuizAnswer{
 	The second resize operation will not be able to move beyond
 	the bucket into which the insertion is taking place due to
-	the insertion holding the lock on one of the hash buckets in
-	the new hash table (the second hash table of three in this
-	example).
+	the insertion holding the lock(s) on one or both of the hash
+	buckets in the hash tables.
 	Furthermore, the insertion operation takes place within an
 	RCU read-side critical section.
 	As we will see when we examine the \co{hashtab_resize()}
-- 
2.7.4


