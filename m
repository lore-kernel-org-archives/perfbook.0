Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=5s5HsljpM4Z8eJhN94HlGVKX/lW4HAvHc8E9MIZdShI=;
 b=rJDeZICgOZUHIT8boXY9/hGFRtHrk7xCJY7IS5VytvEu9fp4cgvNnkPvTNdTMDpi7W
 MvkoFJbcfs42EvM378/imIH4NrN5CLnxztlJHPJOKiOgYe9Al1HdzMTPsF/MwFmY0ICC
 SSzGDg5yDrU2PbHoaHUJmpj5SGc3zyicTGEXws/+B/d1Eh79SiXxJ5Qmg8AgwOQdsOcE
 uaOLhaAWUi2ePI+2WrzN9msXNJeMIFLTxcfAgm9xg9+gQ0XR2Txw2DUl7DQADq7vFhVY
 X7xpeGE1iTY7+bQo69m8Wwl9ezqWr1/bhNZZnXNLT2oNTtc9FVuQb+hKKwd/az1OkTTh
 SClw==
Subject: [PATCH 2/8] SMPdesign: Add shortcut of extdash to compound words
References: <2c5427c4-463a-d118-3c30-d2c9f7ffd5a7@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <d9040c86-a187-1003-a6a7-667f3e3559d0@gmail.com>
Date: Mon, 16 Jan 2017 23:58:01 +0900
MIME-Version: 1.0
In-Reply-To: <2c5427c4-463a-d118-3c30-d2c9f7ffd5a7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 221411c625f10ce968a9d0c3d01ed648c6a46a8d Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 15 Jan 2017 12:03:48 +0900
Subject: [PATCH 2/8] SMPdesign: Add shortcut of extdash to compound words

This one sticks out in 1c layout.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/SMPdesign.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
index 81db94d..aa40139 100644
--- a/SMPdesign/SMPdesign.tex
+++ b/SMPdesign/SMPdesign.tex
@@ -556,7 +556,7 @@ Chapter~\ref{chp:Data Ownership}.
 \label{sec:SMPdesign:Locking Granularity and Performance}

 This section looks at locking granularity and performance from
-a mathematical synchronization-efficiency viewpoint.
+a mathematical synchronization\-/efficiency viewpoint.
 Readers who are uninspired by mathematics might choose to skip
 this section.

-- 
2.7.4


