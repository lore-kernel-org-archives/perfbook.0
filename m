Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=n7u61Rcudfo5YfkoBg/zSOOO7lsgtq2ElYNTF8oldAk=;
        b=T6UZvPL/OEyhdBLrAo3rNP87DRe9gcMVVMxUko2Vod9r2ydSZdmWegOGW9E5zEdAPx
         gGBRfjS54Kagu0pMibXX7StdVhz6B4F8cAR0zLHjP1VZQhB/sdE9ueK7wkzZ5tJizL8k
         k9jp7C1LBH5Q/5wzriEsSCj6VTCo0liu0UZy4GpzZ6tM/CMHAVR2vOdYcMumlV8fAmxh
         iT7HiwfPs/rUggRYECiAFq+yT5leke8vN8X5EpTfGOAOZyx2lr9c4hhDHvZ8kclapv9z
         cCL1wDexN5/PZFdjGqiPKTuNcTv2NJ+fH8oR5qaXeenJOY5H1a42SXTYYc2DiuEP1qP0
         rrSQ==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH 2/3] route_hazptr: Fix a memory leak bug
Date: Sat, 24 Nov 2018 17:34:53 +0800
Message-Id: <1543052094-8306-3-git-send-email-junchangwang@gmail.com>
In-Reply-To: <1543052094-8306-1-git-send-email-junchangwang@gmail.com>
References: <1543052094-8306-1-git-send-email-junchangwang@gmail.com>
To: paulmck@linux.ibm.com
Cc: perfbook@vger.kernel.org, Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Global pointer gplist is used to record hazard pointer array once it's
allocated. This can avoid allocating and freeing hazptr array each time
function hazptr_scan() is invoked. This patch fixes a memory leak bug and
helps achieve the design goal.

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
---
 CodeSamples/defer/hazptr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/CodeSamples/defer/hazptr.c b/CodeSamples/defer/hazptr.c
index 91df310..061ca2c 100644
--- a/CodeSamples/defer/hazptr.c
+++ b/CodeSamples/defer/hazptr.c
@@ -53,6 +53,9 @@ void hazptr_thread_exit(void)
 		hazptr_scan();
 		poll(NULL, 0, 1);
 	}
+
+	if (gplist != NULL)
+		free(gplist);
 }
 
 void hazptr_reinitialize()
@@ -103,6 +106,7 @@ void hazptr_scan()
 			fprintf(stderr, "hazptr_scan: out of memory\n");
 			exit(EXIT_FAILURE);
 		}
+		gplist = plist;
 	}
 
 	/*
-- 
2.7.4

