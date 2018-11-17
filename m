Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=OVFWGVU3MUuYxB0a1vHZc906gumiBmvrmtPYiOHtCF0=;
        b=sbm8iJKwmOsxNqMxDZ7rNoVcZy/sXhh55gjTAvy5Y/vfta+mLP9Fl8zsWtZO3tJv0u
         PRxsVkOB+bXGzzl3llTK4egXK6FWPBmILW2ZdU5b4udbPI1vpTElw1oOFHrBZYAoUAjQ
         JUMiC0mARPbEUisjRJtPhslX+dJ6QYIcDXaf6TWEwnB2XJ0SYItydBP+9cUZrE3Ea8RX
         T7j/KlHrHUDHCkr/AC3Kedjb+3sakkIdoU0nQiR7/2pWW/qXn9AQv0pQE8wTmk2ipvZ/
         1EDMek5212ZpwlYhD4ABn0ieTI9VDZbaiE2uT4g/XAy1304jSmXev7MVPtuZMFmsikpl
         Rwcw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] memorder: Fix typo (Figure -> Table)
Message-ID: <72e3ed43-25f8-288e-ee9e-6349de4916dc@gmail.com>
Date: Sun, 18 Nov 2018 00:19:41 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: Junchang Wang <junchangwang@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 57730b6cd92ed03f1f7c32defa19fc8a57586950 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 18 Nov 2018 00:17:47 +0900
Subject: [PATCH] memorder: Fix typo (Figure -> Table)

"Summary of Memory Ordering" referred from the footnote added in
commit efc3ce7e8d5d ("memorder: Add a brief description of the use
of multicopy atomicity") is actually a table. Fix it.

Cc: Junchang Wang <junchangwang@gmail.com>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 69ce196..943c3af 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -1905,7 +1905,7 @@ CPUs agree on the order of all stores.\footnote{
 	As of late 2018, ARMv8 and x86 provide other-multicopy atomicity,
 	IBM mainframe provides fully multicopy atomicity, and PPC does
 	not provide multicopy atomicity at all. More detail is shown in
-	Figure~\ref{tab:memorder:Summary of Memory Ordering}.}
+	Table~\ref{tab:memorder:Summary of Memory Ordering}.}
 This means that if only a subset of CPUs are doing stores, the
 other CPUs will agree on the order of stores, hence the ``other''
 in ``other-multicopy atomicity''.
-- 
2.7.4

