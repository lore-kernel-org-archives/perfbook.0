Return-Path: <SRS0=Bw3l=JL=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jU1GIJtazHDq3d0VU4SyrTcOroJRM4oOe26tFbR256s=;
        b=jjPljXLK22frxDq0C9qimT4I8ER3O0pWHw2lJ2IdQcu8pzsACi8ODQQhOJl1u/d4Tv
         j9vX1w6OyoY9SsVaDMb7f3KdAm7tMQPzGZGvDcaDFYdkkXUrat+JRre/Hjj71dyYBPry
         0oUDesXHbf+ZWyIzaBz7ADOHDHansAAtb26aptBDDrQiL/qh29vqQZFUvqEq/G3cDmqd
         pfsKm7oiZs7lEVkBLxwbF0dJz4o6dk1xdcHQHOrvkSHLFLoZoy8kAuN1IyTgGREFXPlh
         fne6inJT2ArgxnLT7HwhCZqclnvEHbqPMRBucP8C9JtZsPHonSpdoHSF7M9z+0Mpl7WU
         1Yvw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 3/5] perfbook-lt.tex: Remove boolean qqzchpend
References: <b1bb1f84-9195-33ab-b6d1-ac68be1dca84@gmail.com>
Message-ID: <d1887e68-f48d-7fc3-ac1a-dcc9cef7ac0c@gmail.com>
Date: Wed, 14 Apr 2021 20:09:36 +0900
MIME-Version: 1.0
In-Reply-To: <b1bb1f84-9195-33ab-b6d1-ac68be1dca84@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Now that -nq builds have answers in appendix, and independent of qqzchpend,
remove the boolean and \IfQqzChpEnd macro.
Also remove a sed pattern substituting its value in Makefile.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile        | 3 +--
 perfbook-lt.tex | 3 ---
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index cec7e878..1d26cfbb 100644
--- a/Makefile
+++ b/Makefile
@@ -374,8 +374,7 @@ perfbook-ebnq.tex: perfbook-eb.tex
 perfbook-ebsfnq.tex: perfbook-ebsf.tex
 perfbook-nq.tex perfbook-sfnq.tex perfbook-1cnq.tex perfbook-1csfnq.tex perfbook-ebnq.tex perfbook-ebsfnq.tex:
 	sed -e 's/setboolean{qqzbg}{true}/setboolean{qqzbg}{false}/' \
-	    -e 's/setboolean{noqqz}{false}/setboolean{noqqz}{true}/' \
-	    -e 's/{qqzchpend}{false}/{qqzchpend}{false}/' < $< > $@
+	    -e 's/setboolean{noqqz}{false}/setboolean{noqqz}{true}/' < $< > $@
 
 perfbook-ix.tex: $(PERFBOOK_BASE)
 perfbook-1cix.tex: perfbook-1c.tex
diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 41371abf..d8786baa 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -99,9 +99,6 @@
 \newboolean{noqqz}
 \setboolean{noqqz}{false}
 \newcommand{\IfNoQqz}[2]{\ifthenelse{\boolean{noqqz}}{#1}{#2}}
-\newboolean{qqzchpend}
-\setboolean{qqzchpend}{false}
-\newcommand{\IfQqzChpEnd}[2]{\ifthenelse{\boolean{qqzchpend}}{#1}{#2}}
 
 \input{autodate} % need to input here to reflect tag state
 \usepackage{qqz}
-- 
2.17.1


