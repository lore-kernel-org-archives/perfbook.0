Return-Path: <SRS0=J1Hu=4X=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAGRoaAGdNOSWae9HcxYkwAKeKSObRIjrO2nUEAO/8A=;
        b=qwPt14PTs704uAM27urIPz/iiE790VTd7VP7Pqzgg78c5dKjmmaFUcDXYCaDuhL5+T
         0PVnURGirXhGf24ooHjbmyf0gKG7OpU6ypZ81zyRknN7tEs1PeDQMLUWBmahdk5wmukq
         4jTziZuYHguTB04q/N/+ipd6eF/+PNV0CQC7dSkNuKE7jw+Ka3RlXaE/yiX/gG/GAcsV
         Q0nNlqgulM6ebJaPI2yCxBh3HqupYtk/uZpHKHnK/sowSDdzfwquF5YoPwu8HMw204vZ
         uMJRptllDeujuJdIwbuynSEcl51F/f/UZSMFxIsirwZqn1yduOJ+mNFX1/wtI7vfCA/M
         oJAw==
Message-ID: <2a6b2524-b76e-7de6-2c02-89f35bba9938@gmail.com>
Date: Sun, 25 Dec 2022 09:46:39 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] docker: bionic: Rollback glossaries-extra manually
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Since October 2022, glossaries-extra uses a modern LaTeX feature
for backward compatibility, which was added in TeX Live 2018.
Unfortunately, TeX Live of Bionic is based on TeX Live 2017, hence
the glossaries-extra package at CTAN does not work out of the box.

Add commands for manual rollback in Dockerfile.bionic.

Update FAQ-BUILD.txt as well.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi,

I think it is quite unlikely a new reader/contributor of
perfbook uses Ubuntu Bionic, but anyway.
When Bionic is EOL'ed next spring, we can forget about it. ;-)

        Thanks, Akira
--
 FAQ-BUILD.txt            |  8 ++++++++
 docker/Dockerfile.bionic | 15 +++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index eea4fa37737b..107707533398 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -196,6 +196,14 @@
 	    2.	Install it by following instructions at:
 		https://help.ubuntu.com/community/LaTeX#Installing_packages_manually
 
+	    3.  Since October 2022, glossaries-extra uses a modern LaTeX
+		feature for backward compatibility, which was added in
+		TeX Live 2018. Unfortunately, TeX Live of Bionic is based
+		on TeX Live 2017, hence the glossaries-extra package at
+		CTAN does not work out of the box.
+		Still, you can manually rollback it to an older version.
+		See docker/Dockerfile.bionic for how to do it.
+
 	B.	Instead of above manual steps, you could install the package
 		using a script in this repository,
 		'./utilities/install_latex_package.sh'.  For example:
diff --git a/docker/Dockerfile.bionic b/docker/Dockerfile.bionic
index 207feca7d768..e1c4c3a9696b 100644
--- a/docker/Dockerfile.bionic
+++ b/docker/Dockerfile.bionic
@@ -28,6 +28,21 @@ RUN curl https://mirrors.ctan.org/macros/latex/contrib/cleveref.zip -L -O && unz
     texhash /usr/local/share/texmf && \
     curl https://mirrors.ctan.org/graphics/a2ping.zip -L -O && unzip a2ping.zip && \
     cp a2ping/a2ping.pl /usr/local/bin/a2ping
+# Rollback glossaries-extra for pre-2018 TeX Live
+RUN cd /usr/local/share/texmf/tex/latex/glossaries-extra/ \
+ && mv glossaries-extra.sty glossaries-extra-latest.sty \
+ && mv glossaries-extra-bib2gls.sty glossaries-extra-bib2gls-latest.sty \
+ && mv glossaries-extra-stylemods.sty glossaries-extra-stylemods-latest.sty \
+ && mv glossary-bookindex.sty glossary-bookindex-latest.sty \
+ && mv glossary-longextra.sty glossary-longextra-latest.sty \
+ && mv glossary-topic.sty glossary-topic-latest.sty \
+ && ln -s glossaries-extra-2021-11-22.sty glossaries-extra.sty \
+ && ln -s glossaries-extra-bib2gls-2021-11-22.sty glossaries-extra-bib2gls.sty \
+ && ln -s glossaries-extra-stylemods-2021-11-22.sty glossaries-extra-stylemods.sty \
+ && ln -s glossary-bookindex-2021-11-22.sty glossary-bookindex.sty \
+ && ln -s glossary-longextra-2021-11-22.sty glossary-longextra.sty \
+ && ln -s glossary-topic-2021-11-22.sty glossary-topic.sty \
+ && texhash /usr/local/share/texmf
 ARG uid=1000
 ARG gid=1000
 ARG user=perfbook

base-commit: d5e69a022d636fb3e204c1ef90a3c668cbf0e8bc
-- 
2.25.1

