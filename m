Return-Path: <SRS0=drfo=57=gmail.com=leobras.c@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0bzRc524uNJ1NPEYziAdfS5Dasp6+EieMEdKKz4FnTk=;
        b=HpaJDw7XEFvjID6R4xwywLpJuEp0ji0SfUDYoZansfkF6nR0Vu3sPXgIrAu35A6+a4
         yMmzevzu9x8EwCjT9MWC7IS0rxzmykNT0yu8QFGifATk7xLq+MNSuy9BZkrncMkweXkM
         0f3PjpT9wjETjLixD4cy/LZkCGTS/vig+hiZZps1PUx2pqp3Nom82pwpelGgG3fZ59ty
         s1CIXyuZTsOevJcynlLp+jS0KlbJ0MsNDz4dYnQoUZSqynoMTyfaLtf2vOokNh6JiFyp
         fH9tNLIQ0D4tf2eKQCx9/blbPPA5Ft2AuI6Oz3PD5TFuwRH1kdp0bXuKszaLrGlAdebj
         KvsQ==
From: Leonardo Bras <leobras.c@gmail.com>
Subject: [PATCH v2] Add utilities/gitlab-ci.yml for pdf generation and testing on Gitlab.
Date: Thu,  2 Feb 2023 23:18:55 -0300
Message-Id: <20230203021853.34207-1-leobras.c@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: "Paul E . McKenney" <paulmck@kernel.org>
Cc: Leonardo Bras <leobras.c@gmail.com>, Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

For Gitlab repositories mirroring the original repository, trigger the
Gitlab-CI after every push to the original repo.

For the pipeline to run, the Gitlab repo needs to configure:
- Settings -> CI/CD -> General Pipelines -> CI/CD configuration file to
  utilities/gitlab-ci.yml

What the pipeline does:
- Compile-test CodeSamples
- IF pass, build PDFs: regular, 1c, eb

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 utilities/gitlab-ci.yml | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 utilities/gitlab-ci.yml

diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
new file mode 100644
index 00000000..acc12fb2
--- /dev/null
+++ b/utilities/gitlab-ci.yml
@@ -0,0 +1,33 @@
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
-- 
2.39.1

