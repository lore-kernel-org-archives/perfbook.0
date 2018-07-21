Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=AjHt4BL3+6j9004Oh7KgaUXZTgOPDetie3qMhPbq6mc=;
 b=QlzamYgNNdFHU5sKaWMXzsGzIPdKMk4rDMCiBtevJ8J/4tErhnueQptla6dcVnePY2
 Zxe/h+vVrGG3mnijiy1DPeoeLLeUYg7UcI9k2AruDRH8CQeyIZ+ZZsGPhIEDVXHLmtva
 wVkZ+kJPnaUeJhVvj8Lkx6ES8MYv8mZJaSx/2bZ1EfkelftGI0gIiajtgLRtpQ6/2GQp
 y8yg9DTU9EiAOQ5rqG49NxYAn0F8Vr934exCo6jHaxr8+5RLv1Z0XZRZyJoun0CSDsL8
 n1l6ogJUpIV5tZymPC21ksDISi8XY99GA+iRnNp34nsxVeot+O/wfxCPzbQnIIaeA6u2
 GLyw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH] toolsoftrade: Fix a mistake about line number pointing
Date: Sun, 22 Jul 2018 03:04:10 +0900
Message-Id: <20180721180410.20353-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Fixes: c88cc9eba7a5 ("toolsoftrade: Give a forward reference for READ_ONCE() and WRITE_ONCE()")
Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 00db182..f02d339 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -629,7 +629,7 @@ primitives.
 } \QuickQuizEnd

 \QuickQuiz{}
-	What is the \co{READ_ONCE()} on lines~17 and~41 and the
+	What is the \co{READ_ONCE()} on lines~17 and the
 	\co{WRITE_ONCE()} on line~41 of
 	Listing~\ref{lst:toolsoftrade:Demonstration of Exclusive Locks}?
 \QuickQuizAnswer{
-- 
2.10.0

