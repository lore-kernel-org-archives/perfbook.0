Return-Path: <SRS0=NRmw=IN=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=JIHlGdzPHVtNJtA1XHXOWnyexhcsDXsIAHa/OvC8CDc=;
        b=OkGyM6CCDz24m0WvJymBzMK7pN+wV+6fK1PFvYJkIQKbMwp7dP89QehpTZfaKz2Ujt
         4JlGzBLrQxHirrgE+u9sR/fpj3V3rSLtMVpD1zfjF2IuFIoJ58YG+03u1UVKM1UewPVu
         vu9vglXq5L7FvXOhwVCGXGzAz66YVfYojGXX1bjFSByNs1nehYOSCGNsB6SznyuhjoRC
         7H+5iaTP9LUxJPD6QiXFyCMCibAcBpSbjaw07igv8K71/+twQQwLgwuJw6s+UbVT1VGd
         n6K49rd0+iqTE2rTW3oYrIeX9FKI8FeJFgef8LnW65vXlhJffmriYSptkLvxRy5Wi7Qr
         YWgA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] legal: Remove MIPS from the trademark list
Message-ID: <2586d1bf-d475-b153-0e18-9bfbf9e186ab@gmail.com>
Date: Tue, 16 Mar 2021 00:03:17 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Subject: [PATCH] legal: Remove MIPS from the trademark list

They say Wave Computing will become new "MIPS" [1].
However, there is no official statement regarding the status of MIPS
trademark at the moment.
Tentatively remove MIPS from the explicit list and delegate it to
the final "Other company, ..." item.

[1]: https://www.prnewswire.com/news-releases/wave-computing-and-mips-emerge-from-chapter-11-bankruptcy-301237051.html

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
FWIW, the old entry of "Wave, Inc." was missing "Computing"...
Few people read such Legal pages, if any. ;-)

        Thanks, Akira

--
 legal.tex | 2 --
 1 file changed, 2 deletions(-)

diff --git a/legal.tex b/legal.tex
index b2b827c4..89ce7715 100644
--- a/legal.tex
+++ b/legal.tex
@@ -18,8 +18,6 @@ Trademarks:
 	other countries, or both.
 \item	Arm is a registered trademark of Arm Limited (or its subsidiaries)
 	in the US and/or elsewhere.
-\item	MIPS is a registered trademark of Wave, Inc. in the United States
-	and other countries.
 \item	SPARC is a registered trademark of SPARC International, Inc.
 	Products bearing SPARC trademarks are based on an architecture
 	developed by Sun Microsystems, Inc.
-- 
2.17.1

