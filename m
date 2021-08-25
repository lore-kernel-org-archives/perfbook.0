Return-Path: <SRS0=Ut+l=NQ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+TeIsv3R1+P12ZDpucVnWzSEIbnMqTGg1Tmm8wIsiTU=;
        b=Wy5QcltZVjk2Y8n4KXJ4yxOAgl32w1xNXDrFLMSypHBpMXN0qVApPWb97wVUHr0Y8h
         u5gM7eVSRKIy6S2LsdjQMGFa6oMpGmexyhYX+uYumyCGijFtNlygaIWG4623M7tuWkuB
         t7eqPyZPlI2UxhEg104u4ukrQZTVjM5lJgXrsy3lDkhtVDg0SjKrQrztlYUrzFiHUdG5
         gbA0OSDxZwn03vwuWvmMQ34yJuecHHFuTaGDR1WI0yH9Wn1QfxLyEv3r09NHuSEJgtGi
         NCplgXUbuVaf+bWKNJT8oxxyIgMmbsvwyQW479QapnCTp5lC7YDUih+bpnKxkEATffsv
         KcSw==
Subject: [PATCH -perfbook 5/5] appendix/questions: Fix typo of missing ')'
References: <8e4ab0b0-2a64-3ff6-e35a-38778d9622cf@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <00564999-f4ae-60a5-5285-3cfac5fbd0aa@gmail.com>
Date: Wed, 25 Aug 2021 18:43:08 +0900
MIME-Version: 1.0
In-Reply-To: <8e4ab0b0-2a64-3ff6-e35a-38778d9622cf@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/questions/questions.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/appendix/questions/questions.tex b/appendix/questions/questions.tex
index 48908bcb..f3b4b3d1 100644
--- a/appendix/questions/questions.tex
+++ b/appendix/questions/questions.tex
@@ -28,7 +28,7 @@ With that, here are the questions:
 \item	Why not remove locking?
 	(\cref{sec:app:questions:Why Not Remove Locking?})
 \item	What time is it?
-	(\cref{sec:app:questions:What Time Is It?}
+	(\cref{sec:app:questions:What Time Is It?})
 \item	What does ``after'' mean?
 	(\cref{sec:app:questions:What Does ``After'' Mean?})
 \item	How much ordering is needed?
-- 
2.17.1


