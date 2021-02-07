Return-Path: <SRS0=XMwo=HJ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7rmDHjLb+YHq9aacKhIeFHOmRH24NbCGzUctTBBcuvQ=;
        b=bOUvZxHH9uZfczAIr/lzF61V7PDufbxbZMX9zT0KhsD29pBbvo+he9i42rAxHRKX/2
         d9fQ+LzbJSiWqEIgy3rxRJcCHoyhq2Ta74fQl1WnqQogeEOZ8/XwVcGxIR9BD0pHYXbO
         D/LBu1lu1gKNOYFSsE/YHkO57e7Hx6AJUguH/O6bL4Ev/WVaQriR621ahohFK4BiDEqa
         yZiZsQ+xMLw5nR1yoVQhS4Iuzi/0EBgBDCZJkDZPGAmXwWVtZR2wEp2pYmeLJkM61jtf
         +9yJ9I88jFKqMqnxkASKjwXzedJsB25Q8JtZHJsN+PTDbC/fjB97gySeI2ek8Gzv/Fmn
         VczA==
Subject: [PATCH 2/3] bib: Update missing/broken links in RCU.bib and hw.bib
References: <21a2baaf-887d-8e98-eaad-f18948e9c377@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <46258f28-3818-290e-c9ad-f5403e5b192d@gmail.com>
Date: Mon, 8 Feb 2021 00:24:56 +0900
MIME-Version: 1.0
In-Reply-To: <21a2baaf-887d-8e98-eaad-f18948e9c377@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Add "doi" info to AlexeyGotsman2013ESOPRCU in RCU.bib.

URL of Intelx86MemoryOrdering2007 is now broken.

URLs of imgtec.com in MIPSvII-A-20xx are now broken.
Add MIPSvII-A-2016 with the link to www.mips.com's landing page.
Actual PDF is now on an AWS site.

Annotate a couple of broken URLs with \nolinkurl{}.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/RCU.bib |  6 ++++--
 bib/hw.bib  | 22 ++++++++++++++++------
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/bib/RCU.bib b/bib/RCU.bib
index 13c1fcdc..8005f2bd 100644
--- a/bib/RCU.bib
+++ b/bib/RCU.bib
@@ -2087,8 +2087,10 @@ lot of {Linux} into your technology!!!",
  booktitle = {ESOP'13: European Symposium on Programming},
  year = {2013},
  pages = {249--269},
- publisher = {Springer},
- address = {Rome, Italy},
+ doi = {10.1007/978-3-642-37036-6_15},
+ publisher = {Springer-Verlag},
+ address = {Berlin, Heidelberg},
+ location = {Rome, Italy},
 }
 
 @unpublished{PaulEMcKenney2013NoTinyPreempt,
diff --git a/bib/hw.bib b/bib/hw.bib
index 297e1e51..a1833cf9 100644
--- a/bib/hw.bib
+++ b/bib/hw.bib
@@ -502,7 +502,17 @@ Set Reference Manual",
  organization="{Imagination Technologies, LTD.}",
  year="2015",
  number="MD00087 Rev. 6.04",
- note={\url{https://imgtec.com/?do-download=4302}},
+ note={URL: \nolinkurl{https://imgtec.com/?do-download=4302} [Broken: January 2021]},
+}
+
+@manual{MIPSvII-A-2016,
+ title="{MIPS}\textregistered Architecture For Programmers
+Volume II-A: The {MIPS64}\textregistered Instruction
+Set Reference Manual",
+ organization="{Wave Computing, Inc.}",
+ year="2016",
+ number="MD00087 Rev. 6.06",
+ note={URL: \url{https://www.mips.com/downloads/the-mips64-instruction-set-v6-06/}},
 }
 
 @manual{MIPSvII-A-2017,
@@ -512,7 +522,7 @@ Set Reference Manual",
  organization="{Imagination Technologies, LTD.}",
  year="2017",
  number="MD00087 Rev. 6.05",
- note={\url{https://imgtec.com/?do-download=4302}},
+ note={URL: \nolinkurl{https://imgtec.com/?do-download=4302} [Broken: January 2021]},
 }
 
 @unpublished{LinusTorvalds2006LockingPatchQuality,
@@ -529,9 +539,9 @@ Set Reference Manual",
  organization="{Intel Corporation}",
  year="2007",
  number="318147-001",
- note="Available:
-\url{http://developer.intel.com/products/processor/manuals/318147.pdf}
-[Viewed: September 7, 2007]",
+ note="URL:
+\nolinkurl{http://developer.intel.com/products/processor/manuals/318147.pdf}
+[Broken: January 2021]",
 }
 
 @manual{Intel64IA32v3A2009,
@@ -787,7 +797,7 @@ on Computer Architecture",
  Volume="52",
  Number="6",
  note="URL:
-\url{http://www.research.ibm.com/journal/rd52-6.html}
+\nolinkurl{http://www.research.ibm.com/journal/rd52-6.html}
 [Link to each article is broken as of November 2016; Available via
 \url{http://ieeexplore.ieee.org/xpl/tocresult.jsp?isnumber=5388557}]",
  lastchecked="November 13, 2016",
-- 
2.17.1


