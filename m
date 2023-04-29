Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682787750;
	bh=xfYivhMjZs7ipj2fFuPUyKFfvjE5XQm+ep7NV7W5xis=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hTNWdtH1cI9Cv5+jHKrYaxv6f5PJsFAyR/8MpOYxVLEh8jAaP8P3o6RzXvxi7vD8s
	 pnb+hoAzKg3YhjDUI4ln9S1hidj8JYf7qtFkbHqRh+NF/YGF/nhKHZep8cH4cu8l3y
	 ktiRe4Su91KHNH2BmKfEB4PusVB0um4QWAjQhfgVxcdFV5CkHgY1WiHG1WqUV+tO38
	 GRDrevJ9AiHYy+xvRc2djCDAir8sxfL3PPkmIbLgx7EZGI0aoq+PdWP34icylHWE4y
	 V43e9DnqERlcEBiJviro1M4HQN07XqNh/pJkbNSIfcPL0QudzvxsfjC74dEGToPJiS
	 wT+b5qHIbTWJA==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 2/2] together/seqlock: Use term 'sequence lock' consistently
Date: Sat, 29 Apr 2023 10:02:26 -0700
Message-Id: <20230429170226.3640-3-sj@kernel.org>
In-Reply-To: <20230429170226.3640-1-sj@kernel.org>
References: <20230429170226.3640-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

A sentence in seqlock.tex is calling sequence locks as sequence
counters, while all other sentences in the file is calling those
sequence locks.  Use the term consistently.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 together/seqlock.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/together/seqlock.tex b/together/seqlock.tex
index 5fd31d83..b77b5184 100644
--- a/together/seqlock.tex
+++ b/together/seqlock.tex
@@ -8,7 +8,7 @@
 \epigraph{The girl who can't dance says the band can't play.}
 	 {Yiddish proverb}
 
-This section looks at some special uses of sequence counters.
+This section looks at some special uses of sequence locks.
 
 \subsection{Dueling Sequence Locks}
 \label{sec:together:Dueling Sequence Locks}
-- 
2.17.1

