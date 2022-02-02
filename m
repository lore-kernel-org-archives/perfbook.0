Return-Path: <SRS0=0nXO=SR=jklaehn.de=johann@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jklaehn.de; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm2; bh=DzU/WtkWKbyA72n0dbBV/vw0Lx4r+nS7BCzfF5
	FGsOk=; b=MNuHKyPnQ75wuXVwKH0DQPwiCaeWe73i5XAeWfW7sGyddC3ZBdl+gy
	0KDzqtuj3EzeDCzkYx8asrsxuyuuFCcpVcLuZDTguLh96iz2cX3ggdVaf1Eygt22
	cruA3k38XJo/i5cVYwvBqt0TKydf8OxZc/qhoXE3j9VQcFNp14vVE1vgjMezPv/9
	zvwHxwn2JttMDfo4g6dszLqioCxDcMsWm404Q4zcXaskFn75szFnkQ8OFaAYhI49
	a1HvM+/SFvez56eb/u5D9kBsjvVBBTMQX36harwukmtkJ4f8r+WMuEsGyg9SUpWe
	NflHlPzPVqLTC4bvHKQYsr6lSJSsrFMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=DzU/Wt
	kWKbyA72n0dbBV/vw0Lx4r+nS7BCzfF5FGsOk=; b=EgepXnJM0SFubj2YJ6uvx8
	EXAZSMjzNllFiPaHc0miITet0yks7/Tat1o9XAa5F3qZOkDKvdpgwZu5ol0iCvGN
	RTkyt9j8A+OZvpOpmEWhgvzx+RjsOYeRIANHJP/XymgtiKJp0O72dNEQxnwSSca0
	tDjbRADNizBjTXeCnBCVIqpVI/YgARYwUAGAD94KUxYahenR7+V0EuJsYkzeENkO
	Fxhv+DNoJwjYAOwIxSenWYDdGfULCGOZ2d41/zu14tcRy9ITPdtiYnTEY06Z9YN3
	uRMDuBpRT4GoCGPGmNduVCY4AqRnkFAuWrOrhCsJbm1jPCnsL8BY9quif2GoBUnQ
	==
From: =?UTF-8?q?Johann=20Kl=C3=A4hn?= <johann@jklaehn.de>
Subject: [PATCH-perfbook 1/2] advsync: Fix typo
Date: Wed,  2 Feb 2022 18:33:44 +0100
Message-Id: <20220202173345.49738-1-johann@jklaehn.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Johann Klähn <johann@jklaehn.de>
---
 advsync/rt.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/advsync/rt.tex b/advsync/rt.tex
index 69b80ec6..ee0e7474 100644
--- a/advsync/rt.tex
+++ b/advsync/rt.tex
@@ -1450,7 +1450,7 @@ One way of resolving this conflict between OS jitter and maintaining
 contact with the outside world is to reserve a small number of
 housekeeping CPUs, and to force all interrupts to these CPUs.
 The \path{Documentation/IRQ-affinity.txt} file in the Linux source tree
-describes how to direct device interrupts to specified CPU,
+describes how to direct device interrupts to specified CPUs,
 which as of early 2021 involves something like the following:
 
 \begin{VerbatimU}
-- 
2.34.1

