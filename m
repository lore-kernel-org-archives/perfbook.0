Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=zuXGQP2Ka+3/mzHnXaxBtshrLjeyASPqgLS8/AB6olA=;
 b=Z6zkEPA2DdEuBBB6oWivpVCU4S6WNoqTizD3VR1ey8yb2S9LpnPMFjolZxkxfqZP0h
 RQREKqdRjc34uCHmnhB1J2hMlTZPysW9QRnMHpHzD+SklteNLv8RdRVJc8KPyqwwYqeP
 Fra3F64TRS56qJwfXov4mIz90A13E1NfywglqWjE5f2PjUWAjk3rRLp3f22H3tnBq6KF
 3Y3lhqU4rc2dtGf2bH3X2eM9bSRw0ftXHgbAbvl85xvfziDe7rnP/eOQQ4kCvj1ZfpNn
 94JILVs8y+eCEX6648jc5+bm213xRSc1n9m0FDm3/wlgArOh92PV9vgzj9090yJ3VCPl
 Sf/A==
Subject: [PATCH 5/8] perfbook.tex: Include ushyphex.tex and pfhyphex.tex
References: <2c5427c4-463a-d118-3c30-d2c9f7ffd5a7@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <9bacaac5-5fe1-a6b0-b79e-0f7a929d8b67@gmail.com>
Date: Tue, 17 Jan 2017 00:02:57 +0900
MIME-Version: 1.0
In-Reply-To: <2c5427c4-463a-d118-3c30-d2c9f7ffd5a7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 42f8ee75569cab393772a5188003669c035ff5e7 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 15 Jan 2017 16:55:06 +0900
Subject: [PATCH 5/8] perfbook.tex: Include ushyphex.tex and pfhyphex.tex

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/perfbook.tex b/perfbook.tex
index 441dfea..79f26ab 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -103,6 +103,9 @@

 \newcommand{\Epigraph}[2]{\epigraphhead[65]{\rmfamily\epigraph{#1}{#2}}}

+\input{ushyphex} % Hyphenation exceptions for US English from hyphenex package
+\input{pfhyphex} % Hyphenation exceptions for perfbook
+
 \title{Is Parallel Programming Hard, And, If So, What Can You Do About It?}
 \author{
 	Edited by: \\
-- 
2.7.4


