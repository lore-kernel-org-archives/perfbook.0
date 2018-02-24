Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Em/ynmG8dnh2z+WZBi7M2xl1zCs+ipcVQKKceHl11Nc=;
 b=BzsETV94v333P1cvXcIjO0t38cDbhR6c85R9IwdydkP+ueKAboP604kyrxTsEMC4sr
 Swb68cgPW2hJjQ4AP9rE1pXAebIzB0NwbCRlHL5MbYsWCN4hPqNaXWETRfdcSm71DM+V
 JagV3ACE4puQ9uLf2gcjuyMFhihzZ9HLrxIGghv2veNYIhfTymysXOH8cVUwz1EjJr3B
 kcYXCtf7IaA8TXfj21OUX2DXIyZGJn40fJnMzmz3KveLbkDF0qYvnN2blDvR01dZhADj
 00aiiW3JzwUbk6hHeEJ50yHQ7c6vso8PZ/4gpw9O4ZQGteH/RMAzMDypvzVzTgqzn2qG
 e8AQ==
Subject: [PATCH 5/5] future/QC: Fix typo
References: <1e4f8413-f968-9d37-6322-8057bfe97bb7@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <ae28a529-e232-87bd-d85b-a80689f1b0d9@gmail.com>
Date: Sun, 25 Feb 2018 08:53:41 +0900
MIME-Version: 1.0
In-Reply-To: <1e4f8413-f968-9d37-6322-8057bfe97bb7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 66f9f9f82d4fef12b6d7e2a399c14fbaa758e3f8 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 25 Feb 2018 00:02:51 +0900
Subject: [PATCH 5/5] future/QC: Fix typo

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 future/QC.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/future/QC.tex b/future/QC.tex
index 74bac86..1afae2c 100644
--- a/future/QC.tex
+++ b/future/QC.tex
@@ -189,7 +189,7 @@ a system with fifty qubits~\cite{WillKnight2017IBM50qubits}, which
 is more than triple the sixteen-qubit system made available only five
 months prior.
 It is therefore quite possible that the current exponential growth
-in numbers of qubits might persist for some time time come.
+in numbers of qubits might persist for some time to come.
 Unfortunately, each qubit must be connected to its own signal generator,
 which means that a million-qubit system would also have not only a million
 signal generators, but also a million wires, each of which would be
-- 
2.7.4


