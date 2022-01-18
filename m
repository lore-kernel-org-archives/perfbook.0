Return-Path: <SRS0=7ZAc=SC=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uI0abCxCdD8njPFTQ8K8xzgAf0vGUfAAdKXq1jPVioE=;
        b=Jn54FXWRFcDtWLvQz73TrgUCi+c5BmM1/+XPBg8knvnxw/CW5pIRQqDejg2+uWY0ih
         o8ypcOhm5i7kTZZ3yu3cpRmU7BLWbbcb5rg0QsCASnWn2q6Kcv8cWtkKfDEAm9s5mE9X
         q0oZJGO5pmRNx18nPGfjO5ul8w+mA6Xx/87RM1ZC+QGNjWQqy3SxonPqRdU/WuWgy4wY
         g6dV4i45afR2OqYfABHzHQQZbDA9/Iv0AP4BVGQlB29tIvA9Lkf1unw4ZDrAuSGRXfQB
         k2dEkwln60/0U9XMvukyQsaW9/ckywVcOnaNOAmNtji5TIEXBoSulD1TdrMvoCtlCrXF
         q0HA==
Subject: [PATCH -perfbook 3/6] defer: POC of hierarchical index with modifier
 part's case preserved
References: <014dcadf-e5ff-3a73-3b5a-a7951375d642@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b01f0001-01a1-357a-5377-ff72150ba708@gmail.com>
Date: Tue, 18 Jan 2022 19:55:18 +0900
MIME-Version: 1.0
In-Reply-To: <014dcadf-e5ff-3a73-3b5a-a7951375d642@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

\IXhmr{}{} and \IXhmrpl{}{} are for index of

   Critical section, RCU read-side

, where the modifier part needs to preserve case (in this example
"RCU").

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcufundamental.tex |  2 +-
 defer/rcuintro.tex       |  2 +-
 perfbook-lt.tex          | 14 ++++++++++++++
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index ed2ce21c..d7695a1c 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -198,7 +198,7 @@ scenarios, and memory-leak hazards that are inherent in schemes
 using explicit tracking.
 
 In RCU's case, each of the things waited on is called an
-\emph{RCU read-side critical section}.
+\emph{\IXBhmr{RCU read-side}{critical section}}.
 As noted in
 \cref{tab:defer:Core RCU API}, an RCU read-side critical
 section starts with an \co{rcu_read_lock()} primitive, and ends with a
diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
index 069ccfd7..bc968ae3 100644
--- a/defer/rcuintro.tex
+++ b/defer/rcuintro.tex
@@ -196,7 +196,7 @@ The full API is covered in \cref{sec:defer:RCU Linux-Kernel API}.
 
 Three members of the core APIs are used by readers.
 The \apik{rcu_read_lock()} and \apik{rcu_read_unlock()} functions delimit
-RCU read-side critical sections.
+\IXhmrpl{RCU read-side}{critical section}.
 These may be nested, so that one \co{rcu_read_lock()}--\co{rcu_read_unlock()}
 pair can be enclosed within another.
 In this case, the nested set of RCU read-side critical sections act as
diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 79de56c1..ff257bcc 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -182,15 +182,21 @@
   \lowercase{\def\tempb{#2}}%
   \expandafter\index\expandafter{\temp@\makefirstuc{\temp}!\tempb}%
 }
+\newcommand{\ucindexhm}[2]{%
+  \lowercase{\def\temp{#1}}%
+  \expandafter\index\expandafter{\temp@\makefirstuc{\temp}!#2}%
+}
 \newcommand{\indexhraw}[2]{%
   \expandafter\index\expandafter{#1!#2}%
 }
 \IfIndexHier{
 \newcommand{\indexh}[3]{\ucindexh{#2}{#3}}
 \newcommand{\indexhr}[3]{\indexhraw{#2}{#3}}
+\newcommand{\indexhmr}[3]{\ucindexhm{#2}{#3}}
 }{
 \newcommand{\indexh}[3]{\ucindex{#1}}
 \newcommand{\indexhr}[3]{\index{#1}}
+\newcommand{\indexhmr}[3]{\index{#1}}
 }
 
 \newcommand{\IX}[1]{\ucindex{#1}\hlindex{#1}} % put with first letter capitalized into general index
@@ -203,8 +209,12 @@
 \newcommand{\IXh}[2]{\indexh{#1 #2}{#2}{#1}\hlindex{#1 #2}}
 \newcommand{\IXhpl}[2]{\indexh{#1 #2}{#2}{#1}\hlindex{#1 #2s}}
 \newcommand{\IXhr}[2]{\indexhr{#1 #2}{#2}{#1}\hlindex{#1 #2}}
+\newcommand{\IXhrpl}[2]{\indexhr{#1 #2}{#2}{#1}\hlindex{#1 #2s}}
+\newcommand{\IXhmr}[2]{\indexhmr{#1 #2}{#2}{#1}\hlindex{#1 #2}}
+\newcommand{\IXhmrpl}[2]{\indexhmr{#1 #2}{#2}{#1}\hlindex{#1 #2s}}
 \newcommand{\IXalth}[3]{\indexh{#1}{#3}{#2}\hlindex{#1}}
 \newcommand{\IXalthr}[3]{\indexhr{#1}{#3}{#2}\hlindex{#1}}
+\newcommand{\IXalthmr}[3]{\indexhmr{#1}{#3}{#2}\hlindex{#1}}
 % page number in bold face
 \newcommand{\BF}[1]{\textbf{#1}}
 \newcommand{\IXB}[1]{\ucindex{#1|BF}\hlindex{#1}} % put with first letter capitalized into general index
@@ -217,8 +227,12 @@
 \newcommand{\IXBh}[2]{\indexh{#1 #2|BF}{#2|BF}{#1}\hlindex{#1 #2}}
 \newcommand{\IXBhpl}[2]{\indexh{#1 #2|BF}{#2|BF}{#1}\hlindex{#1 #2s}}
 \newcommand{\IXBhr}[2]{\indexhr{#1 #2|BF}{#2|BF}{#1}\hlindex{#1 #2}}
+\newcommand{\IXBhrpl}[2]{\indexhr{#1 #2|BF}{#2|BF}{#1}\hlindex{#1 #2s}}
+\newcommand{\IXBhmr}[2]{\indexhmr{#1 #2|BF}{#2|BF}{#1}\hlindex{#1 #2}}
+\newcommand{\IXBhmrpl}[2]{\indexhmr{#1 #2|BF}{#2|BF}{#1}\hlindex{#1 #2s}}
 \newcommand{\IXBalth}[3]{\indexh{#1|BF}{#3|BF}{#2}\hlindex{#1}}
 \newcommand{\IXBalthr}[3]{\indexhr{#1|BF}{#3|BF}{#2}\hlindex{#1}}
+\newcommand{\IXBalthmr}[3]{\indexhmr{#1|BF}{#3|BF}{#2}\hlindex{#1}}
 %
 \newcommand{\apic}[1]{\hlindex{\co{#1}}\sindex[api]{#1@\co{#1}\categapi{c}}}
 \newcommand{\apig}[1]{\hlindex{\co{#1}}\sindex[api]{#1@\co{#1}\categapi{g}}}
-- 
2.17.1


