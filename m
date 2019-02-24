Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oPxrGJoJ5VaLzymnE1U32knGfEYze3HBkvo4uavA7ng=;
        b=aratoduML2sMzba8jKKJOUu/DO4aRTEpt+d0TDi0g5lpJ2+/IzvUpfp98IwGjv/+JT
         33M4/ZXzfRyZMSk72DvS9F9fOBtZ90alWVqjZhADxbgUbFAGReyinegSpX09+fXv1lcQ
         OKXiq+7cWadyN6qq8VtbhFoBoP/UK8HtZqNv+tIJAowt1WwM9j86l2VZ9AC8+6QBdbIK
         oQWrf75xAJEZH4GdXRyNNGSDG0MmDJblcRAQh4hWSnwo/XgMWTfXQiMhV+R4gD2x+svR
         GkoV28nM1vemPchPEiWl1D7zPJrzU3qDlTKbr9LVGEMdXhAWItgKjAEB3MT7xS+YAwQD
         CM4g==
Subject: [PATCH 4/8] Specify PDF minor version 1.7
References: <3c30eb79-c675-2686-e2a1-1d0db5469178@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <d5286e3b-8a7a-ee7e-27cb-ea36b23dc0d6@gmail.com>
Date: Sun, 24 Feb 2019 09:09:45 +0900
MIME-Version: 1.0
In-Reply-To: <3c30eb79-c675-2686-e2a1-1d0db5469178@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From f6814ac4124a9a383ca8ca7f683d46f1365ace58 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 23 Feb 2019 18:25:33 +0900
Subject: [PATCH 4/8] Specify PDF minor version 1.7

Ghostscript 9.26 changed the default PDF output to 1.7 [1].
This causes a lot of warning messages in perfbook.log, saying:

    pdfTeX warning: pdflatex (file ./cartoons/1kHz.pdf): PDF inclusion:
    found PDF version <1.7>, but at most version <1.5> allowed
    <cartoons/1kHz.pdf, id=11175, 319.79472pt x 287.27324pt>
    File: cartoons/1kHz.pdf Graphic file (type pdf)

This warning can be suppressed by setting "\pdfminorversion=7"
in the preamble.

[1]: https://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=bb2ea8ca0482

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/perfbook.tex b/perfbook.tex
index f79e7b0..a1e90dd 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -2,6 +2,9 @@
 % For arxiv.org, must be on or before line 5:
 \pdfoutput=1
 
+% To accomodate change in Ghostscript 9.26 (default output: PDF 1.7)
+\pdfminorversion=7
+
 % standard packages
 
 % A more pleasant font
-- 
2.7.4


