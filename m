Return-Path: <SRS0=d1CH=6H=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EZNTNqiWgfn9yEB6f2r8vpnh7rZNjkyrAavXdlA23Zs=;
        b=dutDMKgOnN82AcFDIcGJuPf/3r9FJGr6hGgoy8hJ7lRAn7akkaj7obVqJt/vob9RVE
         0YHQ24pRF8p8cqfZgWlefHJXNrrh+M6JAXlIejhlo5Lunbj0ZYyk0I4DslMVD2WYJfgX
         6d93EiFXD1uVoZp4pBaiEivJoMHt+SyCGWS3Qhx8wrnuWX54kg9hY7XtfmgUMUwWErQM
         /qbJ8lRQVxtzpbYLM8ozzebhiCXn/xUfTDspY1CRYgl/SDuM8zQ2zYNAN2UiqTG0bUIY
         Z3zMPF9iCYOOi4ANvZ5ye71eEqwyFur5gz7Sq4ULuccTeJ8pUaOIztctmJFieIhKSFxE
         1VKA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v2 4/4] debugging/debugging: s/remainder of a section/following sections/
Date: Sat, 11 Feb 2023 09:10:08 -0800
Message-Id: <20230211171008.9415-5-sj38.park@gmail.com>
In-Reply-To: <20230211171008.9415-1-sj38.park@gmail.com>
References: <20230211171008.9415-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: akiyks@gmail.com, perfbook@vger.kernel.org, sj38.park@gmail.com, sj@kernel.org
List-ID: <perfbook.vger.kernel.org>

A sectence in 'Microbenchmarking' section is mentioning the remainder of
the section will look at ways for dealing with conflicts in measurement
error advices.  Because we don't distinguish section and subsection on
text, this makes it a little confused, whether it means remainder of the
subsection, or the following subsections of the section.  Make it a bit
more clear.

Suggedsted-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 debugging/debugging.tex | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index b7538620..170bf273 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -641,8 +641,8 @@ sure to take full advantage of any existing test suites available to
 you.
 Important as test development is, we must leave further discussion of it
 to books dedicated to that topic.
-The following sections therefore discuss locating bugs in your code given that
-you already have a good test suite.
+The remainder of this section (\cref{sec:debugging:Performance Estimation})
+looks at ways of resolving this conflict.
 
 \section{Tracing}
 \label{sec:debugging:Tracing}
@@ -2302,7 +2302,7 @@ to creep in, including:
 
 The first and fourth sources of interference provide conflicting advice,
 which is one sign that we are living in the real world.
-The remainder of this section looks at ways of resolving this conflict.
+The following sections look at ways of resolving this conflict.
 
 \QuickQuiz{
 	But what about other sources of error, for example, due to
-- 
2.17.1

