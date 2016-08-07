Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Jmicia9ZoULCD4DJ2Eo0piz2cNBbf4aRYg0pHXow46g=;
 b=q7VQpw6bXULNuplEcC5W96a1BAuJeydBnjWeyXuM961PmszXB7LAqbxywg+9XPCBb9
 0pg32+IQrG/Qw69OMUW/WrejCeR+Gx56xmzsdHiWyKbIwhtJRoztS8C+E6vfu/wRpkQb
 qYIzagPk5zp3vywQ2xQgPVu02FyMCHi9jQbW9G+xHMWvKs8XfuH1dvxQi3Ne4H9nT+S3
 NUyUS5ayUM2RQz5DDJXEO5ROjvv1/endANm5f+n6XGfsgxjwoSnevgyljhdYmiilRaNQ
 4rXTq2SO+rVMQVgP+ODtDtaNdt5Wu71MPoSDeQNMzDohgDxJejl/+LopDum54uofoDlj
 ETdQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/3] rcutorture: Update usage
Date: Sun,  7 Aug 2016 12:41:25 +0900
Message-Id: <1470541287-12588-2-git-send-email-sj38.park@gmail.com>
In-Reply-To: <1470541287-12588-1-git-send-email-sj38.park@gmail.com>
References: <1470541287-12588-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Commit ca4aa79d18ba ("Add read-only and update-only perf test to
rcutorture.h.") and commit 5f66427aeb6b ("Fix false-sharing and
thread-affinity problems, use pthread_setspecific().") have introduced
additional arguments for additional workloads and cpustride.  However,
its usage message does not updated for them.  This commit updates
rcutorture usage message to indicate their existence.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 CodeSamples/defer/rcutorture.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/CodeSamples/defer/rcutorture.h b/CodeSamples/defer/rcutorture.h
index 3d9842f..2feb4ad 100644
--- a/CodeSamples/defer/rcutorture.h
+++ b/CodeSamples/defer/rcutorture.h
@@ -387,7 +387,8 @@ void stresstest(int nreaders)

 void usage(int argc, char *argv[])
 {
-	fprintf(stderr, "Usage: %s [nreaders [ perf | stress ] ]\n", argv[0]);
+	fprintf(stderr, "Usage: %s [nreaders [ perf | rperf | uperf | stress [cpustride] ] ]\n",
+			argv[0]);
 	exit(-1);
 }

-- 
1.9.1

