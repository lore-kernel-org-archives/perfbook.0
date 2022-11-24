Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669316317;
	bh=Csnh6e0ml8aP+T5yQYdj6J+k3ExQS9sx2lH+pgiwOQU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=acD8FpovnTqIs7E4MX3UEZMfF7NgLMHc2bP8M+0qPlPxMHz0t+QFrKsUwGTKc4q1G
	 M4kp5t6R/GKRqLHRXSUUVoeWsFEBJEbx4XZQmbm7xuyge3lQOci+cHRxT2Xa2Vw1zd
	 MfK2om6d3nUlVBSQBuJO3jRz+itCvginaZHzFbq4rgWb3AcC2pROc78V678SuJDKis
	 LhjBG1lJ+wL2JyMlKELKb2dFpwgS0fdZ8V0MKtwD1r4o1bCWXwY8XsVi/BWMOmTR5Y
	 +Iy7yIp0pLbYNEJ272b9x5xK1noCV5Hn/fpbvp9bqKUPSTnUlgr/Pr48MpN/rC+45e
	 T4c95LaSfAzeA==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 01/13] defer/rcuintro: Clearly point the QSBR described section
Date: Thu, 24 Nov 2022 10:57:50 -0800
Message-Id: <20221124185803.8150-2-sj@kernel.org>
In-Reply-To: <20221124185803.8150-1-sj@kernel.org>
References: <20221124185803.8150-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

'Toy Implementation' section of 'defer/rcuintro' says QSBR is described
in the section, but it's actually explained in detail in its previous
section, 'Waiting for Readers'.  This commit updates the sentence to
point the sepcific section for a better reference.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 defer/rcuintro.tex | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
index 2f4e7ee3..7007058b 100644
--- a/defer/rcuintro.tex
+++ b/defer/rcuintro.tex
@@ -621,7 +621,8 @@ Referring back to
 note that \co{route_lock} is used to synchronize between concurrent updaters
 invoking \co{ins_route()} and \co{del_route()}.
 However, this lock is not acquired by readers invoking \co{access_route()}:
-Readers are instead protected by the QSBR techniques described in this section.
+Readers are instead protected by the QSBR techniques described in
+\cref{sec:defer:Waiting for Readers}.
 
 Note that \co{ins_route()} simply returns the old value of \co{gptr}, which
 \cref{fig:defer:Insertion With Concurrent Readers} assumed would
-- 
2.17.1

