Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=d4QLp8FPOxlAh7D4DNFypVfNm3jgTHGyEolTyL2baE8=;
 b=r9W+bIV7K/R+gWB2fzUTHMttTB8Tkm1xiuR/wm5KSHhmBwOU/JBbkyklh2aDUX5vhh
 UTN0ntr+r5b2fuefAPkkgtjyWs2T06x63NuDQXziJ1wJqa8zE1aTqDQyE8J+/qpNuMTc
 EhjvotBgRRStmOb2gkXmGwLYB2agaTu3lzU7EuevPDgokSn/38jm5I/COGO/BRZbLDTo
 KwZZuGq90ZFtTHRVKtk8MJdtnG6/78627b9N+qqY5yyCi+/8/S3GU+qdLSIYY1suen7Z
 8l2nsBTYyRnQ44rbUsQHFo14VWmvMNBhjY1TI8+Mqrec/Q5jm0/jEZOJCRfcpL8JiaDn
 Xa+g==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 15/17] formal/ppcmem: Substitute `paper` with `chapter`
Date: Wed, 21 Sep 2016 11:44:46 +0900
Message-Id: <20160921024448.24744-16-sj38.park@gmail.com>
In-Reply-To: <20160921024448.24744-1-sj38.park@gmail.com>
References: <20160921024448.24744-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/ppcmem.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/formal/ppcmem.tex b/formal/ppcmem.tex
index e33ba2f..743a891 100644
--- a/formal/ppcmem.tex
+++ b/formal/ppcmem.tex
@@ -391,10 +391,10 @@ It is worth repeating that formal methods and tools are no substitute for
 testing. The fact is that producing large reliable concurrent software
 artifacts, the Linux kernel for example, is quite difficult. Developers
 must therefore be prepared to apply every tool at their disposal towards
-this goal. The tools presented in this paper are able to locate bugs that
+this goal. The tools presented in this chapter are able to locate bugs that
 are quite difficult to produce (let alone track down) via testing. On the
 other hand, testing can be applied to far larger bodies of software than
-the tools presented in this paper are ever likely to handle. As always,
+the tools presented in this chapter are ever likely to handle. As always,
 use the right tools for the job!

 Of course, it is always best to avoid the need to work at this level
-- 
2.10.0

