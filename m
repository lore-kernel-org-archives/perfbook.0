Return-Path: <SRS0=ElMv=QF=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hYEym8B1IRmxg1z9YzY3jUjh3bb0vywSykfvFWAiT7g=;
        b=qlHkUM9YeMyEBfVsV1HnVBHiZT9eqmvSMOxCcbwzVxlb30Y0ZSJnvcbLoz5eIUiCPN
         Yb+plzxOEvQ2lIWOeXFdBSWFPgAf0x/1y4rE6DzrWjKlHgEy5ycswZhVweUu5xo5Q7Ak
         XKMKnDAXGNZ0BCQOoqNyLr+lcCJ+hKCnvTla3lg0bW0jX6bGev1maQPEIzwyGqkQcR6T
         JqyVJEy6BbQB6GLES0QodjaiMbjJcdAb+KKGBD3LwBy/eww/KxYeM8mzzE8uXgmumRE1
         Mkwl1XIsHi39UgNXLnSQg4bX4nM2B/i1Yc17cBGAiV8y6++kTeu1oatPWcifflJZxfe/
         U3kw==
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH-perfbook] ordering: fix typo in QQ A.5
Date: Thu, 18 Nov 2021 14:58:30 +0800
Message-Id: <20211118065830.14709-1-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org, perfbook@vger.kernel.org, luyang.co@gmail.com
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>

In QQ A.5, the pronoun "that" should be preposition "than". And the
word "imptementations" should be "implementations".

Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
---
Hi Paul,

I fixes some typo in QQ A.5

Thanks Zhouyi
--
 appendix/questions/ordering.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/appendix/questions/ordering.tex b/appendix/questions/ordering.tex
index 298600f9..05217bc8 100644
--- a/appendix/questions/ordering.tex
+++ b/appendix/questions/ordering.tex
@@ -97,8 +97,8 @@ than the semantics given by the options above.
 
 \QuickQuiz{
 	But if fully ordered implementations cannot offer stronger
-	guarantees that the better performing and more scalable weakly
-	ordered imptementations, why bother with full ordering?
+	guarantees than the better performing and more scalable weakly
+	ordered implementations, why bother with full ordering?
 }\QuickQuizAnswer{
 	Because strongly ordered implementations are sometimes
 	able to provide greater consistency among sets of calls to
-- 
2.25.1

