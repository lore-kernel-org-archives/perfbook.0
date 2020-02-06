Return-Path: <SRS0=TPJ8=32=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=68k3PGPsPeyynIVo+f654HWbDVZhUN8+mhvNPuWHowI=;
        b=fDwnU6ymD3dzyyMyQW3lxIWm35xAo+yQEz8TIKl/sRtVgzEDwBPGZ6e7K8a5uBDpD5
         4hgx80xjbx8LsiKD2RvAzHvG7edL1ruaVGqmj730N0xjHElW66+7leUk9xgjQy6E5YBZ
         PciMJpfKXdviahH1pfZXz16CES9+rAtum9SmMQLyED7RVkcTKuqM+dySQgyHr+xikFSt
         sRAGlG9bRF/m/CkLz3ssuvUCyupUcTz7uk3FohzuE17LkVY6/elqUho7kICqCqn40Kz9
         ujnx8AB2HQs8HYaaV3CRrrIjUZzecbvJ4EGxm3rAdpnVjEmOrq92KL13RaFskZygOFLf
         MOyw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] Permit occasional orphans
Message-ID: <8953d302-fa2b-da51-f555-52b0ef94612a@gmail.com>
Date: Fri, 7 Feb 2020 07:40:55 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 6ad4c736867394d765a4b50aba907ef0dd8420ba Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 6 Feb 2020 22:16:28 +0900
Subject: [PATCH] Permit occasional orphans

Recent update of upstream LaTeX caused excessively wide spaces between
paragraphs in 2c layout similar to the issue mentioned in the change
log of commit 4c6ee39761a0 ("Remove required version of 'epigraph'")
at the beginning of Chapter 6.

The root cause of the unstable behavior is the constraints imposed
by the unfortunate combination of a fairly tall unbreakable block
(consisting of a section heading, a section epigraph, a paragraph
of only 3 lines), a footnote, and a floating figure.

Note that the "nowidow" package requires at least 4 lines for a
paragraph to be broken.

An orphan line (first line of a paragraph at the bottom of a page/column)
looks less ugly than a widow line (final line of a paragraph at the top
of a page/column) does.

As a band-aid patch, this commit permits an orphan at the problematic
paragraph by the \noclub command provided by the "nowidow" package
and avoids such ugly wide spaces.
Another approach would be to add some words to the paragraph and
make it 4 lines or more.

By this change, TeX Live 2015/Debian (on Ubuntu Xenial) with the
up-to-date "epigraph" can also produce the (mostly) same output.

Do similar tweaks to avoid wide vertical spaces in a couple of other
chapters.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

As mentioned in the change log, if you add some words to the
paragraph in partexercises.tex, the \noclub[1] can be removed.
In the other places, the problem is not the length of the
paragraph and you need different tweaks to avoid orphans.
Let me see what the tweaks would be. 

        Thanks, Akira

 SMPdesign/partexercises.tex | 1 +
 debugging/debugging.tex     | 1 +
 locking/locking.tex         | 1 +
 3 files changed, 3 insertions(+)

diff --git a/SMPdesign/partexercises.tex b/SMPdesign/partexercises.tex
index 9cebe6b7..1708da93 100644
--- a/SMPdesign/partexercises.tex
+++ b/SMPdesign/partexercises.tex
@@ -12,6 +12,7 @@
 
 This section uses a pair of exercises (the classic Dining Philosophers
 problem and a double-ended queue) to demonstrate the value of partitioning.
+\noclub[1]
 
 \subsection{Dining Philosophers Problem}
 \label{sec:SMPdesign:Dining Philosophers Problem}
diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index 286f6df7..07350fe1 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -2256,6 +2256,7 @@ Section~\ref{sec:debugging:Detecting Interference Via Measurement}
 describes methods of rejection involving additional measurements,
 while Section~\ref{sec:debugging:Detecting Interference Via Statistics}
 describes statistics-based rejection.
+\noclub[1]
 
 \subsubsection{Detecting Interference Via Measurement}
 \label{sec:debugging:Detecting Interference Via Measurement}
diff --git a/locking/locking.tex b/locking/locking.tex
index 3c2949fa..8a1a3101 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -1010,6 +1010,7 @@ Therefore CPU~1 will likely acquire the lock.
 If CPU~1 holds the lock long enough for CPU~0 to be requesting the
 lock by the time CPU~1 releases it and vice versa, the lock can
 shuttle between CPUs~0 and~1, bypassing CPUs~2--7.
+\noclub[1]
 
 \QuickQuiz{}
 	Wouldn't it be better just to use a good parallel design
-- 
2.17.1

