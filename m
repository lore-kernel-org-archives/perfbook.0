Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=p9r2wKu5FRfhd6NyDsbOQ7NflTHOSUj9qj7tcuB6Pv0=;
 b=t7FbEkMFtavJNfB3n8OgA4Q0yJZMkTTTpcjXvWFc1I72yZTCBkdV5oKTej0zeVxcyV
 kXQrWZABukMl6l8nLGyUcFeYu0wWGQDOZjQmKzR+myHPerfeCQUrcNwKUjnIfx+vWonA
 +2BOHmvNTAUnTQiWjCDCFCDyRzajPyZcUao8c+60CtbMF2saLNrmxShf0C8O/PCfcNl3
 0VjES9VVbl7XeW5Iln+xWd+UjaCjFrd44Ay2ETEQMFa3Yzap7UP/61k1D30+T0rnFxAn
 SFrBnhiFkCQtPx59SsashBUUvxU0Ot3jVHNyxfCJYgsekfbMLVTiahzvB/RK/Hf/+7np
 Kq4g==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH 1/2] routetorture.h: Fix typos in help messages
Date: Thu,  8 Jun 2017 11:16:32 +0800
Message-Id: <1496891793-5755-2-git-send-email-junchangwang@gmail.com>
In-Reply-To: <1496891793-5755-1-git-send-email-junchangwang@gmail.com>
References: <1496891793-5755-1-git-send-email-junchangwang@gmail.com>
To: perfbook@vger.kernel.org, paulmck@linux.vnet.ibm.com
Cc: Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
---
 CodeSamples/defer/routetorture.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/CodeSamples/defer/routetorture.h b/CodeSamples/defer/routetorture.h
index fa4fdab..86693e9 100644
--- a/CodeSamples/defer/routetorture.h
+++ b/CodeSamples/defer/routetorture.h
@@ -346,10 +346,10 @@ void usage(char *progname, const char *format, ...)
 	fprintf(stderr, "\t\tNumber of elements, defaults to 100.  Must be\n");
 	fprintf(stderr, "\t\t1 or greater.\n");
 	fprintf(stderr, "\t--nreaders\n");
-	fprintf(stderr, "\t\tNumber of readers, defaults to 1.  Must be 1\n");
+	fprintf(stderr, "\t\tNumber of readers, defaults to 7.  Must be 1\n");
 	fprintf(stderr, "\t\tor greater.\n");
 	fprintf(stderr, "\t--nupdaters\n");
-	fprintf(stderr, "\t\tNumber of updaters, defaults to 1.  Must be 1\n");
+	fprintf(stderr, "\t\tNumber of updaters, defaults to 7.  Must be 1\n");
 	fprintf(stderr, "\t\tor greater.\n");
 	fprintf(stderr, "\t--cpustride\n");
 	fprintf(stderr, "\t\tStride when spreading threads across CPUs,\n");
-- 
2.7.4

