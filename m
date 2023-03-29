Return-Path: <SRS0=zOWS=7V=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680096728;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xIihJcbZUdE+UFErnn2P3AMG9ghzm2+Jf8C7REvsVfE=;
        b=lfh93+Sm1TyCtVQEnPrlnPhShLjLBihmUbEUCLExfumCyBWnEvx+qDNpP2wqJDMFHY
         d1G+ng4DXQHY85JQF+vX5OI9ZXb9p4o8k9pQ2vtKaDvwtltpv7tz7aSHgDYDttEcJEEY
         M7h8O4opw9Si3t96UQd6gpRFpN6qAlfRoeQ/D3f8a1hDLLCFig0zDU4c5njAWeZFunkt
         1YZ4VLJ7s9+3J7bUUY1R9snC6S9YVS4JiKZn2N6IPGYkh/9j6sF3uc/3LlS4iOOqiNeJ
         GQne29dlbQpWqTDBF12TwnCzOWGhh4CZeiRs9RcEnFW76dWQCFaSpaB92WpWuRQ47ClU
         Y6tg==
Message-ID: <c25e014e-9fe0-8007-cebd-ba7b1e171fd4@gmail.com>
Date: Wed, 29 Mar 2023 22:30:47 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] docker: Cope with change in latexpand-v1.3.tar.gz
 from gitlab
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

latexpand-v1.3.tar.gz downloaded from gitlab has changed slightly
and latexpand (script) is now extracted under latexpand-<commit-id>/.

Use wildcard for the directory name.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

I'm working on rewriting these Dockerfiles, but it is not ready.
Please apply this urgent fix in case there is somebody who wants to
build an image on their own.

        Thanks, Akira
--
 docker/Dockerfile        | 4 ++--
 docker/Dockerfile.fedora | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/docker/Dockerfile b/docker/Dockerfile
index 3a3991bbe09e..1fec609a0043 100644
--- a/docker/Dockerfile
+++ b/docker/Dockerfile
@@ -14,8 +14,8 @@ COPY steel-city-comic.regular.ttf /usr/local/share/fonts/
 RUN fc-cache /usr/local/share/fonts/
 WORKDIR /opt
 RUN curl https://gitlab.com/latexpand/latexpand/-/archive/v1.3/latexpand-v1.3.tar.gz -o - | tar xfz - && \
-    sed -i -e 's/@LATEXPAND_VERSION@/v1.3/' latexpand-v1.3/latexpand && \
-    cp latexpand-v1.3/latexpand /usr/local/bin
+    sed -i -e 's/@LATEXPAND_VERSION@/v1.3/' latexpand-*/latexpand && \
+    cp latexpand-*/latexpand /usr/local/bin
 ARG uid=1000
 ARG gid=1000
 ARG user=perfbook
diff --git a/docker/Dockerfile.fedora b/docker/Dockerfile.fedora
index 916339488851..ff56ac4c751e 100644
--- a/docker/Dockerfile.fedora
+++ b/docker/Dockerfile.fedora
@@ -14,8 +14,8 @@ COPY steel-city-comic.regular.ttf /usr/local/share/fonts/
 RUN fc-cache /usr/local/share/fonts/
 WORKDIR /opt
 RUN curl https://gitlab.com/latexpand/latexpand/-/archive/v1.3/latexpand-v1.3.tar.gz -o - | tar xfz - && \
-    sed -i -e 's/@LATEXPAND_VERSION@/v1.3/' latexpand-v1.3/latexpand && \
-    cp latexpand-v1.3/latexpand /usr/local/bin
+    sed -i -e 's/@LATEXPAND_VERSION@/v1.3/' latexpand-*/latexpand && \
+    cp latexpand-*/latexpand /usr/local/bin
 ARG uid=1000
 ARG gid=1000
 ARG user=perfbook

base-commit: 3f8f4bf82c2cf1947b8dcef6af1daf71ba4feff1
-- 
2.25.1

