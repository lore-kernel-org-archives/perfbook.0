Return-Path: <SRS0=q5UQ=SQ=jklaehn.de=johann@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jklaehn.de; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; bh=6yxk+BK4scAjgF
	gaqVXy0R1mI24r1NTLp5a0ZtI0WC0=; b=d/HZ7f5HF29L42dJ71yt2bcdsMSefX
	M/PiOTfJKhgPTTbiNhTTEPEKm9VrF9+LjuEHBOmPJUg5Nzlm0wdx1SKZmoPIHF8i
	vH839wppN0WQb2rV9wf+CrvxUV1b/v/GKz/AEGBU8xJCPGFIMOEczliQDsgfidXh
	n7h5N2QB/1nGqdAUukt2MJ2u0qIG+frApROZuk1Qlmr60IafOqXvUzmt3/kjrsJ2
	mPX0PF/BQ8myilehlJrzWOiDipRScJtuKiErv/Nz468lIkKHpLnYI7uKUxKp3pWU
	Bi8jbTmjoNzJjeUxPB4oRY1Uz4XDa7LTMm2MeH+n0bw3uDNDZ9DmMpUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=6yxk+BK4scAjgFgaqVXy0R1mI24r1NTLp5a0ZtI0W
	C0=; b=np3RtV6iUn6ckV4syvJsH/TcQbaXyiyRcQl0hbk8M5e38bH/dbDpVQA58
	dy+d31sp48FCblxjRKxa5VqhLhXIGiBzeShvTXpMMkVefcj/xBmUmg8bBHrM+LXt
	mSRImwNX7pb5LfFr+wPX+5DG9tUHLMye9YL2P24jtN7Ps3wM9zsLpDaYez2wnNzS
	aLFjPAdB0iixmTxQC1Bt7oXFFZUktcnD9HyZ570i25KFeRrISeeacGnc3ZjEkFU+
	xnYaU+1+dcfwaprysrEPYDRoXqpEiDGenbFD8oWNzSTWLZgw+0NDRCi1ajFGgb28
	y9fddvZbs0EvzVwZMU8wCT66qVcRg==
From: =?UTF-8?q?Johann=20Kl=C3=A4hn?= <johann@jklaehn.de>
Subject: [PATCH-perfbook 4/4] glossary: Use more common definition of RAII
Date: Tue,  1 Feb 2022 21:07:51 +0100
Message-Id: <20220201200751.23589-4-johann@jklaehn.de>
In-Reply-To: <20220201200751.23589-1-johann@jklaehn.de>
References: <20220201200751.23589-1-johann@jklaehn.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Cf. https://en.cppreference.com/w/cpp/language/raii or
https://en.wikipedia.org/wiki/Resource_acquisition_is_initialization.

Signed-off-by: Johann Klähn <johann@jklaehn.de>
---
 glsdict.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/glsdict.tex b/glsdict.tex
index 194f364d..d1468859 100644
--- a/glsdict.tex
+++ b/glsdict.tex
@@ -237,8 +237,8 @@
 \newacronym{numa}{NUMA}{non-uniform memory architecture}
 \newacronym{qsbr}{QSBR}{quiescent-state-based reclamation}
 \newabbreviation{qsbr:m}{QSBR}{quiescent-state-based-reclamation}
-\newacronym{raii}{RAII}{resource allocation is initialization}
-\newabbreviation{raii:m}{RAII}{resource-allocation-is-initialization}
+\newacronym{raii}{RAII}{resource acquisition is initialization}
+\newabbreviation{raii:m}{RAII}{resource-acquisition-is-initialization}
 \newacronym{rcu}{RCU}{read-copy update}
 \newacronym{smp}{SMP}{symmetric multiprocessing}
 \newabbreviation{smp:m}{SMP}{symmetric-multiprocessing}
-- 
2.34.1

