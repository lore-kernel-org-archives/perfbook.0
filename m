Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=pc6fahDJEeeVpNnUFMXG3QsVgNa6Lbq9s9a1+oqEfq8=;
 b=I5i5zii80+g7OV7Dn6/JeiipcHumK8zwU6Y43xGhSLWslL7dV4fNXuyVw5NdYfISYN
 qovOL2yj/6N70Fmm2rK8cRxiRCME2miAEU+88jZ72STQSar/vobeF4NEmmdrwaMcyV6I
 f4TB2ZdNV+hyMgN1fuG15Mcai7Y6IpwTH90ChSROr6v0RVGTgVtugA7zm43GTvURFW0q
 +rg9M8+QR+4/miDHb7lUo3zdDogcu6UQ+ovFshvFDCrFmWj6R5jip1UuBGl/j9sRZBfa
 i/qHZptlRflepg+Z+34ZceRCoedOYtbKEGWTL1kq3VcXwg8NAb1wnRsPW1fKynubn1w0
 TN2A==
Subject: [PATCH 10/13] Add \nf{} command to go back to normal font
References: <a054d07b-3b69-25ce-aab4-c294dc3b6bcd@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f6b7cd20-8644-54ae-9490-35b2558870e7@gmail.com>
Date: Wed, 4 Jan 2017 10:29:42 +0900
MIME-Version: 1.0
In-Reply-To: <a054d07b-3b69-25ce-aab4-c294dc3b6bcd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From aac92885e4b76e4229fedc388e8539bc0f656153 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 31 Dec 2016 19:00:00 +0900
Subject: [PATCH 10/13] Add \nf{} command to go back to normal font

This command will be used in tables whose base font is typewriter
font. We should avoid \rm{} command in case sans serif font be
selected as default.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 1 +
 1 file changed, 1 insertion(+)

diff --git a/perfbook.tex b/perfbook.tex
index 4eaace8..bb1e47e 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -97,6 +97,7 @@
 \newcommand{\nbco}[1]{\hbox{\texttt{\detokenize{#1}}}} % no break lines for short snippet
 \newcommand{\tco}[1]{\texttt{\detokenize{#1}}} % for code in tabular environment
 % \tco{} will break at spaces but not at underscores
+\newcommand{\nf}[1]{\textnormal{#1}} % to return to normal font

 \newcommand{\Epigraph}[2]{\epigraphhead[65]{\rmfamily\epigraph{#1}{#2}}}

-- 
2.7.4


