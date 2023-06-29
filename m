Return-Path: <SRS0=ypgO=CR=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688037389; x=1690629389;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPjIbNnEvEf45jmeWDD/BomR3GkDwR0gOQQg+Wn1e9E=;
        b=Mv5po8UqRyLn+pXObbwkOLRKjPLF6TiSK5GxX7mHnkx0RdmQHX4618PxDzT+l+taPM
         9IC0EyaKcU3yzebI40f6+OEyjhcsqv+Yz4swzca6p681uY3XkZ7tzTCNUJKs/XITdXEk
         L6ZLa8WBG2qHNMA7KtSyDy1XM+QCz7vIzHWpbqRlGYEILrVcObtuFFNFnYOhoiBp/q0S
         w4DFd14w9+TaPJMjYnv/tHZpm1OM8m6pSwY8G4N8f7Bk8MZ2bXe/j/hnLCJw6unOdHFT
         AE5erz+38TR8/21gJw9c1u1aHr4xt3nnIkF+m9/pPrUmLhVRcJIFvKiyenNBLFpJBQHM
         U/eg==
Message-ID: <f7ccd9c7-2656-4836-1ac6-6603c4709aba@gmail.com>
Date: Thu, 29 Jun 2023 20:16:26 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] Give up TeX Live 2017/Debian
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The glossaries-extra package at https://www.ctan.org/pkg/glossaries-extra
has changed its directory structure for rollback code.
It made Dockerfile.bionic unusable.

Instead of updating the commands for manual rollback, just give up
TeX Live 2017/Debian of Ubuntu bionic.

Remove Dockerfile.bionic and related notes in FAQ-BUILD.txt.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt            | 43 +++++++-----------------------
 docker/Dockerfile.bionic | 57 ----------------------------------------
 2 files changed, 9 insertions(+), 91 deletions(-)
 delete mode 100644 docker/Dockerfile.bionic

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index 5867acd9d4d3..e9719a606786 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -40,20 +40,12 @@
 		Alternatively, you can use the container image described
 		in #13 below.  Otherwise, instructions follow.
 
-		On Ubuntu Bionic and later, the following list should cover
+		On Ubuntu Focal and later, the following list should cover
 		necessary packages (except for -doc packages):
 			texlive-publishers texlive-pstricks
 			texlive-science texlive-fonts-extra
 			xfig inkscape graphviz
 
-		Ubuntu Bionic has a buggy/incompatible version of LaTeX
-		packages "cleveref" and "glossaries-extra".
-		See #10 below to install the latest one.
-
-		On Ubuntu Bionic, you also need to fetch a version of
-		a2ping which is compatible with updated Ghostscript.
-		See #7 below.
-
 		On Fedora, installing the following set of packages
 		suffices:
 			texlive-collection-plaingeneric
@@ -122,16 +114,12 @@
 	"nimbus15", "newtxtt", etc.; or an old version of font package
 	"newtx".  How can I install or update them?
 
-	A-1.	First of all, building perfbook requires TeX Live 2017/Debian
-		(Ubuntu Bionic) or later. If you are told you don't have
-		"glossaries-extra" package, you need to upgrade your TeX
-		installation.
-		For other optional font packages, upgrading TeX Live
-		to 2017/Debian (Ubuntu Bionic) or later should suffice.
+	A-1.	First of all, building perfbook requires TeX Live 2019/Debian
+		(Ubuntu Focal) or later.
 
-		Upgrading your Linux distribution (e.g. to Ubuntu Focal)
-		is one way to upgrade TeX Live (to 2019/Debian on Focal),
-		and might have many other benefits as well.
+		Upgrading your Linux distribution (e.g. to Ubuntu Jammy)
+		is one way to upgrade TeX Live and might have many other
+		benefits as well.
 
 		However, on modern TeX Live, installing -fonts-extra consumes
 		more than 1GB of your disk space. If you prefer to manually
@@ -209,32 +197,19 @@
 		  - dejavu-fonts-all
 		  - liberation-fonts
 
-10.	Building perfbook fails with a warning of buggy cleveref or
-	version mismatch of epigraph.
+10.	Building perfbook fails with a warning of version mismatch of epigraph.
 	What can I do?
 
-	A.	They are known issues on Ubuntu Bionic (cleveref,
-		glossaries-extra), and TeX Live releases prior to 2020
-		(epigraph).
+	A.	It is a known issue of TeX Live releases prior to 2020.
 		This answer assumes Ubuntu, but it should work on other
 		distros.
 
-	    1.	Download whichever package from CTAN mirror:
-		http://mirrors.ctan.org/macros/latex/contrib/cleveref.zip
+	    1.	Download package archive from CTAN mirror:
 		http://mirrors.ctan.org/macros/latex/contrib/epigraph.zip
-		http://mirrors.ctan.org/macros/latex/contrib/glossaries-extra.zip
 
 	    2.	Install it by following instructions at:
 		https://help.ubuntu.com/community/LaTeX#Installing_packages_manually
 
-	    3.  Since October 2022, glossaries-extra uses a modern LaTeX
-		feature for backward compatibility, which was added in
-		TeX Live 2018. Unfortunately, TeX Live of Bionic is based
-		on TeX Live 2017, hence the glossaries-extra package at
-		CTAN does not work out of the box.
-		Still, you can manually rollback it to an older version.
-		See docker/Dockerfile.bionic for how to do it.
-
 	B.	Instead of above manual steps, you could install the package
 		using a script in this repository,
 		'./utilities/install_latex_package.sh'.  For example:
diff --git a/docker/Dockerfile.bionic b/docker/Dockerfile.bionic
deleted file mode 100644
index e1c4c3a9696b..000000000000
--- a/docker/Dockerfile.bionic
+++ /dev/null
@@ -1,57 +0,0 @@
-FROM ubuntu:bionic
-
-RUN apt-get update && apt-get install -y locales && \
-    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 && \
-    rm -rf /var/lib/apt/lists/*
-ENV LANG en_US.utf8
-RUN apt-get update && DEBIAN_FRONTEND=noninteractive TZ=UTC apt-get install -y tzdata && \
-    rm -rf /var/lib/apt/lists/*
-RUN apt-get update && apt-get install -y fig2ps inkscape xfig graphviz psutils \
-    texlive-publishers texlive-pstricks texlive-science texlive-fonts-extra \
-    make nano vim git curl gnuplot-nox time && \
-    rm -rf /var/lib/apt/lists/*
-COPY steel-city-comic.regular.ttf /usr/local/share/fonts/
-RUN fc-cache /usr/local/share/fonts/
-WORKDIR /opt
-RUN curl https://mirrors.ctan.org/macros/latex/contrib/cleveref.zip -L -O && unzip cleveref.zip && \
-    curl https://mirrors.ctan.org/macros/latex/contrib/epigraph.zip -L -O && unzip epigraph.zip && \
-    curl https://mirrors.ctan.org/macros/latex/contrib/glossaries-extra.zip -L -O && unzip glossaries-extra.zip && \
-    cd cleveref; latex cleveref.ins; cd .. && \
-    mkdir -p /usr/local/share/texmf/tex/latex/cleveref && \
-    cp cleveref/cleveref.sty /usr/local/share/texmf/tex/latex/cleveref && \
-    cd epigraph; latex epigraph.ins; cd .. && \
-    mkdir -p /usr/local/share/texmf/tex/latex/epigraph && \
-    cp epigraph/epigraph.sty /usr/local/share/texmf/tex/latex/epigraph && \
-    cd glossaries-extra; latex glossaries-extra.ins; cd .. && \
-    mkdir -p /usr/local/share/texmf/tex/latex/glossaries-extra && \
-    cp glossaries-extra/*.sty /usr/local/share/texmf/tex/latex/glossaries-extra && \
-    texhash /usr/local/share/texmf && \
-    curl https://mirrors.ctan.org/graphics/a2ping.zip -L -O && unzip a2ping.zip && \
-    cp a2ping/a2ping.pl /usr/local/bin/a2ping
-# Rollback glossaries-extra for pre-2018 TeX Live
-RUN cd /usr/local/share/texmf/tex/latex/glossaries-extra/ \
- && mv glossaries-extra.sty glossaries-extra-latest.sty \
- && mv glossaries-extra-bib2gls.sty glossaries-extra-bib2gls-latest.sty \
- && mv glossaries-extra-stylemods.sty glossaries-extra-stylemods-latest.sty \
- && mv glossary-bookindex.sty glossary-bookindex-latest.sty \
- && mv glossary-longextra.sty glossary-longextra-latest.sty \
- && mv glossary-topic.sty glossary-topic-latest.sty \
- && ln -s glossaries-extra-2021-11-22.sty glossaries-extra.sty \
- && ln -s glossaries-extra-bib2gls-2021-11-22.sty glossaries-extra-bib2gls.sty \
- && ln -s glossaries-extra-stylemods-2021-11-22.sty glossaries-extra-stylemods.sty \
- && ln -s glossary-bookindex-2021-11-22.sty glossary-bookindex.sty \
- && ln -s glossary-longextra-2021-11-22.sty glossary-longextra.sty \
- && ln -s glossary-topic-2021-11-22.sty glossary-topic.sty \
- && texhash /usr/local/share/texmf
-ARG uid=1000
-ARG gid=1000
-ARG user=perfbook
-ARG group=perfbook
-RUN if [ $uid -ne 0 ] ; then \
-    groupadd -g $gid $group ; \
-    useradd -u $uid -g $gid -m $user ; \
-    fi
-VOLUME /work
-USER $uid:$gid
-WORKDIR /work
-CMD /bin/bash

base-commit: 3dace505d308aad265ee0a0c3daa850dbf890966
-- 
2.25.1

