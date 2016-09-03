Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=Re1jtegB3feJGgA7Jn4if/Jld/wtJVv/VISd9Wnf+cg=;
 b=tMxejwFzyyJTpHQvbAV8STzKFVT0Y4B0faM+liXOLEhlwF3XmZkA5IDWPjQO2koXEp
 c44VKcC+CyM2vwfvgcFgoHwe4bq65UsgSsS6sEC5BbiYW8SaiRRoHo53m5001GLk3MaH
 5BrnQ4fv6IvoyHxM4BdnIIG8Yq8Pn9Gu11wtR1H/LTa6Up97Fcegflb5kJv+agjmoEHT
 zz74mBWSlUKzK1T21a/LqEoISbKNXwaelBYvCaQZaQHgZuNAKNjlgm7dH7TPROW+7uJm
 r5dvMIZ+dujORP+qSxLXiUib1bFyZtK4avkDCB3BsUGkIj/rXah6zNpR7b5RR6Ck0J+V
 /kLA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] toolsoftrade: Typo fix
Message-ID: <8ea0d045-2f2b-4b4e-5ef5-490944c8ee44@gmail.com>
Date: Sun, 4 Sep 2016 08:19:10 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From f8e9541c541291726dc7cfa712468546e2795f97 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 4 Sep 2016 08:01:03 +0900
Subject: [PATCH] toolsoftrade: Typo fix

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 130faaf..0782892 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -677,7 +677,7 @@ Finally, lines~44-47 release the lock.

 Figure~\ref{fig:toolsoftrade:Demonstration of Same Exclusive Lock}
 shows a code fragment that runs \co{lock_reader()} and
-\co{lock_writer()} as thread using the same lock, namely, \co{lock_a}.
+\co{lock_writer()} as threads using the same lock, namely, \co{lock_a}.
 Lines~2-6 create a thread running \co{lock_reader()}, and then
 Lines~7-11 create a thread running \co{lock_writer()}.
 Lines~12-19 wait for both threads to complete.
-- 
1.9.1

