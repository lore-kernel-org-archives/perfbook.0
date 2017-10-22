Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hDt1Z97flIs3XQIng1aUMZ1atw/Db5UmbzHx19nwZ4Q=;
 b=KGhHhAxPqpif3s+z3XljyWh0BszYgjhiYKEsfSUPuvD6pOHaupiqAquUl1dDFQxy1Q
 E/Uhr3s0tuNxpQ1IidfE5thMnhk4/Z/rNfzsKZt0cz1hKPBiFiM/mCa90xzG+t/I1n1o
 4IE+xHmW4a/pft38/pF98Oic2t83K1u6mdX5uD1vhhLHidy+0uvo+yRE6beaVoBDvtDx
 MznYKXNg8QVV9Uwz/vMwNUP5qFuui3mwVnUrugVQeL6Z0i9dXmUNANa1FQODdz1d6Ose
 Ci9spry6PmKyk9cunbzPu6KpKa0ptIb6cNwOJFSZh36SbGhxdQaLqEpLAacQeWU+0spL
 BqOg==
Subject: [PATCH] advsync/rt: Restore epigraph under section
References: <458f0875-24ae-d62b-6448-152affe8fb7c@gmail.com>
 <20171021171459.GM3521@linux.vnet.ibm.com>
 <a3fafdfc-4791-e648-204c-e879717a929a@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <669ca5d5-c8e6-9ffe-8c39-97b94c80e30b@gmail.com>
Date: Sun, 22 Oct 2017 09:21:54 +0900
MIME-Version: 1.0
In-Reply-To: <a3fafdfc-4791-e648-204c-e879717a929a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 101b029a0d2ab0296d51556a305099e73c6156e2 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 22 Oct 2017 09:03:58 +0900
Subject: [PATCH] advsync/rt: Restore epigraph under section

By using the \epigraph{} command, sections can have their own
epigraphs. The \noindent command is to keep afterheading-ness.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/rt.tex | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/advsync/rt.tex b/advsync/rt.tex
index 4d86c5d..ebbb2f4 100644
--- a/advsync/rt.tex
+++ b/advsync/rt.tex
@@ -3,9 +3,10 @@
 \section{Parallel Real-Time Computing}
 \label{sec:Parallel Real-Time Computing}
 %
-%\Epigraph{The difference between you and me is that I was right in time.}
-%	 {\emph{Konrad Adenauer}}
+\epigraph{The difference between you and me is that I was right in time.}
+	 {\emph{Konrad Adenauer}}

+\noindent%
 An important emerging area in computing is that of parallel real-time
 computing.
 Section~\ref{sec:advsync:What is Real-Time Computing?}
-- 
2.7.4


