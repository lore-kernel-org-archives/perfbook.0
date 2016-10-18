Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=JegQm8WXZlcsveaHHkr5ug7B4j1o081jLl/O3vQmzII=;
 b=OnWiCb8nxnYieNwlOb+hIcXhHMhIzTqowvmkXsoQqPFR5PqyMWg46IMZ+gyeT79Ngp
 o1hFqXYDmGZnIDzEEp5hYK1iCyVcNvUf/CxYnXt9/YKeCR/OHGSYCabXWroMei4vlZIf
 sp9nIx8dWWJitmCo4eN5l+8kBuzVmnkRevXaA5yBoCdipWUYuVgTQUUwCpwHLQMcSITN
 kUULYcPMQto2oq43yyV+ygg7UfAUHaWINL7Buo6r7/Sy3+zQvXF4yYz15355RS2DfCzp
 +5eEudJf4OF8ErD3k398BSK0vXwFqbDvYDL204SniZ7AvpfmJG1tfbckF3oZZtDU3zq8
 9wow==
Subject: [PATCH 5/6] Redefine \path command for sans serif font
References: <9229c60d-0468-7632-e59e-3921f0e46f54@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a79404a2-50f7-5673-bc0c-8950f7aad66b@gmail.com>
Date: Wed, 19 Oct 2016 07:06:32 +0900
MIME-Version: 1.0
In-Reply-To: <9229c60d-0468-7632-e59e-3921f0e46f54@gmail.com>
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From e5db129b6fe3f2612a9f823f213a734499a0893e Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 10 Oct 2016 23:34:50 +0900
Subject: [PATCH 5/6] Redefine \path command for sans serif font

The "mathastext" package interferes with \path command and make
it lose line-breaking at a "/" or a ".".
Redefining \path command seems to work.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 1 +
 1 file changed, 1 insertion(+)

diff --git a/perfbook.tex b/perfbook.tex
index 0d6f08d..0dfc380 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -64,6 +64,7 @@
 \renewcommand{\familydefault}{\sfdefault}
 \normalfont
 \usepackage[italic]{mathastext}
+\renewcommand{\path}[1]{\nolinkurl{#1}} % workaround of interference with mathastext
 }{}

 \begin{document}
-- 
2.7.4


