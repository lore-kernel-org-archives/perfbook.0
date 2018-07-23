Return-Path: <imrep.amz@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=sZzwtYcyXOdcsyX6SPMdvImYRhMFOz6ZzNqobH0oCig=;
 b=BfxoDXdlOjt1dDBwDENP7PEGkjRLjXQjepCuQAF8JQCG1oi4suaToRZvweeQbZFgSZ
 LBFwGgIZu+lScsy0FRlKQmv6bdUNDw63qpKLIkHBF+IO0m5D4qBd/cuDmIW+Q1sYyM0f
 cbKkyjEP1HaH0PcslarJjNrI2LVVLyPHxPWUR4EeebEaIi1RjFd6zd7whdb2FdTknbSX
 VX01BverMaVMoPFyTUMN1+Tb6HKcW0w38OxeyydZzIaj7QyJ9JJmJwmWg+tM2BOqEkQJ
 QizomhI+/LCZjYqRlD8vb1HJ72KwsK0d4x6TUDTfReSN2105r/E7SCXdheLZKhrbhpIZ
 Vb3w==
From: Imre Palik <imrep.amz@gmail.com>
Subject: [PATCH 1/4] Changing counttorture defaults.
Date: Mon, 23 Jul 2018 22:07:25 +0200
Message-Id: <1532376448-15103-2-git-send-email-imrep.amz@gmail.com>
In-Reply-To: <1532376448-15103-1-git-send-email-imrep.amz@gmail.com>
References: <1532376448-15103-1-git-send-email-imrep.amz@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, "Palik, Imre" <imrep.amz@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From: "Palik, Imre" <imrep.amz@gmail.com>

As the counter implementations are supposed to implement write-mostly
parallelism, this patch changes the default behaviour of counttorture to reflect
it.

Signed-off-by: Imre Palik <imrep.amz@gmail.com>
---
 CodeSamples/count/counttorture.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/CodeSamples/count/counttorture.h b/CodeSamples/count/counttorture.h
index 3276d68..ff0dd72 100644
--- a/CodeSamples/count/counttorture.h
+++ b/CodeSamples/count/counttorture.h
@@ -164,19 +164,19 @@ void perftestrun(int nthreads, int nreaders, int nupdaters)
 	exit(EXIT_SUCCESS);
 }

-void perftest(int nreaders, int cpustride)
+void perftest(int nwriters, int cpustride)
 {
 	int i;
 	long arg;

-	perftestinit(nreaders + 1);
-	for (i = 0; i < nreaders; i++) {
+	perftestinit(nwriters + 1);
+	for (i = 0; i < nwriters; i++) {
 		arg = (long)(i * cpustride);
-		create_thread(count_read_perf_test, (void *)arg);
+		create_thread(count_update_perf_test, (void *)arg);
 	}
 	arg = (long)(i * cpustride);
-	create_thread(count_update_perf_test, (void *)arg);
-	perftestrun(i + 1, nreaders, 1);
+	create_thread(count_read_perf_test, (void *)arg);
+	perftestrun(i + 1, 1, nwriters);
 }

 void rperftest(int nreaders, int cpustride)
-- 
2.7.4

