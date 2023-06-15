Return-Path: <SRS0=Gk1L=CD=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686822754; x=1689414754;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KexVgfx5fc/WsTGJZhse2Ci6+kruw+vYHtT+ew4qOtE=;
        b=lQntdgg+vbD4voISRTwCNOyvscQTO5SFSvrrJhQs+czKQpFeh/JiG4TnqR1fhDxGP0
         KblS4wnPrVi8+Hov9WgMBm1f+ieMIFHRb51NrFNPE20nm2VPcuH4/aPyrbs6YX7y4UQY
         5C1aH2m4v7Cx2tEcmH4Femcle750L5gtJRjsANO7XX1+Ucj4AhHtYHvRGTMl77X7G/+m
         M4iLvkFX9fg2RDobgqK3gjmDjc7tUscp4BWobBh6qBqBbcGuAfzlbCJAQGjFjAD7dKc3
         nCkTRhWdTRHQH8MxxtzjcCqtF0d+tEfmVaI2AKZUWRBgFlzozEUzOfN0HowpGnN071oo
         TnTQ==
Message-ID: <c55b90c8-f00c-671a-1f17-f245c3825b89@gmail.com>
Date: Thu, 15 Jun 2023 18:52:31 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 3/6] docker/Dockerfile.fedora: Stay with Fedora 37
 for the moment
Content-Language: en-US
References: <feeecfa4-ed23-bede-5487-49129030431f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <feeecfa4-ed23-bede-5487-49129030431f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Inkscape of Fedora 38 has a regression in font markup corruption
in SVG --> PDF conversion.

Stay with Fedora 37 by Using an ARG variable "rel" with its value
of 37.

Add poppler-utils package for the pdffonts command to see font markup
in PDF properties.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 docker/Dockerfile.fedora | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/docker/Dockerfile.fedora b/docker/Dockerfile.fedora
index fdfbdc344bf5..9b5ed5440869 100644
--- a/docker/Dockerfile.fedora
+++ b/docker/Dockerfile.fedora
@@ -1,8 +1,15 @@
-FROM fedora:latest
+# As of June 2023, Inkscape of Fedora 38 has a regression of font markup
+# corruption.
+# Stay with Fedora 37 for the moment.
+# You can override "rel" by saying:
+#    docker build -t <tag> --build-arg rel=latest -f Dockerfile.fedora .
+#
+ARG rel=37
+FROM fedora:$rel
 
 RUN dnf -y update && dnf install -y --setopt=tsflags=nodocs \
     fig2ps graphviz inkscape make git vim nano gnuplot-minimal groff time \
-    liberation-fonts dejavu-fonts-all \
+    liberation-fonts dejavu-fonts-all poppler-utils \
     texlive-collection-plaingeneric texlive-collection-binextra \
     texlive-collection-latexextra texlive-epstopdf texlive-fontools \
     texlive-newtx texlive-newtxtt texlive-nimbus15 texlive-courier-scaled \
-- 
2.25.1


