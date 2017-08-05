Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pg0-f41.google.com ([74.125.83.41]:38218 "EHLO
 mail-pg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751136AbdHEDq6 (ORCPT <rfc822;perfbook@vger.kernel.org>); Fri, 4
 Aug 2017 23:46:58 -0400
Received: by mail-pg0-f41.google.com with SMTP id l64so14565203pge.5 for
 <perfbook@vger.kernel.org>; Fri, 04 Aug 2017 20:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KOZxiqzGgzo5m9xUhRBT5e9Ob13M89x0E8swYXapx0Q=;
 b=RzCGixuCHXKdYRhtJz53LnTw05o0O22bed65hUhKb6i2JPlQSfW2DDR+6VYcNQMXZT
 3TptjlZmnM/TdOu9AD+VXKqzGQ9bazutX1kwELhsHDPoj5eMiZ/z1dorkdPybY1GKLa5
 NZ+3j49xxIRI8y0mZDKcsl254rMOT0RBXGRtE9JFrbhwj4SHAmCoIYUiZLz6T6oYbCL4
 IvmnKXG6Nzog4ck+yTn9Fmdq3qqwioBJYY7AuXeysVkp5rsxhvMzq5mTpgcFpIBZOChS
 /Idiae+4A6pLof0wOhEjHVlibrWHG0VzTSAp+gnaDLfVnu85wHpKB+5X5K1kOlTBGLzB
 6G7Q==
Subject: [PATCH 3/3] styleguide: Remove references to 'floatrow' and adjust
 context
References: <26a47dec-a9a0-87e6-88c8-b9ba82c477d5@gmail.com>
 <11d41e53-5367-1149-8064-8808696a2c33@gmail.com>
 <20170801204047.GH3730@linux.vnet.ibm.com>
 <068877e2-655b-0d6f-6dab-84d11467d0e5@gmail.com>
 <20170802162910.GY3730@linux.vnet.ibm.com>
 <0a7b7a93-c60c-436f-77a7-e2b27de86a40@gmail.com>
 <20170802224820.GH3730@linux.vnet.ibm.com>
 <672edb74-85b9-1086-44ee-dba21a0589c9@gmail.com>
 <94dbb98d-370a-8311-b467-9670f3968393@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f81e9709-2634-6a0d-5ccf-51e35731d4e5@gmail.com>
Date: Sat, 5 Aug 2017 12:46:55 +0900
MIME-Version: 1.0
In-Reply-To: <94dbb98d-370a-8311-b467-9670f3968393@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

From ba0af5ad755ab4e175b07abb71890077e4d54a20 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 5 Aug 2017 12:20:00 +0900
Subject: [PATCH 3/3] styleguide: Remove references to 'floatrow' and adjust context

Also fix a typo (and -> nor).

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 72b8ca0..22ff2f4 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -128,7 +128,7 @@ be used as a prefix. An improper example:
 \label{sec:app:styleguide:Non-SI Unit Symbol}

 Although NIST style guide does not cover non-SI unit symbols
-such as ``KB'', ``MB'', and ``GB'', the same rule should be followed.
+such as ``KB'', ``MB'', nor ``GB'', the same rule should be followed.

 Example:

@@ -320,9 +320,9 @@ Line numbers are manually placed for ease of referencing them within
   number counter and the count can be displayed in the resulting
   listing. Leftmost line numbers in
   Figure~\ref{fig:app:styleguide:LaTeX Source of Sample Code Snippet}
-  are output by the feature. See the source of this Section
-  in \path{appendix/styleguide/styleguide.tex}
-  if you are interested.}
+  are output by the feature. The litmus tests in
+  Section~\ref{sec:advsync:Memory Barriers}
+  has been converted to use the auto-numbering feature.}

 The verbatim environment is used for listings with too many lines
 to fit in a column. It is also used to avoid overwhelming
@@ -411,8 +411,7 @@ The \qco{\\verb} macro can be used in running text if you
 need to use monospace font for a string which contains
 many characters to escape.\footnote{
   \co{\\verb} is not almighty though. For example, you can't use it
-  within a footnote nor table inside ``floatrow'' environment mentioned
-  later. If you do so, you will see a fatal latex error.
+  within a footnote. If you do so, you will see a fatal latex error.
   There are several workarounds of this problem, but as for perfbook,
   \co{\\co\{\}} should suffice.}

@@ -588,7 +587,10 @@ This section lists up such candidates.

 Strictly speaking, code snippets are \emph{not} figures.
 They deserve their own floating environment.
-The ``floatrow'' package would be of help.
+The ``float'' package would be of help.\footnote{
+  The ``floatrow'' package provides us even more flexible
+  control of floating objects. However, because of an issue
+  in two-column layout, we can not use it at the moment.}

 % TODO: Add example

@@ -602,7 +604,7 @@ top. You naturally look at the top of a table at first. Captions at
 the bottom of tables disturb this flow.
 The same can be said of code snippets, which are read from
 top to bottom.
-The floatrow package mentioned above also has the capability
+The float package mentioned above also has the capability
 to adjust layout of caption.

 % TODO: Add example
@@ -617,13 +619,11 @@ as the default for the environment.
 To prevent a pair of closely related figures or listings
 from being placed in different pages, it is desirable to group
 them into a single floating environment.
-The floatrow package provides the features to do so.\footnote{
+The ``subfig'' package provides the features to do so.\footnote{
   Note that the ``subfigure'' package currently declared in the
-  preamble is not used any more.
-  The floatrow package is the choice to group floating environments
-  these days.
-  One problem of grouping figures might be the learning curve
-  to do so.}
+  preamble is obsoleted by subfig package.
+  One problem of grouping figures might be the complexity in
+  \LaTeX\ source.}

 % TODO: Add example

-- 
2.7.4


