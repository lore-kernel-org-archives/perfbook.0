Return-Path: <SRS0=tLiy=QO=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IEEJMcEauinKZvpR6nx8dk8jj82QKNICDf0/t2Zq7dE=;
        b=DM7Vol9V8WvONVafnoV/MAFX2MWIP6rkeO4nBjuyLouVZOFtgekrglHuki9+1B7AF0
         qO0w+RPhmHIjqn6W5FUf7n/VQPHNuxUSxJskWhEXD16h6eKHL721CtMSnRAS69TWJ88+
         TATcPpms+2V+FvcalDqYKIFO/QUf6LS0NQAgTwxJa+qGsRL9+nl3akogYgD6enaV+b+f
         AR/8g/Dj19ohNjReNpSAr14jCWgYJw9H/R72KM6kZg7SiefIHGfARcZNlRHg6s0Ll8H0
         QgjMOGWMLNV1/glqD/WLFBYZ6pEfDguu3lMX/2lnV/FrTsrEDtqBgTyDraWKdQGSTI95
         AT2A==
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH-perfbook] toyrcu: add missing close paren in QQ B.13
Date: Sat, 27 Nov 2021 12:07:02 +0800
Message-Id: <20211127040702.15879-1-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org, perfbook@vger.kernel.org, luyang.co@gmail.com
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Add missing close paren in QQ B.13.

Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
---
Hi Paul,

I think there is a close paren missing in QQ B.13, so I add it.
(I invoked make this time ;-)).

Thanks
Zhouyi
--
 appendix/toyrcu/toyrcu.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index 0824fdd3..9c474a37 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -755,7 +755,7 @@ adding them on their first call to \co{rcu_read_lock()}.
 \QuickQuiz{
 	Great, if we have $N$ threads, we can have $2N$ ten-millisecond
 	waits (one set per \co{flip_counter_and_wait()} invocation,
-	and even that assumes that we wait only once for each thread.
+	and even that assumes that we wait only once for each thread).
 	Don't we need the grace period to complete \emph{much} more quickly?
 }\QuickQuizAnswer{
 	Keep in mind that we only wait for a given thread if that thread
-- 
2.25.1

