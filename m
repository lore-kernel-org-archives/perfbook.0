Return-Path: <SRS0=3f/+=CH=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687186724; x=1689778724;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfaM7Gej1rZtJS3+2scnppuY0/Ur0aTF+yuvGAyQpkQ=;
        b=FA3PBFhc6uJKGTiHqEsX+nC3XLYEVG4qV39L0ynF+xpP34NIxEwvGgHsWnGQmeSdQB
         jEuga6dvTTVsYa3wOmPufV+ovHxcJOAyJtMZAGDM1jtBDC67VgynsRJfky3jXjkCQRU1
         djDhB/YWNGiHFFyUquPOa+fl2wXsfnkRkoSvI4VNysdcyFGcCmXWJVaGOIuFJK2CL7Gp
         qPzQ4dJ43bbur+fh8QMjbgVKUiBwVTDPwqVAclvlXuDk1kgpoiMdXDMdhme80SDEhgIO
         X2xr4S5OE5PENXjLPspBgxHoghvxvDG48fXk2QWTotHkLKFEO8SrQh956TWi7W6Diieq
         lHkQ==
Message-ID: <d52b2618-3c84-63f1-cf39-ccec9d789a0e@gmail.com>
Date: Mon, 19 Jun 2023 23:58:41 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] appendix/questions: Address potential orphaned
 epigraph
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Commit 3566689d0c01 ("questions: Add section-level epigraphs")
added an epigraph just above a figure environment.
This makes cleverefcheck.pl complain:

    ./appendix/questions/time.tex:11:\begin{figure}
    ^^^ environment next to epigraph ^^^

Move the figure environment bottom of the first paragraph in the
section and prevent the epigraph from (potentially) ending up in
the bottom of a column/page.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

You might have wondered what cleverefcheck.pl complained about.
At the moment, there is no epigraph actually orphaned, but
let's just silence the complaint.

        Thanks, Akira
--
 appendix/questions/time.tex | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/appendix/questions/time.tex b/appendix/questions/time.tex
index a4ce11ed5bb0..49961966525a 100644
--- a/appendix/questions/time.tex
+++ b/appendix/questions/time.tex
@@ -8,13 +8,6 @@
 \epigraph{Time is a game played beautifully by children.}
 	 {Heraclitus}
 
-\begin{figure}
-\centering
-\resizebox{2.6in}{!}{\includegraphics{cartoons/r-2014-What-time-is-it}}
-\caption{What Time Is It?}
-\ContributedBy{Figure}{fig:app:questions:What Time Is It?}{Melissa Broussard}
-\end{figure}
-
 A key issue with timekeeping on multicore computer systems is illustrated
 by \cref{fig:app:questions:What Time Is It?}.
 One problem is that it takes time to read out the time.
@@ -27,6 +20,13 @@ protocol (NTP) adjustments, and so on.
 So does the time eventually returned correspond to the beginning of
 the resulting time interval, the end, or somewhere in between?
 
+\begin{figure}
+\centering
+\resizebox{2.6in}{!}{\includegraphics{cartoons/r-2014-What-time-is-it}}
+\caption{What Time Is It?}
+\ContributedBy{Figure}{fig:app:questions:What Time Is It?}{Melissa Broussard}
+\end{figure}
+
 Worse yet, the thread reading the time might be interrupted or preempted.
 Furthermore, there will likely be some computation between reading out
 the time and the actual use of the time that has been read out.

base-commit: 3566689d0c01e93c1c0552ddff95b6d4b04ca2ed
-- 
2.25.1

