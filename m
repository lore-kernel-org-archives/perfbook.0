Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=tCexnPvYbZgZoQlF7qE9Mma06OMPEgDTu3w0MpPOcvE=;
 b=IVMbrTopkm/HPp55RRAhTjzRf6q2ttuBTX8p0Ux+INBX96LVrN7PL9SlwfVWy74LGW
 NdXgeReqCu9PjsBUI2tABw+5hMsttVmzpGel8vLPdD9yIURVKxIQPB/C5ClsUpvvLRus
 Th62xYGxX7BLqgPsihspWJJmD+l/3Y3AYdCefl+vGUgNNbZIYDV/VTfVcku7FRbG5Ph8
 Mbsun40OaULnjbtBZV8wFicCEAlOKGgzNEBiEYEdCCn4OvbGq0JYTpXxJzt73eeDAKxA
 lR2xXhMTlClLDY5mL2DRoRgNw+5QkB+3pfav78ffksjPHi2Wpv+7ZLEg9vvB18p00brV
 4QQQ==
Subject: [RFC PATH 1/6] Update book.cls
References: <029d0339-e50a-3b7e-1fb1-2322cb519dac@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <4551bb42-9f61-c473-7cf4-a1e5eef28a36@gmail.com>
Date: Mon, 19 Sep 2016 12:02:08 +0900
MIME-Version: 1.0
In-Reply-To: <029d0339-e50a-3b7e-1fb1-2322cb519dac@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 57dc9c9631bd36c6c1689d28f9c37595f0abc2bc Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 10 Sep 2016 23:39:23 +0900
Subject: [RFC PATH 1/6] Update book.cls

Replace book.cls with that of TeX Live 2015
There is no change in the code.
Conflict in comment is resolved by modifying version string.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 book.cls | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/book.cls b/book.cls
index ed4be2a..0713d4d 100644
--- a/book.cls
+++ b/book.cls
@@ -8,7 +8,12 @@
 %% 
 %% This is a generated file.
 %% 
-%% Copyright 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009
+%% The source is maintained by the LaTeX Project team and bug
+%% reports for it can be opened at http://latex-project.org/bugs.html
+%% (but please observe conditions on bug reports sent to that address!)
+%%
+%%
+%% Copyright 1993-2016
 %% The LaTeX3 Project and any individual authors listed elsewhere
 %% in this file.
 %% 
@@ -55,7 +60,7 @@
 %%   Right brace   \}     Tilde         \~}
 \NeedsTeXFormat{LaTeX2e}[1995/12/01]
 \ProvidesClass{book}
-              [2007/10/19 v1.4h-pem
+              [2014/09/29 v1.4h-pem
  Standard LaTeX document class]
 \newcommand\@ptsize{}
 \newif\if@restonecol
-- 
1.9.1


