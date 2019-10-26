Return-Path: <SRS0=nXUX=YT=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=j4gstFXzWPq2VLFep1N9ZD0CFvxsfEdQCyW+njt5BU4=;
        b=nIOFQ7p618W8fHuiUes3r2QeUz8ShNScznr8OxkMVKCB2QeI0ogPWIp8dg/PTQQgLE
         Zd7a/N1ym7Fk60VH7Xh+kQvUkPkV1rlShXgzkymtv9V1Mexxmq6axlC4GAoKLUQBUgV+
         IWYf6v/Ra9GMYFWAeaP+kVe730rhvw0VBb+wVaBpiBXmO8ob9QmKXHFP7z87DUq/V/lF
         XCjnAZ0Kyf2plXHj7kLtZ4D6xk107DJsJU05wDwGLYcjmgXcw7iDAXkRTEdp+B5f7svT
         6E5upOM0nCp9QVzJohzJc/VegTL/WGENPDSa35BsnxkOgBf462Gd8gLxXGfK8XGMftdH
         8JFw==
Subject: [PATCH 1/3] count: Tweak horizontal spacing of wide tables in 1c
 layout
References: <74f205ba-a530-288b-d211-8ef8db70f365@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6f1bf882-4dc7-f597-d5d3-61186cf0beb5@gmail.com>
Date: Sat, 26 Oct 2019 09:19:31 +0900
MIME-Version: 1.0
In-Reply-To: <74f205ba-a530-288b-d211-8ef8db70f365@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 0a2fa3b2687fc4ca1d79856fa30825f3cbea76f4 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 26 Oct 2019 00:07:26 +0900
Subject: [PATCH 1/3] count: Tweak horizontal spacing of wide tables in 1c layout

These tables got wider than the width of 1c layout by recent
update using the results obtained on a larger system.

Also adjust "table-format" specifiers to the digit counts
in the table (now grown to 6 digits).

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 count/count.tex | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/count/count.tex b/count/count.tex
index 9735a89c..4b01bc75 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -2817,8 +2817,9 @@ will expand on these lessons.
 \rowcolors{4}{}{lightgray}
 \renewcommand*{\arraystretch}{1.1}
 \small
-\centering
-\begin{tabular}{lrS[table-format = 2.1]S[table-format = 3.0]S[table-format = 5.0]S[table-format = 5.0]S[table-format = 5.0]}
+\centering\OneColumnHSpace{-.25in}
+\begin{tabular}{lrS[table-format=1.1]S[table-format=3.0]S[table-format=4.0]
+		  S[table-format=6.0]S[table-format=6.0]}
 	\toprule
 	& & & \multicolumn{4}{c}{Reads (ns)} \\
 	\cmidrule{4-7}
@@ -2904,8 +2905,9 @@ courtesy of eventual consistency.
 \rowcolors{4}{}{lightgray}
 \renewcommand*{\arraystretch}{1.1}
 \small
-\centering
-\begin{tabular}{lrcS[table-format = 2.1]S[table-format = 3.0]S[table-format = 5.0]S[table-format = 5.0]S[table-format = 5.0]}
+\centering\OneColumnHSpace{-.4in}
+\begin{tabular}{lrcS[table-format=2.1]S[table-format=3.0]S[table-format=4.0]
+		   S[table-format=6.0]S[table-format=6.0]}
 	\toprule
 	& & & & \multicolumn{4}{c}{Reads (ns)} \\
 	\cmidrule{5-8}
-- 
2.17.1


