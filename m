Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=lQXZ88Q/mK5/v0ch06K8RBIRQiRpcUCDyFlqbqzXTNU=;
 b=KF3FOjpQMiobQOOE8J8PwxhAoJwXuspJovtDv8nGU59UC5beNEFgQPpO60Kuzqr70s
 VQod6aW2PUXfpdA5KzdkPnrMrzexUCQIKHHtXq2I9++rNLYlooTKPUOtIoFEeybZhfzk
 UCAOzkDu0ndHb/4uuTYhBp2HqbGYGNuy0tvK6lH1uvMqilkNt3QAAhytZzbLPkAXfcm+
 mYxcBOqXC6+QIrq3Le80+GTxeKvgKVwI9jkLlcHUZ5F+uEiqqMr7xNfY7rWco7Wde3Zr
 KoVkVwjFFG8YzTk8AtKxjz4gBY0DAHgPjIMa5ZvWCctmzjID0kd9KQX4EKLDaLxj+spI
 6jUw==
Subject: [PATCH 2/3] advsync: Add necessary blank lines around minipages
References: <5711F2CF.1030907@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5711F478.9020503@gmail.com>
Date: Sat, 16 Apr 2016 17:14:48 +0900
MIME-Version: 1.0
In-Reply-To: <5711F2CF.1030907@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 9aac20a120daf460b1046cb234e8eddd1171271b Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiysw@gmail.com>
Date: Fri, 15 Apr 2016 23:20:36 +0900
Subject: [PATCH 2/3] advsync: Add necessary blank lines around minipages

In the `Pair-Wise Memory Barriers: Portable Combinations`
subsubsection, we need blank lines before and after minipages
that embody code snippet tables. Without them, minipages are
forced to be placed in strange ways. This commit adds those
necessary blank lines.
Also it adds "\scriptsize" commands to the minipages for their
consistency with the one in the previous subsubsection.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 965718c..0ef020f 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -565,9 +565,11 @@ pairings that portable software may depend on.
 	by a memory barrier, while a second CPU executes a pair
 	of stores also separated by a memory barrier, as follows
 	(both A and B are initially equal to zero):
+
 	\vspace{5pt}
 	\begin{minipage}[t]{\columnwidth}
 	\tt
+	\scriptsize
 	\begin{tabular}{l|l}
 		CPU 1 &			CPU 2 \\
 		\hline
@@ -577,6 +579,7 @@ pairings that portable software may depend on.
 	\end{tabular}
 	\end{minipage}
 	\vspace{5pt}
+
 	After both CPUs have completed executing these code sequences,
 	if \co{Y==1}, then we must also have \co{X==1}.
 	In this case, the fact that \co{Y==1} means that
@@ -594,9 +597,11 @@ pairings that portable software may depend on.
 	In this pairing, each CPU executes a load followed by a
 	memory barrier followed by a store, as follows
 	(both A and B are initially equal to zero):
+
 	\vspace{5pt}
 	\begin{minipage}[t]{\columnwidth}
 	\tt
+	\scriptsize
 	\begin{tabular}{l|l}
 		CPU 1 &			CPU 2 \\
 		\hline
@@ -606,6 +611,7 @@ pairings that portable software may depend on.
 	\end{tabular}
 	\end{minipage}
 	\vspace{5pt}
+
 	After both CPUs have completed executing these code sequences,
 	if \co{X==1}, then we must also have \co{Y==0}.
 	In this case, the fact that \co{X==1} means that
@@ -628,9 +634,11 @@ pairings that portable software may depend on.
 	memory barrier followed by a store, while the other CPU
 	executes a pair of stores separated by a memory barrier,
 	as follows (both A and B are initially equal to zero):
+
 	\vspace{5pt}
 	\begin{minipage}[t]{\columnwidth}
 	\tt
+	\scriptsize
 	\begin{tabular}{l|l}
 		CPU 1 &			CPU 2 \\
 		\hline
@@ -640,6 +648,7 @@ pairings that portable software may depend on.
 	\end{tabular}
 	\end{minipage}
 	\vspace{5pt}
+
 	After both CPUs have completed executing these code sequences,
 	if \co{X==1}, then we must also have \co{B==1}.
 	In this case, the fact that \co{X==1} means that
@@ -710,6 +719,7 @@ keep in mind that they used to be a \emph{lot} harder on some systems!
 	\vspace{5pt}
 	\begin{minipage}[t]{\columnwidth}
 	\tt
+	\scriptsize
 	\begin{tabular}{l|l}
 		CPU 1 &			CPU 2 \\
 		\hline
-- 
1.9.1


