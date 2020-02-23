Return-Path: <SRS0=vn7n=4L=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Qc7b3KnN8Pt/dnHmVszhZu1WBDZIg1UBb3IitKojB04=;
        b=nIL/7irL4XgdZq2fNAvqUxLKWrWKpdxF7vgKEaLd8bCQiAMKxidKOUoHhiruAn1fEO
         SmkwI/KdGyNdf/PphMwkEX2z9y45wBXUt36Ga1HseYUcJAoXoPsUXoBnYWRP+9d/5sZC
         MtqlUKRyz6h7j4iRYMX6tHlq60GhWe37hpaVzfPiZ0g/XGc/6qN58XnOIRIbSK805Xrm
         YidUumvzPHZI16kx+4UBZTZ9U5t4sOJe+sk4efOLwr8IIe7tifdlRMRgfCz4qR4MveUn
         0dp/kuOVmLWX2SJn+uSVjBgjcyNGe5+jTuzey887HF9Y3+/mc8UsRGFFXqmIdLvrtA2N
         /YwQ==
Subject: [PATCH 2/2] Define and use \qtco{} to cover string containing
 breakable sequence
References: <ca6192b8-eeb4-4b9d-ba29-d46609fb340b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <11aa8ea3-31ed-e973-616e-c3e2be65e345@gmail.com>
Date: Mon, 24 Feb 2020 08:05:03 +0900
MIME-Version: 1.0
In-Reply-To: <ca6192b8-eeb4-4b9d-ba29-d46609fb340b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>, =?UTF-8?B?0JTQvNC40YLRgNC40Lkg0JTRjNGP0YfQtdC90LrQvg==?= <dimhen@gmail.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From aae17418193531c6d1cf8d7cb4721a4ef8b956d6 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 9 Feb 2020 09:15:39 +0900
Subject: [PATCH 2/2] Define and use \qtco{} to cover string containing breakable sequence

Fix problematic behavior of \qco{}, whose width estimation is
affected by our breakable sequences of characters "->" and "_".

The issue was once fixed by commit 99b31e87fd0d ("Improve definition
of \nbco{} and \qco{}"), but it has been reverted because "examplep"
package has lost compatibility with up-to-date TeX Live.

This commit works around the issue by defining another macro
"\qtco{}" and using it instead.

Hopefully, we can revert both of the commits when examplep restores
its compatibility.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuapi.tex         | 2 +-
 defer/rcufundamental.tex | 2 +-
 formal/dyntickrcu.tex    | 2 +-
 perfbook.tex             | 1 +
 4 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index 8a9baebc..9a8f3e7d 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -872,7 +872,7 @@ Table~\ref{tab:defer:RCU Diagnostic APIs}
 shows RCU's diagnostic APIs.
 
 The \co{__rcu} marks an RCU-protected pointer, for example,
-\qco{struct foo __rcu *p;}.
+\qtco{struct foo __rcu *p;}.
 Pointers that might be passed to \co{rcu_dereference()} can be marked,
 but pointers holding values returned from \co{rcu_dereference()}
 should not be.
diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index 08d30cc0..16bef732 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -136,7 +136,7 @@ emits a single load instruction, just as would the equivalent single-threaded
 code.
 The coding restrictions are described in more detail in
 Section~\ref{sec:memorder:Address- and Data-Dependency Difficulties},
-however, the common case of field selection (\qco{->}) works quite well.
+however, the common case of field selection (\qtco{->}) works quite well.
 Software that does not require the ultimate in read-side performance
 can instead use C11 acquire loads, which provide the needed ordering and
 more, albeit at a cost.
diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index 5465de85..00642584 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -936,7 +936,7 @@ line of \co{dyntick_nohz()}.
 
 \QuickQuiz{}
 	\begin{fcvref}[ln:formal:promela:dyntick:dyntickRCU-irqnn-ssl:dyntick_irq]
-	Why are \clnref{clr_in_irq,inc_i} (the \qco{in_dyntick_irq = 0;}
+	Why are \clnref{clr_in_irq,inc_i} (the \qtco{in_dyntick_irq = 0;}
 	and the \qco{i++;}) executed atomically?
 	\end{fcvref}
 \QuickQuizAnswer{
diff --git a/perfbook.tex b/perfbook.tex
index cc936e47..a5ac180b 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -261,6 +261,7 @@
 \newcommand{\qco}[1]{``\nbco{#1}''} % \nbco with quotation marks
 \newcommand{\tco}[1]{\texttt{\detokenize{#1}}} % for code in tabular environment
 % \tco{} will break at spaces but not at underscores
+\newcommand{\qtco}[1]{``\hbox{\tco{#1}}''} % \tco with quotation marks
 \newcommand{\lopt}[1]{\tco{-}\tco{-}\tco{#1}} % to avoid "--" to endash conversion
 \newcommand{\nf}[1]{\textnormal{#1}} % to return to normal font
 \newcommand{\qop}[1]{{\sffamily #1}} % QC operator such as H, T, S, etc.
-- 
2.17.1


