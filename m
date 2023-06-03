Return-Path: <SRS0=QwI4=BX=gmail.com=leobras.c@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685814970; x=1688406970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bhLkGdUGTHy3zUOmbFzc2VttL1HsNDn77gyHWsBtRwE=;
        b=fNRUgQkQvXPDY5crSN9OtSY4KUWqDP/fDmaVEuxpA/D5Nb/I2aEJ13C8/L7UPGQj7m
         xwJzC/1V5yZquuQwDzoGUq3QzsGAh499U6L+1eRqSm4/axa6drBEUnOVkzWAal+36CbH
         ZnMR3BrzO27S119YWMS6VpEkoptkqGEOlkXn3hvFc7lbwBXXQ7CCSqjgEHhLkkb0PicU
         ydP1IC9b1Ya1gihwSNlmGgNst8EM2H3sm3pVg3cCbNTS5N/LN0Oh+bF/4RGh/WQf6QWf
         lAAqlS87oenB1hdhytaqvoo6aBzC9/dw6/wQWWUh/ly2o1tLfwyyqZj+MBdXUc2AKf8C
         woLw==
From: Leonardo Bras <leobras.c@gmail.com>
Subject: [PATCH] utilities/gitlab-ci: Remove custom build of fig2ps
Date: Sat,  3 Jun 2023 14:55:37 -0300
Message-ID: <20230603175548.12944-1-leobras.c@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: "Paul E . McKenney" <paulmck@kernel.org>, perfbook@vger.kernel.org
Cc: Leonardo Bras <leobras.c@gmail.com>, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Since commit 1f907f3d77dd ("Use fig2dev as fallback to fig2eps"),
there is no need to install fig2ps in the container for building the pdfs.

Remove those steps to simplify the building process.

Suggested-by: Akira Yokosawa <akiyks@gmail.com>
Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---

Tested on Gitlab Pipeline:
https://gitlab.com/linux-kernel/perfbook/-/pipelines/888505608

 utilities/gitlab-ci.yml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
index 6c3ec1e6..544b9373 100644
--- a/utilities/gitlab-ci.yml
+++ b/utilities/gitlab-ci.yml
@@ -21,9 +21,6 @@ generate_pdfs:
     before_script:
         - pacman --noconfirm -Sy texlive-meta fig2dev ghostscript graphviz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts ttf-liberation
         - mkdir -p ~/.local/share/fonts && cp fonts/steel-city-comic.regular.ttf ~/.local/share/fonts/ && fc-cache
-        - wget https://sourceforge.net/projects/fig2ps/files/latest/download -O /dev/shm/fig2ps.tbz
-        - mkdir /dev/shm/build && tar -xjf /dev/shm/fig2ps.tbz -C /dev/shm/build --strip-components=1
-        - make install -C /dev/shm/build
 
     script:
         - make perfbook.pdf perfbook-1c.pdf perfbook-eb.pdf
-- 
2.41.0

