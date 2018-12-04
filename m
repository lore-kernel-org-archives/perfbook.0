Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BjKN9GTvRIaClj5bydHYk7ovL+/tpOoggDQzMa6X+5M=;
        b=UXLHZrM6KwTEeIMfdSpVdD/heDBlFiCTIU4fXiGQVudtvrKhXFr6S73GjqE9P+153/
         H4RTHCuZNij6IoC4oS44nhrv1LuXo6nXUkyPrlazQ06lqJWfqgyiYqzZm7a+yT34+SvX
         HnwYHJRG5UsaOEKWwFvkJYkM4oGVHO0wDhziBUhGycvnXudzWP/YxTF2dlCzi8xL593n
         D0nEiONS88QuFTKi+KUQxuMQK/rFnEuMR+GodzaVi2uwra6Ea+IRHnoV/WJs58/x6ECq
         Kp/3GBGRCA+TLMomosBAToJHdUmCgxUuudUe+Uqe6ndapufx46QkvGmmiNh58KepsBWj
         aSJg==
Subject: [PATCH 4/4] owned: Fix typo in epigraph
References: <b5e1d894-aed2-0171-7cbc-12a46d67bfb6@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <87e409a9-af50-16d9-93d5-b29908a57bd7@gmail.com>
Date: Wed, 5 Dec 2018 00:32:06 +0900
MIME-Version: 1.0
In-Reply-To: <b5e1d894-aed2-0171-7cbc-12a46d67bfb6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 5471262067bf42e8698c80fee3e1d42a8c576d43 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 4 Dec 2018 23:42:11 +0900
Subject: [PATCH 4/4] owned: Fix typo in epigraph

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 owned/owned.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/owned/owned.tex b/owned/owned.tex
index 700db0d..2dcd8e3 100644
--- a/owned/owned.tex
+++ b/owned/owned.tex
@@ -253,7 +253,7 @@ page~\pageref{lst:count:Signal-Theft Limit Counter Subtract Function}).
 \section{Designated Thread}
 \label{sec:owned:Designated Thread}
 %
-\epigraph{Let a man practice the professiong which he best knows.}
+\epigraph{Let a man practice the profession which he best knows.}
 	 {\emph{Cicero}}
 
 The earlier sections describe ways of allowing each thread to keep its
-- 
2.7.4


