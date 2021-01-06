Return-Path: <SRS0=bdEo=GJ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nO/VOB5/OMXFSqa4+k4K6o2Sb5Hye8ChVvFoUWo7+6Q=;
        b=k7ljP7mSsoZzZHG09cgtxICGUsQ8foBGcs5Pv6Ga6oQ35RxVFcY0rRCc25IlMHHCYj
         yzG7agoW178U5KSHzBVndTfL9YhFOEYsUZuj8Ng9rPWbrFGl9XfSPjPwYtXx18/ZVYQE
         JGpRYzqz5QP1o6M4ndkXO2ZC5YZjvEfKwK/zBy8iQQFmiz98Q6V2k1wJNIxCC7JlKsh2
         eiHrB/ojfgt2jigstOjdgJm4L2ck6B5OCuiEz+sHeudBdULVSneEIASds0Ib6AXE6MtU
         sW0BW5UQX6cuj1c5xqPsi1KGkD1J0lnKq5dN1865aTIaUk73oanPb5T03pvxA39IdbUP
         ooWg==
Subject: [PATCH 2/2 -perfbook] FAQ-BUILD: Add Q&A on Docker image
References: <63638566-e9e8-4be6-2d25-b0919b3805d1@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <831592e1-ffca-ac9e-920f-0f4b52b99bb1@gmail.com>
Date: Wed, 6 Jan 2021 19:32:42 +0900
MIME-Version: 1.0
In-Reply-To: <63638566-e9e8-4be6-2d25-b0919b3805d1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 165d967a252652e2ef5af82ce62536dbcf314600 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 6 Jan 2021 19:03:55 +0900
Subject: [PATCH 2/2 -perfbook] FAQ-BUILD: Add Q&A on Docker image

The template Dockerfile and the usage explained is a tutorial level.
Suggestions from Docker-savvy people are more than welcome.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index 2eeb9fbb..d4c18424 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -273,3 +273,25 @@
 
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
+		    docker pull akiyks/perfbook-build-env:focal
+
+		It can be run with the command:
+
+		    docker run --rm -it -v <path to perfbook dir>:/work \
+		      akiyks/perfbook-build-env:focal bash
+
+		Note:
+		    The directory to be mounted to /work you give to the
+		    "-v" option should be a newly cloned git repository.
+		    You should avoid using any git command from the container
+		    that might modify repository meta data and change their
+		    owner.
+		    Git operations should be done from the host side.
-- 
2.17.1


