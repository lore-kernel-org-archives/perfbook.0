Return-Path: <SRS0=J1Hu=4X=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+TEjT4o0lV86So8SRzQoLAObEmXylK81VZ9iEsE0AmY=;
        b=V5FJJkrJ8Hl3JX1ji18g6kkcoNf7DxqMjpk92Q6OfLIFPFXXvldr5bN3UtheOpZ7/o
         Jncw0IEcUQPtYI1G/AfrZ9mzp0n8NXQsMcL6fQGPIE6Q8Cap7jNfn6qnE8u/66CftuYT
         vK3IHaBYJm2XlWBKbY7Zyv8tdVWKpcQoqiPWrvO1eWb+8hTzmCEPoVrho0/Bwtn3IBC4
         74g8KifWXt7xYATOO2GfRTGnWFdYR2sKV4ul18VW+qAdqDyjGYSUNoGUMCvTwdYX0d8r
         JKXmoOwU5wFoBIUU7xrxsuOtwSRoCIMwfNfux17QmhAkRInQs3zIq/+LAnSWdGtWbZAg
         RWCQ==
Subject: [PATCH 2/6] qqz.sty: Fix position of \goodbreak for accuracy of
 hyperlinks
References: <0a98646c-eb33-a27c-b974-ff38b8652a44@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <57ec80db-46ef-7e8a-3e79-9ec4e0e5883a@gmail.com>
Date: Sat, 7 Mar 2020 07:49:02 +0900
MIME-Version: 1.0
In-Reply-To: <0a98646c-eb33-a27c-b974-ff38b8652a44@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 440b3f3bbdd2dc212e7f277c950338f22529f532 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 6 Mar 2020 00:05:09 +0900
Subject: [PATCH 2/6] qqz.sty: Fix position of \goodbreak for accuracy of hyperlinks

Commit 9e256de3262f ("qqz.sty: Permit column/page break in front of
Quick Quiz heading") put \goodbreak after \refstepcounter{}.
This caused backward hyperlinks to QQZs at the top of pages/columns
to point the bottom of the previous pages/columns.

Fix this by placing \goodbreak in front of \refstepcounter{}.

Fixes: 9e256de3262f ("qqz.sty: Permit column/page break in front of Quick Quiz heading")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 qqz.sty | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qqz.sty b/qqz.sty
index 9b2aed8e..cc394160 100644
--- a/qqz.sty
+++ b/qqz.sty
@@ -33,8 +33,8 @@
 	\label{#1}
 	}
 \newcommand{\QuickQuiz}[1]{
-	\refstepcounter{quickquizctr}
-	\goodbreak\QuickQHeading{QQ}{QQA}{\thechapter.\thequickquizctr}}
+	\goodbreak\refstepcounter{quickquizctr}%
+	\QuickQHeading{QQ}{QQA}{\thechapter.\thequickquizctr}}
 \newcommand{\QuickQuizAnswer}[1]{%
 	\refstepcounter{quickquizctrE}%
 	\hyperref[QQA.\thechapter.\thequickquizctr]{\rule{7pt}{7pt}}%
-- 
2.17.1


