Return-Path: <SRS0=NH/g=A6=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683650113; x=1686242113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qgf8pKPj4Ya6Q8RJJJOOCq9NZvo9m52MFN52RO9X/ys=;
        b=sD/w/7iXPLCki0lDAQTLhehwdXKwDbqGg07E4+AuI9UXeeewAwu3uy9JHb41+CbwWa
         /FBGl+1qjLb9jyJj5hS5EU3aiS/jbARxlxbv+MIFiKsNkDJfrQrWGhf6n7uNC6uyRfJb
         r4ABzYDB2il7JpRFnoCwG4upDBePw8RpCSgP/MrxGB8xbS+oxUaPiOc+kCvgaBaIpCcY
         Bv5W18BPfwc2oCe2jSB25emD/lTctH1X7s9YhMis18FSweGPLqqGEcuKcy5oyvprvcW7
         BVoXxBr8fheOdyawPSIXaOSxrh0RUAp7bRpmb1WVmVm09sIuDtYwl9fMK+JQHxLP0Pxr
         I4iQ==
From: Alan Huang <mmpgouride@gmail.com>
Subject: [PATCH] datastruct: Fix typo
Date: Tue,  9 May 2023 16:35:06 +0000
Message-Id: <20230509163506.33670-1-mmpgouride@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Alan Huang <mmpgouride@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This section has almost no code, should be chapter.

Signed-off-by: Alan Huang <mmpgouride@gmail.com>
---
 datastruct/datastruct.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 0242ccc7..d2a67ffd 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -1975,7 +1975,7 @@ produce novel algorithms with surprising properties.
 %
 \epigraph{The devil is in the details.}{Unknown}
 
-The data structures shown in this section were coded straightforwardly,
+The data structures shown in this chapter were coded straightforwardly,
 with no adaptation to the underlying system's cache hierarchy.
 In addition, many of the implementations used pointers to functions
 for key-to-hash conversions and other frequent operations.
-- 
2.34.1

