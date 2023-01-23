Return-Path: <SRS0=kbjk=5U=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLa2zyAGIVNcwkDEVPbfrzZg4aaGipLsD1kp2nGmlU8=;
        b=NAf9xpclEjL87iOAW22cyl7upBFHPItyT+ysjFAN84jr5bRQHdWYXJVhdo94B/qUkN
         nbNikdvLgIV0ad07rNAok0GiUkp5pZc+coVffURgTf9p0IhDuU/ELuDLaILrtWlbc+2y
         hCV5uISMLi/mBDfVYipzHX2KKK8KS7cy7H1zDXs9Dd8S5m8TVEqeYsor1ggm/s7IYZCK
         5IDr6HYDeNFPOHuTabSjdyuXSYQS1UyjOyBoGgBmVrM0IuE3cYEtvnEJx9AELx5Pk6/0
         OnW7igyNpGfm4FYcpCQWXGnczV/zoNbHd6EucyyILeRe03pQ3bnnPx83gpj+z7Uma0vk
         fBVw==
Message-ID: <5d614259-1abe-2174-a5e5-5b2089b5714b@gmail.com>
Date: Mon, 23 Jan 2023 10:29:43 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] toolsoftrade: Fix staccato of 'than'
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Fixes: 542aac900b17 ("toolsoftrade: Add QQ about task-local storage in Linux kernel")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index ce8a9430b16e..fee34ae8a1df 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -2599,7 +2599,7 @@ as will be shown in more detail in
 	What do you do if you need a per-thread (not per-CPU!) variable
 	in the Linux kernel?
 }\QuickQuizAnswer{
-	First, needing a per-thread variable is less likely than than
+	First, needing a per-thread variable is less likely than
 	you might think.
 	Per-CPU variables can often do a per-thread variable's job.
 	For example, if you only need to do addition, bitwise AND,

base-commit: 60bc6a0123d51fd4730411215465841c4ce8213c
-- 
2.25.1

