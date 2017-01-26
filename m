Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=1IQDB/t2MdTrVVSzU8IVDuAJAXI3towb7quFyskmCQU=;
 b=uBb0ei+uJBnI0NSZGv65qWs0pVzzulcp6G1PPNY9M8Tof/NnkPeOgSnd1eAZXfXvb1
 LYS0TGqDO5HsgZ8XLoODHZomnOLLGAD9IUfNionolpKF8SgU/WYefZgg1NEnTpYK26qN
 BvmT46wGibaNwc8bYxb1SMPLNzHYyXYE0HxxjvOyZ01zT2g4PpYR6SwlmQWZvyPpomBO
 4e0X3gwf+b5JkwBkfo3/kf3jff9r1bkQ6JNgj+xO1EIr1ABbNUcHk2DFJLhGrX2wYpGd
 54/QIkufcjR+XV54CrMGWniCLrkH9gXvONs0ttSKTQhgBrgOz+B//0PMt9oSHdFfSD2t
 3mZQ==
Subject: [PATCH 3/5] Change bibliography to one-column layout in 2c build
References: <8fc83317-ec1d-da55-526a-fe63d5233df0@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f97f1d42-e841-c1af-5ddd-c0a3c53acde9@gmail.com>
Date: Fri, 27 Jan 2017 00:20:29 +0900
MIME-Version: 1.0
In-Reply-To: <8fc83317-ec1d-da55-526a-fe63d5233df0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From de94fc449731fc99ae5d608eb5f01cde08037088 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 8 Jan 2017 07:57:48 +0900
Subject: [PATCH 3/5] Change bibliography to one-column layout in 2c build

This change makes it easy to typeset bibliography.
Two column layout is too tight for bibliography entries that
contain urls in alpha style.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/appendix.tex | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/appendix/appendix.tex b/appendix/appendix.tex
index c4bb6cd..e231b28 100644
--- a/appendix/appendix.tex
+++ b/appendix/appendix.tex
@@ -6,9 +6,12 @@
 \QuickQuizAnswers
 \input{glossary.tex}
 \IfTwoColumn{
+\onecolumn\begin{adjustwidth*}{.8in}{.7in}
 \bibliographystyle{alpha}   % Use genuine alpha style
 }{
 \bibliographystyle{alphapf} % Use alpha style customized by urlbst with --inlinelinks option
 }
 \bibliography{bib/RCU,bib/WFS,bib/hw,bib/os,bib/parallelsys,bib/patterns,bib/perfmeas,bib/refs,bib/syncrefs,bib/search,bib/swtools,bib/realtime,bib/TM,bib/standards,bib/OSS,bib/maze,bib/energy}
+\IfTwoColumn{
+\end{adjustwidth*}\twocolumn}{}
 \include{appendix/ack/ack}
-- 
2.7.4


