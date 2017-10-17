Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=71gU0U1AnvZ4HHhU8uV/PLe8Wlq07q5Y3VFJtriS6UA=;
 b=kNDkEbEoi3JzmLU2JHXDAh23v3fufTgNWBkR1L8OX46XVJWxXqjA4JM6L0sUu9Tcu2
 JUutwYpIYkP1jc9ptKhqBIVpHsR5SzxvldjLbaHX+O7snEVkfrGh8LjbFA/bvZV4SRB9
 sYkQ/1XkXzJoglyjSYIFQajn543cv4jSLmu8ef9H7zeeKZRhNUzQVCBAajtoXM7e9NQn
 8cxDqs4yDjpJkpvD3my712cZ4RDswapbr14J/vyWektD+G2JFGrVdUNCfFoPI72eQxgv
 5b2sNb8sihFb7Vz8yDQ+/WL0Zv7aZiGPgobwlaEsMjuuANDIAjR0y1P/EtYBO0L8+U/e
 1lGQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 3/5] memorder: Add missed unbreakable space before line number
Date: Tue, 17 Oct 2017 11:20:52 +0900
Message-Id: <20171017022054.32680-3-sj38.park@gmail.com>
In-Reply-To: <20171017022054.32680-1-sj38.park@gmail.com>
References: <20171017022054.32680-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index cc1497b..11fa280 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -4240,7 +4240,7 @@ On the other hand, the combination of the conditional branch on line~2
 and the \co{ISB} instruction on line~6 ensures that
 the load on line~7 happens after the load on line~1.
 Note that inserting an additional \co{ISB} instruction somewhere between
-lines~3 and 4 would enforce ordering between lines~1 and 5.
+lines~3 and~4 would enforce ordering between lines~1 and~5.

 \subsection{ARMv8}

-- 
2.10.0

