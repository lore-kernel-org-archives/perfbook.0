Return-Path: <SRS0=u77P=RN=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=v9jQ7x/RiHNVJG/WZDig5xoqBQ2xfncXqEX3OqTP458=;
        b=FWMsw/XUqcbZgxDrSyYsyXeUhryDdmGVJf8JjWaTopVlLsd63H5eEVh1x0N1fu0ivQ
         fPg0RWXmAYPi5Q5KAa75wHO9UUUyeCqbJjOlf+LpyUGfeMF3uqXT0x7JRgf2TQSzXMwP
         7DCgF0d/775LvJBt7NT9DELHOsBh/On2VyOWDa/Q9mVF3M54yOtQPvI/bmq7XpsReMoC
         OJHWZUf3MrKZFp0l7Nbbk9CQaFlu2LFrAxAygtr+MgN5C4aDI+Dyd3fKSJKOlg/7ZkYF
         o8fvQGyLX1xwKcFCnd6jbmVs4lpENUFle0A7U+4VEpcWMDSvRp5jwhKHFK7+wuSzxEhL
         KuAA==
Subject: [PATCH -perfbook 1/4] ebook: Allocate enough width for four-digit
 page counts in TOC
References: <4fde622a-0aa3-e6df-1b20-1469ed676813@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2ef395db-5c2f-a7a2-ddaa-d41fe1e7cb25@gmail.com>
Date: Tue, 28 Dec 2021 23:27:06 +0900
MIME-Version: 1.0
In-Reply-To: <4fde622a-0aa3-e6df-1b20-1469ed676813@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Width of page counts in TOC is maintained as a LaTeX command named
\@pnumwidth (defined and referenced in book.cls) with the default
width of 1.55em.

1.55em can cover up to three-digit (< 1000) pages.

In ebook-sized builds, the page count exceeds 1000.
Four-digit pages can be covered by 2.2em (for the slightly wider
sans-serif font).

Conditionally redefine \@pnumwidth in "eb" builds.

Note:
  Final page count of 1c build is 914 now.
  When it exceeds 1000, \IfTwoColumn should be used instead for
  the conditional.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index e8acf779..eb5c31d6 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -151,6 +151,13 @@
 \setboolean{indexhier}{true}
 \newcommand{\IfIndexHier}[2]{\ifthenelse{\boolean{indexhier}}{#1}{#2}}
 
+% Widen pnumwidth in TOC for ebook size build (more than 1000 pages)
+\makeatletter
+\IfEbookSize{
+\renewcommand*\@pnumwidth{2.2em}
+}{}
+\makeatother
+
 \IfEbookSize{
 \usepackage[section]{placeins}
 }{
-- 
2.17.1


