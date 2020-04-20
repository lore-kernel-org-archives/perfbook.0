Return-Path: <SRS0=sCky=6E=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=PiYqIqASFhGw2JkzMZJMgXth3MtYq+MlEZC6MkoMjr0=;
        b=Hik6lW4oPOZ04pXVV+OH7VdA9+/+QS2Y8z9nbXXNVCirAK3ceR8ZLmHeUxx6/cRIwO
         Q1qATkkTjsHv0xXznQY5WLsNwSe2mcBjZLZ1JxKQONfBKNJ/MK9mb6CbDMVD6j0kjf3s
         JOcJx08jSDW79KVmMgAsap1tzggU3zGvWtfmoF4pgJnaLGalxfVK7n2gJW0puqjGQo0i
         x2rJrpTjEFZdPl9f4RSLO7K0p7L+NeXoW3cZUv8F2YbOmN/bcDNm/wQgIBVuF2nEmv40
         0HGroiwmJZY3xzjARFz9/xtrA4p0ljzm6Jc0iKml/bB5nNN0KKi05PiqwYH9aQnNu4V9
         eP/w==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] owned: Fix trivial typo
Message-ID: <3f299e03-f6c6-e0a1-017d-374fefa40c91@gmail.com>
Date: Mon, 20 Apr 2020 23:16:32 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 531deebc3597b87e9ed992d7a3f3608c846b4fe8 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 20 Apr 2020 17:10:11 +0900
Subject: [PATCH] owned: Fix trivial typo

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 owned/owned.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/owned/owned.tex b/owned/owned.tex
index b45fabb1..945d7144 100644
--- a/owned/owned.tex
+++ b/owned/owned.tex
@@ -250,7 +250,7 @@ page~\pageref{lst:count:Signal-Theft Limit Counter Subtract Function}).
 	What mechanisms other than POSIX signals may be used for function
 	shipping?
 }\QuickQuizAnswer{
-	There is a very large number of such mechanisms, including:
+	There are a very large number of such mechanisms, including:
 	\begin{enumerate}
 	\item	System V message queues.
 	\item	Shared-memory dequeue (see
-- 
2.17.1

