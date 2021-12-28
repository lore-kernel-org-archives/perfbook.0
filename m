Return-Path: <SRS0=u77P=RN=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7adbl4tN80pRbEAAbXtFUEZJA+iR7JEQ2Hrl+NK+ayY=;
        b=S59om6eUWbtboPzKygYF4WqzFHQkCjeD6kqierI9K3UJY6oyA68n+oOxw5N+cC4Lmk
         Nf80dZCwX+FbwKL0+zlYkf7lKiZw/IZjfcHOygFfHDkgPK6mOQS4J8SlGy8z12mRNkv9
         +36WrWMQ8YuoaytxoGQDiKx1hcHRIqBWaQopaoc4lS5fDYvL+JFPp1iP0fBHESc03P2Q
         xIhltF9C5iXOjsfSLHtwbZtHSvi94eLWdp/EV0KU4BLfxpVBEvpYTNP9n9KifSOd4wT6
         EYcxLTTP3al2nec+aSpHfVFymjN+zcmpVsTGHVL8mCB4Pic8DvdUakKd3WJLMaAue5rG
         WA4g==
Subject: [PATCH -perfbook 2/4] ebook: Print page counts on upper-right edge of
 page
References: <4fde622a-0aa3-e6df-1b20-1469ed676813@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a4c9cdf2-e80f-80c1-fa4a-c75d1e638746@gmail.com>
Date: Tue, 28 Dec 2021 23:29:20 +0900
MIME-Version: 1.0
In-Reply-To: <4fde622a-0aa3-e6df-1b20-1469ed676813@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Page counts at the header area are invisible due to the narrow
margin of 0.2in.

Use fancyhdr package and print page counts close to the top edge of
paper.  Print them in "Grey" color and scriptsize font so that they
won't distract readers too much.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index eb5c31d6..ec3e38e1 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -401,9 +401,17 @@
   \setlength{\twocolumnwidth}{3.125in}
   \IfEbookSize {
     % From https://tex.stackexchange.com/questions/16735/latex-options-for-kindle
-    \usepackage[papersize={4.5in,6.3in},margin=0.2in,onecolumn,twoside=false]{geometry}
+    \usepackage[papersize={4.5in,6.3in},margin=0.2in,footskip=0.2in,
+      headsep=0.05in,headheight=0.15in,onecolumn,twoside=false]{geometry}
     \sloppy
     \setlength{\onecolumntextwidth}{4.1in}
+    \usepackage{fancyhdr}
+    \fancypagestyle{plain}{%
+      \fancyhf{} % clear all header and footer fields
+      \renewcommand{\headrulewidth}{0pt}
+      \rhead{\textcolor{Grey}{\scriptsize\thepage}}
+    }
+    \pagestyle{plain}
     %\pagestyle{empty}
     %\usepackage[scaled]{helvet}
     %\renewcommand{\familydefault}{\sfdefault}
-- 
2.17.1


