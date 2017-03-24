Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=R+pDpVDAE2I4AgXV6x6qaiWsNrRiZDndXkVdLPKV9yo=;
 b=o3pbU0+mXR0Ut1YmiIThtx9NK5NzMu5gQrlR5FTOuN8u2LoqoDW/fztCU6XnNkuymY
 RnkndwdhsvEEstjcUTy51x4mhSTMDaR/XlTtcxnLJvTuPfY8GFuzeYiW8FIIOpKW563P
 QqhVCjEevVKe9PtpFVUhmC86UlsudRKwh/fR8Kx7TXwSVTKV/Afe5NhKVJD4mrb/7HNs
 B6C+tAR1dlYU6p0ILzSh9E51REyMjKVFgAm7NI+Yhy30m59aV0dDq3ZscRtgl4p4DXJK
 9JlfxiOIp3WW91khr87iUYTXrxaPPI7se1PtO3BeZS7WnIQSvNNjr5jNUMoTHRy9II+L
 DKVg==
Subject: [PATCH v2 2/2] Add another build error check
References: <d4e3f6ba-bdc9-fa85-7404-f189adfb6436@gmail.com>
 <20170323153558.GD3637@linux.vnet.ibm.com>
 <c7a6f457-3914-9e5e-a42a-29e9b8f67b77@gmail.com>
 <7dd80f92-b8e7-3912-9bca-e59100e4665d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <1c5f06b1-a6ea-1c93-2f3d-3acf7706f6e1@gmail.com>
Date: Fri, 24 Mar 2017 22:51:15 +0900
MIME-Version: 1.0
In-Reply-To: <7dd80f92-b8e7-3912-9bca-e59100e4665d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From dd65cd3918b33e9bd267661ea697b39755be72a1 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 24 Mar 2017 20:37:26 +0900
Subject: [PATCH v2 2/2] Add another build error check

This check catches build error to happen when font-map database
is not updated after manual install of a font package.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/runfirstlatex.sh | 6 ++++++
 utilities/runlatex.sh      | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/utilities/runfirstlatex.sh b/utilities/runfirstlatex.sh
index 8261238..1a2a7a5 100644
--- a/utilities/runfirstlatex.sh
+++ b/utilities/runfirstlatex.sh
@@ -47,6 +47,12 @@ then
 	echo "----- Fatal latex error, see $basename.log for details. -----"
 	exit 1
 fi
+if grep -q '!pdfTeX error:' $basename.log
+then
+	grep -A 2 '!pdfTeX error:' $basename.log
+	echo "----- Fatal latex error, see $basename.log for details. -----"
+	exit 1
+fi
 grep 'LaTeX Warning:' $basename.log > $basename-warning.log
 touch $basename-first.log
 exit 0
diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
index cece545..81800db 100644
--- a/utilities/runlatex.sh
+++ b/utilities/runlatex.sh
@@ -58,6 +58,12 @@ iterate_latex () {
 		echo "----- Fatal latex error, see $basename.log for details. -----"
 		exit 1
 	fi
+	if grep -q '!pdfTeX error:' $basename.log
+	then
+		grep -A 2 '!pdfTeX error:' $basename.log
+		echo "----- Fatal latex error, see $basename.log for details. -----"
+		exit 1
+	fi
 	if test -r $basename-warning.log
 	then
 		mv -f $basename-warning.log $basename-warning-prev.log
-- 
2.7.4


