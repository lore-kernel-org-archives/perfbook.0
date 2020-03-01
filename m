Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:56948 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725945AbgCARvd (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 1 Mar 2020 12:51:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583085092;
        bh=mw0PNzRf/s9YthchKKIIRVSF/bJ4yzpkxVch1pUQqKY=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=qve4EUm0EplYas7HocCf4IHZqbcYzVw3RgFRAQyxmJ2NwsrP5IOF7a3TbOz3fhIRD
         eWymcOY2e3l02VyxXx7XwHFPYPJJVicG1TvgbO3zC+hOLwx0O84gwm19GllpjbhItM
         rZ8i6k6lIAXbzeIQdQS7PXVo3sGDo4nKD0gwcjak=
Date: Sun, 1 Mar 2020 09:51:32 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] qqz.sty: Permit column/page break in front of Quick Quiz
 heading
Message-ID: <20200301175132.GS2935@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <90c17ed1-2a89-d270-c7ca-3668ef52d3dd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90c17ed1-2a89-d270-c7ca-3668ef52d3dd@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Mar 02, 2020 at 12:02:01AM +0900, Akira Yokosawa wrote:
> >From 2c4fd06827d075a04c157d150cf036db1615f268 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 1 Mar 2020 21:47:45 +0900
> Subject: [PATCH] qqz.sty: Permit column/page break in front of Quick Quiz heading
> 
> It turned out that the definition of \QuickQuiz needs an explicit
> hint (\goodbreak) for LaTeX to be able to break column/page in front
> of it.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Nice!

Does it make sense to also add \goodbreak at the end of a Quick Quiz,
perhaps as follows?  Doing so gets QQ2.11 all on one page in the
two-column version.

Does it also make sense to encourage page breaks at the beginnings of
Quick Quizzes in the answer chapter?

In other words, should I fold the diff below into your diff, or would
doing so break something?

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/qqz.sty b/qqz.sty
index 4dd411f..8bd80d9 100644
--- a/qqz.sty
+++ b/qqz.sty
@@ -39,7 +39,7 @@
 	\refstepcounter{quickquizctrE}%
 	\hyperref[QQA.\thechapter.\thequickquizctr]{\rule{7pt}{7pt}}%
 	\label{QQE.\thechapter.\thequickquizctrE}}
-\newcommand{\QuickQuizEnd}{}
+\newcommand{\QuickQuizEnd}{\goodbreak}
 
 % To create a macro referencing the previously defined quick quiz:
 %	\QuickQuizLabel{\QQname}
@@ -80,7 +80,7 @@
 \newcommand{\QuickQ}[1]{
 	\par
 	\refstepcounter{quickquizctrC}%
-	\noindent
+	\goodbreak\noindent
 	\QuickQHeading{QQA}{QQ}{\QuickQuizAnswerChapter.\thequickquizctrC} #1 ~ \\ }
 
 \newcommand{\QuickA}[1]{%
