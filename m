Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=19UdcxYj1pndYC+Zw0IUVccDX+xNMPdJRda8fP5gVcc=;
 b=VP6nZxOiun9tTVeeXZOq4xH2YcoN7RXB3OvMI50/zicEJlerNWj46KAtEihHWGm+9x
 VLAukkU/BaPSqtTwUb6Ik/SeLMl6B/BKsataq7XUcHEYi2C07gzzaLPW/xHOa5O7SSH+
 ypKelaQ46T4roCUejI2hmXe8II6Nsu47JYmHCndB8OBe3MKrFZkAETTOUmCgNSO9jHzq
 rX0LS8g5v3b2F59wwhYGfg3/gXfqb7wL61xghYohNQn4vlwQ8ticF5V+tjDH+gUc6hSW
 WrulIZ5QHPBCO1mL5ah12rcW4VMYDzOasLo31qeWi2eVcCqIwTaLYKfs5RJBbzTkoZWl
 W4SA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] advsync/rt: Remove epigraph under section
Message-ID: <458f0875-24ae-d62b-6448-152affe8fb7c@gmail.com>
Date: Sat, 21 Oct 2017 20:27:57 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 7ec65f19bf8b1d8a6389e684955d672658ac1010 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 21 Oct 2017 20:20:27 +0900
Subject: [PATCH] advsync/rt: Remove epigraph under section

Also modify label (chp -> sec).

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/rt.tex | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/advsync/rt.tex b/advsync/rt.tex
index 673b8f8..4d86c5d 100644
--- a/advsync/rt.tex
+++ b/advsync/rt.tex
@@ -1,10 +1,10 @@
 % advsync/rt.tex

 \section{Parallel Real-Time Computing}
-\label{chp:Parallel Real-Time Computing}
+\label{sec:Parallel Real-Time Computing}
 %
-\Epigraph{The difference between you and me is that I was right in time.}
-	 {\emph{Konrad Adenauer}}
+%\Epigraph{The difference between you and me is that I was right in time.}
+%	 {\emph{Konrad Adenauer}}

 An important emerging area in computing is that of parallel real-time
 computing.
-- 
2.7.4

