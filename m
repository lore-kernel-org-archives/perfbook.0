Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EL/f8Xa21sgUz13hW5/yg1/It2sePCHYchJ86gp1G9s=;
 b=h8WMGmOE8ziatD4KhckLPD7NMcActVk6rzvXoQRCHnvB3ysLU3xm/KFUvlNKlhlRNn
 fcK7cGfPXHhIt3XaVin0vZJssj1hXDMX7fVnirPpbAqf2YpuAng3HVs08b3TmLSoJp59
 z9WCH/moh8CPmlNYcmHLUsbhE259mcf9peRUOI0eJIj7nVaYF7lesyYpxWmQ9hueIl89
 Smiu58J7/4m9twjE2AB0dOkN7736iJR5XuQzDvRYmt1QyAZQAsZaihaK0a+twX9pyy9B
 KPijKgx85yDbyibqjPiZsPlsVr8rux7NY2wDfdEFR/VkPWErhfei7yeCuR7jqU42f9kk
 i/FQ==
Subject: [PATCH 2/3] cpu/overheads: Don't break just after nn-mm
References: <2495dd31-1b4c-99e2-46aa-dc55671007ff@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <479e6ed4-b56d-a9d8-3f98-28439201a348@gmail.com>
Date: Sat, 4 Nov 2017 10:40:40 +0900
MIME-Version: 1.0
In-Reply-To: <2495dd31-1b4c-99e2-46aa-dc55671007ff@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 96995ec9781970d633f554579465e9f053ec316a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 4 Nov 2017 07:44:36 +0900
Subject: [PATCH 2/3] cpu/overheads: Don't break just after nn-mm

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 cpu/overheads.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/cpu/overheads.tex b/cpu/overheads.tex
index bd4c814..366b071 100644
--- a/cpu/overheads.tex
+++ b/cpu/overheads.tex
@@ -290,8 +290,8 @@ cycles, as shown in the ``Global Comms'' row.
 	How can I possibly get my head around them?
 \QuickQuizAnswer{
 	Get a roll of toilet paper.
-	In the USA, each roll will normally have somewhere around 350-500
-	sheets.
+	In the USA, each roll will normally have somewhere around
+	350-500 sheets.
 	Tear off one sheet to represent a single clock cycle, setting it aside.
 	Now unroll the rest of the roll.

-- 
2.7.4


