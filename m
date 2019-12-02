Return-Path: <SRS0=7eUo=ZY=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2VScRArhZIRglz99biwEUr2daG5DaoIjfOHGpZz3bvM=;
        b=Ip/Tg352d6WEUtRrZBu9kDBUmpED1VTNfPY2R2/Kv/38KAiL7/2tQik7pS9PFP0Dfq
         XTlZmTCyIcWKB0iNdHFNto3X5vEMSr1uieSlwrpHz2K/OmQQfd1WPCI78+x5c2k3M0rw
         uEYbZyK+BgHsTQTRUFk6aQsEy4y27OmgMvAURiPldKeeeEU4Lz68O9gHCIHQX8WyrL0+
         F1SJNaTccBe3AFMTGo4Ryjkn98D2fHiOV1rX1s/5BoK0mzpNYfmidSZkXytTmg/JXvzc
         /sz8jDQglU9RDDcUaISJp1aIUjeJMXecNHv7cQo8A7R4CR4cY0hImDMNKQgd7/e2CyKC
         ff4g==
Subject: [PATCH 6/6] styleguide: Treat current snippet scheme as 'the scheme'
References: <bd2bcae7-bfde-241f-281c-832615d1c9c0@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b3a73a47-f7e1-53d8-f68e-40162702e223@gmail.com>
Date: Tue, 3 Dec 2019 00:22:16 +0900
MIME-Version: 1.0
In-Reply-To: <bd2bcae7-bfde-241f-281c-832615d1c9c0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 6dcdd57af3b2afa72635dc544064c789ddd1d391 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 2 Dec 2019 21:17:35 +0900
Subject: [PATCH 6/6] styleguide: Treat current snippet scheme as 'the scheme'

Now that conversion of code snippets to the current scheme has
completed, we can call it "the scheme".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 8967c315..12273309 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -333,10 +333,10 @@ This section explains the use cases of such macros and environments.
 \label{sec:app:styleguide:Code Snippet}
 
 Because the \qco{verbatim} environment is a primitive way to include
-listings, we are transitioning to a new scheme which uses
+listings, we have transitioned to a scheme which uses
 the \qco{fancyvrb} package for code snippets.
 
-The goal of the new scheme is to extract \LaTeX\ sources of
+The goal of the scheme is to extract \LaTeX\ sources of
 code snippets directly from code samples under \path{CodeSamples}
 directory.
 It also makes it possible to embed line labels in the code samples,
@@ -355,7 +355,7 @@ by the \qco{verbatimbox} package.
 \co{verbbox} can automatically generate line numbers,
 but those line numbers cannot be referenced within the \LaTeX\ sources.
 
-Let's start by looking at how code snippets are coded in the new scheme.
+Let's start by looking at how code snippets are coded in the current scheme.
 There are three customized environments of \qco{Verbatim}.
 \qco{VerbatimL} is for floating snippets within the \qco{listing}
 environment. \qco{VerbatimN} is for inline snippets with line count
-- 
2.17.1


