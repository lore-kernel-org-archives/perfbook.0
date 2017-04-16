Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bYW8FnwxGBpfItMEJNU1SNs4dgw2j+gpZssOrezpyhI=;
 b=sr6ldWV1rPLi+uoR0vtsLP38072C8B8hrejcxQXW+cWUI/hskYYLuH9VH9E+x9rgSl
 fuGIcX+pghbot/syApMwmiBbcyxcoatGZ3sxhlVnqGvd3CZ1KCnzaLJ+PM3jPnqyViBz
 n3oXYD1AuclnK4VeT0Iu9u2rljIuBGkcjbgqYeMNKvfDuF8YbQRpT3oDecOTyKQnGJ24
 +PjWZl/+IGMlc7o/C5bVAnT/vuK31xptYId7tYs73RYkt9NwdOUFXPjBfhCAF35jj3dH
 gF2rcI1pHxzk5bc1MiM1r2LM4wXQ0gc0JVO4GCyGehUX0EoK5557bAGmaB7fNuZHiGjT
 86lQ==
Subject: [PATCH 05/14] advsync: Use pseudo asm in reordering example
References: <be8c3cb5-9ee2-9f60-bfcd-e729389304f9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <60312088-2bf8-5d02-18b2-7f730221d8da@gmail.com>
Date: Mon, 17 Apr 2017 07:18:23 +0900
MIME-Version: 1.0
In-Reply-To: <be8c3cb5-9ee2-9f60-bfcd-e729389304f9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 79fac48313712400900333ca8f3e920e0cc1ed75 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 16 Apr 2017 07:52:31 +0900
Subject: [PATCH 05/14] advsync: Use pseudo asm in reordering example

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index fc361ad..f60eb3a 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -1161,8 +1161,8 @@ initial values of shared variables {\tt \{A~=~1, B~=~2\}}:
 \begin{tabular}{l|l}
 	\nf{CPU 1} &	\nf{CPU 2} \\
 	\hline
-	A = 3; &	x = B; \\
-	B = 4; &	y = A; \\
+	STORE A = 3 &	x = LOAD B \\
+	STORE B = 4 &	y = LOAD A \\
 \end{tabular}
 \end{minipage}
 \vspace{5pt}
-- 
2.7.4


