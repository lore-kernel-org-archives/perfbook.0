Return-Path: <SRS0=yiI0=SF=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=LZCzZxq1tUT3gt7hrXmDyrApbYyGYHH6I5QqgNuvuL0=;
        b=FmlEWD7bP1zO3wOl9GcYZyxnBmXQ7WwN7l/BYWN1jZBSVvaq6QVI4JzU/vQi7tT926
         bvdWO56HiTNl2VQQvB8dQo3i5XNrsQkwaddSS4GbScbvxVF32FqcANtRmSaFCd/cKs7O
         Qp5cyM1qurVjn7olcgInHoCNlyIpZXBUaVFnkS34A9rpUTSP3QpEpyzwT5AmHb3FZpjz
         asj4Ye1U0tJVcGC9i1bJ9y3x9qwwtrRS8LngapwCIiwUUcEN+dagOphoJZpg3wM2Tl1l
         7tt0Y+mFlZcNanUF0EcNnXcU4jl5Qbrmc9hrzBiyzV0JyLzUvIApiCj7fTLelQ0siWs5
         dWnw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [NOT A PATCH -perfbook] index of 'Non-Blocking' in Glossary
Message-ID: <c4add712-74a7-cb57-77c8-6ee8d9b529a4@gmail.com>
Date: Fri, 21 Jan 2022 09:29:24 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Not-signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

This is a reminder in sent as a patch.

I find the indexing tag you put to "Non-Blocking" looks strange.
This entry talks about some classes of forward-progress guarantees,
not much about synchronization.
Also, the existing tags of NBS are \IXacr{}.  You therefore
need to use \glsuseriii{nbs} as shown below in a separate entry
of "Non-Blocking Synchronization (NBS)".

I think NBS deserves its own entry in the Glossary.

        Thanks, Akira

--
 glossary.tex | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/glossary.tex b/glossary.tex
index 86d9a025..4ea87f60 100644
--- a/glossary.tex
+++ b/glossary.tex
@@ -425,7 +425,7 @@
 	These are used for hardware-specific purposes such as profiling.
 	The advantage of using NMIs for profiling is that it allows you
 	to profile code that runs with interrupts disabled.
-\item[\IXGaltr{Non-Blocking}{Non-blocking synchronization (NBS)}:]
+\item[\IXG{Non-Blocking}:]
 	A group of academic forward-progress guarantees that includes
 	bounded population-oblivious wait free,
 	bounded wait free,
@@ -437,6 +437,8 @@
 	deadlock free.
 	See \cref{sec:advsync:Non-Blocking Synchronization}
 	for more information.
+\item[Non-Blocking Synchronization (NBS):]\glsuseriii{nbs}
+	%@@@ Need expansion @@@
 \item[NUCA:]\glsuseriii{nuca}
 	Non-uniform cache architecture, where groups of CPUs share
 	caches and/or store buffers.
-- 
2.17.1

