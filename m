Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680975209;
	bh=48aDQkGOhrxS4Aw/4tq41BFeufDeB3UlF+VwGPYocUA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZixcSQ6jbQ2vh5b4lmUTHU0bI7+RQXzgRHSUZ5/VEZegPiE/ieS5iTTmQUHtrVvVh
	 9WUlHB4vaD62iiEEMq/TyMsxQASANBFzdfFP85hlSOK8gEgPLumbYYfA2eZbkVhafl
	 D06ts7CmAUkhRynjGl6v7hswTeVcsZNCxdXRyYBDW/c9eF3hknmCBmxBZe2evmOKeU
	 l6SEcjF7T4rfuMaMnljuSOq9aSho8gue1O/lFzIgprvWUCIKftzluCx/hDI+c8ddFc
	 N0Uk7Z6ZnGBbPoekuPk4BXdcomAKWzFGRwcQQxY0GU2Ov8vqiOX9jVKKMDisklWzhs
	 /+x8hvlGFTRQA==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 01/12] formal/formal: Drop cppmem from 'Special-Purpose State-Space Search' section explanation
Date: Sat,  8 Apr 2023 10:32:58 -0700
Message-Id: <20230408173309.5543-2-sj@kernel.org>
In-Reply-To: <20230408173309.5543-1-sj@kernel.org>
References: <20230408173309.5543-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

The advance explanation of 'Special-Purpose State-Space Search' section
says it will introduce both ppcmem and cppmem, but the section
introduces ppcmem only.  Fix the sentence.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/formal.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/formal/formal.tex b/formal/formal.tex
index 895d2ba7..13dcf071 100644
--- a/formal/formal.tex
+++ b/formal/formal.tex
@@ -28,7 +28,7 @@ A number of such tools exist, for example,
 \cref{sec:formal:State-Space Search} provides an
 introduction to the general-purpose state-space search tools Promela and Spin,
 \cref{sec:formal:Special-Purpose State-Space Search}
-similarly introduces the special-purpose ppcmem and cppmem tools,
+similarly introduces the special-purpose ppcmem tool,
 \cref{sec:formal:Axiomatic Approaches}
 looks at an example axiomatic approach,
 \cref{sec:formal:SAT Solvers}
-- 
2.17.1

