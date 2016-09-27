Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cvGjbYzMCZiLOAL3mFZsXl0wG9wuJF4G6mEWMvRNAaw=;
 b=g6ORsOvYB5/n99PN3n3rgI9oB6lnVLUx+p9kn/Bz0v1WWtm0gkJmKvCmfit5SbZ6gM
 jDu07IyEQ2ApVxQLagg/Ld/XUUvb8ntsAkLKwPR+1PE2IpmE20BHuHQ/0t1Lnd94uMQ2
 we4ee6YxwSblAK/I+jugwRFLPQyrMHSKvZkHGyPxUTakPqXJUFPCKFQHQR0tfkDfcIXe
 3DadQCvSQBjius/dnG/Y+e/q1lw6qB9ZlpAD55MbaKxd3G4nuaHi+89UnFe+L0vWjgnp
 EEYnHRQet4zamsuAxuDm9h+JaH/TUvjE5/ImaODsq4jr+xeJS2VZOUmx7dqLd4B2QYNL
 0k5Q==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v3 05/17] formal/spinhint: Use \co{} for variable quotation
 consistently
Date: Wed, 28 Sep 2016 06:56:29 +0900
Message-Id: <20160927215641.7330-5-sj38.park@gmail.com>
In-Reply-To: <20160927215641.7330-1-sj38.park@gmail.com>
References: <20160927215641.7330-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: akiyks@gmail.com, perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/spinhint.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index 73ebe8e..878fa61 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -921,7 +921,7 @@ allows an assertion to determine when all the readers are finished
 (since a QRCU update cannot be permitted to complete until all
 pre-existing readers have completed their QRCU read-side critical
 sections).
-The readerprogress array elements have values as follows,
+The \co{readerprogress} array elements have values as follows,
 indicating the state of the corresponding reader:

 \begin{enumerate}
-- 
2.10.0

