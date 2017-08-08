Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i/uJt5Oj8XkcpgNjyKRJqDJrHNIBYTpnp6Hri5O11hI=;
 b=C5AC6xyFYOCagpgBYnMIge3uFdzr+9HJW0XRdl24jXP142jd0ywoAk34lrK1RveFFO
 L0jWxEzsXG5xTcY+YfYbrdPqW20vIY5fxiRWiwcrrgbjbSffQ7QWl61UIA+1KRBvjJhT
 EB5S1BOtYC62rhtu++AeDFP16/2RGVRNHXRc9eeEIYmyGg7yES059iZBITgF97uyOCOF
 vdXbjkSdT1DSozO00NWXeeCUODrlEqyICKcj6jDZUMWiQt+/dsO+O0vExSqrusr+KnP2
 7zPT53+9+/DelWcDa6QryluSq5ccfbCJpHCbG41pnlyOuQKZKOrcIxxW2r6LWe9ymEFg
 pu6A==
Subject: [PATCH 3/6] Use 'subfig' package instead of 'subfigure'
References: <acc91026-d2fe-3cc8-7c6f-f43662b533b8@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <1effdf7e-b38d-af93-2067-5e551ea312e5@gmail.com>
Date: Wed, 9 Aug 2017 07:08:25 +0900
MIME-Version: 1.0
In-Reply-To: <acc91026-d2fe-3cc8-7c6f-f43662b533b8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 527d718728dd07acf75939d98e2a30f298cf3296 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 6 Aug 2017 12:04:22 +0900
Subject: [PATCH 3/6] Use 'subfig' package instead of 'subfigure'

The "subfig" package obsoleted "subfigure" package more than
a decade ago.
It is going to be used in style guide as an experiment.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/perfbook.tex b/perfbook.tex
index f750455..bfb1c79 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -23,7 +23,8 @@
 \floatname{listing}{Listing}
 \usepackage{lscape}
 \usepackage{epsfig}
-\usepackage{subfigure}
+\usepackage{subfig}
+\newsubfloat{listing}
 % \usepackage{breakurl}
 \usepackage{graphicx}
 \usepackage{rotating}
-- 
2.7.4


