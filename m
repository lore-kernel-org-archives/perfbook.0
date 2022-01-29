Return-Path: <SRS0=PE5W=SN=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=szexCB425YPFNzbx+kIuwC5o70Pn0BW4RIf+X5Y2TYc=;
        b=ApiJe4rv9DBGd4dJ+BLPcykY+PgRspvHHpXvPZzUzKGLapBo00GF7daUXS57QOL9vk
         H7AiAvYA+oIRa7FmIwAGZduBRFune8CGvWrChif5qM/rkJGKpgljbO5nXKuJhUdEAGlk
         0M+kDGLg3Ki8iF6mftFD0qIAM/NiOKNcqFXQKcB3XFTr0ng5KNao8KiUIqXWv0yUvjjb
         Uq1jgQMPnthvrESyCMlNWTn9U52CVNzDUNc8JDfz+3eLeR9Aar53j8pmprAsiOUXtVf9
         04519XqAJ3OhTIFmTeI1BXL0Hnm6YzI0McKz/7t+QyXpSxmIP/IB3EiFyG4TuIvgt4SR
         GxZA==
Message-ID: <37063e70-f93f-4e77-6d7b-de09876bcc65@gmail.com>
Date: Sat, 29 Jan 2022 20:23:39 +0900
MIME-Version: 1.0
Subject: [RFT PATCH -perfbook v3 v3 1/4] Replace \include{} with \input{} for
 parallel pdflatex runs
Content-Language: en-US
References: <e4f48e3d-7efe-f822-1002-6836d63b542f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <e4f48e3d-7efe-f822-1002-6836d63b542f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Parallel build of .pdf and .fcv files by "make -jN" worked when
a single PDF target was specified.
On the other hand, "make -j3 2c 1c eb" ended up in various errors
during parallel runs of pdflatex.

It turns out that the cause of the error is the \include{} commands
in appendix/appendix.tex and perfbook-lt.tex.
\include{} switches to its own .aux file, in this case,
appendix/questions.aux, appendix/toyrcu.aux, and so on.
As their names are common to different PDF targets, those .aux files
can be overwritten/corrupted by parallel runs of pdflatex.

\include{} implies \cleardoublepage both in front of and next to it.
In perfbook, included LaTeX sources have \chapter{} commands and
the implied page breaks are redundant.

By replacing \include{} commands with \input{} commands, parallel
runs of pdflatex can be enabled.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/appendix.tex | 8 ++++----
 perfbook-lt.tex       | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/appendix/appendix.tex b/appendix/appendix.tex
index f2640157..edcfe7ef 100644
--- a/appendix/appendix.tex
+++ b/appendix/appendix.tex
@@ -2,9 +2,9 @@
 % mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
-\include{appendix/questions/questions}
-\include{appendix/toyrcu/toyrcu}
-\include{appendix/whymb/whymemorybarriers}
-\include{appendix/styleguide/styleguide}
+\input{appendix/questions/questions}
+\input{appendix/toyrcu/toyrcu}
+\input{appendix/whymb/whymemorybarriers}
+\input{appendix/styleguide/styleguide}
 \renewcommand{\bottomtitlespace}{.08\textheight}
 \QuickQuizAnswers
diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 085ce55d..d70dde66 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -667,12 +667,12 @@
 
 % Credits
 \setcounter{secnumdepth}{-1} % surpress section numbering in backmatter
-\include{ack}
+\input{ack}
 
 % Index if enabled
 \IfIndexOn{
 \IfIndexHier{
-\include{indexsee}
+\input{indexsee}
 }{}
 \phantomsection
 \IfEbookSize{
-- 
2.17.1


