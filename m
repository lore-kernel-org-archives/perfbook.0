Return-Path: <SRS0=Ggdu=IS=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xZtD0/8Onjo6Fiz/ewl2Qv4qmD9AGylFAiGnxpDz/XM=;
        b=ZlzIIes7BBNaiU4fePdxGdnGSZVX4ppl6NcxiXwqr/p7dIIWn/s+zjJg/mNHJlvQK4
         mfObxtJ6XnldQb5iedGj6ghwLxaTY6fuDTr9DpP9rseHT6reg3yoXAO2sKjczy9N2irq
         8aeW9MhdcIREXTdWi2TzV6V2fbYU2Fb6aAtgR5MQDQoRM2UwCYW7Ol3xrp/g6dYxZ/Pk
         evKnuNPB3OKDMPKL+iyGYD/AnroEN5T0PGfDGwZFYmrpQrrdM+wveUIrZClV1vrOS/QU
         TRQeJyDlU+gZLceoHYL1SwKAkItFlmluC3K//+gWVb8ynXPZlSBKl5zNEPcUKKoFIB1y
         oZ7w==
Subject: [PATCH 3/3 -perfbook] debugging: Fix typo
References: <85bad10b-4875-b98f-8c3d-547625460817@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <bafeaad6-181b-e4cf-a2ef-588ea8268f02@gmail.com>
Date: Sun, 21 Mar 2021 00:24:46 +0900
MIME-Version: 1.0
In-Reply-To: <85bad10b-4875-b98f-8c3d-547625460817@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 debugging/debugging.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index fd52d9e7..3f697f58 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -755,7 +755,7 @@ access to data.
 The Kernel Concurrency Sanitizer (KCSAN)~\cite{JonathanCorbet2019KCSAN}
 uses existing markings such as \co{READ_ONCE()} and \co{WRITE_ONCE()}
 to determine which concurrent accesses deserve warning messages.
-KCSAN has a significant false-positive rate, especially in from the
+KCSAN has a significant false-positive rate, especially from the
 viewpoint of developers thinking in terms of C as assembly language
 with additional syntax.
 KCSAN therefore provides a \co{data_race()} construct to forgive
-- 
2.17.1


