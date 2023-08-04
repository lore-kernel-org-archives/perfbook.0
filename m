Return-Path: <SRS0=RL7U=DV=gmail.com=leobras.c@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691171438; x=1691776238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h7c4rU1aXj49stewIMxLpk2m9mj+O6xhB/kDpzZDMOo=;
        b=E5EyxeaAi03iY692OOq0K8G3jj45N0H5yZ8RnbmPH7LdrSQYbiCio/9In4B1cY7b+T
         FJWdTco0P3PBFMAJHvHy7019yBzh/r/YGY9JYKq+qvMgp5IApBYxi5hUmROAAfkyzfB5
         rp+IsjGbWFYedAfA70cztS/1+7wYW9A76xw5GiNnewPuEKHiKzdGgcDUJcccbTNsaJhm
         CPLIdCxEywXu4M1wSBMtQ5RvzjDmefXKPpyiVvGc+HhjFVkuSeZ90dDZiLtPJfMBoBLf
         /N9xVBqkWBBwGWTr7akZlueF9GZ6HzUXp46p92tc2js+2sOr6pcbKP0R7dxSP9GavBwn
         vgrw==
From: Leonardo Bras <leobras.c@gmail.com>
Subject: [PATCH] utilities/gitlab-ci: Fully update system before building
Date: Fri,  4 Aug 2023 14:50:09 -0300
Message-ID: <20230804175010.1143023-1-leobras.c@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: "Paul E . McKenney" <paulmck@kernel.org>
Cc: Leonardo Bras <leobras.c@gmail.com>, Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Some recent CI errors come from the incompatibility between packages
pre-installed in the docker image and the ones installed via pacman.

To avoid this, make a full system upgrade when installing the needed
packages.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 utilities/gitlab-ci.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
index 544b9373..bcda8712 100644
--- a/utilities/gitlab-ci.yml
+++ b/utilities/gitlab-ci.yml
@@ -9,7 +9,7 @@ test_codesamples:
     stage: test
 
     before_script:
-        - pacman --noconfirm -Sy make gcc liburcu
+        - pacman --noconfirm -Syu make gcc liburcu
 
     script:
         - make -C CodeSamples/
@@ -19,7 +19,7 @@ generate_pdfs:
     stage: build
 
     before_script:
-        - pacman --noconfirm -Sy texlive-meta fig2dev ghostscript graphviz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts ttf-liberation
+        - pacman --noconfirm -Syu texlive-meta fig2dev ghostscript graphviz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts ttf-liberation
         - mkdir -p ~/.local/share/fonts && cp fonts/steel-city-comic.regular.ttf ~/.local/share/fonts/ && fc-cache
 
     script:
-- 
2.41.0

