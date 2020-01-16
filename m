Return-Path: <SRS0=dwV0=3F=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CAktX9v5GW/5crh769xxHuyhv4E1AdMUpmK2sQ7O1WQ=;
        b=VwywH3oLOAc2Ympnxidqs+HpYrsYFvY/z8YjpntJt7ZhI6HIDDD6M8S9Qsxvnw08wn
         8DeTJrHhHYb9UWsnEPzp9Yi+2gToCUJUqQM1Hr45hQ8/Jb0O58egd8iwhv6FPlbLXcvx
         mM8Ow2JxH9etUSNoUM3yYM1b4Xmv2ewW3ruu9ygNEBHsmEAH/bLn5vH18rAHP4OcYLct
         IL5IV0bK9V5HQ+IHZbskevpVEHPNrsmqYH74ML2gsbyin8hB4mOXfNMNFVSt9UbC34Ak
         HbgN5kP93j02Obon7eAmo7ELfurzH2acfnv3mqj/PUVe6ImkH+Ge0F92F/wmbFeiTDl/
         WJtQ==
Subject: [PATCH 3/3] intro: Fix typo
References: <805bd7c5-477f-c398-b025-34a630f663f9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <cbe1f7ea-d39a-47c9-13a8-32f5ce96c38e@gmail.com>
Date: Fri, 17 Jan 2020 07:00:30 +0900
MIME-Version: 1.0
In-Reply-To: <805bd7c5-477f-c398-b025-34a630f663f9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 865d0b46e811f6a719f4af1a59d65c6f70185108 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 13 Jan 2020 19:51:52 +0900
Subject: [PATCH 3/3] intro: Fix typo

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 intro/intro.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/intro/intro.tex b/intro/intro.tex
index beda0464..e3ec3a43 100644
--- a/intro/intro.tex
+++ b/intro/intro.tex
@@ -361,7 +361,7 @@ which shows that writing single-threaded code and simply waiting
 a year or two for the CPUs to catch up may no longer be an option.
 Given the recent trends on the part of all major manufacturers towards
 multicore/multithreaded systems, parallelism is the way to go for
-those wanting the avail themselves of the full performance of their
+those wanting to avail themselves of the full performance of their
 systems.
 
 Even so, the first goal is performance rather than scalability,
-- 
2.17.1


