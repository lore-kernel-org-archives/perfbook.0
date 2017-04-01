Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=wvcC9KZLf8R8j/piZ2WUxvPPFowS2pE+dp39rpYCrw0=;
 b=ZqDXBvwVtztvlWZIddQ3japZYXgii+FmBGxvS0DzdiWFEtaIKKoEuh3NwdN2GSgbDV
 8F46zGWmUMW10RR4BgtEKyNffrkJljG75+OH6xTMp/FXdTAM2eOGQ98EvO+V6V0KomA+
 Srk4tjbd500nJCzvviyvE8g9e5ikh7mqkqY/CLMgP1VhoUyu6zbEzgxACw/+g/R5Drd3
 f3I06zVAbN1rrP+oCpqDreiABkZF4nqNIPHwKfZQDmKbaT9QhahjmG2RFgH5NyRzTwEi
 oiILLEdTkYlzyTHLn7QLcFsKAX2cpeC2TEFvZXPmrUJINUI3BnAhrN/GrGrMMpufKULn
 6JTw==
Subject: [RFC PATCH 11/12] advsync: Add extdash shortcut
References: <b00db59a-a0b0-42d6-7546-01872ad3e404@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7ec3829f-db93-7f5d-4c72-269f17963414@gmail.com>
Date: Sat, 1 Apr 2017 11:23:00 +0900
MIME-Version: 1.0
In-Reply-To: <b00db59a-a0b0-42d6-7546-01872ad3e404@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 30b53cae7cbbb00daef6c6a979e6e5d39680b9b8 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 1 Apr 2017 08:48:26 +0900
Subject: [RFC PATCH 11/12] advsync: Add extdash shortcut

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 99593a6..d2ad7b8 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -2828,7 +2828,7 @@ respectively.
 } \QuickQuizEnd

 \paragraph{Lock-Based Critical Sections:}
-Although an ACQUIRE-RELEASE pair does not act as a full memory barrier,
+Although an ACQUIRE\-/RELEASE pair does not act as a full memory barrier,
 these operations \emph{do} affect memory ordering.

 Consider the following code:
-- 
2.7.4


