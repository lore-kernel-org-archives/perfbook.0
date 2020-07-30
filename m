Return-Path: <SRS0=rnhZ=BJ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=97s4iV7WhA0I+OPwyQdBJERk12P2glgtVrJ8kIuWsQ0=;
        b=R1ju2WJIQ1ehivEXCOEoF3FSP7lBzNO4nHJO3imPgg5ukbnkvuC3oKPXFjpffjd0pN
         gNcgftKr8w1vjTJH4Zl0LbjHXzrlYuUXs7M4f4+t9omTb4I5vhuNv82clbO5GDZqz+qn
         SYjBXGWT7EkyvskSNr9yqXQh6B+UxQ8dz4FoD8U3u0Y5NLpCVMT8xR1I3yY2YwoU3HdH
         K1NympErcDaG5NYDsupcmA4xjiO1NSChflnADiozM6Wga6Kzr3Rgj5jzNef+Mf+z4uMj
         wRCbf8xLaHFKRNBdIOCfcJgBtoCQLaDF6wRldh1zlV1y509z7DZ6gD0OQ06Iaa7mJnGx
         UbSQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 1/2] qqz.sty: Add page number to the QQZ heading for 'nq'
 build
Message-ID: <d21641e4-ad62-8cee-3479-98b059994661@gmail.com>
Date: Fri, 31 Jul 2020 06:40:15 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 7b56ddf382f836201b9e88e2f7b185fae422314e Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 31 Jul 2020 00:18:58 +0900
Subject: [PATCH 1/2] qqz.sty: Add page number to the QQZ heading for 'nq' build

Excerpt of Paul's message:

    For a printed book, would it make sense to put the page number of the
    quick-quiz source (the location of the little box containing "QQ" and
    the quick-quiz number) into each answer?  Or after each question?

This commit adds the page number at the right-hand side of quiz heading
in framed box.  It is also a hyperlink to the little box in the text.

Suggested-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 qqz.sty | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/qqz.sty b/qqz.sty
index 6d87e192..897d1ab6 100644
--- a/qqz.sty
+++ b/qqz.sty
@@ -59,6 +59,8 @@
 \newcommand{\QuickQuizAnswerChapter}{\textbf{Unknown QuickQAC!!!}}
 
 \newcommand{\QuickQHeading}[3]{\hyperref[#2.#3]{\textbf{Quick Quiz #3:}}\label{#1.#3}}
+\newcommand{\QuickQHeadingPage}[3]{\hyperref[#2.#3]{\textbf{Quick Quiz #3:}}\label{#1.#3}%
+	\hfill\raisebox{0.5ex}{\footnotesize\fbox{p.\pageref{#2.#3}}}}
 \newcommand{\QuickQHeadingLight}[3]{\scriptsize QQ~\hyperref[#2.#3]{#3}\label{#1.#3}}
 \newcommand{\QuickQHeadingBegin}[3]{\scriptsize QQ~\hyperref[#2.#3]{#3}\label{#1.#3},}
 \newcommand{\QuickQHeadingMiddle}[3]{\scriptsize\hyperref[#2.#3]{{ #3}}\label{#1.#3},}
@@ -219,7 +221,7 @@
 \newcommand{\QuickQ}[1]{
 	\begin{tcolorbox}[breakable]
 	\refstepcounter{quickquizctrC}
-	\QuickQHeading{QQA}{QQ}{\QuickQuizAnswerChapter.\thequickquizctrC} \\
+	\QuickQHeadingPage{QQA}{QQ}{\QuickQuizAnswerChapter.\thequickquizctrC}\\
 }
 
 \newcommand{\QuickA}[1]{%
-- 
2.17.1

