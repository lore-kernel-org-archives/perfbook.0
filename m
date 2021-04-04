Return-Path: <SRS0=ALPs=JB=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CP+B110OsoznljshMwEcf0mEe9pwK/8FVNsd+dzR27A=;
        b=FJCXPamukJJk28PsIef2OJPGIQC6pi3Sxa5SXJM9OABIvVb4v2upd3gQT1dBAjXPpm
         WqFwzcluISnCMZpwrqE0c1VUlSADN1jpsx2EDs+uZdSQYyEFEfdd+pmTFpiTPIcrVRK5
         8YRnXCYaNbCWwHMKafRoWTiOz/KRVglehyPZa3qJ37HdbuBxFYhxBjaDPjt1SjeHuPpq
         7CBHbMIr2URigdbbJGRGwfu75kgEa0syTc56MIK++ZcHO/F47+h8emaaMAe9PJA13AAB
         mlZFK+oIhxUe1HopsZhIg/hqfH1zhjYci2qyzTHezinHQPbYp2oSrydvDPRhm8dMV8Lo
         sv0A==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/4] howto: Add missed `~` for Paul's name
Date: Sun,  4 Apr 2021 09:50:08 +0200
Message-Id: <20210404075010.15858-3-sj38.park@gmail.com>
In-Reply-To: <20210404075010.15858-1-sj38.park@gmail.com>
References: <20210404075010.15858-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

In the latex source files, preferred way of Paul's name writing would be
`Paul E.~McKenney`.  This commit adds missed `~` in the name in howto
chapter.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 howto/howto.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/howto/howto.tex b/howto/howto.tex
index 4a00bb3c..fff71e6c 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -187,7 +187,7 @@ of parallel programming.
 	Is that really the intent?
 }\QuickQuizAnswerM{
 	Indeed it is!
-	Many are questions that Paul E. McKenney would probably have
+	Many are questions that Paul E.~McKenney would probably have
 	asked if he was a novice student in a class covering this material.
 	It is worth noting that Paul was taught most of this material by
 	parallel hardware and software, not by professors.
-- 
2.17.1

