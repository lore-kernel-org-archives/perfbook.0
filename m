Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=iG4PsoTgDE9ndeeg9MmritaKz8xrYaJXdT1pmutnxvA=;
 b=H3cQs5+SVlMaRVS/UB0yYn+3CYVXRYxoXt4q3R6bu1zjKB1iTLMFBQcUdxr1PWfdF3
 r+wbklKqgbFUbd/eCVL9bQ4rC7Ztb2X1jn8Z3N7xHSx2KF6LqBb20evxHG4a0gJfBdLp
 r7wuKgNOiBz0a7wwxqWvwK/7Wf5YYOXATgWjDjoQuoyBIDazV5ApAh0FmkedWiKsXh1E
 hnsF3YwD9PFFM5fNC+nntkqhHinvB+eQaLoGDAnTElpJrQFsBTXp5JsJvZhOem2EVrfa
 ZL75bYwnPIz9x0ntW49e8r1xIyEuJjxB+AT/273WBwNgczalH5hFM33iI78elZdfW/Cl
 MJ8A==
Subject: [PATCH 4/5] Enable inlinelinks for 2c build
References: <8fc83317-ec1d-da55-526a-fe63d5233df0@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <1b122083-533c-1c56-ae19-cfe1dd72c577@gmail.com>
Date: Fri, 27 Jan 2017 00:21:18 +0900
MIME-Version: 1.0
In-Reply-To: <8fc83317-ec1d-da55-526a-fe63d5233df0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 51586d7d3289e407879416353e05c77d54de3542 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 8 Jan 2017 08:04:14 +0900
Subject: [PATCH 4/5] Enable inlinelinks for 2c build

Changing layout of bibliography to one column permits us to enable
inlinelinks in 2c build. Build failure caused by a link crossing
a page/column boundary is observed only in two-column layout so far.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/appendix.tex | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/appendix/appendix.tex b/appendix/appendix.tex
index e231b28..6385bc2 100644
--- a/appendix/appendix.tex
+++ b/appendix/appendix.tex
@@ -7,7 +7,8 @@
 \input{glossary.tex}
 \IfTwoColumn{
 \onecolumn\begin{adjustwidth*}{.8in}{.7in}
-\bibliographystyle{alpha}   % Use genuine alpha style
+%\bibliographystyle{alpha}   % Use genuine alpha style (In case of build failure, use this instead)
+\bibliographystyle{alphapf} % Use alpha style customized by urlbst with --inlinelinks option
 }{
 \bibliographystyle{alphapf} % Use alpha style customized by urlbst with --inlinelinks option
 }
-- 
2.7.4


