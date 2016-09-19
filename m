Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:33989 "EHLO
 mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S936495AbcISDDo (ORCPT <rfc822;perfbook@vger.kernel.org>); Sun, 18
 Sep 2016 23:03:44 -0400
Received: by mail-pf0-f195.google.com with SMTP id 21so5098240pfy.1 for
 <perfbook@vger.kernel.org>; Sun, 18 Sep 2016 20:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=ZyhuuNQ6loNhN2R8EHmTJSo3z7ppSRfseQSoEQ1Futc=;
 b=It5v0efhrVvt5DVr+rHvBCw2bmUvGVdtqyQMyqA1BX+z43hlGkyn/SX3AM03HWB4id
 AfbFUGdalXyYEV91Yza10xaOTYO3GnUmp5A42Ms6tB1JouYZSoR8xWKVjePctXMMdrCR
 BdLNpF9yyy2CVaL/z+keibWABITYwF0A0eZliC8nbib3kko+WjfuvTvYkFctnOfebt5d
 VATInqF65ZwnWL2jl4u1WnUFToRaPndBZdof+EanpU6pbH/uTxR/gexcim/JgI7+BG2Y
 KjJB3k30qfu+74JPNkY6Umux48UUiIgtJENxvrVynVLRyigjYqDKOnb3uScTkBww13pS
 Nz6A==
Subject: [RFC PATH 2/6] book.cls: Fix indent after \chapter in twocolumn
References: <029d0339-e50a-3b7e-1fb1-2322cb519dac@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <9664fdd2-7d0d-94b8-5e00-08887d58a430@gmail.com>
Date: Mon, 19 Sep 2016 12:03:37 +0900
MIME-Version: 1.0
In-Reply-To: <029d0339-e50a-3b7e-1fb1-2322cb519dac@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

From a0a92cb0f614ba369973dc0eb1184d01fa73cee7 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 11 Sep 2016 00:01:02 +0900
Subject: [RFC PATH 2/6] book.cls: Fix indent after \chapter in twocolumn

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 book.cls | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/book.cls b/book.cls
index 0713d4d..2455a78 100644
--- a/book.cls
+++ b/book.cls
@@ -32,6 +32,10 @@
 %% by the LaTeX Project.  These modifications allow specifying "hardcover"
 %% in order to generate 10.75x8.25in pages for hardcover books.
 %% 
+%% It has also been modified by Akira Yokosawa. The modification fixes
+%% indentation behavior of first paragraph in a chapter when twocolumn
+%% option is specified.
+%%
 %% This file may only be distributed together with a copy of the LaTeX
 %% base system. You may however distribute the LaTeX base system without
 %% such generated files.
@@ -60,7 +64,7 @@
 %%   Right brace   \}     Tilde         \~}
 \NeedsTeXFormat{LaTeX2e}[1995/12/01]
 \ProvidesClass{book}
-              [2014/09/29 v1.4h-pem
+              [2014/09/29 v1.4h-pem-ay
  Standard LaTeX document class]
 \newcommand\@ptsize{}
 \newif\if@restonecol
@@ -391,8 +395,8 @@
                       \@topnewpage[\@makechapterhead{#2}]%
                     \else
                       \@makechapterhead{#2}%
-                      \@afterheading
-                    \fi}
+                    \fi
+                    \@afterheading}
 \def\@makechapterhead#1{%
   \vspace*{50\p@}%
   {\parindent \z@ \raggedright \normalfont
@@ -411,8 +415,8 @@
                    \@topnewpage[\@makeschapterhead{#1}]%
                  \else
                    \@makeschapterhead{#1}%
-                   \@afterheading
-                 \fi}
+                 \fi
+                 \@afterheading}
 \def\@makeschapterhead#1{%
   \vspace*{50\p@}%
   {\parindent \z@ \raggedright
-- 
1.9.1


