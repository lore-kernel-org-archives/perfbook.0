Return-Path: <SRS0=gDlb=Z5=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HnpmxOhGnBxAdtVFw45e28babvgMJAMM88a+QgBKGJg=;
        b=qSN1/f4LZGKyQ+3JVHDkgttK7vgRvaIftZmigxw/vkPkf/ZNxeKY6UbgQ+JZprqfVL
         0MPU9UyKfNDH1MiHqDXMqMU20WjMXP+U32qLzVL75IcJBAAqJK8gjN23DndqF48f169D
         arEAUWmOqGAe9qzMmGrZWwDhshpbeqgpkVyOc3LpW1F2DsD/P+EcG+UWva3n4jxFefpC
         V+EJT2ighO4CIb7w4vNgpskml8eMeZoGZyOnoJ+pa1zNtANdWvljX/f85s6vRWj3NIH8
         W0r5hN5gY4RX4yt1kwtcyM8OXV5FonxmnXaNUKLiRaNRH7REiA0OlW+MgfIazf46aliv
         8LWg==
Subject: [PATCH 1/2] toyrcu: Use mathcal O for 'orders of'
References: <eb5c3f76-c84f-c801-ceb4-27efd64e2d0f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <03a55e97-d018-ee1e-65b5-f0216bbc2089@gmail.com>
Date: Sat, 7 Dec 2019 13:06:56 +0900
MIME-Version: 1.0
In-Reply-To: <eb5c3f76-c84f-c801-ceb4-27efd64e2d0f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From b981496b8b93f2dafd1becfc7cc65df121c73a55 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 6 Dec 2019 07:59:40 +0900
Subject: [PATCH 1/2] toyrcu: Use mathcal O for 'orders of'

Also update the macro "\O{}" introduced in commit b4ad25eae241
("future/QC: Use upright glyph for math constant and descriptive
suffix") so that it uses "\left(" and "\right)".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/toyrcu/toyrcu.tex | 2 +-
 perfbook.tex               | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index 9dff9f8a..92bd5ae7 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -1590,7 +1590,7 @@ create a new RCU implementation.
 	In particular, expensive operations such as cache misses,
 	atomic instructions, memory barriers, and branches should
 	be avoided.
-\item	RCU read-side primitives should have $O\left(1\right)$ computational
+\item	RCU read-side primitives should have $\O{1}$ computational
 	complexity to enable real-time use.
 	(This implies that readers run concurrently with updaters.)
 \item	RCU read-side primitives should be usable in all contexts
diff --git a/perfbook.tex b/perfbook.tex
index 37160751..14f138d4 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -240,7 +240,7 @@
 \newcommand{\qop}[1]{{\sffamily #1}} % QC operator such as H, T, S, etc.
 
 \DeclareRobustCommand{\euler}{\ensuremath{\mathrm{e}}}
-\DeclareRobustCommand{\O}[1]{\ensuremath{\mathcal{O}(#1)}}
+\DeclareRobustCommand{\O}[1]{\ensuremath{\mathcal{O}\left(#1\right)}}
 \newcommand{\Power}[1]{POWER#1}
 \newcommand{\GNUC}{GNU~C}
 \newcommand{\GCC}{GCC}
-- 
2.17.1


