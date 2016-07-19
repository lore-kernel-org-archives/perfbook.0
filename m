Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=PG4K6aYNdkPzqjRYgppnMVqWnOHK6OQ7xKHUFczXoQ0=;
 b=Hfzl3cX2xNrMgqvn/kIVPugHRxWpU2sPzEaP/LuAbatPjvtDOrx4uO71JQoSHjzUqW
 9faoNMCnwWy/B7vlKAvvcZUihaMVEo5hIpdUI0G5ajk1wgkC7BmD4YEk2EcOCGDqcjd6
 BK29bofVAgI2q8IeP/EFGI7XwzVaKm6PZUtu52G4bQGf/UgFNMQO7ay1J2l0tWcYweYM
 ovcF0HJJNFjF4W8Ksj2myjnUGiJlALY5XJJBC6WCbhEzQmYpHt7qqWpDNNPN0H+AHJk+
 xr3isycy4Sqt8ISDglLp11H9S4I9Ew2g3zUI3AtI5NKN0gUdgq8rGTSea29pE21xXT5v
 jQ7w==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] howto: Update explanation of cross-link between QQs and QQAs
Message-ID: <55319b08-655a-c5e7-dc55-9459dff58a1b@gmail.com>
Date: Tue, 19 Jul 2016 22:06:33 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From d12e861e19ba9fd78ec6169ee7f56b4ca191bc7a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 19 Jul 2016 21:56:44 +0900
Subject: [PATCH] howto: Update explanation of cross-link between QQs and QQAs

This commit attempts to update the explanation to reflect the
changes made by commit 3a66515124a8 ("qqz: Modify back link
target at end of QQA to the end of QQ").

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 howto/howto.tex | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/howto/howto.tex b/howto/howto.tex
index 30eac7b..68ed47d 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -208,9 +208,13 @@ Here are a few possible strategies:
 \end{enumerate}

 Note that as of mid-2016 the quick quizzes are hyperlinked
-to the answer and vice versa.
+to the answers and vice versa.
 Click either the ``Quick Quiz'' headings or the small squares
 to move back and forth between quiz and answer.
+Also note that the white squares at the end of answers are
+linked to the black squares at the end of quizzes.
+If you want to continue reading text after the end of quizzes,
+white squares would be of your choice.
 } \QuickQuizEnd

 In short, if you need a deep
-- 
1.9.1

