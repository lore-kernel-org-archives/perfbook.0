Return-Path: <SRS0=dEfS=SP=jklaehn.de=johann@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jklaehn.de; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm2; bh=27RfBRfF/A+picY8q3UckhsoKy6YLaqRJE6Ed3
	9nUQY=; b=WJYwcSIil0dlryguo9T63QF3LSBsmOKP1mPNmQP3xY97l4NYm82czU
	J15kZqXt0rbEZu0zHEuxpRkfHxToA//50nIRxYpQSxwKwjdhF/PHV1CG20/NnQra
	x38ZVMTNL7JjdE64gTOlPYhO5zT74BdDBYjgZJvNRLIZfcZK90JGfHRwi21eg8wg
	vutd9M150oopkLhcFtKTytNt1h2UKCPihCGSVLjfL7CxARpMf041L3lNFZhn6AiI
	az5aVXENvCd6fBS012Kb1z9dkosZi3tgqWmgKPPMuyhFTNSbDb1m8ZfbmIJlz2B1
	FJL58+msCrITbt73gIeD1CAyDRG89/Vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=27RfBR
	fF/A+picY8q3UckhsoKy6YLaqRJE6Ed39nUQY=; b=Q5wO/xMjsuJFiN5e3W7qdD
	/IoOmUidCGcEHC3uarVhWuzsLg6M6AJ/3QjNr/sHHXgQFypLcPjr2PQ4oMU2g8+T
	LIusvPRksq0vOLuglRLeus1DWRxZpA/liyuXjvSsx80HU1IHbgfkUgwAlEMUNhqU
	PIH1YIm4j66vwShXWKFicPYC+J4ombKDjIRZthsEdQ0VLb1hVqpHPRYqeytZ4z/x
	EtWmPJBWwYeGcsZEp1pESZ+nQkhBxkACN07rBYkjyqaAkN8/zA+F72pfj6tKi/Jl
	W3i8QOwM5M12MViQPAWR/eG2h7wHrGbYSxyRIAJWZUDvnUtfNethc3rOWrnBp6Sg
	==
From: =?UTF-8?q?Johann=20Kl=C3=A4hn?= <johann@jklaehn.de>
Subject: [PATCH-perfbook 1/3] defer: Fix typos
Date: Mon, 31 Jan 2022 20:28:24 +0100
Message-Id: <20220131192826.140138-1-johann@jklaehn.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Johann Klähn <johann@jklaehn.de>
---
 defer/defer.tex    | 2 +-
 defer/rcuintro.tex | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/defer/defer.tex b/defer/defer.tex
index 69d9fd5a..be5f997b 100644
--- a/defer/defer.tex
+++ b/defer/defer.tex
@@ -37,7 +37,7 @@ algorithm that will be used to compare and contrast these approaches.
 This chapter will use a simplified packet-routing algorithm to demonstrate
 the value of these approaches and to allow them to be compared.
 Routing algorithms are used in operating-system kernels to
-deliver each outgoing TCP/IP packets to the appropriate network interface.
+deliver each outgoing TCP/IP packet to the appropriate network interface.
 This particular algorithm is a simplified version of the classic 1980s
 packet-train-optimized algorithm used in BSD UNIX~\cite{VanJacobson88},
 consisting of a simple linked list.\footnote{
diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
index bc968ae3..2f4e7ee3 100644
--- a/defer/rcuintro.tex
+++ b/defer/rcuintro.tex
@@ -126,7 +126,7 @@ the state, as indicated by the ``2~Versions'' in the figure.
 }\QuickQuizEndB
 %
 \QuickQuizE{
-	Readers running concurrently each other and with the procedure
+	Readers running concurrently with each other and with the procedure
 	outlined in
 	\cref{fig:defer:Deletion With Concurrent Readers}
 	can disagree on the value of \co{gptr}.
@@ -687,7 +687,7 @@ updaters from making useful concurrent forward progress.
 	seqlock writers, whenever this happens, the \co{read_seqretry()}
 	primitive will force the reader to retry.
 	This means that any work done by a seqlock reader running concurrently
-	with a seqlock updater will be discarded and the redone upon retry.
+	with a seqlock updater will be discarded and then redone upon retry.
 	So seqlock readers can \emph{run} concurrently with updaters,
 	but they cannot actually get any work done in this case.
 
-- 
2.34.1

