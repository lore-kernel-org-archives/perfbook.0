Return-Path: <SRS0=zoNZ=LI=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=or8jTPCs6ZJIzuVSB76/Zr70FpVAquW7tRMpjV6SPTY=;
        b=vdx+H34LbNCe/6Mr1TH4PhiTV5X3vxpvXIW2IBCJLYnGlvrxhWrYtzYAgI9soSvyfI
         gqQOf2pzdGCPepXQVaV9z/UfWQE89t//LhyXrUbAIu0rSSH8m5Ww7K4YZ5+lNsP5JPwt
         w7JR1rWoG05eK+2Qc6XX7J+cIS1IYjBpA6r/2NBMLc9FcWoXS81AXn/BHq5Si/mvsPUC
         ud47yoVsBddZuuBgfSEM/aVh7WWuLxy0jPN/P2D07yEcfQ38XITb9jBo05OElDNlm6Yh
         8F2jW92MMsH/2zzWciWKYH4etKM0mLtYFkNJQksGK8Wqhjl+nPUFx465xjgBREAhCLKP
         9yQw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 1/2] defer/rcuusage: Put path name of singleton
 get/set code snippets
Message-ID: <f3899671-ca23-631b-af10-cb20e0bf84d1@gmail.com>
Date: Mon, 14 Jun 2021 13:00:25 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

As Listing 9.20 shows set_config() as a whole, replace the reference
to the line-count range with that to the Listing itself.
Also adjust conjugation of verbs.

Fixes: 787eb4586767 ("defer/rcuusage: Add RCU space-time code and diagram")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

These patches are trivial fixes independent of the planned
colon-related changes.

        Thanks, Akira
--
 defer/rcuusage.tex | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index 8e705ce4..b3d79d13 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -798,7 +798,7 @@ by the RCU singleton data structure illustrated in
 \cref{fig:defer:Insertion With Concurrent Readers,fig:defer:Deletion With Concurrent Readers}.
 This structure is defined on \clnrefrange{myconfig.b}{myconfig.e} of
 \cref{lst:defer:Singleton Get}, and contains two integer fields,
-\co{->a} and \co{->b}.
+\co{->a} and \co{->b} (\path{singleton.c}).
 The current instance of this structure is referenced by the \co{curconfig}
 pointer defined on \clnref{myconfig.e}.
 \end{fcvref}
@@ -828,9 +828,9 @@ with each other.
 \end{fcvref}
 
 \begin{fcvref}[ln:defer:singleton:set]
-The structure is updated by the \co{set_config()} function shown on
-\clnrefrange{set_config.b}{set_config.e}.
-\Clnrefrange{allocinit.b}{allocinit.e} allocates and initializes a
+The structure is updated by the \co{set_config()} function shown in
+\cref{lst:defer:Singleton Set}.
+\Clnrefrange{allocinit.b}{allocinit.e} allocate and initialize a
 new \co{myconfig} structure.
 \Clnref{xchg} atomically exchanges a pointer to this new structure
 with the pointer to the old structure in \co{curconfig}, while also
-- 
2.17.1

