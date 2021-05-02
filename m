Return-Path: <SRS0=fRoa=J5=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=5Dw5OosTvLqBbZzI9E72u3E7H/haA4Wm4eHkOQEOf5A=;
        b=NdjVZi7CSo0arWxdsBZHUC3+DmvEMSagIn2kGdprKnedSV01k5bFDFeR2lfbwob07o
         95MFRy5fThphsNVaAZcV8OTRF24/TNudYq/6s1Aa3cy4UIG88GY+60Vn1H7k+/OsZSgp
         lhHuz8Ex4SiPtVQXeggNWf2BHsgMU5+ahtO3rtIl2nZd2vdE+LSRQx/viFwO58yXCTiJ
         dyCggsnW8Ppd8dE8dzb2BBpDbf/u6W5R5ktu/bLgQ2wNc9o3Wdp0PkA2+4GTpBetDZsI
         zaZLJGDnwWaitPZmh5Cgvhts9YKVmi/I9OfSl9pD1OwKiL0Dmb+3YkwxhQEizAHSeF1P
         PoGg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] docker: Downgrade latexpand to v1.3
Message-ID: <a149adf2-9347-f275-7c2d-5de7f8f6e927@gmail.com>
Date: Sun, 2 May 2021 09:26:06 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The latest version of latexpand (v1.6) is much slower than the
one found on Ubuntu Bionic.
It is caused by the internal use of "kpsewitch" and other improvements.
As perfbook's LaTeX code base uses a lot of \input{}s, the runtime of
laetxpand becomes excessively long.

Comparison of "rm autodate.tex; time make perfbook_flat.tex":

latexpand v1.3:  real  0m1.031s

latexpand v1.6:  real  0m16.266s

For perfbook, latexpand v1.3 is good enough.
To reduce build time, install latexpand v1.3 in docker images.

Also add Dockerfile.bionic, which is based on ubuntu:bionic and
add a couple of up-to-date LaTeX packages and a2ping under
/usr/local/share and /usr/local/bin.

Note: On the host, you can download it from

    https://gitlab.com/latexpand/latexpand/-/archive/v1.3/latexpand-v1.3.tar.gz

, and put it into your own bin directory.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 docker/Dockerfile        |  5 +++++
 docker/Dockerfile.bionic | 40 ++++++++++++++++++++++++++++++++++++++++
 docker/Dockerfile.fedora |  4 ++++
 3 files changed, 49 insertions(+)
 create mode 100644 docker/Dockerfile.bionic

diff --git a/docker/Dockerfile b/docker/Dockerfile
index a5afe6ea..7527e08b 100644
--- a/docker/Dockerfile
+++ b/docker/Dockerfile
@@ -12,6 +12,11 @@ RUN apt-get update && apt-get install -y fig2ps inkscape xfig graphviz psutils \
     rm -rf /var/lib/apt/lists/*
 COPY steel-city-comic.regular.ttf /usr/local/share/fonts/
 RUN fc-cache /usr/local/share/fonts/
+RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*
+WORKDIR /opt
+RUN curl https://gitlab.com/latexpand/latexpand/-/archive/v1.3/latexpand-v1.3.tar.gz -o - | tar xfz - && \
+    sed -i -e 's/@LATEXPAND_VERSION@/v1.3/' latexpand-v1.3/latexpand && \
+    cp latexpand-v1.3/latexpand /usr/local/bin
 ARG uid=1000
 ARG gid=1000
 ARG user=perfbook
diff --git a/docker/Dockerfile.bionic b/docker/Dockerfile.bionic
new file mode 100644
index 00000000..56e6280e
--- /dev/null
+++ b/docker/Dockerfile.bionic
@@ -0,0 +1,40 @@
+FROM ubuntu:bionic
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
+RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*
+WORKDIR /opt
+RUN curl https://mirrors.ctan.org/macros/latex/contrib/cleveref.zip -L -O && unzip cleveref.zip && \
+    curl https://mirrors.ctan.org/macros/latex/contrib/epigraph.zip -L -O && unzip epigraph.zip && \
+    curl https://mirrors.ctan.org/macros/latex/contrib/glossaries-extra.zip -L -O && unzip glossaries-extra.zip && \
+    cd cleveref; latex cleveref.ins; cd .. && \
+    mkdir -p /usr/local/share/texmf/tex/latex/cleveref && \
+    cp cleveref/cleveref.sty /usr/local/share/texmf/tex/latex/cleveref && \
+    cd epigraph; latex epigraph.ins; cd .. && \
+    mkdir -p /usr/local/share/texmf/tex/latex/epigraph && \
+    cp epigraph/epigraph.sty /usr/local/share/texmf/tex/latex/epigraph && \
+    cd glossaries-extra; latex glossaries-extra.ins; cd .. && \
+    mkdir -p /usr/local/share/texmf/tex/latex/glossaries-extra && \
+    cp glossaries-extra/*.sty /usr/local/share/texmf/tex/latex/glossaries-extra && \
+    texhash /usr/local/share/texmf && \
+    curl https://mirrors.ctan.org/graphics/a2ping.zip -L -O && unzip a2ping.zip && \
+    cp a2ping/a2ping.pl /usr/local/bin/a2ping
+ARG uid=1000
+ARG gid=1000
+ARG user=perfbook
+ARG group=perfbook
+RUN groupadd -g $gid $group && useradd -u $uid -g $gid -m $user
+VOLUME /work
+USER $uid:$gid
+WORKDIR /work
+CMD /bin/bash
diff --git a/docker/Dockerfile.fedora b/docker/Dockerfile.fedora
index 4a3ab855..33add84d 100644
--- a/docker/Dockerfile.fedora
+++ b/docker/Dockerfile.fedora
@@ -10,6 +10,10 @@ RUN dnf -y update && dnf install -y --setopt=tsflags=nodocs \
     mktexlsr
 COPY steel-city-comic.regular.ttf /usr/local/share/fonts/
 RUN fc-cache /usr/local/share/fonts/
+WORKDIR /opt
+RUN curl https://gitlab.com/latexpand/latexpand/-/archive/v1.3/latexpand-v1.3.tar.gz -o - | tar xfz - && \
+    sed -i -e 's/@LATEXPAND_VERSION@/v1.3/' latexpand-v1.3/latexpand && \
+    cp latexpand-v1.3/latexpand /usr/local/bin
 ARG uid=1000
 ARG gid=1000
 ARG user=perfbook
-- 
2.17.1

