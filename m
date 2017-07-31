Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pg0-f45.google.com ([74.125.83.45]:37130 "EHLO
 mail-pg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750987AbdGaOqL (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 31
 Jul 2017 10:46:11 -0400
Received: by mail-pg0-f45.google.com with SMTP id y129so139102317pgy.4 for
 <perfbook@vger.kernel.org>; Mon, 31 Jul 2017 07:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3ON/jeq7wzrZiaJiXYcouZoeTGl6GwDxMiujju0FdFk=;
 b=LOeF8EPtEa1D5SWZacy8gHtAGEXX7pqvI22F5VZt2ZsQgSMUw7upT7GJj1+fQhQS5G
 oFHlDkJh5S+xJa/cfEJZLQu49JLEfpvpfx0lFqHiE+ZKTXIchw3uSDm8E4NOESj4AOcy
 saqR5idNUGmps+WMYHfY6XhyQFjsL2MAK4cBcJALmYH/HYUcg4LMVlsav2lzExky8efh
 T/DbWyh5Cnl4E66Z1EvqpX3cNh8v+U3NS3gDBldn2wrwyktTdSql9UHdIAFWxVTu+yey
 04dXsXK6EuK7S1xWZheai0eJGZ6Jzpz8r6wIq8z9sAxLWKoLWiRsXjWKn5Kvks8H/HJ9
 DTYg==
Subject: [PATCH v2 2/8] Apply workaround to floatrowpf.sty
References: <26a47dec-a9a0-87e6-88c8-b9ba82c477d5@gmail.com>
 <11d41e53-5367-1149-8064-8808696a2c33@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <fc99c645-cdeb-9a38-fd52-15cf4a6080f4@gmail.com>
Date: Mon, 31 Jul 2017 23:46:07 +0900
MIME-Version: 1.0
In-Reply-To: <11d41e53-5367-1149-8064-8808696a2c33@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

From 709e5350e4b9ca4435142c67fa3e05fe0748365c Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 20 Jul 2017 23:35:31 +0900
Subject: [PATCH v2 2/8] Apply workaround to floatrowpf.sty

Also modify package names in the sty file. They are output to
the log file as part of info or error messages.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 floatrowpf.sty | 38 ++++++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/floatrowpf.sty b/floatrowpf.sty
index 18ef28a..b98af62 100644
--- a/floatrowpf.sty
+++ b/floatrowpf.sty
@@ -1,4 +1,13 @@
-%%
+%%%
+%%% This is file `floatrowpf.sty', which is a modified version
+%%% of `floatrow.sty' to work around issues in two-column layout.
+%%% The possible workaround was posted at:
+%%% https://tex.stackexchange.com/questions/133127/
+%%%
+%%% Modified by Akira Yokosawa for perfbook project.
+%%%
+%%% Following is the original header:
+%%%
 %% This is file `floatrow.sty',
 %% generated with the docstrip utility.
 %%
@@ -21,16 +30,16 @@
 %% same distribution. (The sources need not necessarily be
 %% in the same archive or directory.)
 \NeedsTeXFormat{LaTeX2e}[1995/06/01]
-\ProvidesPackage{floatrow}
-       [2008/08/02 v0.3b floatrow: float package extension]
+\ProvidesPackage{floatrowpf}
+       [2017/07/17 v0.3b-ay floatrowpf: customized floatrow for perfbook]
 \@ifundefined{float@caption}{%
   \@ifundefined{rotfloat@float}{}%
-    {\PackageError{floatrow}{Do not use rotfloat package with floatrow.\MessageBreak
+    {\PackageError{floatrowpf}{Do not use rotfloat package with floatrowpf.\MessageBreak
         The latter will be skipped}{}%
-  \@namedef{opt@floatrow.sty}{}\endinput}}%
-  {\PackageError{floatrow}{Do not use float package with floatrow.\MessageBreak
+  \@namedef{opt@floatrowpf.sty}{}\endinput}}%
+  {\PackageError{floatrowpf}{Do not use float package with floatrowpf.\MessageBreak
         The latter will be skipped}{}%
-  \@namedef{opt@floatrow.sty}{}\endinput}
+  \@namedef{opt@floatrowpf.sty}{}\endinput}
 \@namedef{ver@float.sty}{2001/11/08 v1.3d (excerpt)
     Float enhancements (AL)}
 \@namedef{ver@rotfloat.sty}{2004/01/04 v1.2 (excerpt)
@@ -38,7 +47,7 @@
 \RequirePackage{keyval}
 \RequirePackage{caption3}
 \@ifpackagelater{caption3}{2007/04/11 v3.0q}{}{\PackageError
-    {floatrow}{For a successful cooperation we need at least\MessageBreak
+    {floatrowpf}{For a successful cooperation we need at least\MessageBreak
     version `2007/04/11 v3.0q' of package caption,\MessageBreak
         but only version\MessageBreak
           `\csname ver@caption.\@pkgextension\endcsname'\MessageBreak
@@ -62,7 +71,7 @@
 \@ifundefined{c@figure}%
   {\setcounter{float@type}{1}}%
   {\setcounter{float@type}{4}}
-\newcommand\flrow@package{floatrow}
+\newcommand\flrow@package{floatrowpf}
 \newcommand*\flrow@error[1]{\PackageError\flrow@package{#1}\flrow@eh}
 \newcommand*\flrow@eh{%
   If you do not understand this error, please take look\MessageBreak
@@ -114,7 +123,8 @@
 \newcommand\flrow@restyle[1]{%
   \@namedef{#1}{\killfloatstyle\def\@captype{#1}\FR@redefs
     \flrow@setlist{{#1}}%
-    \textwidth\columnwidth\edef\FBB@wd{\the\columnwidth}%
+    %\textwidth\columnwidth <-- error in two-column layout
+    \edef\FBB@wd{\the\columnwidth}%
     \FRifFBOX\@@setframe\relax\@@FStrue\@float{#1}}%
   \@namedef{#1*}{\killfloatstyle\def\@captype{#1}\FR@redefs
     \flrow@setlist{{#1}{widefloat}{wide#1}}%
@@ -452,7 +462,7 @@
   \@tempa{#1\@mkboth{\MakeUppercase{#1}}{\MakeUppercase{#1}}}}%
 \newcommand\float@addtolists[1]{%
   \def\float@do##1{\addtocontents{##1}{#1}} \the\float@exts}
-\PackageInfo{floatrow}{Modified float package code loaded}
+\PackageInfo{floatrowpf}{Modified float package code loaded}
 \IfFileExists{rotating.sty}{\@tempswatrue}{\@tempswafalse}
 \if@tempswa
   \let\rotfloat@HH\@float@HH
@@ -470,7 +480,7 @@
       \@rotdblfloat{}[]%
       \ifFBbuild\rotfloat@@makebox{#1}\else\box\@currbox\fi
       \end@rotdblfloat}}
-\PackageInfo{floatrow}{Modified rotfloat package code loaded}
+\PackageInfo{floatrowpf}{Modified rotfloat package code loaded}
 \fi
 \@ifdefinable\FR@everyfloat{\newtoks\FR@everyfloat}
 \FR@everyfloat={\let\@footnotetext\@mpfootnotetext
@@ -516,7 +526,7 @@
   \@ifnextchar[{\FB@nc{#1}{#2}}{\FB@nc{#1}{#2}[]}}
 \newcommand\renewfloatcommand[2]{%
   \@ifundefined{#1}{}%
-    {\PackageInfo{floatrow}{Redefining \string#1}}%
+    {\PackageInfo{floatrowpf}{Redefining \string#1}}%
   \@ifnextchar[{\FB@nc{#1}{#2}}{\FB@nc{#1}{#2}[]}}
 \@ifdefinable\FB@nc{}\@ifdefinable\FB@@nc{}
 \def\FB@nc#1#2[#3]{%
@@ -1469,4 +1479,4 @@
 \if@tempswa\RequirePackage{fr-longtable}\fi}
 \endinput
 %%
-%% End of file `floatrow.sty'.
+%% End of file `floatrowpf.sty'.
-- 
2.7.4


