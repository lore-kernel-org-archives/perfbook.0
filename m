Return-Path: <SRS0=82Xt=NK=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=/0F0ky3jK+cTUIU2Lml6b5Es/Bb0u3nzlGZy3vrReRU=;
        b=YvXjwyVCBMoRDdUH97kOqGDgXSY4gvfaYz5iBTUWknrrGOW924iKQCQ4moO+he9uyL
         BvZATfwhbHyMdSmEpsTM7No2IsTriL6Fh7zUgecJOiNCHb6Dl1pvyq9lTbwRSNPYwXP1
         KpS6Dd3pJpHnlYhlsFpkOUSgGExM3qs8ab9IGcckJl2Kh1MlKoZFflCN3u7H0ZLROiPC
         +/I64aoaLNYs7ea06hD6+Emb7cVHVGyKPfoH7DXB+WtzdnnIsEwEYTJAflrol3enlm1L
         l1MP5UJ6Zc+FLapwQh60RoOXWzYufs7SrXbOFD8UmfDuwiZJ1ExMuqx17EPzVO+15Vzg
         b5Gg==
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH-perfbook] Fix a little grammar mistake
Date: Thu, 19 Aug 2021 15:51:58 +0800
Message-Id: <1629359518-3861-1-git-send-email-zhouzhouyi@gmail.com>
To: paulmck@kernel.org, perfbook@vger.kernel.org, luyang.co@gmail.com
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

I think there is a little grammer mistake in answer to quick quiz 10.8,
I am not so sure because my English is not so well ;-)

Thanks
Zhouyi

Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
---
 datastruct/datastruct.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index adb102d..68341f2 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -963,1 +963,1 @@ not recommended for production use.
 	In theory, it isn't any safer, and a useful exercise would be
	to run these programs on larger systems.
 	In practice, there are a lot more systems with more than 28~CPUs
-	than there are systems with more than 448 CPUs.
+	are systems with more than 448 CPUs.
 	In addition, other testing has shown that RCU read-side primitives
 	offer consistent performance and scalability up to at least 1024 CPUs.
 }\QuickQuizEnd
-- 
2.5.0

