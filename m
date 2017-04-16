Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/K8pkfn5YHniVCXeljeSPJPVpZoYfDNqVKCSlEjYpfA=;
 b=L2UU9daLoKcbU/NpF2XkblkDBfbIrsjiajf9Iz88n2zHNc136PGNPaJZfufRVAXSP4
 cppa5i5nSStXpSIb5nCGlkHhSCLkvoz8u5SvqTHnA1AT1IFTeOb2150jN6XagdZVkMe5
 YDVPBAE/9sg+ai1EnTnmZsUxXKRmyoBoP7F+sK3HqafjqZafGxW1aBV9Vt3eyoi/Bt8b
 NE/fE5xhfn3xwkhtn/LmAYBx3WqA/tTH2eLP36FmqzUXN6hcTc3NBKfTZMFJYajtHJXJ
 Qwy7n0F+SI+QovQMdih4oAEKKmIxule4W9T+fmElaxNWIOfQoCprAipXY+ehiV7gZPZE
 3XAg==
Subject: [PATCH 06/14] advsync: Use pseudo asm in another reordering example
References: <be8c3cb5-9ee2-9f60-bfcd-e729389304f9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2e885956-0e58-47ce-fef2-1e1169a2fe08@gmail.com>
Date: Mon, 17 Apr 2017 07:19:05 +0900
MIME-Version: 1.0
In-Reply-To: <be8c3cb5-9ee2-9f60-bfcd-e729389304f9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 8e91a3c8c27c2d39d7954138676be3e0b2f5cf98 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 16 Apr 2017 07:58:21 +0900
Subject: [PATCH 06/14] advsync: Use pseudo asm in another reordering example

Also make it clear the initial values are for shared variables.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index f60eb3a..270c868 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -1209,17 +1209,18 @@ perceived by the loads made by another CPU in the same order as the stores were
 committed.

 As a further example, consider this sequence of events given the
-initial values {\tt \{A~=~1, B~=~2, C~=~3, P~=~\&A, Q~=~\&C\}}:
+initial values of shared variables
+{\tt \{A~=~1, B~=~2, C~=~3, P~=~\&A, Q~=~\&C\}}:

 \vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
 \tt
 \scriptsize
 \begin{tabular}{l|l}
-	\nf{CPU 1} &	\nf{CPU 2} \\
+	\nf{CPU 1}	& \nf{CPU 2} \\
 	\hline
-	B = 4; &	Q = P; \\
-	P = \&B &	D = *Q; \\
+	STORE B = 4	& Q = LOAD P \\
+	STORE P = \&B	& D = LOAD *Q \\
 \end{tabular}
 \end{minipage}
 \vspace{5pt}
-- 
2.7.4


