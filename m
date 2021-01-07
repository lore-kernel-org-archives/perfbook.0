Return-Path: <SRS0=cNLA=GK=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LVNRsb7R5DEnTA2iSezILK3xDOp89ZnXc7mvo4FOAv8=;
        b=KlDrOJ5B/t6WjL9zjbwe2tdiKnF14hjA6anvgd7lT74ry9yHnH+FdZbeueXrNuuXaa
         DSh8QGzTw3uD3TzdFHdCBIROzKRGiC5PLGDcTHPTAHyGhLbbXssohQall8alNAzFBlIb
         +2VMDBNL5FfLksGkFlRmBu7r8zJdwFrMqKstNGLEfZfA5lpXV/0Z7IC/qnd/A+Mli6gY
         Emoc49fSwHL1qXa2Y+pNd4BYVYES7oiToJKnzn0KZT9AoS78EHqbvBUuDoWss6c+YRSA
         s+u3IUxJqMBIykg7b5sBsTCYcn+bHSW+DLGRNKdQaTbrjMReUjZnr5re+XYvTK91PhvI
         mgfg==
Subject: [PATCH v2 2/2 -perfbook] FAQ-BUILD: Add Q&A on Docker image
References: <63638566-e9e8-4be6-2d25-b0919b3805d1@gmail.com>
 <37b28839-4534-b567-02e6-2ca4c7afe261@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <4148cb4f-725d-5b52-830e-9c123e01e3fe@gmail.com>
Date: Thu, 7 Jan 2021 22:52:42 +0900
MIME-Version: 1.0
In-Reply-To: <37b28839-4534-b567-02e6-2ca4c7afe261@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From a439bdb6aedf1ba06600c060e865d872580b0596 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 6 Jan 2021 19:03:55 +0900
Subject: [PATCH v2 2/2 -perfbook] FAQ-BUILD: Add Q&A on Docker image

The template Dockerfile and the usage explained is a tutorial level.
Suggestions from Docker-savvy people are more than welcome.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt | 38 +++++++++++++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index 2eeb9fbb..f6c720b8 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -36,7 +36,11 @@
 	find it?
 
 	A.	The "pdflatex" package is a variant of Don Knuth's
-		digital typesetting program.  On Ubuntu Xenial,
+		digital typesetting program.
+		If you'd like to use a Docker container, See #14 below.
+		Otherwise, instructions follow.
+
+		On Ubuntu Xenial,
 		installing the following set of packages suffices:
 
 			texlive-latex-base texlive-latex-extra psutils
@@ -71,8 +75,10 @@
 
 		On other Linux distributions such as RHEL/CentOS and
 		Scientific Linux, where support of TeX Live packages
-		is insufficient, installing upstream TeX Live should
-		be a reasonable choice.
+		is insufficient, using a Docker container is the easiest
+		choice for you.  Again, see #14 below.
+
+		Of course, you can install upstream TeX Live.
 		See: https://www.tug.org/texlive/quickinstall.html
 
 		NOTE: In doing so, you might end up in having
@@ -273,3 +279,29 @@
 
 		    sudo updmap-sys --syncwithtrees --force
 		    sudo updmap-sys
+
+14.	I want a stable environment to build perfbook.pdf.
+	Isn't some container image available in that regard?
+
+	A.	You can find a template Dockerfile under the docker/
+		subdirectory.
+		A docker image built from it can be pulled by:
+
+		    docker pull akiyks/perfbook-build-focal:latest
+
+		It can be run with the command:
+
+		    docker run --rm -it -v <path to perfbook dir>:/work \
+		      -u $(id -u):$(id -g) \
+		      akiyks/perfbook-build-focal:latest bash
+
+		Note:
+		The prebuilt Docker image assumes <uid:pid> = <1000:1000>.
+		If you have different ids, bash prompt will be in the
+		form of "I have no name!@abcdef012345:/work$".
+		There is no problem in building perfbook.
+		If you'd like, you can build a docker image on your own.
+
+		    cd docker
+		    docker build -t <docker image tag> \
+		      --build-arg uid=$(id -u) --build-arg gid=$(id -g) .
-- 
2.17.1


