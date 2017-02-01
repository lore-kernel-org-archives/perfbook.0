Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=rFF+7X8d+1po0FKMLnA0jlqmtB4io3ZKdMiNcsidzgw=;
 b=apaG/7sd1ZHUJwrz2YnPIqJ4Y16vTXGn2OsEhkEtboJbB/JGAD7D1KwZ2fbypftRu3
 a1TdJPNxnuaE7BzU9hs3NS4m05RW3Noq2+iTU69rGoEtMBePpfRRbkssU4x+s3h0jJJN
 6+i7Q5g9ZMxYI2to95v1f/i1WtDt9PLQoXKI0eVxSlQ3w57EJ+23z5b8zWOabK1YEShv
 NpF7+K9IGDab2+N3wZCAkRqNNf4hXfX+zKz1BBJ35tv2Msoj0fDSOAhScl1/2Rde03DA
 lTz4LMwbviFxBTR12cX2o/MtKGN2bHbwDnStpRI6nZ/5JAtOSVmpnIX2OTsO/TOMlhOM
 x84w==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] howto: Specify style of enumerate header
Message-ID: <11bda1dc-d40d-602c-b583-b1588bd1a7c4@gmail.com>
Date: Thu, 2 Feb 2017 00:10:06 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From c6d2effca0b51ec680dc3e7b4072279686a2690f Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 31 Jan 2017 22:14:49 +0900
Subject: [PATCH] howto: Specify style of enumerate header

This enumeration contains reference to its headers.
Specify "(a)" style for consistency.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 howto/howto.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/howto/howto.tex b/howto/howto.tex
index f1f9cfe..2f1b0fc 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -453,7 +453,7 @@ patch containing a \co{Signed-off-by:} line.
 It is important to note that the \co{Signed-off-by:} line has
 a very specific meaning, namely that you are certifying that:

-\begin{enumerate}
+\begin{enumerate}[(a)]
 \item	The contribution was created in whole or in part
 	by me and I have the right to submit it under
 	the open source license indicated in the file; or
-- 
2.7.4

