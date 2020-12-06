Return-Path: <SRS0=ReyI=FK=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=u3lLdy88srKhKk5hJgdJ3capfz+ziAHFzyDDLPp7+Is=;
        b=fk7f2kKv3EnjWS929YQIrp+NY6Lc5twK1K/BziVlLWuuLgC3nv4gdFWME1U5pwxIDp
         y1aFEeqFhM55HBunLAVk+8xW/x0GgT460+0lpT0db7/smX+lg26qw/6IirxOgc4Ee7yt
         ybc1BScgzEAs1p4h15tmwYyN/jWMES92MosiyTgpq183u3VA76Khb1X1xnfZffn/Kj5X
         WAmYhgWY9nUMDEipjJHVviDTTQCjwlXO1+Vk1NTnnPFA5SBypolfBgKw2hqpwtf2wr1w
         +M/GsyIXa9AR53fzYNtde5WAI+LXRH60Zw8jL9Fy+nOpWPKFbgTM1tHHQ14aNDxlZ1eZ
         nbhg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] whymb: Fix typo in variable name
Message-ID: <7e76cd30-1879-bdff-f693-e0671c8d77d4@gmail.com>
Date: Sun, 6 Dec 2020 23:35:01 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Motohiro Kanda <kanda.motohiro@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 93f718fcd589225aaf77c5bd804f2ecc07fb6443 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 5 Dec 2020 13:44:14 +0900
Subject: [PATCH -perfbook] whymb: Fix typo in variable name

It is the variable "b" that CPUs 1 and 2 observe.
This typo was pointed out by Motohiro in his Japanese translation [1].

[1]: https://sites.google.com/site/kandamotohiro/perfbook-d/perfbookappendixc

Cc: Motohiro Kanda <kanda.motohiro@gmail.com>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/whymb/whymemorybarriers.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index e6c24f6e..d139c4dd 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -1511,7 +1511,7 @@ are both guaranteed to see all assignments by CPU~0 preceding its memory
 barrier on line~2.
 Similarly, CPU~0's memory barrier on line~8 pairs with those of CPUs~1 and 2
 on line~4, so that CPU~0 will not execute the assignment to ``e'' on
-line~9 until after its assignment to ``a'' is visible to both of the
+line~9 until after its assignment to ``b'' is visible to both of the
 other CPUs.
 Therefore, CPU~2's assertion on line~9 is guaranteed \emph{not} to fire.
 
-- 
2.17.1

