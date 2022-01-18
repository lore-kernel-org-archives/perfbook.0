Return-Path: <SRS0=7ZAc=SC=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qTZgZiGfqWMNz35aAbzaNtRw9rXaMLgRTWwu+dPAwyk=;
        b=RgKxn2YcLGaaLdpJm6KidxUBi+bum+HF0jkUIAE73c1VZbLtc/rFViPx31iKyqumJQ
         5rbhynVLuOfNL83QnEgkrJAkQzpA0R9ofaKfXVRZgwfoABaa6GBaQKQ+k1XnoU/ilJU0
         3PbvTyZB2PHC22ce+2/tvTpWoz1PQ7xlmruhwI+Nhk2/4fto7TrO6b4vO9LaDKJcz7hw
         5UJkkaNEC1jf6WmjPdhALV/7ilLWWK1khAKD5aRnRVX+3d9ZmCBhSVXV0R572dtFTgj5
         cBUIl9oHpexXeI5w+5NQ29XlN+Kwc0oR99hWivSZ9nDHgpjyi4BEjXO0rozNELOl5wer
         nRwg==
Subject: [PATCH -perfbook 6/6] index: Retouch prenotes
References: <014dcadf-e5ff-3a73-3b5a-a7951375d642@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <842878f6-c24f-747d-f417-3450db0fe0d1@gmail.com>
Date: Tue, 18 Jan 2022 19:57:56 +0900
MIME-Version: 1.0
In-Reply-To: <014dcadf-e5ff-3a73-3b5a-a7951375d642@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Concise note on general index is suggested by Paul.

Suggested-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index a5bb32c5..085ce55d 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -682,14 +682,24 @@
 }
 \printglossary[type=\acronymtype]
 \phantomsection
-\setindexprenote{\footnotesize Note on page number styles:
-  \BF{Bold} indicates fair amount of discussion,
-  \GL{underline} indicates a definition in glossary or elsewhere.}
+\setindexprenote{%
+  \hfill\begin{minipage}{1in}
+    \footnotesize%
+    \BF{Bold}: Major reference.
+    \GL{Underline}: Definition.
+    \vspace*{1ex}
+  \end{minipage}
+}
 \printindex
 \phantomsection
-\setindexprenote{\footnotesize (c):~Cxx standard, (g):~GCC extension,
-  (k):~Linux kernel, (kh):~Linux kernel historic, (pf):~perfbook CodeSamples,
-  (px):~POSIX, (ur):~userspace RCU}
+\setindexprenote{%
+  \hfill\begin{minipage}{2.6in}
+    \footnotesize (c):~Cxx standard, (g):~GCC extension,
+    (k):~Linux kernel, (kh):~Linux kernel historic, (pf):~perfbook CodeSamples,
+    (px):~POSIX, (ur):~userspace RCU\@.
+    \vspace*{1ex}
+  \end{minipage}
+}
 \printindex[api]
 \IfEbookSize{}{
 \restoregeometry
-- 
2.17.1


