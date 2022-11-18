Return-Path: <SRS0=xDx5=3S=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KUgIjXiaydCmSO3HWayGHmAee590rhRtb99ZEaESgcA=;
        b=BI1mczkDayMd6qhPsghVoBpjZJmBfcn5+BJOx824ToNlwVsRwfqTu/cCl+R87xzme/
         T/0HiFy9n+iiOarPMbbieIYGrO088gUNgWIx5Y7+f2GeEsnU0bpTW/fI7DnOaYVLYCP2
         YPO1EyZ4wQhpue9kETAiZk8QtQPmkeOie2czrAf+EjZgWokGI0TyrMcrBKNj95y9UKG2
         +EaHWXKjXJB0qdAaJvGpKcYUHJhgSvUOskAxKKhRDDmhe5Zom4UkSTFvomW9eSHIaw8c
         FcUue7S9P8bobQr0dD4L91JuNb5ezP8dkbG98ilMOOcc+avEX+EGzBTg8fLc6QzC5cVP
         YLXw==
Message-ID: <3b515cce-eef7-7ca5-2ffe-a1c92a8db44b@gmail.com>
Date: Fri, 18 Nov 2022 23:52:13 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] CodeSamples/locking: Add rec_tree_itr to .gitignore
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Elad Lahav <e2lahav@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Commit a4e1d87b97f8 ("locking: Warn about state preservation when
releasing and re-acquiring locks") added a make target of
rec_tree_itr under CodeSamples/locking/, but failed to update
.gitignore.

Add rec_tree_itr in the list.

Fixes: a4e1d87b97f8 ("locking: Warn about state preservation when releasing and re-acquiring locks")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/locking/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CodeSamples/locking/.gitignore b/CodeSamples/locking/.gitignore
index 4cd08bfb256b..29a71f856d68 100644
--- a/CodeSamples/locking/.gitignore
+++ b/CodeSamples/locking/.gitignore
@@ -1,3 +1,4 @@
 locked_list
 lockwakelatency
+rec_tree_itr
 xchglock

base-commit: ea5a893d74e27536fd1189905f9496fd4bc368f4
-- 
2.25.1

