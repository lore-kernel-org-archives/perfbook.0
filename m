Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0N8cnIgQ08AmeMN4rKT9g/TepHxTXH4AJ1SFZg3OHeY=;
 b=o0WZCHvrHNAbcWSds57LgxKab3h/nL9a/oOq/iWO1rF6ecy+hnx4mjFQpOpTv5VkaF
 EKjMKAlDr1Et3hoCWwKNFbEXrV6sBQEAdaNeBtFgH4X50gS3kKMkKvtLd/qkOmh5YxuN
 RyLLZytN3VfJCewfdHrauISIKT1YefiRzR26tF4AO5bnYp0cXaDli76s5kAdRkdLDtqd
 +kYJhzbOAImUAMU5WxJYM6Ikm2SYt8hh+k8OzPX4eosF3JdjneOgTx33DYRfjRV1CRCb
 u+WrIfSA3jVQNf7jWtLcB+OPztsPRn9QOHIUSEnZUbJW45E/ljWcK9ARzwHeqpypBFMh
 tp2Q==
Subject: [PATCH 2/5] FAQ-BUILD: Add entry on compatibility of a2ping and
 Ghostscript
References: <cf0ba9bc-ba0e-fac5-4b1d-52a69655244d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2bba1013-9371-5cb4-9751-b68f298d01b2@gmail.com>
Date: Wed, 2 May 2018 13:17:30 +0900
MIME-Version: 1.0
In-Reply-To: <cf0ba9bc-ba0e-fac5-4b1d-52a69655244d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 1300fe2c5c51e4427c3e3a19b303e346dda73fd9 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 15 Apr 2018 20:15:16 +0900
Subject: [PATCH 2/5] FAQ-BUILD: Add entry on compatibility of a2ping and Ghostscript

a2ping 2.77p is not compatible to Ghostscript 9.22 or later.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index 8b0e8aa..ea2c57f 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -74,7 +74,16 @@

 	A.	Please see #5 above.

-7.	When I try to build perfbook, it hangs after printing a line
+7.	I cannot build perfbook, neither can I find perfbook.log.
+	What am I missing?
+
+	A.	Updating a2ping can resolve the build error if you
+		have Ghostscript 9.22 or later.  Compatible a2ping
+		(2.83p) is available at:
+			https://www.ctan.org/pkg/a2ping
+		It is included in TeX Live 2018 or later.
+
+8.	When I try to build perfbook, it hangs after printing a line
 	reading "pdflatex 1".  How can I fix this?

 	A.	On UNIX-like systems, including Linux, type control-D.
@@ -88,7 +97,7 @@
 		perfbook.log output (or perfbook-1c.log output, depending
 		on which you were building) so that I can fix the scripts.

-8.	Some of experimental targets for alternative font won't build
+9.	Some of experimental targets for alternative font won't build
 	due to lack of necessary packages such as "newtxtt". How can I
 	install those packages?

-- 
2.7.4


