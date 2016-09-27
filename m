Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/H3TY7amn8/ML6g89HrG6L1Co8Z8eUCZkY9Q+/y2a30=;
 b=ouTou9Y5NjmSxNK5kOXSocrdQ5poaYrk2GHo/jpqU09NxSmo8L1VO8qiYc8ZUIJum2
 oiCFMMwuvm8Jqh0lA/CN1n0fzXktlAgZ1SSZwKwsbmIlJv2FPqnQEDhI2KMaA8DwsJsj
 cIYuDHS5EpZMKcApsxLWcBnwv9fFmb0i854sup2mRm0FkvYHIkYAgFZc1HEDyE461Hpk
 MRa/ofUVDu6g1oYuu42GwTkdzJP/mkCXamTrk0RCSAtIAwTaQSVyylo81dsP4AzRvIX+
 ywJE9tCg7iQMC7JVK4eCYuaM7oZ5ly8WAblv1I2gu2Y18g9hEQ4YNu/OAY+Z+iytspYG
 tGyw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v3 17/17] formal/dyntickrcu: Adjust font size of sample code
Date: Wed, 28 Sep 2016 06:56:41 +0900
Message-Id: <20160927215641.7330-17-sj38.park@gmail.com>
In-Reply-To: <20160927215641.7330-1-sj38.park@gmail.com>
References: <20160927215641.7330-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: akiyks@gmail.com, perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Code for `dyntickRCU-irqnn-ssl.spin` has a too long line.  Because the
line breaks the layout, this commit reduces font size of the sample code
for better layout.

Suggested-by: Akira Yokosawa <akiyks@gmail.com>
Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/dyntickrcu.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index d0b2c6e..a63d324 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -1252,7 +1252,7 @@ and finally lines~32-43 model \co{rcu_irq_exit()}.

 The \co{grace_period()} process then becomes as follows:

-{ \scriptsize
+{ \fontsize{6.7pt}{8pt}\selectfont
 \begin{verbatim}
   1 proctype grace_period()
   2 {
-- 
2.10.0

