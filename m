Return-Path: <SRS0=rne+=X7=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CLyo9Q3edGa1YZfBdW6Tyeoiv0PxzWuPMdVLK4KOyqw=;
        b=cqNeNufNORogvNRkl7oiKKFLq1suhJ1rI7EO5jkl9H/luklGaypNyPHFlNMNyLBHXx
         iY9p2fIJd2Nu1XV5pkRFcdwaTKVArNkMEi4/y21/Mm3tgUq5l5OnP0CSOpRs0X1kelKe
         xDJuowpEQf+2ceHWjoXL1jqRHutGnwjGP1iQMagn8hcMQhRi/zS6Lr8yBQkhJ+VlJB+V
         BOiqFlIoWIMeiZ2+JqQDxGiZutsOFeX9vCuqL7rxdsck/c1DQ89VwI48gdZgNI6iTMl8
         1T2ZVjrNlWwP2HJ9jwP4Q5XfDY1QafaqFyJTETJg5OeQHagPmMwVN8Z2HENtM/JC5GhP
         O29A==
Subject: [PATCH 2/3] Tell 'cleveref' to respect Oxford comma
References: <dd51b8e0-71b8-0214-a6a7-d48988462f52@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <fe447fa4-ccb3-6b2c-42d7-9fb9e76fb8bf@gmail.com>
Date: Mon, 7 Oct 2019 00:21:21 +0900
MIME-Version: 1.0
In-Reply-To: <dd51b8e0-71b8-0214-a6a7-d48988462f52@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From cade0553582a6aa4792939fffd561424436af561 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 29 Sep 2019 00:14:13 +0900
Subject: [PATCH 2/3] Tell 'cleveref' to respect Oxford comma

Also suppress aggressive compression mode of cleveref,
which compress e.g.:

    Listings 12.18, 12.19, and 12.20

into

    Listings 12.18--12.20

by the option "nosort".

"nosort" supresses both the sorting and compression of successive
references.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/perfbook.tex b/perfbook.tex
index 6eae887c..06019496 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -175,10 +175,11 @@
 \captionsetup{hangindent=20pt}
 \captionsetup[listing]{hangindent=20pt}
 
-\usepackage[capitalise,noabbrev]{cleveref}
+\usepackage[capitalise,noabbrev,nosort]{cleveref}
 \crefname{subsubsubappendix}{Appendix}{Appendices}
 \crefname{sublisting}{Listing}{Listings}
 \newcommand{\crefrangeconjunction}{--}
+\newcommand{\creflastconjunction}{, and~}
 
 % Define \clnref{} and \Clnref{} for reference to line labels
 \newcounter{lblcount}
@@ -204,6 +205,7 @@
 \newcommand{\Clnref}[1]{\clnrefp{#1}{Line}}
 \newcommand{\clnrefrange}[2]{lines~\lnref{#1}--\lnref{#2}}
 \newcommand{\Clnrefrange}[2]{Lines~\lnref{#1}--\lnref{#2}}
+
 \begin{document}
 
 %%HTMLSKIP
-- 
2.17.1


