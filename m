Return-Path: <SRS0=2WLy=55=gmail.com=leobras.c@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3WaV5cemOdYpy8TUYpC4gQ5N2oqPHw6S6BgA44QyHNY=;
        b=A/eVXqSso22zU/LKnVXYbpsuKS+dPbc41E51JaN7yxd6A+2i3d8TuEI7+QBz+7KXlF
         gSPRw5G2Zgszipj6Y1401M2i/cvPB/jNE9x+dQbl21pLm8RfH4Te30XWxpgsFYRxGaEA
         RTFT9dJ7esICDSp6dqi/6s9FhAL/v+rQtwSxU7VD0ARN0n08GWMCuLJpQ9krJfJ5RphS
         R71wP0qfnY9A1hM0ti7emCKudMLcjkt51yB81wGRw3uh8/p423UNT1ZfuitFYJRaROnt
         AeYTgoX9DY278TpLQSXXAttMYPNDeLAiIbYJ8C9Xd5F9XEnd9QtXNSQZQ0pW4zRiicFE
         PryA==
From: Leonardo Bras <leobras.c@gmail.com>
Subject: [PATCH] Add .gitlab-ci.yml for pdf generation and testing on Gitlab.
Date: Wed,  1 Feb 2023 17:15:29 -0300
Message-Id: <20230201201529.901316-1-leobras.c@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: "Paul E . McKenney" <paulmck@kernel.org>
Cc: Leonardo Bras <leobras.c@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Having this file merged on the main repository will trigger the Gitlab-CI
on the mirror: https://gitlab.com/linux-kernel/perfbook/ after each push.

The way it works:
- Compile-test CodeSamples
- IF pass, build PDFs: regular, 1c, eb

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 .gitlab-ci.yml | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 .gitlab-ci.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
new file mode 100644
index 00000000..d131a4dc
--- /dev/null
+++ b/.gitlab-ci.yml
@@ -0,0 +1,34 @@
+image: archlinux:latest
+
+stages:
+  - test
+  - build
+
+test_codesamples:
+    stage: test
+
+    before_script:
+        - pacman --noconfirm -Sy make gcc liburcu
+
+    script:
+        - make -C CodeSamples/
+
+generate_pdfs:
+    stage: build
+
+    before_script:
+        - pacman --noconfirm -Sy texlive-most fig2dev ghostscript graphviz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts
+        - mkdir -p ~/.local/share/fonts && cp fonts/steel-city-comic.regular.ttf ~/.local/share/fonts/ && fc-cache
+        - wget https://sourceforge.net/projects/fig2ps/files/latest/download -O /dev/shm/fig2ps.tbz
+        - mkdir /dev/shm/build && tar -xjf /dev/shm/fig2ps.tbz -C /dev/shm/build --strip-components=1
+        - make install -C /dev/shm/build
+
+    script:
+        - make perfbook.pdf perfbook-1c.pdf perfbook-eb.pdf
+
+    artifacts:
+      paths:
+          - perfbook.pdf
+          - perfbook-1c.pdf
+          - perfbook-eb.pdf
+
-- 
2.39.1

