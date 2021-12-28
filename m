Return-Path: <SRS0=u77P=RN=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vaVmZOy++8KQjR7bwIMXRHudsp1vi+79jmNAE36dXrQ=;
        b=QGbgDQbmiwFR8HxY1uJ5f2NZO4yIvVnSpIGMwinKmkTQ+t9PL0CQUTMagEcGHQA78h
         4L0brdk3sTDVvecyStBLR1YRDuIQ1n8hXYXRQZg9oLl+aRJuTbBgFyqWnQuO1yucqr4V
         NdOHUoMf++VlDke9JpbG6whRwTqJeW593XTLSFyAlYAmKbU7Z9ZV03kXGqGvh0ZE346B
         AzU3hCuckf1niMPxuSdSphSxvYszg3MApPpsm48KR3goVyLZbcHfFC//XQraYxZvBdz2
         GQWfB4SjCyCaB9d05NYybpq1x+Jl+dI3K5ZJrnVmalV3GCq9T7Q7t4/+RncaGOWkG1sP
         iGiQ==
Subject: [PATCH -perfbook 3/4] ebook: Use normal epigraph for chapter headings
References: <4fde622a-0aa3-e6df-1b20-1469ed676813@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <51500ad1-8181-9cc9-653f-8a9d11a81309@gmail.com>
Date: Tue, 28 Dec 2021 23:31:18 +0900
MIME-Version: 1.0
In-Reply-To: <4fde622a-0aa3-e6df-1b20-1469ed676813@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The \epigraphhead command (of epigraph package) redefines chapter
page style.  This overwrites fancyhdr's settings.
Also, the epigraphs above chapter titles sometime look busy in
ebook-sized builds.

Therefore, switch to normal style epigraphs printed below chapter
headings for ebook-sized builds.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index ec3e38e1..c45d033c 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -509,7 +509,11 @@
 %\newcommand{\IRQ}{irq}      % For those who prefer "irq"
 \newcommand{\rt}{\mbox{-rt}} % to prevent line break behind "-"
 
-\newcommand{\Epigraph}[2]{\epigraphhead[65]{\epigraph{#1}{#2}}}
+\IfEbookSize{
+  \newcommand{\Epigraph}[2]{\epigraph{#1}{#2}}
+}{
+  \newcommand{\Epigraph}[2]{\epigraphhead[65]{\epigraph{#1}{#2}}}
+}
 
 \input{ushyphex} % Hyphenation exceptions for US English from hyphenex package
 \input{pfhyphex} % Hyphenation exceptions for perfbook
-- 
2.17.1


