Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=I4xPKmsYNuW+M864Wp2w8zsBRooUiW7Fz1/MCDj71HA=;
 b=YRl2DXocGjwMyEHtf5J8lDPmpNXLQKvDkcEYsulgHj/ogDTE5ASCLNUdsEsfw3+aUy
 doupN+IIeU8KwuGAsPVfEhfjXq7YgG/8ebwuDHMWE3g88MIy+u65sisK11TTD00rzhPj
 zLqoMQQafgTl6WrBO5fw50gKnSUp2IGZz5V3aG5+ViJ5pSi5XjknCOxufIs1CUBsW77y
 IK9pwef59pCp1sM/00N16BYHCKGmYmHQVq3yA13K9jqpYsRKF37nfdV8ne/vvmBLUJmW
 S6csfOdMyE/oJ9fYav/sOR0gBrkUcEszpFJR8hlzPrDouhos7kYwhwHFmJJsj7k9mxjE
 oZMQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 3/4] defer: Add missing dot
Date: Fri,  1 Jul 2016 09:43:53 +0900
Message-Id: <1467333834-17050-4-git-send-email-sj38.park@gmail.com>
In-Reply-To: <1467333834-17050-1-git-send-email-sj38.park@gmail.com>
References: <1467333834-17050-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 defer/rcufundamental.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index 8c6e0c5..48f020f 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -385,7 +385,7 @@ circular list:
 \QuickQuizAnswer{
 	Because in an hlist it is necessary to check for
 	NULL rather than for encountering the head.
-	(Try coding up a single-pointer {\tt hlist\_for\_each\_entry\_rcu()}
+	(Try coding up a single-pointer {\tt hlist\_for\_each\_entry\_rcu()}.
 	If you come up with a nice solution, it would be a very good thing!)
 } \QuickQuizEnd

-- 
1.9.1

