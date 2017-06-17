Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=897YFyt3AKg/YItZBLsLhUVe2eGng0FRwmz6RNw3GH0=;
 b=Ih93K0bPmWfXzeQBOeHIbCkApnE70AtyQ76FO/EicE3LF1t44QUFJqIi71fkVp/QGU
 9PteJ4iQzp8WDLraInyVQgE9s6vZhi99imrWCrRX9OlXDy5tTe00VRQKhYpR8ByTWZl4
 y78acOk3qMaeLRXCgfxNGBbNoUA9oVu1QX5MjbroaQPjelgnebcwHcyxGtGwGA2HT6eH
 fYqzfkhhhAuSJJmqAgYDJYVw/okZs4vwFQUP+vLcXIMFWKHTN//RfP+z2o5MUTBmg7T1
 Kh++NykQ0P9b3U6z9upQAKs6Y4Eka1idw9vHIuDB1fQeX0F2HC6blTGq+YszBPYB/qSG
 vLkg==
Subject: [PATCH 6/8] future/QC: Add missing 'has' in description list
References: <8919b898-9e43-8f72-39ce-5d31dc84f45d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7c4e1ee8-1ec2-8696-a8fa-b46983eeaf2b@gmail.com>
Date: Sat, 17 Jun 2017 13:01:25 +0900
MIME-Version: 1.0
In-Reply-To: <8919b898-9e43-8f72-39ce-5d31dc84f45d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From a9cfd4a69a028c71dbd8ac2a65ea6970cf82ced6 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 17 Jun 2017 08:30:50 +0900
Subject: [PATCH 6/8] future/QC: Add missing 'has' in description list

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 future/QC.tex | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/future/QC.tex b/future/QC.tex
index cbcbef3..701c086 100644
--- a/future/QC.tex
+++ b/future/QC.tex
@@ -338,20 +338,20 @@ are as follows:
 	Either way, we get a qubit that is 50\% one and 50\% zero.
 \item[S:]
 	Rotate 90\degree{} ($\frac{\pi}{2}$ radians) about the
-	Bloch-sphere Z-axis, which no effect on qubits in the
+	Bloch-sphere Z-axis, which has no effect on qubits in the
 	\co{|0>} or \co{|1>} states.
 \item[S\textsuperscript{$\dagger$}:]
 	Rotate $-90\degree$ ($-\frac{\pi}{2}$ radians) about the
-	Bloch-sphere Z-axis, which no effect on qubits in the
+	Bloch-sphere Z-axis, which has no effect on qubits in the
 	\co{|0>} or \co{|1>} states.
 	This operator is the inverse of \co{S}.
 \item[T:]
 	Rotate 45\degree{} ($\frac{\pi}{4}$ radians) about the
-	Bloch-sphere Z-axis, which no effect on qubits in the
+	Bloch-sphere Z-axis, which has no effect on qubits in the
 	\co{|0>} or \co{|1>} states.
 \item[T\textsuperscript{$\dagger$}:]
 	Rotate $-45\degree$ ($-\frac{\pi}{4}$ radians) about the
-	Bloch-sphere Z-axis, which no effect on qubits in the
+	Bloch-sphere Z-axis, which has no effect on qubits in the
 	\co{|0>} or \co{|1>} states.
 	This operator is the inverse of \co{T}.
 \item[X:]
-- 
2.7.4


