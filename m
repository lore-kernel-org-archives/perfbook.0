Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:34706 "EHLO
 mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with
 ESMTP id S1750904AbcAYIM4 (ORCPT	<rfc822;perfbook@vger.kernel.org>); Mon, 25
 Jan 2016 03:12:56 -0500
Received: by mail-pa0-f45.google.com with SMTP id uo6so78738339pac.1 for
 <perfbook@vger.kernel.org>; Mon, 25 Jan 2016 00:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=from:to:cc:subject:date:message-id;
 bh=aHBCBspd1cPTE+EvVA/Xk63Q9bs0K4DRTWkYszRrnM4=;
 b=AJQc5w9V8F30W0pUt2nZGod0L6g8oUM9CtUv1/qngb+YWlqzMzQeHl8eJ7ipVi0Y/O
 bTBq1m3uDnBdPYM89Z3oQQDIIqQ7GIeWL4jPss8a51/peC4tB/HbMXpvmVc2QvVivdVM
 jFDLmzn8GsjEyTcLDKaAt685pZnb1xnUVnCE2A0IbB95AuHG9Eu5ciDe+HWLPi6NVuW/
 CXfPlrrjaqHuRRDWAf3MXOAHMnkYKP0hTGNqghKK20JHdnQ3I11oPvF2WOGr9YlMtdZo
 iSwyrBLd0+z4NgC0EMvhtJf1yb/gxGL6LlSTMgnXuVJqwHyU+EULoQcymiMJy80hQC8+
 ZHzQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH] intro: trivial: remove an unnecessary dot
Date: Mon, 25 Jan 2016 17:12:47 +0900
Message-Id: <1453709567-9156-1-git-send-email-sj38.park@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>

There is an unnecessary dot that seemed to be inserted by trivial
mistake. This commit just removes the dot.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 intro/intro.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/intro/intro.tex b/intro/intro.tex
index fc5a51e..0a8ecb7 100644
--- a/intro/intro.tex
+++ b/intro/intro.tex
@@ -332,7 +332,7 @@ This change in focus is due to the fact that, although Moore's Law
 continues to deliver increases in transistor density, it has ceased to
 provide the traditional single-threaded performance increases.
 This can be seen in
-Figure~\ref{fig:intro:Clock-Frequency Trend for Intel CPUs}.\footnote{	
+Figure~\ref{fig:intro:Clock-Frequency Trend for Intel CPUs}\footnote{	
 	This plot shows clock frequencies for newer CPUs theoretically
 	capable of retiring one or more instructions per clock, and MIPS
 	(millions of instructions per second, usually from the old
-- 
1.9.1

