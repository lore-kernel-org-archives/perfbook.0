Return-Path: <SRS0=41H2=ZZ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date;
        bh=Tv7VyTG7jJu5abJfEUsio/mrwjLzpVAXKieKCKftzHQ=;
        b=HLlloumMdJNdGPa4lxCIfCuZlRPs4rGFC7arjYSMNdxspoU3gT0/DTmrquCukQzxey
         eV++csiZr/81YeX50ZyWt9YZxC5Ja3rnj/BJ0D/mgUPChA7kmL28MxJ2Zz3sOiBgIv9o
         PSw/ED4JaN9XR7gUF4wUYo0CG61j7oTs3x2vQBkJ1ni++6hMD3kDEAxrtQvh9bGPcuvs
         qzy7lhZIRYmm6MpVQ6ooRusDXxBPolTI7vE9s8fubGPi5exFsaIhw8GqI652sqi3VGOi
         RJWFn8Muzn8OQs9AkOdwfWWXBkHjadlzjeKQxfV89lXyeSgdEeX6vU4H5Y9IOz/JdvmT
         p0Jw==
Message-ID: <9b1809dc-a03c-e239-494b-89207ecaa4aa@gmail.com>
Date: Thu, 22 Sep 2022 23:45:00 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] Cope with Ghostscript 10.00.0 and later
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Ghostscript 10.00.0 has graduated from its RC stages recently [1].
Expand regular expressions for detecting modern versions of
Ghostscript.

Link: [1]: https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/tag/gs1000
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi,

Despite the increment of major version to 10, there seems to be no
outstanding backward-incompatible changes like the early days of
9.5x releases.

One notable change mentioned in the release note is the switch of
the default PDF interpreter to the brand new implementation in the
C language (appeared in 9.56) from the one written in PostScript.

If we encounter any behavior change, we are supposed to file a
bug report :-)

Ubuntu's and Fedora's distro packages will wait the upgrade
until next spring, I guess, but who knows.

        Thanks Akira
--
 a2ping-rule.mk   | 4 ++--
 epstopdf-rule.mk | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/a2ping-rule.mk b/a2ping-rule.mk
index 5260ec92e7f2..6db633deed24 100644
--- a/a2ping-rule.mk
+++ b/a2ping-rule.mk
@@ -7,10 +7,10 @@
 A2PING := $(shell which a2ping 2>/dev/null)
 
 ifdef A2PING
-  GS_950_OR_LATER := $(shell gs --version | grep -c -E "9\.[5-9].?")
+  GS_950_OR_LATER := $(shell gs --version | grep -c -E "^(9\.[5-9]|10\.[0-9]).?")
   A2PING_277P := $(shell a2ping --help 2>&1 | grep -c "2.77p,")
   A2PING_283P := $(shell a2ping --help 2>&1 | grep -c "2.83p,")
-  GS_953_OR_LATER := $(shell gs --version | grep -c -E "9\.5[3-9].?")
+  GS_953_OR_LATER := $(shell gs --version | grep -c -E "^(9\.5[3-9]|10\.[0-9]).?")
   ifeq ($(A2PING_277P),1)
     A2PING_GSCNFL = 1
   else
diff --git a/epstopdf-rule.mk b/epstopdf-rule.mk
index d248ce750d68..e33e476c2c74 100644
--- a/epstopdf-rule.mk
+++ b/epstopdf-rule.mk
@@ -5,7 +5,7 @@
 # Authors: Akira Yokosawa <akiyks@gmail.com>
 
 EPSTOPDF := $(shell which epstopdf 2>/dev/null)
-GS_953_OR_LATER := $(shell gs --version | grep -c -E "9\.5[3-9].?")
+GS_953_OR_LATER := $(shell gs --version | grep -c -E "^(9\.5[3-9]|10\.[0-9]).?")
 GS_OPT=--gsopt=-dPDFSETTINGS=/ebook
 
 $(PDFTARGETS_OF_GNUPLOT_NEEDFIXFONTS): $(FIXFONTS)

base-commit: 36e0babae953969d16bc5254b79412bc873cf8c0
-- 
2.25.1

