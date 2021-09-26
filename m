Return-Path: <SRS0=/aQ/=OQ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HwqU/VPwAVNVt2KW3Lw0qNu9mutGcyh6KdVBiu42/cw=;
        b=e3O5PEwpgUUoW76G+wN55JVGHQ7dJPVNI+SatNVBRK8RWq+jJeqxTkIuiQnXgQg2oo
         6k/GIuhCodJVQC1YR7Q+2VisSjeiiMrB+j6X0K5vtNjTDzAw7kxcLKNStIDBwMAhQEZi
         Nqhbp9IUCf6bFjq5SR8UWIpMDhEMlG34oyKPszZ+s9G7yGYI56LBqTQ+wQd4F2hIhlmC
         Ync9euCxl0iE/K4cVRt0t88Ispkc502Nmqp0V3Jmvopm3VHYCSLcENSdA5/+VqAp7d4u
         xSkOFbTToQHiWnhMj7Hv44gblrnjLCnUdSyvubUL+u94kiBW/Cvz23LNIAx7zStcwbNW
         3z8Q==
Subject: [PATCH -perfbook 2/2] defer: Adjust height of RCUGuaranteeFwd.svg
References: <3842d24f-8c0b-c9aa-2259-38e62c807f32@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <014e07b3-94b9-7550-497a-32f786b51875@gmail.com>
Date: Sun, 26 Sep 2021 19:35:07 +0900
MIME-Version: 1.0
In-Reply-To: <3842d24f-8c0b-c9aa-2259-38e62c807f32@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Subject: [PATCH -perfbook 2/2] defer: Adjust height of RCUGuaranteeFwd.svg

"P1()" at the bottom is cropped a little.
Fix it by increasing the height parameter a bit.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/RCUGuaranteeFwd.svg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/RCUGuaranteeFwd.svg b/defer/RCUGuaranteeFwd.svg
index 055638bb..8393f989 100644
--- a/defer/RCUGuaranteeFwd.svg
+++ b/defer/RCUGuaranteeFwd.svg
@@ -10,7 +10,7 @@
    xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
    xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
    width="235.50583"
-   height="270.15079"
+   height="272.00000"
    id="svg2"
    version="1.1"
    inkscape:version="0.92.3 (2405546, 2018-03-11)"
-- 
2.17.1


