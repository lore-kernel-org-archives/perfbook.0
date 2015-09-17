Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx1.redhat.com ([209.132.183.28]:43583 "EHLO mx1.redhat.com"
 rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP	id S1753966AbbIQJdA
 (ORCPT <rfc822;perfbook@vger.kernel.org>);	Thu, 17 Sep 2015 05:33:00 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
 (int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])	by mx1.redhat.com
 (Postfix) with ESMTPS id 53DECA91	for <perfbook@vger.kernel.org>; Thu, 17 Sep
 2015 09:33:00 +0000 (UTC)
Received: from donizetti.redhat.com (ovpn-112-79.ams2.redhat.com
 [10.36.112.79])	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4)
 with ESMTP id t8H9WvRm018100	for <perfbook@vger.kernel.org>; Thu, 17 Sep 2015
 05:32:59 -0400
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 1/2] qqz: avoid duplicate references
Date: Thu, 17 Sep 2015 11:32:55 +0200
Message-Id: <1442482376-16981-2-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1442482376-16981-1-git-send-email-pbonzini@redhat.com>
References: <1442482376-16981-1-git-send-email-pbonzini@redhat.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

\refstepcounter makes LaTeX create a label "quickquizctr.NN".  However
such labels repeat in every chapter, which causes a complaint that
"destination with the same identifier has been already used" in the
log.  Avoid clutter by using \stepcounter instead.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qqz.sty | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qqz.sty b/qqz.sty
index 6a9da91..ca70c56 100644
--- a/qqz.sty
+++ b/qqz.sty
@@ -23,7 +23,7 @@
 	\label{#1}
 	\setcounter{quickquizctr}{0}}
 \newcommand{\QuickQuiz}[1]{
-	\refstepcounter{quickquizctr}
+	\stepcounter{quickquizctr}
 	\textbf{Quick Quiz \thechapter.\thequickquizctr:}}
 \newcommand{\QuickQuizAnswer}[1]{\rule{7pt}{7pt}}
 \newcommand{\QuickQuizEnd}{}
@@ -48,7 +48,7 @@
 	\section{#2}}

 \newcommand{\QuickQ}[1]{
-	\refstepcounter{quickquizctr} ~ \\ ~ \\
+	\stepcounter{quickquizctr} ~ \\ ~ \\
 	\textbf{Quick Quiz \QuickQuizAnswerChapter.\thequickquizctr:} #1 ~ \\ }

 \newcommand{\QuickA}[1]{\rule{7pt}{7pt} \\ ~ \\ \textbf{Answer:} \\ }
-- 
2.5.0


