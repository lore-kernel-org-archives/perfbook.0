Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=RmkU0rrVazZAx4Rwm/fWQd0cCiHeSg8Swwpkgv9shlM=;
 b=pTeWLRwyP8/Dvezo16ENiZ8joQL/C0P2R6zFD3zt1U8oy5nBu8fv2FZi3i8wctd0/T
 fydUtLvf8Cc5JCA6yykKUqNMdpVE1iDdlIdBdIJ564ldOJEQSDraQ2S+9uMfBLzDvMd+
 3GmekB9c1H1lfzrt7K1TDOhFyX2rTu4jroryMlV/xo34Spuq2Yx4JNMg7rQK38yUWaSh
 hmiqvOY9nG+84D4gHtT4IE1FR27a8LsTGLrj9bS30DE0+uU0bZv8Xn3OiylrIlnTpy0F
 j8+JjA+rabxfiGMOqP4802xZgMABvPxrHXqLyrTMcAxFLwS22BxYjIDHiZ7Hsaas+Jaz
 znLg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] whymb: Remove redundant words
Message-ID: <f053f42a-478a-8c35-780a-a51094b03030@gmail.com>
Date: Thu, 28 Apr 2016 20:18:15 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 53364b467603cd5ec9e1f6a12ad9377a76ebb72a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiysw@gmail.com>
Date: Thu, 28 Apr 2016 20:08:32 +0900
Subject: [PATCH] whymb: Remove redundant words

The sentence fixed in commit 3d3ce3673746 ("Fix now-obsolete back
reference to Compaq Wizard web page") has redundant words around
the citation. This commit removes them.

Signed-off-by: Akira Yokosawa <akiysw@gmail.com>
---
 appendix/whymb/whymemorybarriers.tex | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index 6d09bfc..0c3b83e 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -1788,8 +1788,7 @@ busy, but cache bank~0 is idle.
 This could result in the cache invalidates for the new element being
 delayed, so that the reading CPU gets the new value for the pointer,
 but sees the old cached values for the new element.
-See the documentation called out earlier~\cite{Compaq01} called out
-earlier for more information,
+See the documentation~\cite{Compaq01} called out earlier for more information,
 or, again, if you think that I am just making all this up.\footnote{
 	Of course, the astute reader will have already recognized that
 	Alpha is nowhere near as mean and nasty as it could be,
-- 
1.9.1

