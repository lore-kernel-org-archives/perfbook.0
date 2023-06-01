Return-Path: <SRS0=JDvZ=BV=gmail.com=leobras.c@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685651919; x=1688243919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dTeBE5zuY4L3a0KqR6r57TJWLEsh7ArpwYglt7ijqkQ=;
        b=EOu1H3ZeInj2jpXMGwfbLsie0Kymh7zVVyL4jVBss/feSmgTsNkNUSHguEy21G6OCr
         pkPsSgTtwv5RzgsLBmj68p2A95Df/6VPqyT78vO/BNfi0pOGtsPcCCGQlUVfcHMn5hsi
         0dR6ffuOOlQ6YfGrEe9v+5joFXu++1rvpn/B9OCxicJG2EdjhNj4+vT+dS0No7qPwvVq
         7TyKDSwHBpFAC4WmhJmwKBvpignxn21buAPKdU+8C2TmHw5j4ICGcEPl96eUN9Eo0TWz
         q/jpYvypRlGY0Z+dJDgyvX4d/y7WXfG59b5zDofECIb9sTBMi+qeQVBSMQuRahj7dL6U
         Kg4w==
From: Leonardo Bras <leobras.c@gmail.com>
Subject: [RFC PATCH 1/1] utilities/gitlab-ci: Fix gitlab-ci due to Arch Linux deprecating texlive-most
Date: Thu,  1 Jun 2023 17:38:16 -0300
Message-Id: <20230601203816.996788-1-leobras.c@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: "Paul E . McKenney" <paulmck@kernel.org>
Cc: Leonardo Bras <leobras.c@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Arch Linux folks deprecated the texlive-most package group in favor of
texlive-meta, which should contain the same packages with an aditional
tool.

Fix this script to use texlive-meta, so the gitlab pipeline is able to
build the pdfs.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 utilities/gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
index 42eda60f..6c3ec1e6 100644
--- a/utilities/gitlab-ci.yml
+++ b/utilities/gitlab-ci.yml
@@ -19,7 +19,7 @@ generate_pdfs:
     stage: build
 
     before_script:
-        - pacman --noconfirm -Sy texlive-most fig2dev ghostscript graphviz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts ttf-liberation
+        - pacman --noconfirm -Sy texlive-meta fig2dev ghostscript graphviz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts ttf-liberation
         - mkdir -p ~/.local/share/fonts && cp fonts/steel-city-comic.regular.ttf ~/.local/share/fonts/ && fc-cache
         - wget https://sourceforge.net/projects/fig2ps/files/latest/download -O /dev/shm/fig2ps.tbz
         - mkdir /dev/shm/build && tar -xjf /dev/shm/fig2ps.tbz -C /dev/shm/build --strip-components=1
-- 
2.40.1

