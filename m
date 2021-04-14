Return-Path: <SRS0=Bw3l=JL=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=B5PwvhWPhCbJwfOuIAnSyOvLgAAooNmkesaFXTk2EAM=;
        b=r9kEI5dWgnKzGNOy6oWDKnaLoBj5ijRThj54HrRMpKOWWClWXT4Se2lpirRCAqTtwV
         W9G7fNaeJGWlU3mkr5dyYiPk8Qjvqqo8DucyKIzssBynF+p8JA8b1wjyigqwxxVUPraD
         dmYoYmumPcxBe2AL9aS0HZAs441fb77Ln/K/pO25mVc0RGmvFjADwRW2RkaVOUJfvGj2
         ddJG6qRx4d3vyypst83u2CBH8kxTC6NWUXV8Qoxx7IxXYWZjEGBPOKajotMiI+6VV1gH
         4h7sXsxoSVSRiJY8xBBe5ljEwa4ZzOMqxBzR9jEpWzksyiFHiJI5wyciaq/bk6RzIRwO
         H6Kg==
Subject: [PATCH -perfbook 2/5] qqz.sty: Modify -nq build to have chapterwise
 quiz-only section
References: <b1bb1f84-9195-33ab-b6d1-ac68be1dca84@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e0f96e97-7526-fc5f-98f3-50092a2cd9fa@gmail.com>
Date: Wed, 14 Apr 2021 20:04:43 +0900
MIME-Version: 1.0
In-Reply-To: <b1bb1f84-9195-33ab-b6d1-ac68be1dca84@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Presenting answers in chapter-wise sections would deprive of chances
to think before seeing answers.

So, modify -nq builds so that each chapter has a quiz-only section
and Appendix E provides answers in the same manner of the official
builds.

This is done by the set of changes listed below:

o divideqqz.sh now extracts quiz part only, with renaming of macros
  "\QuickQAC -> \QuickQQC", "\QuickQ -> \QuickQQ", and
  "\QuickE -> \QuickQE".

o Add definitions for those -nq only macros in qqz.sty.

o Hyperlinks are made in the following way:

  - Inline QQ marker -> Chapter-wise Quiz -> Answer in Appendix
  - Page number marker in Quiz part -> Inline QQ marker
  - Answer in Appendix -> Inline QQ marker

  - Essential Quizzes are directly linked to their answers, and
    the white boxes at the end of the answers are linked to the
    end markers of inline Quizzes.

o Use \phantomsection instead of \refstepcounter{quickquizctrE},
  because the counter value for labeling is always the same as
  quickquizctr or quickquizctrP.

o Remove conditional contents for \IfQqzChpEnd{} (answers are
  in Appendix now).

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile               |  2 +-
 advsync/rt.tex         | 18 --------
 howto/howto.tex        | 14 ------
 qqz.sty                | 97 ++++++++++++++++++++++++------------------
 utilities/divideqqz.pl | 25 ++++++++++-
 5 files changed, 81 insertions(+), 75 deletions(-)

diff --git a/Makefile b/Makefile
index cd8ee7ff..cec7e878 100644
--- a/Makefile
+++ b/Makefile
@@ -375,7 +375,7 @@ perfbook-ebsfnq.tex: perfbook-ebsf.tex
 perfbook-nq.tex perfbook-sfnq.tex perfbook-1cnq.tex perfbook-1csfnq.tex perfbook-ebnq.tex perfbook-ebsfnq.tex:
 	sed -e 's/setboolean{qqzbg}{true}/setboolean{qqzbg}{false}/' \
 	    -e 's/setboolean{noqqz}{false}/setboolean{noqqz}{true}/' \
-	    -e 's/{qqzchpend}{false}/{qqzchpend}{true}/' < $< > $@
+	    -e 's/{qqzchpend}{false}/{qqzchpend}{false}/' < $< > $@
 
 perfbook-ix.tex: $(PERFBOOK_BASE)
 perfbook-1cix.tex: perfbook-1c.tex
diff --git a/advsync/rt.tex b/advsync/rt.tex
index 2732f9ed..96c22d25 100644
--- a/advsync/rt.tex
+++ b/advsync/rt.tex
@@ -1996,42 +1996,24 @@ non-real-time computing, using real-time when it is not required is
 unwise, as fancifully depicted by
 \cref{fig:advsync:The Dark Side of Real-Time Computing}.
 
-\IfQqzChpEnd{
 \begin{figure}
 \centering
 \resizebox{3.2in}{!}{\includegraphics{cartoons/RealTimeNotRealFast}}
 \caption{The Dark Side of Real-Time Computing}
 \ContributedBy{Figure}{fig:advsync:The Dark Side of Real-Time Computing}{Sarah McKenney}
 \end{figure}
-}{
-\begin{figure}
-\centering
-\resizebox{3.2in}{!}{\includegraphics{cartoons/RealTimeNotRealFast}}
-\caption{The Dark Side of Real-Time Computing}
-\ContributedBy{Figure}{fig:advsync:The Dark Side of Real-Time Computing}{Sarah McKenney}
-\end{figure}
-}
 
 On the other hand, failing to use real-time when it \emph{is} required
 can also cause problems, as fancifully depicted by
 \cref{fig:advsync:The Dark Side of Real-Fast Computing}.
 It is almost enough to make you feel sorry for the boss!
 
-\IfQqzChpEnd{
 \begin{figure}
 \centering
 \resizebox{3.2in}{!}{\includegraphics{cartoons/RealFastNotRealTime}}
 \caption{The Dark Side of Real-Fast Computing}
 \ContributedBy{Figure}{fig:advsync:The Dark Side of Real-Fast Computing}{Sarah McKenney}
 \end{figure}
-}{
-\begin{figure}
-\centering
-\resizebox{3.2in}{!}{\includegraphics{cartoons/RealFastNotRealTime}}
-\caption{The Dark Side of Real-Fast Computing}
-\ContributedBy{Figure}{fig:advsync:The Dark Side of Real-Fast Computing}{Sarah McKenney}
-\end{figure}
-}
 
 One rule of thumb uses the following four questions to help you choose:
 
diff --git a/howto/howto.tex b/howto/howto.tex
index a4ed4f4c..42e3d626 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -134,11 +134,9 @@ This chapter is followed by a number of appendices.
 The most popular of these appears to be
 \cref{chp:app:whymb:Why Memory Barriers?},
 which delves even further into memory ordering.
-\IfQqzChpEnd{}{
 \Cref{chp:Answers to Quick Quizzes}
 contains the answers to the infamous Quick Quizzes, which are discussed in
 the next section.
-}
 
 \section{Quick Quizzes}
 \label{sec:howto:Quick Quizzes}
@@ -148,15 +146,8 @@ the next section.
 
 ``Quick quizzes'' appear throughout this book, and the answers may
 be found in
-\IfQqzChpEnd{%
-the final section of each chapter.\footnote{
-	In the official release/edition of this book, all the answers are
-	gathered in an Appendix.
-}
-}{%
 \cref{chp:Answers to Quick Quizzes} starting on
 \cpageref{chp:Answers to Quick Quizzes}.
-}
 Some of them are based on material in which that quick quiz
 appears, but others require you to think beyond that section, and,
 in some cases, beyond the realm of current knowledge.
@@ -171,13 +162,8 @@ of parallel programming.
 \QuickQuizB{
 	Where are the answers to the Quick Quizzes found?
 }\QuickQuizAnswerB{
-\IfQqzChpEnd{
-	At the end of each chapter as you see here in
-        \cref{sec:qqzhowto:Answers to Quick Quizzes}.
-}{
 	In \cref{chp:Answers to Quick Quizzes} starting on
 	\cpageref{chp:Answers to Quick Quizzes}.
-}
 	Hey, I thought I owed you an easy one!
 }\QuickQuizEndB
 %
diff --git a/qqz.sty b/qqz.sty
index 0992c027..9b1d4c35 100644
--- a/qqz.sty
+++ b/qqz.sty
@@ -53,14 +53,14 @@
 
 \tcbset{enhanced,colback=black!5,boxrule=0.5pt,top=1pt,bottom=1pt,left=0pt,right=0pt}
 \newcounter{quickquizctr}[chapter]
-\newcounter{quickquizctrE}[chapter]
 \newcounter{quickquizctrC}[section]
+\newcounter{quickquizctrP}[chapter] % for noqqz build page anchor
 \newcommand*{\theHNum}{\arabic{chapter}.\arabic{quickquizctr}}
 \newcommand{\QuickQuizAnswerChapter}{\textbf{Unknown QuickQAC!!!}}
 
 \newcommand{\QuickQHeading}[3]{\hyperref[#2.#3]{\textbf{Quick Quiz #3:}}\label{#1.#3}}
 \newcommand{\QuickQHeadingPage}[3]{\hyperref[#2.#3]{\textbf{Quick Quiz #3:}}\label{#1.#3}%
-	\hfill\raisebox{0.5ex}{\footnotesize\fbox{p.\pageref{#2.#3}}}}
+	\hfill\raisebox{0.5ex}{\footnotesize\fbox{p.\pageref{QQP.#3}}}}
 \newcommand{\QuickQHeadingLight}[3]{\scriptsize QQ~\hyperref[#2.#3]{#3}\label{#1.#3}}
 \newcommand{\QuickQHeadingBegin}[3]{\scriptsize QQ~\hyperref[#2.#3]{#3}\label{#1.#3},}
 \newcommand{\QuickQHeadingMiddle}[3]{\scriptsize\hyperref[#2.#3]{{ #3}}\label{#1.#3},}
@@ -75,34 +75,31 @@
 	\vspace{-1pt}\hfill\fbox{#1}\vspace{1pt}}
 \newcommand{\QuickQuiz}[1]{%
 	\vspace{-1pt}%
-	\hfill\fbox{\refstepcounter{quickquizctr}%
-	\QuickQHeadingLight{QQ}{QQA}{\thechapter.\thequickquizctr}}%
+	\hfill\fbox{\refstepcounter{quickquizctrP}%
+	\QuickQHeadingLight{QQP}{QQ}{\thechapter.\thequickquizctrP}}%
 	\vspace{1pt}}
 \newcommand{\QuickQuizB}[1]{%
-	\refstepcounter{quickquizctr}%
-	\QuickQHeadingBegin{QQ}{QQA}{\thechapter.\thequickquizctr}}
+	\refstepcounter{quickquizctrP}%
+	\QuickQHeadingBegin{QQP}{QQ}{\thechapter.\thequickquizctrP}}
 \newcommand{\QuickQuizM}[1]{%
-	\refstepcounter{quickquizctr}%
-	\QuickQHeadingMiddle{QQ}{QQA}{\thechapter.\thequickquizctr}}
+	\refstepcounter{quickquizctrP}%
+	\QuickQHeadingMiddle{QQP}{QQ}{\thechapter.\thequickquizctrP}}
 \newcommand{\QuickQuizE}[1]{%
-	\refstepcounter{quickquizctr}%
-	\QuickQHeadingEnd{QQ}{QQA}{\thechapter.\thequickquizctr}}
+	\refstepcounter{quickquizctrP}%
+	\QuickQHeadingEnd{QQP}{QQ}{\thechapter.\thequickquizctrP}}
 \newcommand{\EQuickQuiz}[1]{%
 	\begin{tcolorbox}[breakable]
-	\leavevmode\refstepcounter{quickquizctr}%
-	\small\QuickQHeading{QQ}{QQA}{\thechapter.\thequickquizctr}%
+	\leavevmode\refstepcounter{quickquizctrP}%
+	\small\QuickQHeading{QQP}{QQA}{\thechapter.\thequickquizctrP}%
 	{#1}
 }
-\newcommand{\QuickQuizAnswer}[1]{%
-	\refstepcounter{quickquizctrE}%
-	\label{QQE.\thechapter.\thequickquizctrE}}
+\newcommand{\QuickQuizAnswer}[1]{\label{QQE.\thechapter.\thequickquizctrP}}
 \newcommand{\QuickQuizAnswerB}[1]{\QuickQuizAnswer{#1}}
 \newcommand{\QuickQuizAnswerM}[1]{\QuickQuizAnswer{#1}}
 \newcommand{\QuickQuizAnswerE}[1]{\QuickQuizAnswer{#1}}
 \newcommand{\EQuickQuizAnswer}[1]{%
-	\refstepcounter{quickquizctrE}%
-	\hyperref[QQA.\thechapter.\thequickquizctr]{\rule{7pt}{7pt}}%
-	\label{QQE.\thechapter.\thequickquizctrE}
+	\hyperref[QQA.\thechapter.\thequickquizctrP]{\rule{7pt}{7pt}}%
+	\phantomsection\label{QQE.\thechapter.\thequickquizctrP}%
 	\end{tcolorbox}
 }
 \newcommand{\QuickQuizEnd}{\goodbreak}
@@ -120,9 +117,8 @@
 	{#1}
 }
 \newcommand{\QuickQuizAnswer}[1]{%
-	\refstepcounter{quickquizctrE}%
 	\hyperref[QQA.\thechapter.\thequickquizctr]{\rule{7pt}{7pt}}%
-	\label{QQE.\thechapter.\thequickquizctrE}
+	\phantomsection\label{QQE.\thechapter.\thequickquizctr}
 	\end{tcolorbox}
 }
 \newcommand{\QuickQuizEnd}{}
@@ -132,9 +128,8 @@
 	\QuickQHeading{QQ}{QQA}{\thechapter.\thequickquizctr}
 	{#1}}
 \newcommand{\QuickQuizAnswer}[1]{%
-	\refstepcounter{quickquizctrE}%
 	\hyperref[QQA.\thechapter.\thequickquizctr]{\rule{7pt}{7pt}}%
-	\label{QQE.\thechapter.\thequickquizctrE}}
+	\phantomsection\label{QQE.\thechapter.\thequickquizctr}}
 \newcommand{\QuickQuizEnd}{\goodbreak}
 }
 \newcommand{\QuickQuizB}[1]{\QuickQuiz{#1}}
@@ -159,6 +154,17 @@
 %	\QuickQuizARef{\QQname}
 % The reference also generates a hyperlink.
 
+\IfNoQqz{
+\newcommand{\QuickQuizLabel}[1]{
+	\edef#1{\thechapter.\thequickquizctrP}
+}
+\newcommand{\QuickQuizRef}[1]{%
+	\hyperref[QQ.#1]{Quick Quiz~#1}%
+}
+\newcommand{\QuickQuizARef}[1]{%
+	\hyperref[QQA.#1]{Quick Quiz~#1}%
+}
+}{
 \newcommand{\QuickQuizLabel}[1]{
 	\edef#1{\thechapter.\thequickquizctr}
 }
@@ -168,17 +174,9 @@
 \newcommand{\QuickQuizARef}[1]{%
 	\hyperref[QQA.#1]{Quick Quiz~#1}%
 }
+}
 
-\IfQqzChpEnd{
-\newcommand{\QuickQuizAnswers}{}
-\newcommand{\QuickQuizAnswersChp}[1]{
-%	\renewcommand*{\theHNum}{\arabic{section}.\arabic{quickquizctrC}}
-%	\label{sec:#1:Answers to Quick Quizzes}
-	\setlength{\parskip}{0.0pt plus 1ex}
-	\input{#1}
-	\setlength{\parskip}{0.0pt plus 1.0pt}% return to default
-}}{
-\newcommand{\QuickQuizAnswers}{
+\newcommand{\QuickQuizAnswers}{%
 	\renewcommand*{\theHNum}{\arabic{section}.\arabic{quickquizctrC}}
 	\chapter{Answers to Quick Quizzes}
 	\label{chp:Answers to Quick Quizzes}
@@ -189,21 +187,27 @@
 	\input{qqz}
 	\setlength{\parskip}{0.0pt plus 1.0pt}% return to default
 }
+\IfNoQqz{
+\newcommand{\QuickQuizAnswersChp}[1]{
+	\setlength{\parskip}{0.0pt plus 1ex}
+	\input{#1}
+	\setlength{\parskip}{0.0pt plus 1.0pt}% return to default
+}}{
 \newcommand{\QuickQuizAnswersChp}[1]{}
 }
 
 %% Internal interfaces generated by scripts.
 
-\IfQqzChpEnd{
-\newcommand{\QuickQAC}[3]{
-	\edef\QuickQuizAnswerChapter{\getrefnumber{#1}}
-	\section{Answers to Quick Quizzes}
-	\label{sec:#3:Answers to Quick Quizzes}}
-}{
 \newcommand{\QuickQAC}[3]{
 	\edef\QuickQuizAnswerChapter{\getrefnumber{#1}}
 	\section{#2}}
-}
+
+\IfNoQqz{
+\newcommand{\QuickQQC}[3]{
+	\edef\QuickQuizAnswerChapter{\getrefnumber{#1}}
+	\section{Quick Quizzes}
+	\label{sec:#3:Quick Quizzes}}
+}{}
 
 \IfQqzBg{
 \newcommand{\QuickQ}[1]{
@@ -217,14 +221,25 @@
 	\end{tcolorbox}
 	\noindent\textbf{Answer:} \\ }
 }{\IfNoQqz{
+\newcommand{\QuickQQ}[1]{
+	\begin{tcolorbox}[breakable]
+	\leavevmode\refstepcounter{quickquizctr}%
+	\QuickQHeadingPage{QQ}{QQA}{\thechapter.\thequickquizctr}\\
+}
+
+\newcommand{\QuickQE}[1]{
+	\hyperref[QQA.\thechapter.\thequickquizctr]{\rule{7pt}{7pt}}%
+	\end{tcolorbox}
+}
+
 \newcommand{\QuickQ}[1]{
 	\begin{tcolorbox}[breakable]
 	\leavevmode\refstepcounter{quickquizctrC}%
-	\QuickQHeadingPage{QQA}{QQ}{\QuickQuizAnswerChapter.\thequickquizctrC}\\
+	\QuickQHeadingPage{QQA}{QQP}{\QuickQuizAnswerChapter.\thequickquizctrC}\\
 }
 
 \newcommand{\QuickA}[1]{%
-	\hyperref[QQ.\QuickQuizAnswerChapter.\thequickquizctrC]{\rule{7pt}{7pt}}
+	\hyperref[QQP.\QuickQuizAnswerChapter.\thequickquizctrC]{\rule{7pt}{7pt}}
 	\end{tcolorbox}
 	\noindent\textbf{Answer:} \\ }
 }{
diff --git a/utilities/divideqqz.pl b/utilities/divideqqz.pl
index 7387f683..7895fb23 100755
--- a/utilities/divideqqz.pl
+++ b/utilities/divideqqz.pl
@@ -25,18 +25,41 @@ use warnings;
 my $src_file = "qqz.tex";
 my $chp_name;
 my $QAC_ptn = "\\\\QuickQAC\\{[^}]*}\\{[^}]*}\\{([^}]*)}" ;
+my $QA_ptn  = "\\\\QuickA\\{" ;
+my $QQ_ptn  = "\\\\QuickQ\\{" ;
 my $out_h;
 my $out_file;
+my $skip = 0;
 
 open(my $in_h, "<", $src_file) or die "cannot open $src_file: $!" ;
 while (my $line = <$in_h>) {
     if ($line =~ /$QAC_ptn/) {
+	if ($out_h) {
+	    print $out_h "\\QuickQE{}\n";
+	}
 	$out_file = $1 . ".tex" ;
 	open ($out_h, ">", $out_file) or die "cannot open $out_file: $!" ;
 	print $out_h "% mainfile: perfbook.tex\n" ;
 	print $out_h "% Do not edit! Generated by divideqqz.pl\n" ;
+	$line =~ s/QuickQAC/QuickQQC/;
+	$skip = 0;
     }
     if ($out_h) {
-	print $out_h $line ;
+	if ($line =~ /$QA_ptn/) {
+	    $skip = 1;
+	}
+	if ($skip == 1 && $line =~ /$QQ_ptn/) {
+	    print $out_h "\\QuickQE{}\n";
+	    $skip = 0;
+	}
+	if ($skip == 0) {
+	    if ($line =~ /$QQ_ptn/) {
+		print $out_h "\\QuickQQ{}\n";
+	    } else {
+		print $out_h $line ;
+	    }
+	}
     }
 }
+# need to print file line
+print $out_h "\\QuickQE{}\n";
-- 
2.17.1


