Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dvYJfMvOKRB15KCweWqeCWOtG1puSRSGsEk5SFpQNEk=;
        b=CRnphM8IVnlzf4Y1qGMnUyRWFHpU4NR/wp75fxgJTNvmeHprLUBjRGNOdkX7u04W/0
         zmxqcmSaCNmkW0s80ydIP3BCSHa/QBFfTz0EVq/slW38NhTRGr9DE4f5DXbCTB1BxTAO
         B28vL2sk7/IV9Bf4lmXUFeZZKmcVylCcvyrMuzI/Kqi0T9AjQLdT/26hTm4I2RazlcL+
         Kh8RB6/gv2n7zJ9L0lJqa8bsyFZOCuTHxyo4irP/L9OwBBFzLl4AusMFkdSWVBj0uBHT
         ulCOTPh0AoGDkDG4oO3BAy2DwzEVVqHE9J+pYtRgvkeeErSIglpM6owS3M295BYOkr3S
         D/jw==
Subject: [PATCH 1/3] formal/dyntickrcu: Fix the way to redefine VerbatimN
References: <1b15d6d0-55da-0fc6-67bb-0f30b4eb5fa9@gmail.com>
 <36421da6-4c59-597a-660f-f7ddf1d8835c@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b30a88d7-ccb6-bf78-6c18-3ebffb179f8c@gmail.com>
Date: Tue, 9 Apr 2019 00:46:44 +0900
MIME-Version: 1.0
In-Reply-To: <36421da6-4c59-597a-660f-f7ddf1d8835c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 111d908f713435dfd62384eb1cc29a24268537ea Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 8 Apr 2019 21:20:14 +0900
Subject: [PATCH 1/3] formal/dyntickrcu: Fix the way to redefine VerbatimN

It turns out the \AtBeginEnvironment{} command accumulates specified
commands in a hook. By using a length variable within the patching
command, just setting the length is good enough in dyntickruc.tex.

"9pt" in the old code was a typo. It should have been "6pt".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Fixes: xxxxxxxxxxxx ("formal/dyntickrcu: Mitigate ugliness around tall inline snippets")
---
 formal/dyntickrcu.tex | 8 ++------
 perfbook.tex          | 5 ++++-
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index 94093ee9..0c09d1ce 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -4,9 +4,7 @@
 \IfTwoColumn{
 \RecustomVerbatimEnvironment{VerbatimN}{Verbatim}%
 {numbers=left,numbersep=5pt,xleftmargin=10pt,xrightmargin=0pt,frame=none}
-\AtBeginEnvironment{VerbatimN}{%
-\renewcommand{\lnlbl}[1]{\raisebox{0pt}{\phantomsection\label{\lnlblbase:#1}}}%
-}
+\setlength{\lnlblraise}{0pt}
 }{}
 
 \subsection{Promela Parable: dynticks and Preemptible RCU}
@@ -1626,7 +1624,5 @@ Verification can be a good thing, but simplicity is even better.
 \IfTwoColumn{
 \RecustomVerbatimEnvironment{VerbatimN}{Verbatim}%
 {numbers=left,numbersep=3pt,xleftmargin=5pt,xrightmargin=5pt,frame=single}
-\AtBeginEnvironment{VerbatimN}{%
-\renewcommand{\lnlbl}[1]{\raisebox{9pt}{\phantomsection\label{\lnlblbase:#1}}}%
-}
+\setlength{\lnlblraise}{6pt}
 }{}
diff --git a/perfbook.tex b/perfbook.tex
index dd4a8d42..641df90a 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -251,8 +251,11 @@
 %\fvset{fontsize=\scriptsize,numbers=left,numbersep=5pt,xleftmargin=9pt,obeytabs=true,tabsize=2}
 \newcommand{\lnlblbase}{}
 \newcommand{\lnlbl}[1]{\phantomsection\label{\lnlblbase:#1}}
+\newlength{\lnlblraise}
+\setlength{\lnlblraise}{6pt}
 \AtBeginEnvironment{VerbatimN}{%
-\renewcommand{\lnlbl}[1]{\raisebox{6pt}{\phantomsection\label{\lnlblbase:#1}}}%
+\renewcommand{\lnlbl}[1]{%
+\raisebox{\lnlblraise}{\phantomsection\label{\lnlblbase:#1}}}%
 }
 \newcommand{\lnrefbase}{}
 \newcommand{\lnref}[1]{\ref{\lnrefbase:#1}}
-- 
2.17.1


