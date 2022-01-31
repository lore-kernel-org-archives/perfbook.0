Return-Path: <SRS0=dEfS=SP=jklaehn.de=johann@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jklaehn.de; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; bh=hZ2QC9TaQM/JiK
	PLyvzHwrrEqN8z/Xu+6YjmQtlDpec=; b=EEoIYSzA1LT7A0KyEV2hP2a7DiViOW
	Ewh44gTESv82KOmbLqnLZfg79PUjyQLOdyBEKgDc+bICzDX3sVR3fzr/ZZVWsL5i
	EHMWLh6ixze61M4Sy1z6npS8fKHRoYwImO9iLA7rO8vADeE3moa2nrWeAUR/uWgO
	0nh9u9cK4bCXImsPoAUqdf0brO5cH0NL7rOFvqS+9zrg/Nl3tm0q04JHnfY4Vz0K
	w6pjrI9EvqRzbimHASNLgfRMxKNQJEDN06AYauHOG9ZM/1qZAP9oYm27uAKPgJrS
	t/4k5TnVq1bkcmtomEfCiPkL2IhSKOBaG1nCx3+iHWzoCoiQ/V+xWjbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=hZ2QC9TaQM/JiKPLyvzHwrrEqN8z/Xu+6YjmQtlDp
	ec=; b=Pz4PzrdgNhYVneab7DMDRAwKlQvs30wTVXdUMYfs67fASG2hxVqW6loAa
	wVxa3kfI6fyEB5OKpm7/wbXHEACX4p2imHVBAEGV/8vS/ZceLh2PHcXBz0tkTOaY
	333ZiiJ5j608AdwujtlJvK5EvkcJhSuxUFrB6vjtwQlrd8lj+N7zNaTGTqm6WiRk
	beZ5jHVN4/4i/FllaG1VdEjAfu7nr+VSpjAbOmY1H4i0J/bIuOaEAGOaie5VfZDc
	J6x+us5BzQL+XtfHS1nIh1+xgHUR5fGWhV1HBDjf20jth4mxCN7Q6MvfSAhwVL6j
	0gMmQakbF/IXRkEn8FQyCOwzUWHzw==
From: =?UTF-8?q?Johann=20Kl=C3=A4hn?= <johann@jklaehn.de>
Subject: [PATCH-perfbook 3/3] toolsoftrade: Fix reference to concept introduced earlier
Date: Mon, 31 Jan 2022 20:28:26 +0100
Message-Id: <20220131192826.140138-3-johann@jklaehn.de>
In-Reply-To: <20220131192826.140138-1-johann@jklaehn.de>
References: <20220131192826.140138-1-johann@jklaehn.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

The corresponding section starts ~150 lines earlier in the same file.

Signed-off-by: Johann Klähn <johann@jklaehn.de>
---
 toolsoftrade/toolsoftrade.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index d2117fde..440bcb04 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -1309,8 +1309,8 @@ the like.
 
 The \apipf{for_each_thread()} macro loops through all threads that exist,
 including all threads that \emph{would} exist if created.
-This macro is useful for handling per-thread variables as will be
-seen in \cref{sec:toolsoftrade:Per-Thread Variables}.
+This macro is useful for handling per-thread variables as
+introduced in \cref{sec:toolsoftrade:Per-Thread Variables}.
 
 \subsubsection{\tco{for_each_running_thread()}}
 
-- 
2.34.1

