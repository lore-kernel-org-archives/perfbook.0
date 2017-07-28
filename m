Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fEgyh/AvuJwXmKJdX+n61G5qY1PYddFGtbNKEMP/h+o=;
 b=kWFN5oRKc34YZFfWNH3dkwW4sSQ8MdsFM1qYPW/8L5FtoeOEp0jI2xNInEhDkAN5fw
 YxJ4xNVgA6rHEGQ5Mu3E2b0NFMrCSg3ySiqNealspyMvMUMfzJHbsPYyqjmgfmedzPbB
 o1+cd6g8pKHwRERuqHTswV7A1ydDgAO5BBd0BYirE/rmPQKhHBUlEB7Xu3dNj4fCDc4F
 TrhIH1iSPbPmUydyGs4Z6RN6D2R6id4mLrcxf66+IJ55YljG8Gui3kArsjKHCBDck01L
 Qp9iiqwxnA46Yvbc3tHYtRf1+BOehgnZnowF9X7FQd8X4Ek/C8km8O/IB+odNQUi4qgf
 tTRA==
Subject: [PATCH 02/10] Specify required revision of 'verbatimbox'
References: <26a47dec-a9a0-87e6-88c8-b9ba82c477d5@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <71949aac-b879-2b8a-ddf2-26deb9c300fd@gmail.com>
Date: Fri, 28 Jul 2017 18:57:03 +0900
MIME-Version: 1.0
In-Reply-To: <26a47dec-a9a0-87e6-88c8-b9ba82c477d5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From a77121a7bba9c9df9c6cc92acea88e31b3f5f594 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 19 Jul 2017 20:02:32 +0900
Subject: [PATCH 02/10] Specify required revision of 'verbatimbox'

The command "verbfilebox" requires "verbatimbox 2014/01/30 v3.11"
which is available in TeX Live 2013/Debian.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/perfbook.tex b/perfbook.tex
index ad24285..cda014c 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -36,7 +36,7 @@
 % \usepackage{underscore}
 \usepackage{pifont} % special character for qqz reference point
 \usepackage{gensymb} % symbols for both text and math modes such as \degree and \micro
-\usepackage{verbatimbox} % for centering verbatim listing in figure environment
+\usepackage{verbatimbox}[2014/01/30] % for centering verbatim listing in figure environment
 \usepackage[bottom]{footmisc} % place footnotes under floating figures/tables
 \usepackage{tabulary}
 \usepackage[hyphens]{url}
-- 
2.7.4


