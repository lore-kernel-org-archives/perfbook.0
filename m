Return-Path: <SRS0=LG5i=PF=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1/21xAGuHdtjUF1sB/4eShwT1VV8IKpwUnnIdGRLbbo=;
        b=DSIo7O66JbjVmbiCVedwxS/2S0nBKmv7ACM2kuI+km+Y/t0BT+dljqddp4V601UWWW
         G1Tq7S8LB3hqxbQtBITaKX4Ry2ioVHkDZjFXZCGb7wDIzzAkel6a2Ofk13StPqAorn1+
         EhXCvFQgxU9A/zU7RDA912xq5bhxdhoaKfVOr3nNsZpin5Q8n2MhVvjKuDibdGof6ZLx
         LCrsD7tV3O7C8fOjAzCh1SY2WXrjoNPzqhsAKMBNke6AOnuOoQIcsmewjdhYZHoss+pz
         HwWFXazDIHiArFvCV54B/5VNZPfE2+b+unWBM2ncCD2DKTTLk1ERd0UoXQKDu8kA0+Ix
         794A==
Subject: [PATCH -perfbook 1/3] docker: Add some fonts and commands
References: <e803eeb3-d39d-8bbf-4e5e-d7c3fbbfcd84@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <81b043b5-f479-3a5b-107b-ceb89d77fa20@gmail.com>
Date: Sun, 17 Oct 2021 17:15:41 +0900
MIME-Version: 1.0
In-Reply-To: <e803eeb3-d39d-8bbf-4e5e-d7c3fbbfcd84@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

To cover recent changes in commit cb1e3178533d ("Update on-the-fly
font-substitution patterns for .eps and .svg files") and some of
existing .svg figures, Dockerfile.fedora needs a couple of
additional font packages.

Also add packages for "gnuplot" and "time" commands in all three
Dockerfiles.

Other change:

  o Use "if -- then -- fi" constructs so that redundant groupadd
    and useradd commands can be skipped when "uid == 0".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 docker/Dockerfile        |  8 +++++---
 docker/Dockerfile.bionic |  8 +++++---
 docker/Dockerfile.fedora | 11 ++++++++---
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/docker/Dockerfile b/docker/Dockerfile
index 7527e08b..3a3991bb 100644
--- a/docker/Dockerfile
+++ b/docker/Dockerfile
@@ -8,11 +8,10 @@ RUN apt-get update && DEBIAN_FRONTEND=noninteractive TZ=UTC apt-get install -y t
     rm -rf /var/lib/apt/lists/*
 RUN apt-get update && apt-get install -y fig2ps inkscape xfig graphviz psutils \
     texlive-publishers texlive-pstricks texlive-science texlive-fonts-extra \
-    make nano vim git && \
+    make nano vim git curl gnuplot-nox time && \
     rm -rf /var/lib/apt/lists/*
 COPY steel-city-comic.regular.ttf /usr/local/share/fonts/
 RUN fc-cache /usr/local/share/fonts/
-RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*
 WORKDIR /opt
 RUN curl https://gitlab.com/latexpand/latexpand/-/archive/v1.3/latexpand-v1.3.tar.gz -o - | tar xfz - && \
     sed -i -e 's/@LATEXPAND_VERSION@/v1.3/' latexpand-v1.3/latexpand && \
@@ -21,7 +20,10 @@ ARG uid=1000
 ARG gid=1000
 ARG user=perfbook
 ARG group=perfbook
-RUN groupadd -g $gid $group && useradd -u $uid -g $gid -m $user
+RUN if [ $uid -ne 0 ] ; then \
+    groupadd -g $gid $group ; \
+    useradd -u $uid -g $gid -m $user ; \
+    fi
 VOLUME /work
 USER $uid:$gid
 WORKDIR /work
diff --git a/docker/Dockerfile.bionic b/docker/Dockerfile.bionic
index 56e6280e..207feca7 100644
--- a/docker/Dockerfile.bionic
+++ b/docker/Dockerfile.bionic
@@ -8,11 +8,10 @@ RUN apt-get update && DEBIAN_FRONTEND=noninteractive TZ=UTC apt-get install -y t
     rm -rf /var/lib/apt/lists/*
 RUN apt-get update && apt-get install -y fig2ps inkscape xfig graphviz psutils \
     texlive-publishers texlive-pstricks texlive-science texlive-fonts-extra \
-    make nano vim git && \
+    make nano vim git curl gnuplot-nox time && \
     rm -rf /var/lib/apt/lists/*
 COPY steel-city-comic.regular.ttf /usr/local/share/fonts/
 RUN fc-cache /usr/local/share/fonts/
-RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*
 WORKDIR /opt
 RUN curl https://mirrors.ctan.org/macros/latex/contrib/cleveref.zip -L -O && unzip cleveref.zip && \
     curl https://mirrors.ctan.org/macros/latex/contrib/epigraph.zip -L -O && unzip epigraph.zip && \
@@ -33,7 +32,10 @@ ARG uid=1000
 ARG gid=1000
 ARG user=perfbook
 ARG group=perfbook
-RUN groupadd -g $gid $group && useradd -u $uid -g $gid -m $user
+RUN if [ $uid -ne 0 ] ; then \
+    groupadd -g $gid $group ; \
+    useradd -u $uid -g $gid -m $user ; \
+    fi
 VOLUME /work
 USER $uid:$gid
 WORKDIR /work
diff --git a/docker/Dockerfile.fedora b/docker/Dockerfile.fedora
index 33add84d..91633948 100644
--- a/docker/Dockerfile.fedora
+++ b/docker/Dockerfile.fedora
@@ -1,11 +1,13 @@
 FROM fedora:latest
 
 RUN dnf -y update && dnf install -y --setopt=tsflags=nodocs \
-    fig2ps graphviz inkscape make git vim nano \
+    fig2ps graphviz inkscape make git vim nano gnuplot-minimal groff time \
+    liberation-mono-fonts liberation-sans-fonts \
+    dejavu-sans-mono-fonts \
     texlive-collection-plaingeneric texlive-collection-binextra \
     texlive-collection-latexextra texlive-epstopdf texlive-fontools \
     texlive-newtx texlive-newtxtt texlive-nimbus15 texlive-courier-scaled \
-    texlive-inconsolata texlive-newtxsf texlive-mdsymbol && \
+    texlive-inconsolata texlive-newtxsf texlive-mdsymbol texlive-gnu-freefont && \
     dnf clean all && \
     mktexlsr
 COPY steel-city-comic.regular.ttf /usr/local/share/fonts/
@@ -18,7 +20,10 @@ ARG uid=1000
 ARG gid=1000
 ARG user=perfbook
 ARG group=perfbook
-RUN groupadd -g $gid $group && useradd -u $uid -g $gid -m $user
+RUN if [ $uid -ne 0 ] ; then \
+    groupadd -g $gid $group ; \
+    useradd -u $uid -g $gid -m $user ; \
+    fi
 VOLUME /work
 USER $uid:$gid
 WORKDIR /work
-- 
2.17.1


