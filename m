Return-Path: <SRS0=wHCD=7N=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=i4svXAgMQWdxzX9LL/CFnQpWof2iy4yCOIQJfEpr/0A=;
        b=GUcLJ9B6Ow6YHsQUx6VDzSsobD3W1oRYBx8Jhvmd0dd9ZzJioEaEzjC7dW5SwME3M8
         0rprzklWpainBcqOpEOK2bk8uMq+tqL0mXHVgFbLbdfPUrNNf/YGrXTdm8rdDZgn7VG+
         UjYUGkoaUzq+WAuOgqFwENzecvCYtWwnyVCdmImzihU7x0SPigL41tYoKQ6xIAFQNC+5
         Nc3kTqcgDmXZYwMuMRg2ndZgijVMEidJsEKXwWqedLA/VmvAJIDSC2uonHFDJ/fPibqT
         gw+p+0lMjS4OW23FHGXqrTnMNAqWGEZ5tCRnfjPR8r0Vg/VqBtAwuFxUDfBT5PEvCJwK
         JBtQ==
Subject: [PATCH 2/3] FAQ.txt: Advertise 'nq' build in #9
References: <64483a19-eee6-f406-7456-01feb232d019@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <63fc56b1-dea0-e21e-7cac-6b1c11160623@gmail.com>
Date: Sun, 31 May 2020 09:33:58 +0900
MIME-Version: 1.0
In-Reply-To: <64483a19-eee6-f406-7456-01feb232d019@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 4c3ca479e8aeb16fee229d9d52eb30b42c7618cc Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 31 May 2020 08:16:33 +0900
Subject: [PATCH 2/3] FAQ.txt: Advertise 'nq' build in #9

The experimental target "nq" can be a partial solution for those
who don't like Quick Quizzes.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ.txt | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/FAQ.txt b/FAQ.txt
index e63117af..a284615f 100644
--- a/FAQ.txt
+++ b/FAQ.txt
@@ -158,8 +158,12 @@
 
 	A.	Quite a few people like them a lot, so they will be
 		staying.  However, you can easily produce a copy of the
-		book that omits the Quick Quizzes by editing the Makefile
-		and qqz.sty files in the top-level directory.
+		book that hides the quiz part of Quick Quizzes in the
+		text by "make nq".
+
+		If the resulting perfbook-nq.pdf does not satisfy you,
+		you can edit the Makefile and qqz.sty files in the
+		top-level directory as you like.
 
 		One approach is to make the "\QuickQuiz" command in
 		qqz.sty be a no-op and to add line to the Makefile that
-- 
2.17.1


