Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=iUfGvdYzrBT1DAK2bsDMvj1VurN+Dd7WSYQCHqerYeo=;
 b=h1TT7Rr/2xf1/SiyzEacV1eI7q+/Si3pJl6wCp/xTvxfArBvEu1WBUIuBqJ0TfWNhB
 k7sdqjHJVOzbFHDHoXIIi5fjmY03wxbBhv33uUpAIIUDovuInHVdxzH1lPCatzlGI7Q2
 YsegDV8JZSDj02l0zcFbdJLZMJlqrq/0UWzC54MSHD95rEvtf/8b6TSs11lqgRqO0urh
 eowzr9T+aqCl77zwMLAPxKkvdNdLtEH1DjYpj0U85+lJf7vd5NwlewYtQk/lnEbFfBCI
 0tybSsavvAlTdd51z0qaHnTH/liPN8w2gX7lQe9tWN4wLuTxPcqn8D8BdIEyVhkTzw5/
 ewUg==
Subject: [PATCH 1/2] appendix: Enable hyperlink border in bibliography for all
 layouts
References: <b194a26a-355b-94f5-2bba-57269769d58e@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <47ad7071-d062-0660-7bdf-4c1899db72ea@gmail.com>
Date: Fri, 3 Mar 2017 21:28:57 +0900
MIME-Version: 1.0
In-Reply-To: <b194a26a-355b-94f5-2bba-57269769d58e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From ec794a1bd368c5ad381fac0594a254fd6a23f619 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 3 Mar 2017 20:56:59 +0900
Subject: [PATCH 1/2] appendix: Enable hyperlink border in bibliography for all layouts

"pdfborder" in bibliography also helps in identifying known broken
urls. This commit enables the border regardless of layout.

Suggested-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/appendix.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/appendix/appendix.tex b/appendix/appendix.tex
index e17c5e1..63bf728 100644
--- a/appendix/appendix.tex
+++ b/appendix/appendix.tex
@@ -11,12 +11,12 @@
   \bibliographystyle{alphapf} % Use alpha style customized by urlbst with --inlinelinks option
 }{
   \bibliographystyle{alphapf} % Use alpha style customized by urlbst with --inlinelinks option
-  \hypersetup{pdfborder=0 0 1,urlbordercolor=0.4 1 1}
 }
+\hypersetup{pdfborder=0 0 1,urlbordercolor=0.4 1 1}
 \bibliography{bib/RCU,bib/WFS,bib/hw,bib/os,bib/parallelsys,bib/patterns,bib/perfmeas,bib/refs,bib/syncrefs,bib/search,bib/swtools,bib/realtime,bib/TM,bib/standards,bib/OSS,bib/maze,bib/energy}
+\hypersetup{pdfborder=0 0 0}
 \IfTwoColumn{
   \end{adjustwidth*}\twocolumn
 }{
-  \hypersetup{pdfborder=0 0 0}
 }
 \include{appendix/ack/ack}
-- 
2.7.4


