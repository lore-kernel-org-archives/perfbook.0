Return-Path: <SRS0=cNLA=GK=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DYpaeU6M/mfwTDnHFk8/oc90NFIMkGrinFzpCP/g++s=;
        b=AXTSqau3oyiU0L3YzkzkVmDAXHPzOfgqsI1PZoSVbfg/m/EYbJFZad2So3YoBtgx5d
         sDLixqDRadCDWKDVvPcEorLBZv/0sA0RtacyLWgVSARGv4DAfOG2Bb/jiAcQYNoL7YjB
         vQaGXVY8r9+PAdr96h0s8cIbCqgWy/y0wl9q8yQdtQE/A8FrjSVbTYrxPPWGYM8bAefX
         QdXRoIn7XW5CK4r0XNFnl5306amWBkUL52khjfxhvqPkobd7sbBJQ6BzYqV/aGtB4v3M
         2uEQFuWI8bb+TJOEOvkoadV3v7aI9tCTVlwUneXFSw/QWSdCfr8RFULRBnI9/kYz6CZ3
         txSg==
Subject: [PATCH v2 1/2 -perfbook] Add files to build Docker image for perfbook
 build
References: <63638566-e9e8-4be6-2d25-b0919b3805d1@gmail.com>
 <37b28839-4534-b567-02e6-2ca4c7afe261@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a40e6490-876f-7561-3176-e3263cca682f@gmail.com>
Date: Thu, 7 Jan 2021 22:51:19 +0900
MIME-Version: 1.0
In-Reply-To: <37b28839-4534-b567-02e6-2ca4c7afe261@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 9a7692db7e7fcafb7ba9d084cc30f918a1d7cb61 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 7 Jan 2021 20:53:27 +0900
Subject: [PATCH v2 1/2 -perfbook] Add files to build Docker image for perfbook build

Contains (not so) minimal packages to build perfbook*.pdf

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 docker/Dockerfile                   |  21 +++++++++++++++++++++
 docker/steel-city-comic.regular.ttf | Bin 0 -> 23280 bytes
 2 files changed, 21 insertions(+)
 create mode 100644 docker/Dockerfile
 create mode 100644 docker/steel-city-comic.regular.ttf

diff --git a/docker/Dockerfile b/docker/Dockerfile
new file mode 100644
index 00000000..e2d23c77
--- /dev/null
+++ b/docker/Dockerfile
@@ -0,0 +1,21 @@
+FROM ubuntu:focal
+
+RUN apt-get update && apt-get install -y locales && \
+    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 && \
+    rm -rf /var/lib/apt/lists/*
+ENV LANG en_US.utf8
+RUN apt-get update && DEBIAN_FRONTEND=noninteractive TZ=UTC apt-get install -y tzdata && \
+    rm -rf /var/lib/apt/lists/*
+RUN apt-get update && apt-get install -y fig2ps inkscape xfig graphviz psutils \
+    texlive-publishers texlive-pstricks texlive-science texlive-fonts-extra \
+    make nano vim git && \
+    rm -rf /var/lib/apt/lists/*
+COPY steel-city-comic.regular.ttf /usr/local/share/fonts/
+RUN fc-cache /usr/local/share/fonts/
+ARG uid=1000
+ARG gid=1000
+ARG user=perfbook
+ARG group=perfbook
+RUN groupadd -g $gid $group && useradd -u $uid -g $gid -m $user
+VOLUME /work
+WORKDIR /work
diff --git a/docker/steel-city-comic.regular.ttf b/docker/steel-city-comic.regular.ttf
new file mode 100644
index 0000000000000000000000000000000000000000..8e78fb3be367fa19516664d5086322cf0774c711
GIT binary patch
literal 23280
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

literal 0
HcmV?d00001

-- 
2.17.1


