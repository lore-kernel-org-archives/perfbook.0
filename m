Return-Path: <SRS0=u77P=RN=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qToyACp1phh6ys0AqpPRbSLW1ATcaE/enKJFOMAIQU0=;
        b=DE9UqVcM5RcoYhQ9NFzirQAqBTJ7VoD/yRc798TaUq4JEUaQPeGCCaFUw3JMOptHp3
         LNAbAtSM9bx5fpRtbv6HdSWLKFfCkLzEYx4xVWUncdH1CPqog/1lMDrY7eSti6t2qbRT
         sOcSWAjomDxpeLW9xN/lqbDOAlPHs4WSDAiDiGeVL9oNiSNt95NJXahULRx1sEPhnXlS
         dLpcN/unb5ZbfjB6EEECQmOnoy+z6461M5G7uQNjY7kCMvS69aCQnrbn2uB4y46oxqap
         dliTEhZ4cZ0II3UpW8BUmlZwI4aFvZJ1bLRx+TdTK5zK04bOTabor1kwY3rKDDhu9F8G
         emrQ==
Subject: [PATCH -perfbook 4/4] ebook: Reduce chapter heading's font size and
 spaces
References: <4fde622a-0aa3-e6df-1b20-1469ed676813@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <cf3e3922-8d10-94c7-e5b1-7240e1fc7478@gmail.com>
Date: Tue, 28 Dec 2021 23:33:15 +0900
MIME-Version: 1.0
In-Reply-To: <4fde622a-0aa3-e6df-1b20-1469ed676813@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The default font size of \Huge for chapter headings is too large
in ebook-sized builds.

Reduce the size and spaces around them by adding titlesec settings.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index c45d033c..cdc0acc7 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -415,6 +415,10 @@
     %\pagestyle{empty}
     %\usepackage[scaled]{helvet}
     %\renewcommand{\familydefault}{\sfdefault}
+    % Smaller font and tighter space for chapter title
+    \titleformat{\chapter}[display]{\normalfont\bfseries}
+                {\Large\chaptertitlename~\thechapter}{0pt}{\LARGE}
+    \titlespacing*{\chapter}{0pt}{*1}{*2}
   }{
   \IfHardCover{
     \usepackage[papersize={8.25in,10.75in},body={4.75in,8.25in},onecolumn]{geometry}
-- 
2.17.1


