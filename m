Return-Path: <SRS0=Gk1L=CD=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686822679; x=1689414679;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c2YDQTdcD1jlAs78BWxMrGu7LT2P+ytOjPY8Q9QnkRQ=;
        b=lADthG5rVvyqjamEZZlf54iAX5L1TWauknAA1L5n5DyX8eqbh96PfsGvwwEn97v4Gb
         JXdnXIvZQ7CZ7/ll9Wsr6bM38uoff11A/aI43Bz6lxR5oDZAfZZQHTGkwkuK5shrv12K
         fOlaeIJFw7O7aXX2lGqAl8PxZsK8UlqUVj3l01vlchMgiz8SxJTOPTxYCtQ+b9qY9SgL
         /mHDaEDtyzCO//HeR3+5yLllJWq2DnV34ahkZFLK0aCYdQvilS8nwSe6UxiDF/xQFBZk
         DfHn+7QIPo9t2QrDfo8FcFSHIRMIfr6+iPlBjGLHEZ2pFUlAFlWw8bkJarMKN0oLZqES
         geuA==
Message-ID: <59a77a0c-5b4e-1b60-6c0d-177c79165f35@gmail.com>
Date: Thu, 15 Jun 2023 18:51:16 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 2/6] FAQ-BUILD: Update nice-to-have fonts for SVG
 figures
Content-Language: en-US
References: <feeecfa4-ed23-bede-5487-49129030431f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <feeecfa4-ed23-bede-5487-49129030431f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The list for Fedora in the answer to #5 doesn't cover DejaVu and
Liberation font families.

Update A-2 of #9 to suggest packages for Fedora.

Update docker/Dockerfile.fedora accordingly.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt            | 9 +++++++--
 docker/Dockerfile.fedora | 3 +--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index 7c584c2444fe..e0fa0847fd53 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -201,8 +201,13 @@
 
 		in .svg --> .pdf conversions if that happens.
 
-		As for Ubuntu and Fedora, packages listed in #5 should cover
-		all the font families needed.
+		As for Ubuntu, packages listed in #5 should cover all the
+		font families listed above.
+
+		As for Fedora, installing packages listed below should suffice:
+
+		  - dejavu-fonts-all
+		  - liberation-fonts
 
 10.	Building perfbook fails with a warning of buggy cleveref or
 	version mismatch of epigraph.
diff --git a/docker/Dockerfile.fedora b/docker/Dockerfile.fedora
index ff56ac4c751e..fdfbdc344bf5 100644
--- a/docker/Dockerfile.fedora
+++ b/docker/Dockerfile.fedora
@@ -2,8 +2,7 @@ FROM fedora:latest
 
 RUN dnf -y update && dnf install -y --setopt=tsflags=nodocs \
     fig2ps graphviz inkscape make git vim nano gnuplot-minimal groff time \
-    liberation-mono-fonts liberation-sans-fonts \
-    dejavu-sans-mono-fonts \
+    liberation-fonts dejavu-fonts-all \
     texlive-collection-plaingeneric texlive-collection-binextra \
     texlive-collection-latexextra texlive-epstopdf texlive-fontools \
     texlive-newtx texlive-newtxtt texlive-nimbus15 texlive-courier-scaled \
-- 
2.25.1


