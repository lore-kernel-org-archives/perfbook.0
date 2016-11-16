Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=+P/2zdLo1CRaKDldW/ZEawhbpyJ3ylq2+LjgibK/naE=;
 b=zGv1geVkJRLQTPpJ9ImMp1FKe9K3iqdoSwbRTfZpDaXxg8ahmRBC9TIQE6bvWvZYGL
 ckNTsTBh7o88FgkqJXypufStaIqhEWSVqEX9KsG1RbPPzDMTp8h7J+AMmmiqCkbFoBf5
 lUN03YOsfj09XcaZ4MibPMcJIxLp1b6Wv1V3VJE3ZRRxsHnsuzISDwt1blza4OTcn/c9
 8SiUu1/xEtNEfzo9pxZBhCch7OOfKnGkHYBmTVwUDR4dbnxfBQFUlQyMbPOg2T8pr3Ir
 PmCycoabcrMax4uRKD5vlBsY6dprkXcFZUWIjPd/HomdBm64wyPvfS+DlaOHQX8W55dJ
 iwqw==
Subject: [PATCH 1/3] formal: Promote \OriginallyPublieshed macro to Chapter
References: <74e04f98-adb1-cd0d-7b6f-bbd550a6ea56@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <17d553f8-eb6f-37e9-e18a-ea816fc1634a@gmail.com>
Date: Wed, 16 Nov 2016 09:58:47 +0900
MIME-Version: 1.0
In-Reply-To: <74e04f98-adb1-cd0d-7b6f-bbd550a6ea56@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From c7c9ba9496cb97f664881935937d733f93b1e7bf Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 16 Nov 2016 00:08:29 +0900
Subject: [PATCH 1/3] formal: Promote \OriginallyPublieshed macro to Chapter

This should have been done in commit 87a645d2aa0b ("Promote
formal-methods appendix to a chapter.") three years ago.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/formal.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/formal/formal.tex b/formal/formal.tex
index 8335978..e66300c 100644
--- a/formal/formal.tex
+++ b/formal/formal.tex
@@ -6,7 +6,7 @@
 \Epigraph{Beware of bugs in the above code; I have only proved it correct,
 	  not tried it.}{\emph{Donald Knuth}}

-\OriginallyPublished{Appendix}{chp:formal:Formal Verification}{Formal Verification}{Linux Weekly News}{PaulEMcKenney2007QRCUspin,PaulEMcKenney2008dynticksRCU,PaulEMcKenney2011ppcmem}
+\OriginallyPublished{Chapter}{chp:formal:Formal Verification}{Formal Verification}{Linux Weekly News}{PaulEMcKenney2007QRCUspin,PaulEMcKenney2008dynticksRCU,PaulEMcKenney2011ppcmem}

 Parallel algorithms can be hard to write, and even harder to debug.
 Testing, though essential, is insufficient, as fatal race conditions
-- 
2.7.4


