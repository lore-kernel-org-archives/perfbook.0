Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0OPjU7pLjXWW2ny9WPNZKwhBRHmtp4+uXnlI3HCO57o=;
 b=hyGTG3JuGwDxHyDj/PKqnaTHuh973xm15LwLAepiZJl8/T+6RTgPFPIeU65lAr18jv
 SC8qmpAVi7RhbRvn1z0dQxoWOR+xr4GlSl1OojVsOst4mEGOWqfsGXPyGEh06Fh/5L8R
 NbYrjYGRrpY74qs2RuRimbh2J1Kwq8kkaBQCsHR4n0LzXj9IT/lCHsNyTcM8i0cjKxtR
 kN0yZTIbJfc4gPp/J/gZrBlamEFgwa8VPRdHirVodg5FoQncXTZAybC9Hw4Xh3+JFw98
 zHdX4Qom95feVKtjujn9pZwK281+3qNEeaEjXEGN9dpKWbov8B2QRN0EWe/UfzlxscSb
 KO7g==
Subject: [PATCH] memorder: Add one solution for one snippet
From: Yubin Ruan <ablacktshirt@gmail.com>
References: <9307038d-60f1-0c93-55a1-f3c9be35605c@gmail.com>
 <20170917010730.GY3521@linux.vnet.ibm.com>
 <e802cd64-22d9-7ef4-a2b8-95d4779d6c3d@gmail.com>
 <20170917215508.GD3521@linux.vnet.ibm.com>
 <fb1ab164-36a7-1ed7-4eea-5668f5ada155@gmail.com>
 <20171030181423.GA3659@linux.vnet.ibm.com>
 <b067fb63-43b7-a8a4-7bdd-3cd79b839d5c@gmail.com>
Message-ID: <70204d71-e19e-4bb6-8064-984550c38456@gmail.com>
Date: Tue, 31 Oct 2017 11:14:47 +0800
MIME-Version: 1.0
In-Reply-To: <b067fb63-43b7-a8a4-7bdd-3cd79b839d5c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com, Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From 256adc5ccd239288c3f38cd193072d6666ab1e82 Mon Sep 17 00:00:00 2001
From: Yubin Ruan <ablacktshirt@gmail.com>
Date: Tue, 31 Oct 2017 11:12:03 +0800
Subject: [PATCH] memorder: Add one solution for one snippet

Signed-off-by: Yubin Ruan <ablacktshirt@gmail.com>
---
 memorder/memorder.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index f8886b4..a1c96df 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -3055,6 +3055,8 @@ surprise to \co{do_something()}.\footnote{
 	Tracking down the bug consumed a holiday weekend not just
 	for your editor, but also for several of his colleagues.
 	In short, this is not a new problem.}
+In this case, \co{tmp} should be declared as \co{volatile} to prevent
+the transformation by the compiler.

 Compilers can also fuse stores.
 The most infamous example is probably the progress-bar example
-- 
2.7.4

