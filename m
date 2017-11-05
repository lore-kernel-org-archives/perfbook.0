Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tma6p1UFXR3+tJ6ra9+z9QkFSNyVtXAy0g4fDYisWxs=;
 b=TsSLjGKgxhmnykbw6a6E3KBYvoQsXsB/SdIORxHo4D77nwQHkC/CGmNpOgCFhNmqV8
 fA8wHvFf/rrS4p7ZHuw12S5TnKUjF28Nv71jUM7uAxF25FD37XjnUdPbudVqWJLxR4y7
 iPf0TvsYgN4tT7p3WBfUjdqKbULNBEMz4ExcwO8PMzroewgtwqUCu4sTQqM8D0scp+ZZ
 HvT81QEVU25HWYmd9aQRVA9OpkVptIx4lmy9GYH6ESkhlm8Gdc9geOyANnpcGT6grYDC
 rnRsCMkln1eqo2XRYpqI8HA1kSiP2TM+Y9sxjAkb74KZOQrzMrla7wGruzSvSVn4Avm9
 i3KA==
Subject: [PATCH 1/4] formal/regression: Restore escape to '%' symbol
References: <5a0c3a27-0b4e-8d2b-b43c-26e75cdfe05f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6e242c23-bac8-f2e0-bb10-45319a782f4f@gmail.com>
Date: Sun, 5 Nov 2017 23:49:14 +0900
MIME-Version: 1.0
In-Reply-To: <5a0c3a27-0b4e-8d2b-b43c-26e75cdfe05f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From d785724bbefebe945e7d2003cd9bfd286f4872c8 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 5 Nov 2017 18:28:41 +0900
Subject: [PATCH 1/4] formal/regression: Restore escape to '%' symbol

Fixes: a7aaa45857bf ("formal, memorder: Fix typo and adjust spacing")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/regression.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/formal/regression.tex b/formal/regression.tex
index 89290ea..4e06cb7 100644
--- a/formal/regression.tex
+++ b/formal/regression.tex
@@ -400,7 +400,7 @@ decreased the reliability of the overall software.
 \QuickQuizAnswer{
 	We don't, but it does not matter.

-	To see this, note that the 7\,% figure only applies to injected
+	To see this, note that the 7\,\% figure only applies to injected
 	bugs that were subsequently located: It necessarily ignores
 	any injected bugs that were never found.
 	Therefore, the MTBF statistics of known bugs is likely to be
-- 
2.7.4


