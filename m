Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xgStYy+plrjFYvQJ/T6fWU2EZqCvR2a/NAzXvFe5vr0=;
 b=gdnODwkI4v+okAlmtRc1Tf3Z1FvOprY61ROa2Yc9LeyTHJ4uksmPrHLqhUogV2pair
 GVHS7mdZjL3D4sMU+zZvLJKLZmoJYLf6HyCZrrzx45PBePfzGcLTPSU16E2mm/NhOB7Z
 qOJMILMmZ38tBOlZ+B37BlT+iz6kmT5+K8EAJVChTO/aujRo68ptmyZWM8iC8GHWUWHo
 YYXw2+g/ZVrzwGUXAlnYqbmMgHUGV2Lyc6Sr2UXD6gVljYl1BIz6/WijZDZdbggMDZza
 XG83wAsFl06XEOS9Mq4b/Lg7zW/CNPH+vKKP8kAtMCsR0/XYu0cfJu58YfBAn6LT+Lc6
 9nRg==
Subject: [PATCH] Add info where to obtain 'noindentafter' package
References: <eb5de77b-fc3f-88d4-f717-c0f7314005e9@gmail.com>
 <20180901172947.GN4225@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e7b62093-acdf-5969-f6b9-c4d2951f6d09@gmail.com>
Date: Sun, 2 Sep 2018 08:33:04 +0900
MIME-Version: 1.0
In-Reply-To: <20180901172947.GN4225@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From bb7727a5e3a9a22ec53a870f09b7bbf39448f95e Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 2 Sep 2018 08:12:36 +0900
Subject: [PATCH] Add info where to obtain 'noindentafter' package

LPPL 1.3c Clause 6.d.2 requires us to provide information to obtain
a complete, unmodified copy of the Work.

Reported-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 noindentafter.sty | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/noindentafter.sty b/noindentafter.sty
index 2ea6e22..7a36224 100644
--- a/noindentafter.sty
+++ b/noindentafter.sty
@@ -1,3 +1,8 @@
+%% Notice to comply with Clause 6 of LPPL v 1.3c
+%% This file is copied from TeX Live 2015/Debian.
+%% Whole package including documentation can be obtained from:
+%%     https://ctan.org/pkg/noindentafter
+
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% \iffalse %%%%
 %                                                                              %
 %  Copyright (c) 2014 - Michiel Helvensteijn - www.mhelvens.net                %
-- 
2.7.4


