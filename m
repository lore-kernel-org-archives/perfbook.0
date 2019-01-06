Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=O7KnSu4Q5j9Eh0NDoo/qyRsuamby98WaAp1tk+AC6C0=;
        b=jAZneARp8qlWBfePDXvPjKxjNdfi98pQvmLszBg077HtQeuH9Tb6NNIXnkh0LSBYog
         yDF4tBTRtMYJOnSoVmuB+gAQn+3gxDANhoNRwQ/nUNRYJWsijvbh7LsLrJzVRKnf9zJd
         1h0pvDfPrpM8OXx6B/vk1Ucrd20YIWXteRROXWyZTfj1oqn81dZrXhE7vJ3YANHxs8Yt
         ulU6bf2QKxFD2jEkBEAyaKv0181fqbB+g6p+m92xHjU51+1LOt6Nxqp6sHFvkL5owNu5
         oErPgN/dyGmYhySiNJTIpV3a9Sfhny9HJiAVpfgkQdUA/mTQA2dmJxaV4Dt0C2w/HrwN
         FQnQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] debugging: Define and use '\lopt' macro in description
 heading
Message-ID: <4f6647ef-05cb-d911-a233-eeb3c382f8af@gmail.com>
Date: Sun, 6 Jan 2019 09:11:13 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 0b95993bbe36699a9e5fcc19cf28bcbba2decc06 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 6 Jan 2019 08:40:33 +0900
Subject: [PATCH] debugging: Define and use '\lopt' macro in description heading

Reduce "ugliness" of workaround in commit 66b12d0a4b87 ("debugging:
Leave double dashes in description headings") using a macro.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Cc: SeongJae Park <sj38.park@gmail.com>
---
Hi,

I'm wondering why I didn't notice the conversion to endash when I
submitted commit 7842c988b1d5 ("debugging: Convert to 'description'").

While \tco{} is already a workaround, it should be a better approach
to define a macro when you do the same thing repeatedly.

I'll update the style guide to mention this workaround.

        Thanks, Akira
--
 debugging/debugging.tex | 6 +++---
 perfbook.tex            | 1 +
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index 5b2ce27..37d9022 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -2287,15 +2287,15 @@ and output consists of one line for each input line, with fields as follows:
 This script takes three optional arguments as follows:
 
 \begin{description}
-\item	[\tco{-}\tco{-divisor}\nf{:}] Number of segments to divide the list
+\item	[\lopt{divisor}\nf{:}] Number of segments to divide the list
 	into, for example, a divisor of four means that the first quarter of
 	the data elements will be assumed to be good.
 	This defaults to three.
-\item	[\tco{-}\tco{-relerr}\nf{:}] Relative measurement error.  The script
+\item	[\lopt{relerr}\nf{:}] Relative measurement error.  The script
 	assumes that values that differ by less than this error are for all
 	intents and purposes equal.
 	This defaults to 0.01, which is equivalent to 1\,\%.
-\item	[\tco{-}\tco{-trendbreak}\nf{:}] Ratio of inter-element spacing
+\item	[\lopt{trendbreak}\nf{:}] Ratio of inter-element spacing
 	constituting a break in the trend of the data.
 	For example, if the average spacing in the data accepted so far
 	is 1.5, then if the trend-break ratio is 2.0, then if the next
diff --git a/perfbook.tex b/perfbook.tex
index ce85570..1799bfb 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -159,6 +159,7 @@
 \newcommand{\qco}[1]{``\nbco{#1}''} % \nbco with quotation marks
 \newcommand{\tco}[1]{\texttt{\detokenize{#1}}} % for code in tabular environment
 % \tco{} will break at spaces but not at underscores
+\newcommand{\lopt}[1]{\tco{-}\tco{-}\tco{#1}} % to avoid "--" to endash conversion
 \newcommand{\nf}[1]{\textnormal{#1}} % to return to normal font
 \newcommand{\qop}[1]{{\sffamily #1}} % QC operator such as H, T, S, etc.
 
-- 
2.7.4

