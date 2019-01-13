Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0YVB5svC1Fig3F7XcIDVKPsTMCA6vVbD5oP0zVkbgA0=;
        b=s0utt22bYoPFyrPvUx6+s7uscNZKQnJfgKYFsJQRMx4ztR5vv0mjtggn492XSZDOm2
         uTe11cQmWWVCdLdhho4Drym60uk/qxjpR27X5ml8V+t7KUCS0sJm5tHXXbXiaURqrUv8
         iQ2WYV7F1Sokg4PGXjZObaudEKBCVVWalYZX469PFLq2EvGc4gwXN/56JcHu9eIhdoKQ
         uOEIit7chv6AtFPR8jeeJ4g2F00gs3tysfuqQehxzn7b3yLFx9Bq6h9zFPhdt9rPlhK4
         G2SSZRY6RlUcYabR4R6Ls7xzSiRDebwKjlVIE67No8mlYwWi2uVUvobDfAHu7FSz8cZi
         C1vQ==
Subject: [PATCH 6/6] datastruct/hash: Display error msg if rcu_barrier() is
 not available
References: <dff55e7c-6e93-8f4a-79fd-f400ed3b38f8@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3b04024c-0fa0-5a89-c369-559b3627bc4b@gmail.com>
Date: Mon, 14 Jan 2019 08:38:18 +0900
MIME-Version: 1.0
In-Reply-To: <dff55e7c-6e93-8f4a-79fd-f400ed3b38f8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 7b69a9b37ba9a73a50aad5cbb097235ddfe75870 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 14 Jan 2019 00:12:41 +0900
Subject: [PATCH 6/6] datastruct/hash: Display error msg if rcu_barrier() is not available

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/datastruct/hash/hashtorture.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/CodeSamples/datastruct/hash/hashtorture.h b/CodeSamples/datastruct/hash/hashtorture.h
index d6345cc..7078896 100644
--- a/CodeSamples/datastruct/hash/hashtorture.h
+++ b/CodeSamples/datastruct/hash/hashtorture.h
@@ -60,6 +60,11 @@ void (*defer_del_done)(struct ht_elem *htep) = NULL;
 #define quiescent_state() do ; while (0)
 #define synchronize_rcu() do ; while (0)
 #define rcu_barrier() do ; while (0)
+#else /* #ifndef quiescent_state */
+# ifndef rcu_barrier
+#  error You need a modern version of liburcu which has "rcu_barrier()".
+#  define rcu_barrier() do ; while (0)
+# endif /* #ifndef rcu_barrier */
 #endif /* #ifndef quiescent_state */
 
 #ifndef check_hash
-- 
2.7.4


