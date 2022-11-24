Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669316320;
	bh=GxbF3X7hTONh+vaixUWR3cCPj0FR4h/ZRZf0Ja4TsWw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b8Z6JE/ZFyNsBysxttjFnkr7yuPVjtcSivk/RN6sHoUt6nMiTK1YJYpRH4N/Z+J9C
	 5VGu6vullgSLLeH/xAPFZ1fArCyJjHI9baXj4oyzvqqlAVfsGvNnyPiQIFDNSUl9Dk
	 iowTKa9+ExnP8qZEPtGDXj2djvNWVu/Sr5CJbe1nISlYVnB6uPwdYTRlFn6udeh2SL
	 fRK0nYCgsASOM2OoXnYrHf02ukh9eaiVJ5/wT3IYVbSUvb03GREECaHY9nkwhewyhm
	 +2Kl5foFPSEZK4WM/EfGYmtAZrilwHY5OWnFEgfJNvvbxcR70f2VzKkP8AcAJZNe/e
	 oQJBV7siMnlcw==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 10/13] defer/rcuusage: Fix wrong function name: s/timer_stop/nmi_stop/
Date: Thu, 24 Nov 2022 10:58:00 -0800
Message-Id: <20221124185803.8150-12-sj@kernel.org>
In-Reply-To: <20221124185803.8150-1-sj@kernel.org>
References: <20221124185803.8150-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

A sentence in 'RCU is a Way of Waiting for Things to Finish' section is
calling 'nmi_stop()' as 'timer_stop()'.  Fix it.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 defer/rcuusage.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index 1dc4c2ca..372a508d 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -272,7 +272,7 @@ The basic form of such ``Pure RCU'' designs is as follows:
 
 The remainder of this section presents example code adapted from
 the Linux kernel.
-In this example, the \co{timer_stop()} function in the now-defunct
+In this example, the \co{nmi_stop()} function in the now-defunct
 oprofile facility uses \co{synchronize_sched()} to ensure that all
 in-flight NMI notifications have completed before freeing the associated
 resources.
-- 
2.17.1

