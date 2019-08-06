Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=ynOnxliXFEXCqy2dFcqmyp/Prf+HXwWlguUX49xsFyA=;
        b=dd4WnBLI84BWmu7PSVVSL7EjwhJJ1Sl51/y3mKTCe5EQ/JMnzhQp+XoL7vayeB1pin
         Qgu6lISNYxf3j7f6gS5NZ1YxwDyuvkRZlTM+IOR9CeU9NI2UTPmj4DGLheX7mG0hMP6s
         x1qgQi0uEYYncN1ZIiQj8UqYcHymg36WfHJzu88dNBuzYuPpOLjRCyiv2ZhD6LseD9q7
         l9ZkNWse+VHf/QKIYOuu9PRHdjVi8XzzjVkr5Hg3wLGN0VvlDRzMkZHYu1MtUZC4cqBY
         B8crXZQgzqxisVVyI+C4wwVNrfalfdaEtOP1iJFca1MwhVI4ogQFjpUj+bKGNASGzFdo
         cLLw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] Create .mailmap to fix unreachable email address
Message-ID: <154feeee-a7b3-17bd-6b26-6ff1778e8b42@gmail.com>
Date: Wed, 7 Aug 2019 00:45:34 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 327971006462cbab7b5007717d7536b0e3947eb4 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 7 Aug 2019 00:15:12 +0900
Subject: [PATCH] Create .mailmap to fix unreachable email address

There are some commits with typo in my gmail address.
Although they can not be fixed after the fact, "git shortlog -se"
and "git show --use-mailmap" respect entries in .mailmap.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

Inspired by discussion in another thread, I looked up the usage of
.mailmap in Git repository. It can be used to partially rescue typos
in email configs such as those made in the early days of my contributions.

This will prevent the unreachable address from being displayed by
"git shortlog -se" and the like.

        Thanks, Akira
-- 
 .mailmap | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 .mailmap

diff --git a/.mailmap b/.mailmap
new file mode 100644
index 00000000..c5d1cd3e
--- /dev/null
+++ b/.mailmap
@@ -0,0 +1 @@
+<akiyks@gmail.com> <akiysw@gmail.com>
-- 
2.17.1

