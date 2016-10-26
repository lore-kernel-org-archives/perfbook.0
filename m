Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=kjyOehIcOclYC82i676WdF3YA5jcHYTRSBSWws9LWU4=;
 b=LZi0wMzlCj09bb6lViVVBmfbxzsr9ESIHURv+iAxj3XcaYY1hMq2x328cCf11HHKzH
 SErG0qI9q18l1M9PykVre+EI4fK8yc/0g1ObsTMy/xvEikUPRzrzzMBnboaUnkZqE9Ft
 zFf8KM0EIjqX7E67Zha3ZN1reJxrl824dwDuAq2kbtpmYmQpOiQtrNqrcKHaxNHsKbEV
 L9gma3Bb9/sSaG3Cj5amo6+U1uZ/nQ/5pWsbQ3AODAfdA/hJKeiGznP7qZJgngFgQMaB
 32wvXPYTX74cuA6IXZZMhPnxVg50MEJAsStL+n+X/xF0038nPa+A8QhRIeJ8lA5qUMK2
 qbDA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] formal: Replace 'article' with 'section'
Message-ID: <5879c432-65ed-fc6c-7984-5b322b4bc4b8@gmail.com>
Date: Thu, 27 Oct 2016 00:07:02 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 32b72b9fccd06a3ea30cd844e8361a176a9892aa Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 22 Oct 2016 20:35:44 +0900
Subject: [PATCH] formal: Replace 'article' with 'section'

This commit removes a remnant of this section's origin in LWN.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/spinhint.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index ec53a7f..906de31 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -51,7 +51,7 @@ book~\cite{Holzmann03a} on Promela and Spin,
 as well as searchable online references starting at:
 \url{http://www.spinroot.com/spin/Man/index.html}.

-The remainder of this article describes how to use Promela to debug
+The remainder of this section describes how to use Promela to debug
 parallel algorithms, starting with simple examples and progressing to
 more complex uses.

-- 
2.7.4

