Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=9yLLBa+aXukTMc2KvS7Sxr7RjE0c/s4gUr1GO+zaah0=;
 b=ZkDzw9NaLp0QTxO09CGUdqq46RY0/olhZS+fB97FBdE/skaOWZF5GL2DrcuhM19wrR
 1rh5fhPbdmgjVA+XGyFfZQgKILWIlXZF589WRNauAakOK5DZumP+c6DaezGAKc9SHyzW
 h78VZyWlh8SiqRWXsm8Js1Yprp3Sz3ZgieP/l8KRi+bY/XwDz5erl+982goU7bZDqVhe
 HRPT12VRZUfu7gTjwqghKOYQqmqp8DTCP5YtMmd1fvP5uS/PXa+uONqAzKCsK6QSvWez
 Pflynxs5scZjgKvc8Fk+4RQtFlHEsZlzS+rN2mhC/hwMHp6SjK9dDM75wKGeOW84pwpn
 1l2w==
Subject: [PATCH 1/5] Use 'enumitem' package instead of 'enumerate'
References: <97daedea-d454-cdf6-0111-8089ef0678c8@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e0332f7e-a3d8-86e6-d458-ace2c0bd5b78@gmail.com>
Date: Fri, 10 Mar 2017 00:20:51 +0900
MIME-Version: 1.0
In-Reply-To: <97daedea-d454-cdf6-0111-8089ef0678c8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 477bc66e66a08506ca04c456348d04dff877ea37 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 9 Mar 2017 23:50:51 +0900
Subject: [PATCH 1/5] Use 'enumitem' package instead of 'enumerate'

For more flexibility of list environment customization, use
"enumitem" package instead of "enumerate".
We need to modify enumeration header style specification added
in commit 4dd83b8e1aca ("howto: Specify style of enumerate header")
to work with "enumitem".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 howto/howto.tex | 2 +-
 perfbook.tex    | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/howto/howto.tex b/howto/howto.tex
index 2f1b0fc..91a8563 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -453,7 +453,7 @@ patch containing a \co{Signed-off-by:} line.
 It is important to note that the \co{Signed-off-by:} line has
 a very specific meaning, namely that you are certifying that:

-\begin{enumerate}[(a)]
+\begin{enumerate}[label={(\alph*)}]
 \item	The contribution was created in whole or in part
 	by me and I have the right to submit it under
 	the open source license indicated in the file; or
diff --git a/perfbook.tex b/perfbook.tex
index d532e65..a999705 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -21,7 +21,9 @@
 % \usepackage{breakurl}
 \usepackage{graphicx}
 \usepackage{rotating}
-\usepackage{enumerate}
+\usepackage{enumitem}
+\setlist[description]{style=unboxed}
+%\usepackage{enumerate}
 \usepackage{ifthen}
 \usepackage{xcolor}
 \usepackage[shortcuts]{extdash}
-- 
2.7.4


