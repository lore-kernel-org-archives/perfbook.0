Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672078621;
	bh=Mxcb8DZ+rpTggmSsy2TXRxciS7U6aYb9I2b3rDyjJhY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fhVaPsiBj4NlvIOcQathJ18iHD9wL4AGT1ygZBI932ffSiXLWjE+/24h4ksyWnm3o
	 T+EOLIRAjwQaatG+oyIPemvazciFt6eO6ZRXbPPlQUMaHZ4/C+Ei6h+8lslzvVm521
	 5nV8yALbWwXDAW1/i7z6MRubnCmej2ZpGNAFl3six4Vt+AXCdhMYTIuWOqi++w9KO5
	 fp9sYWm/G/c9Dmt4x8jgw2Kn2ETvGrnJZvWeASyU+6bOL7CFIxLgThUwSbJ1SietWN
	 vntLxdpLZDazYl+cyNjvCX1/CTljUXbo3hyn6lJjpnLYTjE56FlbpBcXckgXq9r0BW
	 eZG67jY8LwU0w==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 3/4] datastruct: Enclose NULL with \co{}
Date: Mon, 26 Dec 2022 10:16:38 -0800
Message-Id: <20221226181639.10795-9-sj@kernel.org>
In-Reply-To: <20221226181639.10795-1-sj@kernel.org>
References: <20221226181639.10795-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

Every 'NULL' in datastruct are enclosed with \co{} but one.  Remove the
inconsistent exception.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 datastruct/datastruct.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 40ea6995..9dffaf37 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -1532,7 +1532,7 @@ and \clnref{acq_oldcur} acquires that bucket's spinlock.
 	\co{hashtab_add()} and \co{hashtab_del()}?
 	In other words, what prevents \co{hashtab_add()}
 	and \co{hashtab_del()} from dereferencing
-	a NULL pointer loaded from \co{->ht_new}?
+	a \co{NULL} pointer loaded from \co{->ht_new}?
 	\end{fcvref}
 }\QuickQuizAnswer{
 	\begin{fcvref}[ln:datastruct:hash_resize:resize]
-- 
2.17.1

