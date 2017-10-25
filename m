Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iFbLPCM6ZNAESGoIY5wqlRZ58yKE6X4laahScz2xwls=;
 b=vHcTAa75Ozh6r08QmyXWnZTIhsHbX4BAePh3+UhEZ8q+9INH5HfZs6eN9cA/tSWKBR
 iM72GVmqIpYPGU9As1TZapHkdkifjqDWGR7tom+sc1bdub8aMuEdZzl4fgan4hw18BDz
 9eg1uI1AcPunFEnPsNHGd7Dwt/hWZ2cDO6gM9IxWIIGba/hLVuP/NvI9W6a1iyyBzsgh
 0jERp8OC5xop507isB+W/0wo0BLIn5Q/rvC2i0WNDtCtqayZ2nml8IPV7rPIUNsi7hEk
 RaAWfmWGIzBkqAxgFsUHBCh4/JyMG8wKxg4YnwWQI1135RJOtS20lKeng9tR+xaf3LZ2
 OB+A==
Subject: [PATCH v2] locking: Update table layout
References: <4cfc2b83-44b8-b1b8-056d-45f88f50c316@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5dee006d-1712-5383-0670-555cef1a5836@gmail.com>
Date: Thu, 26 Oct 2017 06:58:44 +0900
MIME-Version: 1.0
In-Reply-To: <4cfc2b83-44b8-b1b8-056d-45f88f50c316@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From aa7899ff624e41740f4ed22eb43abf856caa6940 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 26 Oct 2017 06:51:42 +0900
Subject: [PATCH v2] locking: Update table layout

To imply vertical lines, instead of coloring alternate rows,
put light gray boxes in blank cells.

Suggested-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Change after v1:
  The definition of "\x" is moved to within the "table" environment
  to make the macro local.

--
 locking/locking.tex | 41 +++++++++++++++++++----------------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/locking/locking.tex b/locking/locking.tex
index 9cb0176..14db27d 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -1312,43 +1312,40 @@ or even milliseconds.
 \label{sec:locking:Beyond Reader-Writer Locks}

 \begin{table}
+\renewcommand*{\arraystretch}{1.2}
+\newcommand{\x}{\textcolor{gray!20}{\rule{7pt}{7pt}}}
 \small
 \centering
-\begin{tabular}{l||c|c|c|c|c|c}
-	~ ~ ~ ~ ~ ~ ~ ~ ~
-	& \begin{picture}(6,70)(0,0)
+\begin{tabular}{lcccccc}
+	\toprule
+	& \begin{picture}(6,65)(0,0)
 		\rotatebox{90}{Null (Not Held)}
 	  \end{picture}
-	& \begin{picture}(6,70)(0,0)
+	& \begin{picture}(6,65)(0,0)
 		\rotatebox{90}{Concurrent Read}
 	  \end{picture}
-	& \begin{picture}(6,70)(0,0)
+	& \begin{picture}(6,65)(0,0)
 		\rotatebox{90}{Concurrent Write}
 	  \end{picture}
-	& \begin{picture}(6,70)(0,0)
+	& \begin{picture}(6,65)(0,0)
 		\rotatebox{90}{Protected Read}
 	  \end{picture}
-	& \begin{picture}(6,70)(0,0)
+	& \begin{picture}(6,65)(0,0)
 		\rotatebox{90}{Protected Write}
 	  \end{picture}
-	& \begin{picture}(6,70)(0,0)
+	& \begin{picture}(6,65)(0,0)
 		\rotatebox{90}{Exclusive}
 	  \end{picture}
 	\\
-	\hline
-%				 NL  CR  CW  PR    PW  EX
-	\hline
-	Null (Not Held)		& ~ & ~ & ~   & ~ & ~ & ~ \\
-	\hline
-	Concurrent Read		& ~ & ~ & ~   & ~ & ~ & X \\
-	\hline
-	Concurrent Write	& ~ & ~ & ~   & X & X & X \\
-	\hline
-	Protected Read		& ~ & ~ & X   & ~ & X & X \\
-	\hline
-	Protected Write		& ~ & ~ & X   & X & X & X \\
-	\hline
-	Exclusive		& ~ & X & X   & X & X & X \\
+%				  NL   CR   CW     PR   PW   EX
+	\cmidrule(r){1-1} \cmidrule{2-7}
+	Null (Not Held)		& \x & \x & \x   & \x & \x & \x \\
+	Concurrent Read		& \x & \x & \x   & \x & \x &  X \\
+	Concurrent Write	& \x & \x & \x   &  X &  X &  X \\
+	Protected Read		& \x & \x &  X   & \x &  X &  X \\
+	Protected Write		& \x & \x &  X   &  X &  X &  X \\
+	Exclusive		& \x &  X &  X   &  X &  X &  X \\
+	\bottomrule
 \end{tabular}
 \caption{VAX/VMS Distributed Lock Manager Policy}
 \label{tab:locking:VAX/VMS Distributed Lock Manager Policy}
-- 
2.7.4


