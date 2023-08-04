Return-Path: <SRS0=UaWh=DV=redhat.com=lsoaresp@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691170926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=h7c4rU1aXj49stewIMxLpk2m9mj+O6xhB/kDpzZDMOo=;
	b=eiGUn9p20KX9mSrdG4URXFlHB4T3cu0R17cmA37yoZ70L0V2YnaQZ/olwTLkB72RvMFczR
	nmrCVu/+WcXZtxbRhJhEG4/SFtoGyHo/A9usdQ0zXSxD3zOoME8P9m1SRkbLe1G5jupZBq
	kdHJFDrrG1Uw3KJt4y5ZyWUQnkz/YI0=
From: Leonardo Bras <lsoaresp@redhat.com>
Subject: [PATCH] utilities/gitlab-ci: Fully update system before building
Date: Fri,  4 Aug 2023 14:41:34 -0300
Message-ID: <20230804174136.1142358-1-leobras.c@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

