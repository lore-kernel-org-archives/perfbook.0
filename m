Return-Path: <SRS0=s5RH=QE=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=EYlilEx7K+cbqBIZuXPLaAJnp6NNxPp40H1qjAveoDQ=;
        b=adrBqhZbM4rkFbmd1LBp0oFOs6Y/1x10kfzj/Dn5wHBkKmW3EBzN0imiFn0In2GQl/
         yB20jCNtIyz+2Tupa86hHa+kexJ7U5NPOa8fx+cKQxKZ75lwQnI9CLjIRCb6FzADU174
         wX1Bb6rlUh4+FnQXTA6H0pypxCb0q7//Z7XW92y3ReCA6lXCsAP7ajxkMPVFvRSeTMF4
         Q8FaKMSRmwvv51FdHrz073p/ybzU1xuigBlizmHttznN7BiVVaoxW06mZutWL1qjIbKO
         qPVYMWpEoJtphT4o+Fsl5b466XgBEIq/HvHHyHdqlAMeBuIbZOrxZfyjd7M3ddQvaTMG
         WTAw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] Revert "docker: Stay with Fedora 34"
Message-ID: <11bf80e4-ff2d-9be3-5272-b8ad9a3c31e1@gmail.com>
Date: Wed, 17 Nov 2021 23:29:44 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This reverts commit a1f2577ee2be1a464c2e63191f17f21f24fc81f8.

Fedora's Inkscape team has proactively applied the fix to the
issue at https://bugzilla.redhat.com/show_bug.cgi?id=2018036
and has released inkscape-1.1.1-2.

Now it should be safe for perfbook to build container images from
fedora:latest.

Note: Upstream Inkscape will fix this issue with the point release
of 1.1.2, which is scheduled to be released in January 2022.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 docker/Dockerfile.fedora | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docker/Dockerfile.fedora b/docker/Dockerfile.fedora
index c2af8d11..91633948 100644
--- a/docker/Dockerfile.fedora
+++ b/docker/Dockerfile.fedora
@@ -1,4 +1,4 @@
-FROM fedora:34
+FROM fedora:latest
 
 RUN dnf -y update && dnf install -y --setopt=tsflags=nodocs \
     fig2ps graphviz inkscape make git vim nano gnuplot-minimal groff time \

base-commit: 10fb038cd0da1be1db8766a9d2df120ebf6ca28d
-- 
2.17.1

