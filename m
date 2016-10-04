Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=Z9h+oDBnU3mwk0CW5SYBTmQek+F1TcBqZdzBmaYNUDI=;
 b=R9Wqmgs9jZL8KL+XCR0JztbUngZoYI27cEr3OtK9DhHwVhHw+qBWsgvPjUoqDOa7D9
 LTFdvybVQ/S8H6Xl+1w9bUJpd8u5evMD0wtMfs3fotIJ6phpC6ZVBlzGDlyN0IsMoTYB
 9T3p7YwlZfQOq9D340MNkdCfMspifCGjTnk2uROum7uROXACCNkwgKqwzmFuChnfP4Ob
 TVfuAoAVqeMSZR8/ZXux/RMTP7nFQFLhjI+i8OWJiiG+s9QTjA5f/xLcHbypY+UVxVuZ
 sp1zMqRnU88Fvt6VbyLOT2F9oV82S4xpltX5Ddng3xDU5dDen3r3IJjFU7wMv6lYB1YH
 2+Zw==
Subject: [PATCH 3/3] Disable 'microtype' in code snippets
References: <fb8777a9-a5f2-ede7-69b6-8882f05cdb81@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e1e5adb0-0415-0f89-e6ac-a72ce2bb064d@gmail.com>
Date: Wed, 5 Oct 2016 00:25:34 +0900
MIME-Version: 1.0
In-Reply-To: <fb8777a9-a5f2-ede7-69b6-8882f05cdb81@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From a37c36710b08dce3b4be06416a131b1f99aa327a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 3 Oct 2016 18:36:28 +0900
Subject: [PATCH 3/3] Disable 'microtype' in code snippets

"microtype" package can affect monospece-ness of code snippets.
The symptom is evident in Figures 12.17 and 12.18, where patch
diffs beginning with "-" and "+" have slightly different indents.
This commit addresses this issue by adding a \microtypesetup{}
command at the start of "verbatim" and "verbbox" environments
with the help of "etoolbox" package.

This workaround is mentioned in Section 9 of microtype documentation:
http://mirrors.ctan.org/macros/latex/contrib/microtype/microtype.pdf

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/perfbook.tex b/perfbook.tex
index 14c06f8..66c93fe 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -9,6 +9,9 @@

 % Improves the text layout
 \usepackage{microtype}
+\usepackage{etoolbox}
+\AtBeginEnvironment{verbatim}{\microtypesetup{activate=false}}
+\AtBeginEnvironment{verbbox}{\microtypesetup{activate=false}}

 \usepackage{lscape}
 \usepackage{epsfig}
-- 
2.7.4


