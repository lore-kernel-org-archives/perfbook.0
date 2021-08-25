Return-Path: <SRS0=Ut+l=NQ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LZ4OiKdc79Iwc+Jqqdq27FBKFuUFnj39EwB/RHBbLgE=;
        b=SVdMT3oNH8KWhbIgyjeRldDH2i3sNfhjV0XZuUEgXk8C4B1pTSbnT54WB7WZ0vZuK9
         IpaG9oE/7ctmRMz5WZS3O1jaffOMehkJxZgx5IQaH/pbSUMf3OQIUMNE6MnvDyekXtY7
         burkWMgEfI4aWYBg1WeVDDYudNDaUPaVXS+9kjdTIXBy44RDbJsq52iF83FsFx2icnJC
         jUarsKA1s2Vg97N5WK8heoOEirhhtoKigGPmO9wqDIOARQyslnr2ovktpQIKZBVKz03d
         hRROgGkQYUgyBL48vMbZf7ovpA2PMIQTZlPq3VLj0de38M8IZ8DWkVxOisqma6p7RIgp
         ZalA==
Subject: [PATCH -perfbook 1/5] datastruct: Reference Figure 10.11 to clarify
 discussion flow
References: <8e4ab0b0-2a64-3ff6-e35a-38778d9622cf@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f97a9af5-b3d4-1be8-224c-4dbc44506ac3@gmail.com>
Date: Wed, 25 Aug 2021 18:36:55 +0900
MIME-Version: 1.0
In-Reply-To: <8e4ab0b0-2a64-3ff6-e35a-38778d9622cf@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The preceding paragraph discusses update performance regarding
Figure 10.12.
This paragraph returns to Figure 10.11 and speculates that the rate
of lookup might be affected by the differences of update rates.
To help readers to follow the discussion flow, add a reference to
Figure 10.11 near the beginning of the paragraph.

Also fix a typo in the reworked answer to QQ 10.9.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 datastruct/datastruct.tex | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 552bd955..d703a741 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -940,7 +940,8 @@ starts to make its presence known, first for RCU and then for hazard
 pointers.
 Of course, all three of these implementations beat global locking.
 
-It is quite possible that the differences in lookup performance
+It is quite possible that the differences in lookup performance observed in
+\cref{fig:datastruct:Read-Side RCU-Protected Hash-Table Performance For Schroedinger's Zoo in the Presence of Updates}
 are affected by the differences in update rates.
 One way to check this is to artificially throttle the update rates of
 per-bucket locking and hazard pointers to match that of RCU\@.
@@ -969,7 +970,7 @@ not recommended for production use.
 
 	In addition, other testing has shown that RCU read-side primitives
 	offer consistent performance and scalability up to at least 1024~CPUs.
-	However, is useful to review
+	However, it is useful to review
 	\cref{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schr\"odinger's Zoo at 448 CPUs; Varying Table Size}
 	and its associated commentary.
 	You see, unlike the 448-CPU system that provided this data,
-- 
2.17.1


