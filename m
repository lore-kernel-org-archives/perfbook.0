Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=Zj5po5tXe6NMNcthSKCOZgkMsotV9JRnAqdPaCieywg=;
 b=0tRROq6o9FJMF0ktRE53qAYGbvB6NsN0S6EFjTFdaz4EY7kjVdW/Q82AmcW68Ouq78
 46Vv0YuJZBL7wsbEfLaJfQMjpeJ9JREn8xfzLFFn3iRz+uDkFl4b+Y/SfPa44DxKCRCR
 ZsQ6QapHiJaTst3RZtmzpYzvZ7P0f1KfuxyJH5N5/ncN0Mxc5RAEOrCrTY7Vh9st7F1t
 XSqTCtT9PkTqVKDoJMNBt0nIon1csh6M74AY+2U5I3hRz8r60eM5a6o7gPZp4nwofyby
 M5qMZDSmrZoxdFOssnF3obcHZiCmDU7OBTHci/51PRq8WxkAt6UPbSgBVzvYnUrSesBz
 SjLg==
Subject: [RFT PATCH 4/5] Add explanation of short name target in FAQ.txt
References: <9f8a3c0d-75fe-0b6f-733f-2134f67ccd6f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <bf29f8ed-ccbf-25c1-0443-a728a8abd901@gmail.com>
Date: Tue, 3 May 2016 08:01:11 +0900
MIME-Version: 1.0
In-Reply-To: <9f8a3c0d-75fe-0b6f-733f-2134f67ccd6f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 3b3505ccba4bee3d0f1348f75f59f48c6fa4bb7e Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiysw@gmail.com>
Date: Mon, 2 May 2016 23:49:33 +0900
Subject: [RFT PATCH 4/5] Add explanation of short name target in FAQ.txt

Signed-off-by: Akira Yokosawa <akiysw@gmail.com>
---
 FAQ.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/FAQ.txt b/FAQ.txt
index f331bdd..1a1c589 100644
--- a/FAQ.txt
+++ b/FAQ.txt
@@ -20,6 +20,12 @@
 		are .svg files.  Typing "make touchsvg; make" will do
 		the trick.

+1.2	I prefer perfbook-1c.pdf than perfbook.pdf to read it on my
+	tablet. Typing "make perfbook-1c.pdf" every time is a little
+	bit cumbersome. Isn't there any simpler way?
+
+	A.	Actually there is!  Just type "make 1c".
+
 2.	The Makefile cannot find pdflatex.  What is it and where can I
 	find it?

-- 
1.9.1


