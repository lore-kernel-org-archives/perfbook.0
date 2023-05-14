Return-Path: <SRS0=4U7B=BD=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684075891; x=1686667891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VUOjWFBhxXVo4Ad4K4kVZwAJLJpTertax1gv/vBmTsM=;
        b=SIwlUwypw9pFa5M1gpXIkLu2yVRurKGUbpVt2TOTOaYYBsDer48a6mxN6Q60S9+AoO
         HnWg0wTc295Df33QRdHmAE7lR5azG6dNS1D15pR7i6t+TrrwTeI+tf7az36KgfblEnOP
         mpdfx622DG5/YAgaZaZ27T/xYHeNT7P77PFufZOvlmtHoQHnso3L8rwyrxYP4fLzVkWU
         3BYSQKM8AlUCG66UgjXBVhiU6te13Gj1+oYo/awUN8b39mUUgWbP1SgTuPrRavw9Ib5q
         Aim/+Jnw0GvfjGdMIQpTz7OiO4MetxQE70o8rw+EKhnwXU31W34KBOTzTIhP7Dedzdj2
         wZog==
From: Alan Huang <mmpgouride@gmail.com>
Subject: [PATCH] formal/spinhint: Clarify the proof
Date: Sun, 14 May 2023 14:51:23 +0000
Message-Id: <20230514145123.37079-1-mmpgouride@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Alan Huang <mmpgouride@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The third step and the fourth step seem to have no causal relationship between them.
Therefore, this patch explains under what circumstances both counters will be at least 1.

Signed-off-by: Alan Huang <mmpgouride@gmail.com>
---
 formal/spinhint.tex | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index 16764aef..dd2e88cc 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -1103,8 +1103,9 @@ follows:
 	execution.
 \item	The counter corresponding to this reader will have been
 	at least 1 during this time interval.
-\item	The \co{synchronize_qrcu()} code forces at least one
-	of the counters to be at least 1 at all times.
+\item	If the counter corresponding to this reader is 1, then
+	the other counter is at least 1 because of the completion of
+	counter flip.
 \item	Therefore, at any given point in time, either one of the
 	counters will be at least 2, or both of the counters will
 	be at least one.
-- 
2.34.1

