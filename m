Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=TTBRzSwfYEjUoPFNOlTNfKqw2N9O4frkPLqXBU/OU20=;
 b=P3SMlnblhOWVJrK6+SIeu89zgG/pURMNeRt551H0Unwv27kaH5mtn5beBwZKx3BNAJ
 9SZXmH9ofa+uzGMIJ1ucPi1EE2HPNkUtXyr0T4A9y6ISU5PY+0MqEu4amMc7kg8DdinU
 en0pdNGDjlkElMnJWD6hbh9/09zyHdp4ldB/nLGbsjkroJ/6V5cjUSadQ5NQ+YCHVPxz
 ztaZSC0aNkGa1GUqaecVxI3RH3JeKHNfl5cDY9QGnO+B60aky1KNavuSa/09ZURzPy1z
 z3txrhoCW7W0XQWuwIhLW6NAarp6lEiKE010OTQFoqyyr04lRx4OpIbV0122qPGSuSKv
 hRwg==
Subject: [PATCH 1/6] Separate font package declarations
References: <9229c60d-0468-7632-e59e-3921f0e46f54@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <79a43bc8-daa4-7a63-0818-e3e6a4f7f02b@gmail.com>
Date: Wed, 19 Oct 2016 07:24:44 +0900
MIME-Version: 1.0
In-Reply-To: <9229c60d-0468-7632-e59e-3921f0e46f54@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 0cfe68cfd9e7c5413c26f25408ea3cb78f1a334c Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 9 Oct 2016 17:59:03 +0900
Subject: [PATCH 1/6] Separate font package declarations

This is a preparation of font-choice tweaks to follow.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/perfbook.tex b/perfbook.tex
index 66c93fe..87d5b53 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -5,7 +5,9 @@
 % A more pleasant font
 \usepackage[T1]{fontenc} % use postscript type 1 fonts
 \usepackage{textcomp} % use symbols in TS1 encoding
-\usepackage{mathptmx,helvet,courier} % use nice, standard fonts for roman, sans and monospace respectively
+\usepackage{mathptmx} % use nice, standard fonts for roman,
+\usepackage{helvet}   % sans serif,
+\usepackage{courier}  % and monospace respectively

 % Improves the text layout
 \usepackage{microtype}
-- 
2.7.4


