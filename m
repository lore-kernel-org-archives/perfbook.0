Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=lx5jVpGM2W+l1xCodesQVAyWLE5s0c0FUdaqMssamIs=;
 b=ZdHCGDNA80xUZIP0NacrQQOth361yXC6HU9FqY3su9thrB7A+6xQgGmJKjY9e+gAYd
 eVToiKL7ELqM+qOQmoHThBwIubCTlHZFWAjMJe64O1dorOPFK1UED2689uHm0hmhSkDt
 psrmXyQGcVHb5r1GlCAlvMdas4r5KI1LzrnF4AOt7MK/0QBwtL+1KagtP+mGdu+1V5l/
 zBYTiF7xTF9CYVmAXQ7X2y5gAvQkksCfdLzwVWupFHT0TdAS0XzV06+WXP35jm6LTfRi
 vzDPJVniXEhUD1CkJBfne+8DeJ9EwSiDde07Ki+wRfknzzpr4wxquCiNm5rUFCt8AOR9
 Cesw==
Subject: [PATCH 5/6] advsync/memorybarriers: Refer explicit Figure label
References: <b0933155-7c2b-d271-c2a4-8cf78b133193@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2de4eb42-b6b4-606a-94f9-2f69a9b9850e@gmail.com>
Date: Tue, 14 Mar 2017 07:48:23 +0900
MIME-Version: 1.0
In-Reply-To: <b0933155-7c2b-d271-c2a4-8cf78b133193@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From c6cab8f8a30053825be79d4701ade5e847b64fb3 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 13 Mar 2017 20:50:12 +0900
Subject: [PATCH 5/6] advsync/memorybarriers: Refer explicit Figure label

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 98f7787..85e9162 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -1135,7 +1135,8 @@ appears to be maintained.  Similarly, the compiler may also arrange the
 instructions it emits in any order it likes, provided it doesn't affect the
 apparent operation of the program.

-So in the above diagram, the effects of the memory operations performed by a
+So in Figure~\ref{fig:advsync:Abstract Memory Access Model},
+the effects of the memory operations performed by a
 CPU are perceived by the rest of the system as the operations cross the
 interface between the CPU and rest of the system (the dotted lines).

-- 
2.7.4


