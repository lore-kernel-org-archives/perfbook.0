Return-Path: <SRS0=Y4Pl=5B=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=WKLO7wqApPlkI4b2J8os101pTYqLd3b3/YgrCTMNiSM=;
        b=f5r3eY3dJOBL8euoRgIu1eRUZm0qoY0wCn3CyGISx4myiWEfZD+0TmD/FBI7vMa3r9
         Ydo1VYganC2/K6P57/Yfg/fw2LqNxTFMSFV6oePLK8BWBZJGK1EKFgJvLrH78TIs5KAQ
         20GpQBEbd3hwmA/bc/qUpSzIDIgBVose4rxvycyhpB+vnSsig5lieGH7GpTaGrJR8sZE
         fddeFJX5+ocqRaP5Y7ALaYy9WrkeBFp01x29u/FmnuWiRIs9yIgvfkPVxdV175CEvGWt
         zuQBk20vqGwiyLuMhjGhugAoAjzGT4Unsyya+Xn8b5z4uPNN2Yos9m3hfLBmQnwFCDhv
         XV8g==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 1/3] howto: Update Answer to QQZ 1.3 to mention inline QQA is
 not easy
Message-ID: <70bc6ef5-e823-ae3f-7753-169ba1190d5f@gmail.com>
Date: Tue, 17 Mar 2020 00:16:26 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From f4a50f79fdd13552b482b5e0f8ef0ff9b199e24b Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 8 Mar 2020 00:59:39 +0900
Subject: [PATCH 1/3] howto: Update Answer to QQZ 1.3 to mention inline QQA is not easy

The macro \QuickQuizAnswer{} defined in qqz.sty currently discards
its argument.  If you modify it to enable inline QQA, pdflatex will
end up in error due to verbatim contents and other fragile elements
within macro arguments.

Appendix E's code (qqz.tex) works because the macros \QuickQ{}
and \QuickA{} have no argument.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 howto/howto.tex | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/howto/howto.tex b/howto/howto.tex
index b0b0e487..18757934 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -207,10 +207,14 @@ Here are a few possible strategies:
 	to ignore, you can always clone the \LaTeX{} source for
 	this book from the git archive.
 	You can then modify \path{Makefile} and \path{qqz.sty} to eliminate
-	the Quick Quizzes from the PDF output.
-	Alternatively, you could modify these two files so as
-	to pull the answers inline, immediately following
-	the questions.
+	the Quick Quizzes from the PDF output.\footnote{
+		On the other hand, modifying these two files does not
+		suffice at the moment if what you'd like to do is to pull
+		the answers inline, immediately following the questions.
+		This is due to the fragility of verbatim environments
+		within arguments of \LaTeX\ macros.
+		It should still be possible, for example, by editing every
+		\path{.tex} source by a script, though.}
 \item	Look at the answer immediately rather than investing
 	a large amount of time in coming up with your own
 	answer.
-- 
2.17.1

