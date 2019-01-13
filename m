Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38735 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726471AbfAMXgh (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 13 Jan 2019 18:36:37 -0500
Received: by mail-pf1-f196.google.com with SMTP id q1so9474757pfi.5
        for <perfbook@vger.kernel.org>; Sun, 13 Jan 2019 15:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EKTvvXzpiEGA18rbz5Wtd3Fbb6ENRqu2qG7V2sAjh3E=;
        b=VGRgr8COWpggW6pJM96Wle4nznp4IiQ5QaS41Lu9ofhBKQ2QC8W7mv79dYnuhWuxva
         B4WIsyr+J7j46hy/eutwTFEd36rQPeUA9ZNxg+/2uWGYBzGXgtxbliMZ2tk0PzcorBZS
         r2SC5Vt0My0HrI1eH+xkr9ueF8+mNuZRenLf/QEvA/P0MD8X/M0HCg2xBwIMhKy3D9Lt
         34tZQxkQC+t00wJThLli1Szdr56D4ZJlX/ANEQj6pVJDKxqECiIemJw3b0Oysi04//ue
         LNykSx0E2fnd9nk9sPaPDJ/RXW8bbYXsxtQ7DTZ9IW+w1Ph+a7OguoH+IizPTwMFXmv8
         uCrg==
Subject: [PATCH 5/6] datastruct/hash: Add Quick Quiz on READ_ONCE/WRITE_ONCE
 in hash_resize.c
References: <dff55e7c-6e93-8f4a-79fd-f400ed3b38f8@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <73d03fe8-2afa-06a0-f2bf-4d084b8727e0@gmail.com>
Date: Mon, 14 Jan 2019 08:36:32 +0900
MIME-Version: 1.0
In-Reply-To: <dff55e7c-6e93-8f4a-79fd-f400ed3b38f8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

From f56134cbf4de7748ed7f361f7630b1e7a22c2822 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 13 Jan 2019 20:04:01 +0900
Subject: [PATCH 5/6] datastruct/hash: Add Quick Quiz on READ_ONCE/WRITE_ONCE in hash_resize.c

The answer is borrowed from the change log of Paul's commit
1aac0c703482 ("datastruct/hash: Remove extraneous barrier from
hashtab_resize()")

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 datastruct/datastruct.tex | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 6d8350a..c78e5c5 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -1115,15 +1115,15 @@ or \co{NULL} when the search failed.
 \QuickQuiz{}
 	The \co{hashtab_lookup()} function in
 	Listing~\ref{lst:datastruct:Resizable Hash-Table Access Functions}
-	searches only the current hash bucket.
-	Doesn't this mean that readers might miss a newly added
-	element?
+	does not take account of concurrent resize operations.
+	Doesn't this mean that readers might miss an element
+	added while resizing is progressing?
 \QuickQuizAnswer{
 	No.
-	As will be described soon,
-	The \co{hashtab_add()} and \co{hashtab_del()} functions
-	keep updating the current hash table while resizing is
-	progressing.
+	As we will see soon,
+	the \co{hashtab_add()} and \co{hashtab_del()} functions
+	keep the current hash table up-to-date until a resize operation
+	completes.
 } \QuickQuizEnd
 
 \begin{lineref}[ln:datastruct:hash_resize:access:add]
@@ -1292,6 +1292,24 @@ line~\lnref{free} frees
 the old hash table, and finally line~\lnref{ret_success} returns success.
 \end{lineref}
 
+\QuickQuiz{}
+	\begin{lineref}[ln:datastruct:hash_resize:resize]
+	Why is there a \co{WRITE_ONCE()} on line~\lnref{update_resize}
+	in Listing~\ref{lst:datastruct:Resizable Hash-Table Resizing}?
+	\end{lineref}
+\QuickQuizAnswer{
+	\begin{lineref}[ln:datastruct:hash_resize:lock_unlock_mod]
+	Together with the \co{READ_ONCE()}
+	on line~\lnref{l:ifresized} in \co{hashtab_lock_mod()}
+	of Listing~\ref{lst:datastruct:Resizable Hash-Table Update-Side
+	Concurrency Control},
+	it tells the compiler that the non-initialization accesses
+	to \co{->ht_resize_cur} must remain because reads
+	from \co{->ht_resize_cur} really can race with writes,
+	just not in a way to change the ``if'' conditions.
+	\end{lineref}
+} \QuickQuizEnd
+
 \subsection{Resizable Hash Table Discussion}
 \label{sec:datastruct:Resizable Hash Table Discussion}
 
-- 
2.7.4


