Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=VGZ7Y1SO29SqyVsD/RZNN8Gc3WtkOtw9xPmGqW/EmNk=;
 b=pHjTaDmR8vfvMGyE8WA1nD1U2jxxkEBMrlTzLI0H9NoT3OwTXAUElriqMVaOLypyTI
 87kjdpWDlmE7A35uv6Njp9VUVvf/r54tZkZvt6fjSbz+iBnzNdWKTYBkUReE57Kup4gu
 wk0LtBgs8H+slMq3bKk9t6IJAeYFWoDkI2FvUY6kyxHxL1sdf3sREilFg0AQqhDXpOQY
 56P6bJ3iemMpi+0EitZVcUmOgOtq+MaI5vso9VhDp3e1LS3pCk4GYRRMYv7Qqc4ulL/j
 ISdHJGc2ueJtVhP9kU27AsfPOJwAA0YxXpjRSsp4dFcIcpI0jj1I4+jo++6FhkzfvlSE
 51xA==
Subject: [PATCH 1/5] Specify line break in title of cover page
References: <8fc83317-ec1d-da55-526a-fe63d5233df0@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <633d1140-18bb-563d-e006-76cc8ea27b23@gmail.com>
Date: Fri, 27 Jan 2017 00:18:13 +0900
MIME-Version: 1.0
In-Reply-To: <8fc83317-ec1d-da55-526a-fe63d5233df0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 57ee8a0a075853ce99cdeede7d86f937b13c7817 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 7 Jan 2017 10:38:45 +0900
Subject: [PATCH 1/5] Specify line break in title of cover page

Breaking before "What" would make the title be more appealing.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/perfbook.tex b/perfbook.tex
index 79f26ab..2c13e3f 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -106,7 +106,9 @@
 \input{ushyphex} % Hyphenation exceptions for US English from hyphenex package
 \input{pfhyphex} % Hyphenation exceptions for perfbook

-\title{Is Parallel Programming Hard, And, If So, What Can You Do About It?}
+\title{
+  Is Parallel Programming Hard, And, If So, \\
+  What Can You Do About It?}
 \author{
 	Edited by: \\
 	\\
-- 
2.7.4


