Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=5MsRBqCUnmPuvLP1VAa2z7VqnmNChYClat/WRJt1KTU=;
 b=kfDW7+JoJ5hlLNxwQnUrRlg4ZLupCDLrmJb6o9fHl2i2olPogRjWLEGgXukxdYb15b
 Mghc+MLY+4YoIMYWCNedM+9VpT+X3rJktxIPmjf65W0oyOaUcK4kZ2SDqvnHqFXhQbIm
 3GuA2P4Dt6ik6CNgcaLkaK4MzkfI+wLZDhyhZ86naUnMtuk9OK9jXUAQb7+Pa6+FWN0B
 BB/c9JJfVRFPb61xO3gMBxR5oon0OX2aYs8c+EQg8M9x5E/qlRYdIf7ap+gpPq1MHvj0
 YTXXf1XBND1pJOgGaWWtkYOQsTa2No5bQvHfl3YHOMWdP3QOHX3HomnpDt0O825g/WLa
 f99Q==
Subject: [PATCH v2 1/2] FAQ-BUILD.txt: Typo fix
References: <d4e3f6ba-bdc9-fa85-7404-f189adfb6436@gmail.com>
 <20170323153558.GD3637@linux.vnet.ibm.com>
 <c7a6f457-3914-9e5e-a42a-29e9b8f67b77@gmail.com>
 <7dd80f92-b8e7-3912-9bca-e59100e4665d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <8117de3c-166f-0768-9894-84e9b4edb960@gmail.com>
Date: Fri, 24 Mar 2017 22:49:47 +0900
MIME-Version: 1.0
In-Reply-To: <7dd80f92-b8e7-3912-9bca-e59100e4665d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 29f2c51a3a0f1a970a8665df15961d3c9a400a57 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 24 Mar 2017 20:36:40 +0900
Subject: [PATCH v2 1/2] FAQ-BUILD.txt: Typo fix

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index a47eef6..85a79f7 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -107,7 +107,7 @@
 		Note: If available, you can use the <package>.tds.zip,
 		which will automatically put the files in the relatively
 		right place. Note that font packages should be copied to
-		the TEXMFLOCAL directory rather than to the TEXFMHOME
+		the TEXMFLOCAL directory rather than to the TEXMFHOME
 		directory.

 		Following is a list of links to optional packages as of
-- 
2.7.4


