Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=c8dBWqvBmo4oAxFrAevEDvDejHkvfIgiA1oDlbrZ/0c=;
        b=n2c42ptkGgzDD/qWK7VhpUxaAhAMuMnp5CsYbvUYsAyBJ4uR09f72Z5q7HMt0mTBcT
         /nXZpq22lAgtZtu/v7yzxzhOcpdgUOEutUhQsO1gsHFTuWTWJuucmnOYUcWmfZLwY/S2
         cvJys7Zaz29jGgWCk3XF0Sa5TqaXeeXN63WbYxfIG8w+1nPTVnXWyELFg7/O3K9RjwN8
         OWJ4k6t8SIVfvUfE7mBzMTr0ELQtjSkPGNefiI20Jnkuo68irr4PdrjNGSKZcMmCSM98
         gvrohTEot/rGiQiiuYNM3o2idK1L32rPPYdxQ4/PJWb/dV3Xsm747CKTQJ4BYxc3lIpS
         eeTg==
Subject: [PATCH 3/4] RCU.bib: Add entry of git commit of Tree RCU
References: <6cf9cea0-09ad-7a66-34b1-5ee5f52258bc@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <26976da5-8a09-01d8-b0dd-cdb67830c2fa@gmail.com>
Date: Sun, 21 Apr 2019 19:09:04 +0900
MIME-Version: 1.0
In-Reply-To: <6cf9cea0-09ad-7a66-34b1-5ee5f52258bc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 9bbb1eced9e6c0c44e0582329511a78d86d6b6a7 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 16 Apr 2019 00:39:17 +0900
Subject: [PATCH 3/4] RCU.bib: Add entry of git commit of Tree RCU

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/RCU.bib | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/bib/RCU.bib b/bib/RCU.bib
index 1617f71b..eb3613cf 100644
--- a/bib/RCU.bib
+++ b/bib/RCU.bib
@@ -1488,6 +1488,17 @@ lot of {Linux} into your technology!!!"
 ,note="\url{http://lwn.net/Articles/305782/}"
 }
 
+@unpublished{PaulEMcKenney2008commit:64db4cfff99c
+,Author="Paul E. McKenney"
+,Title={{"Tree RCU"}: scalable classic {RCU} implementation}
+,month="December"
+,day="18"
+,year="2008"
+,note="Git commit:
+\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=64db4cfff99c}"
+,lastchecked="April 15, 2019"
+}
+
 @unpublished{PaulEMcKenney2009BloatwatchRCU
 ,Author="Paul E. McKenney"
 ,Title="Re: [{PATCH} fyi] {RCU}: the bloatwatch edition"
-- 
2.17.1


