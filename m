Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=yPLzxgRv7qDju7AK3MEeT7BFLNNWY90kljl9hwlOVFg=;
 b=UxpWwWJKAa0OhdXa+S5iD0owi7k2Rru2MZgPA2TsT+1gSUDtW2ngcsgoerVGdIHSO7
 UE/lE2BzNXE1f6l9eCFtC919M3DASgyjbYbWAgcxh3vk7UXL/PHkutsuoXqNUhBh9xJF
 GzjvkrJnDp8M7FDOeXr1ICjepiuhWgWLRdHz4ldQpfg7vvX3Ld7klOcoc2Oi5mtybHwx
 tm4/Q5D80UjrdEJIKURoPm8EN6JHOW4uHGrpqr4gcQqwoodRQkTALq1s5IhLpWunVALY
 jMj17UtomFpdQ7JNqi09xAiwAVpMz02hKY458bBdW9EG3IbUQ8Qp0JJLfNH9wtMIF4gR
 wzEw==
Subject: [PATCH 2/2] alphapf.bst: Enable 'inlinelinks'
References: <72375aa0-f2bd-72b0-e39c-69ce8d7ccadc@gmail.com>
 <20161106234719.GL24166@linux.vnet.ibm.com>
 <20161224070505.GA16424@linux.vnet.ibm.com>
 <ac74555d-18c3-9bb1-66cc-e2acb3888dcd@gmail.com>
 <af2c3345-2e60-1582-1f8f-d2adb3413927@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <da2ebff3-57a2-ba62-97ab-f9d8abb85b60@gmail.com>
Date: Sun, 25 Dec 2016 20:46:27 +0900
MIME-Version: 1.0
In-Reply-To: <af2c3345-2e60-1582-1f8f-d2adb3413927@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 651a65ca5cc7c0a1b14a022c8295f43f329affa3 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 5 Nov 2016 08:40:25 +0900
Subject: [PATCH 2/2] alphapf.bst: Enable 'inlinelinks'

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 alphapf.bst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/alphapf.bst b/alphapf.bst
index 498e0ee..6a9ec4d 100644
--- a/alphapf.bst
+++ b/alphapf.bst
@@ -69,7 +69,7 @@ FUNCTION {init.urlbst.variables}
   #1 'adddoiresolver :=     % 0=no DOI resolver; 1=include it
   #1 'addpubmedresolver :=     % 0=no PUBMED resolver; 1=include it
   #2 'hrefform :=           % 0=no crossrefs; 1=hypertex xrefs; 2=hyperref refs
-  #0 'inlinelinks :=        % 0=URLs explicit; 1=URLs attached to titles
+  #1 'inlinelinks :=        % 0=URLs explicit; 1=URLs attached to titles

   % String constants, which you _might_ want to tweak.
   "URL: " 'urlintro := % prefix before URL; typically "Available from:" or "URL":
-- 
2.7.4


