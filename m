Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:35568 "EHLO
 mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751931AbdHHWGE (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 8
 Aug 2017 18:06:04 -0400
Received: by mail-pf0-f193.google.com with SMTP id j68so4283569pfc.2 for
 <perfbook@vger.kernel.org>; Tue, 08 Aug 2017 15:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=y60bgnwsI3wJxZo3FUGC6CpeJ7nV4Spd/efg8a9TpMo=;
 b=bbK06bGXqX7JHpYOmxxGLoG9FQ/DGp+yug9CQYm38fwNPaXuhvUOPdf6EODt4OE2Iq
 cCFgp5nDDvkuqPd1FFVy4MCnJSFx6F18Hxvbivx6JzcQxj1uono3nujNGDpbNLUeZzmQ
 PjltUNWhaPhhpKMdRYsXtRBqJIuzUBKPwwbDfq+ud12FxYWDY4fl9sONwapurWRNQsiF
 AfxxXvchaOKy64RZcJq0yAZiDUiJYnc0KltM0nXD8gsTBAEppvOCqCu8yihp6WzEUsgN
 h7C+gQjZPxiDWdW7PqnK8amBgsLAp3W3T6lMdMiIrO+f25uDNYBKad8O4ZvH4tTASyHt
 jf6A==
Subject: [PATCH 1/6] Define 'listing' environment for style guide
References: <acc91026-d2fe-3cc8-7c6f-f43662b533b8@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <86a76e00-28b2-a420-0e96-752643bfcfc7@gmail.com>
Date: Wed, 9 Aug 2017 07:06:02 +0900
MIME-Version: 1.0
In-Reply-To: <acc91026-d2fe-3cc8-7c6f-f43662b533b8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

From 1fa65ab2cc4fc6a836c2ebca307e79d91445f243 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 5 Aug 2017 18:15:45 +0900
Subject: [PATCH 1/6] Define 'listing' environment for style guide

Define an experimental floating environment for code snippet
to be used in style guide. It requires "float" package.
Choose the "plain" style at the moment.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/perfbook.tex b/perfbook.tex
index 7e201a6..f750455 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -17,6 +17,10 @@
 \UseMicrotypeSet[protrusion]{basicmath} % disable protrusion for tt fonts
 \usepackage{etoolbox}

+\usepackage{float}
+\floatstyle{plain}
+\newfloat{listing}{tbhp}{lst}[chapter]
+\floatname{listing}{Listing}
 \usepackage{lscape}
 \usepackage{epsfig}
 \usepackage{subfigure}
-- 
2.7.4


