Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=A46fKvUqM6crz9c2qZlj4MamDy0DPElLYiCSQ5nnJWY=;
 b=b0V6MB23CYMb385Drb+XvKO8yBdgMVAfxOLwpLlSPfTIboN7LdWto57u8Dxmw1oYiY
 kTOMYmwDUAo6e89Zt4VtQYBwjwQ09aJoO4aG0McmjJPNKVNJnCFACm6r2s19iiRjtn+y
 1NLdvDqe4j2IooNTzWufUzioPQSz3vT6xBOmrsIlS7OWSKLe3lIpVMb4UzPMia07RQM/
 OdjUjaU/PU6xJJpCrlGu80fp0sYtZfQzVLXRo8S34ONtt0/TSpMCMCk4y8wSUGNZ97em
 lL8+MQ6bEAHRREkKG+oXJAZB7V9r/+s3lScagCSkg0x9BL2F4gcPdlIGIDQOuQRK9nZ7
 4ujQ==
From: Yubin Ruan <ablacktshirt@gmail.com>
Subject: [PATCH] locking: Fix syntactic ambiguity
Message-ID: <0eb6e2e3-e193-3109-7794-fcdf10a3045b@gmail.com>
Date: Sun, 29 Oct 2017 09:01:57 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: perfbook@vger.kernel.org
Cc: paulmck@linux.vnet.ibm.com, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From c8a3ed4cc54d322dd107e4842837851943784666 Mon Sep 17 00:00:00 2001
From: Yubin Ruan <ablacktshirt@gmail.com>
Date: Sun, 29 Oct 2017 08:40:31 +0800
Subject: [PATCH] locking: Fix syntactic ambiguity

Acked-by: Akira Yokosawa <akiyks@gmail.com>
Suggested-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Signed-off-by: Yubin Ruan <ablacktshirt@gmail.com>
---
 locking/locking-existence.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/locking/locking-existence.tex b/locking/locking-existence.tex
index 9fcbbf9..6340734 100644
--- a/locking/locking-existence.tex
+++ b/locking/locking-existence.tex
@@ -174,8 +174,8 @@ single partitionable data structure such as the hash table shown in the
 figure, it can be problematic if a given data element can be a member
 of multiple hash tables or given more-complex data structures such
 as trees or graphs.
-These problems can be solved, in fact, such solutions form the basis
-of lock-based software transactional memory
+Not only can these problems be solved, but the solutions also form
+the basis of lock-based software transactional memory
 implementations~\cite{Shavit95,DaveDice2006DISC}.
 However,
 Chapter~\ref{chp:Deferred Processing}
-- 
2.7.4

