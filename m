Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X/oxxBqoWLpyF12bnxtBRKiVBdWp9CXpQfHCb5uh7dQ=;
 b=Qia83tGMuqGpYl+e6UWBamhsCrEnQF8PUsId60ZXcL/hL6IeMPxyDbXdx8ur54I6S/
 /tfU2vN6nTZP1rN5REae0vIbqfYH3cVKrb1igbtdQQHC6Kq3ilFg5VOOOObBMbBfIWnB
 4G7QufEv+y3fhVqfCcWjW5ckpODA0lvEGjjjBxZaQPWQzOTq3BbLfnud6BTiRke+e2OE
 gMe98CpBHp5baf1rO6diN1WiPzrCWQ39R3DmR8VAtri++8FwAdtd3OmqzJLvsP7rT/PU
 xzYs5BqiWgiqCDTKYmUrXBgYWXKNl1dWNNebIpsq2VEZbFEytulT2o0xRGAvCohk6x7b
 oR/Q==
Subject: [PATCH 4/5] together/applyrcu: Use upright glyph for descriptive
 suffix
References: <225c5748-05bd-b97f-398f-50e09c58c701@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b4fbb441-b129-35fd-1030-46864976775c@gmail.com>
Date: Fri, 27 Oct 2017 07:56:00 +0900
MIME-Version: 1.0
In-Reply-To: <225c5748-05bd-b97f-398f-50e09c58c701@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 6ed5c9accaad77683040a1c936a27fab3ce5f975 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 27 Oct 2017 00:14:07 +0900
Subject: [PATCH 4/5] together/applyrcu: Use upright glyph for descriptive suffix

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 together/applyrcu.tex | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/together/applyrcu.tex b/together/applyrcu.tex
index 1169603..11aaa73 100644
--- a/together/applyrcu.tex
+++ b/together/applyrcu.tex
@@ -87,13 +87,13 @@ execution.

 	Or, for those who prefer equations:
 	\begin{equation}
-	\epsilon = \frac{T_r R_i}{2}
+	\epsilon = \frac{T_\mathrm{r} R_\mathrm{i}}{2}
 	\end{equation}
 	where $\epsilon$ is the expected error in \co{read_count()}'s
 	return value,
-	$T_r$ is the time that \co{read_count()} takes to execute,
-	and $R_i$ is the rate of \co{inc_count()} calls per unit time.
-	(And of course, $T_r$ and $R_i$ should use the same units of
+	$T_\mathrm{r}$ is the time that \co{read_count()} takes to execute,
+	and $R_\mathrm{i}$ is the rate of \co{inc_count()} calls per unit time.
+	(And of course, $T_\mathrm{r}$ and $R_\mathrm{i}$ should use the same units of
 	time: microseconds and calls per microsecond, seconds and calls
 	per second, or whatever, as long as they are the same units.)
 } \QuickQuizEnd
-- 
2.7.4


