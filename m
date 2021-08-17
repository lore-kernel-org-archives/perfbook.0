Return-Path: <SRS0=sDSD=NI=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=P/56wBVylzaA6KusZFQpyq1SyZCHMVBDOX7Fo97xZXM=;
        b=bqejjtQjx2oBD4PpeYszypkjroc3OvFqZd3mDsyCtTI1T4XwqDBTH27+aMl6EOMvfl
         UkhDyMt1cw7mJGUJpVSVhW+fEE+I3KI/HsVmXfHZDuzOrwKNu16gYbKdQUJ91EB3GhPc
         d2xMzI4em5Fk51xTSZiHjpoO0Pdv1akrPdvmJqj1GlWwPW8AppKqGw+Go6nygMzJhvUN
         FyAh6RLH/97b6kgNKtRmCslq7XNyVtGq12trJMbgju8I+ktKGc7FVfPIc4SiQfiAGuNs
         sH+5xpjWWT/R/aoSQ0bbpe0/RBmABrMjJhkxKXO7x699yf5ZRVMx1NKpvsrg2uXu3z7Y
         XSaQ==
Subject: [PATCH -perfbook 02/11] glossary: Put missing question mark
References: <9f71d7d5-b9bb-ceeb-6acb-e889821eeeb9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b90f55e8-de9c-565e-2a5e-63634359998b@gmail.com>
Date: Tue, 17 Aug 2021 19:18:04 +0900
MIME-Version: 1.0
In-Reply-To: <9f71d7d5-b9bb-ceeb-6acb-e889821eeeb9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 glossary.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/glossary.tex b/glossary.tex
index 12dc7529..ee1471bd 100644
--- a/glossary.tex
+++ b/glossary.tex
@@ -464,7 +464,7 @@
 	is a pre-existing writer, any threads attempting to write must
 	wait for the writer to release the lock.
 	A key concern for reader-writer locks is ``fairness'':
-	Can an unending stream of readers starve a writer or vice versa.
+	Can an unending stream of readers starve a writer or vice versa?
 \item[\IX{Real Time}:]
 	A situation in which getting the correct result is not sufficient,
 	but where this result must also be obtained within a given amount
-- 
2.17.1


