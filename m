Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=HG+RKN99xyygiilFePuCKYAdXgouui6+mEHgRDiWayI=;
 b=JPGfoVDwv7FXvAU49SFsybT65Hdf3UMpizgSBOMtYCDQUuZE2VM9cTWdmhnLEXp5id
 n31OwUzY6hHmRe32t2bGJs3ai7dPxu+RDhNrLtiX7oPBON13hsx9xM+tNQ+nTI4fA7al
 2VL7Xv7nmaqMuosdzRCYotDhAycs00Lam8Xj2L6a72NrDd5xe6n3f+Msq5pDh9KBRvXy
 c6HVKQhy9PRkvK5AsYW3GNlZWm7Gr9uxLcE1W9cqRIVTf2AWJinS0+Ja3e1KikhfT2Su
 t600v5pwYt59ae6Bf0GGK2gqaVN+Awm5z3JXXa51jolmAhkhCNjLYoi+6VExEsYR1zkT
 LFYw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] Prevent line-break of '__' within \co{} macro
Message-ID: <2f056df6-c1f2-a944-2541-a8bf176b1b85@gmail.com>
Date: Thu, 29 Dec 2016 10:31:09 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From d52949f8937a736d7eaa1db4914bccf88fbe2697 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 23 Dec 2016 09:20:53 +0900
Subject: [PATCH] Prevent line-break of '__' within \co{} macro

We don't want "__" to be broken in between. Such line-breaks can
be prevented by specifying "__" after "_" in \lstset{}.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 1 +
 1 file changed, 1 insertion(+)

diff --git a/perfbook.tex b/perfbook.tex
index 3dd6c6e..4e6a173 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -73,6 +73,7 @@
 %%HTMLSKIP
 \lstset{
  literate={\_}{}{0\discretionary{\_}{}{\_}}%
+  {\_\_}{}{0\discretionary{\_\_}{}{\_\_}}%
   {->}{}{0\discretionary{->}{}{->}}%
 }
 %%HTMLNOSKIP
-- 
2.7.4

