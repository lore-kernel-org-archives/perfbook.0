Return-Path: <SRS0=J1Hu=4X=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5uzD0hXJ2vOYagXdwlHt4pM0huXkfQEVSpTxHajQ/eU=;
        b=j6QTWv/YuwpbmDlnw5c2tJpFvBzDo2eh6bLRSjXF9w3T0yNh2cCtCFlhKhckmyyxuk
         kKL7kynan4f2qMOUrGbt/IZ+qQEzhnpiV9ANGZKwhTZaXJHpuxaisMgAquJ8t2FRvdZq
         8IsCtwaKLtjGlvhEq/tpJkSdrqCiq0ZxVSCam+QtK6fWpCsJTjKxVBLn/kam5RWdbwK4
         v2qCNx8VUwjvSXqYXxulEYGtpUCfbZLUZBp6qzx23wyvitGPAzHsER9EmZidzuZHAgev
         ofqJ24dtPMVsQGtoBw4fr5LdcfMtvR+88ov3lR7Y7PA5XoFZat8atfTLcMqU4ZeSFt3H
         A6Rg==
Subject: [PATCH 1/6] qqz.sty: Improve page/column breaks in Appendix E
References: <0a98646c-eb33-a27c-b974-ff38b8652a44@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6ca07460-3b98-aaaf-2a91-f33517608cfc@gmail.com>
Date: Sat, 7 Mar 2020 07:47:43 +0900
MIME-Version: 1.0
In-Reply-To: <0a98646c-eb33-a27c-b974-ff38b8652a44@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 3f5304088091cdbc434d7dacf5835e65c79da5ca Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 5 Mar 2020 23:40:39 +0900
Subject: [PATCH 1/6] qqz.sty: Improve page/column breaks in Appendix E

For "Quick Quiz" headings to be more likely at the top of pages/
columns in Appendix E, put \goodbreak hint after the white box mark
at the end of QQA.

Also tweak glue parameters to suppress the increase in the total
number of pages.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 qqz.sty | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/qqz.sty b/qqz.sty
index e2dbade6..9b2aed8e 100644
--- a/qqz.sty
+++ b/qqz.sty
@@ -66,7 +66,7 @@
 	\Epigraph{The Answer to the Ultimate Question of Life, The Universe,
 		  and Everything.}
 		 {\emph{``The Hitchhikers Guide to the Galaxy'', Douglas~Adams}}
-	\setlength{\parskip}{0.0pt plus 2ex}
+	\setlength{\parskip}{0.0pt plus 1ex}
 	\input{qqz}
 	\setlength{\parskip}{0.0pt plus 1.0pt}% return to default
 }
@@ -85,11 +85,11 @@
 
 \newcommand{\QuickA}[1]{%
 	\hyperref[QQ.\QuickQuizAnswerChapter.\thequickquizctrC]{\rule{7pt}{7pt}}
-	\par\vspace{0.5\baselineskip plus .5ex minus .3ex}
+	\par\vspace{0.2\baselineskip plus .2ex minus .1ex}
 	\noindent\textbf{Answer:} \\ }
 
 \newcommand{\QuickE}{%
 	\hyperref[QQE.\QuickQuizAnswerChapter.\thequickquizctrC]{\ding{113}}
-	\vspace{1.0\baselineskip plus 2ex minus .5ex}
+	\goodbreak\vspace{0.7\baselineskip plus .5ex minus .2ex}
 }
 
-- 
2.17.1


