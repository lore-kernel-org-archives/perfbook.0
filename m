Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=EnEvETsN8Hkk9F9vUOrhViFh5u1eiEGsFFDxLhR+LlI=;
 b=wOTrEUKZdcIeSJ0gem3UtSqAKjscY+GsXZIs700BTlLgBUDIl3NdmF0AfTOmp3IcVq
 ZFP0SljSwBeo1aiY6jmOEu3vnovyLimDmU5T0WHSaxMnNrgHP8kgkGqEKIcoOiXMYa2t
 7JyCvlDDku2cL72rOH5L3G2HQojB8UEqzC3vfYsvun6VQ0YP5cwbqry2m4htY127bNTa
 8bu7aFieO5k2K3uX5pVabNLo+ybGy1VqPf9Mm0FwnVEbyyqSZxeQ4qIa7DMaT4EA98hg
 BNLhd7p4Ihpxeg8ciwoe15CPCIT5a+Xkm4A863PUvMe7/wLZhTb6j+iHXs+qaIzWcQEs
 RMNQ==
Subject: [FOLLOW-UP RFC PATCH] advsync: Minor fix of word choice
References: <6cc7de73-01cd-a186-78c4-2cce19f74d31@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <bc44e04e-2d2c-0000-a6e1-625e51d8fb62@gmail.com>
Date: Sat, 30 Apr 2016 17:29:51 +0900
MIME-Version: 1.0
In-Reply-To: <6cc7de73-01cd-a186-78c4-2cce19f74d31@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 67433ddbf67a7d37e83426fed98228c245408c89 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiysw@gmail.com>
Date: Sat, 30 Apr 2016 17:08:03 +0900
Subject: [FOLLOW-UP RFC PATCH] advsync: Minor fix of word choice

This should have been "the vertical line", not "the vertical bar".

Signed-off-by: Akira Yokosawa <akiysw@gmail.com>
---
 advsync/memorybarriers.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index dfbf0f3..9cc546c 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -378,7 +378,7 @@ Again, CPU~0 coordinates the test, so does not record any values.
 All CPUs eventually agree on the final value of 9, but not before
 the values 15 and 12 take early leads.
 Note that there are fourteen different opinions on the variable's value
-at time 21 indicated by the vertical bar in the lower diagram.
+at time 21 indicated by the vertical line in the lower diagram.
 Note also that all CPUs see sequences whose orderings are consistent with
 the directed graph shown in
 Figure~\ref{fig:advsync:Possible Global Orders With More Simultaneous Values}.
-- 
1.9.1


