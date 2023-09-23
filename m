Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695486852;
	bh=RhsBNKG49fyrZgLN2MRwNslVk90YMk+sA4jImoEvKxw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vCEPGFiFxlxBFE6RSNprM6ezH/RrMRpaFap0AakqKIT5xW1aLH0mYsFB8uTt7prVo
	 VVu7Pgycd40vmO8B+cGo1FCNkl/61VCwax7wJ1isQhL6wr7v5S5QJG0Y86NtXqkRnZ
	 35zKzwQs2gTP4D8LtpQzEshJD3nIV91U5NHjDaQOMeyRP3ajItyvkHXtrTkkhx/EBe
	 0EZs/B46L6nHYQpmNYRSw13nFRPCFQDjkE1h0SPggTJNCR9mnu4m75N5OKSmT4dVXK
	 Qi7RY3S+4UuIiVgubX6o4gX9rjrdpTp5xAzJdUOQh0R05QUn7wQu3HE1RF58L367BI
	 IFFUrEEOsVFDg==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 07/10] memorder: Consistently use '\co{}' for 'herd'
Date: Sat, 23 Sep 2023 09:32:01 -0700
Message-Id: <20230923163204.14558-8-sj@kernel.org>
In-Reply-To: <20230923163204.14558-1-sj@kernel.org>
References: <20230923163204.14558-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

All sentences but one in memorder.tex use \co{} for herd.  Use it
consistently.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index b7699129..5ded6988 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -527,7 +527,7 @@ sometimes substitute \co{WRITE_ONCE()} plus \co{smp_wmb()} for
 and \co{READ_ONCE()} plus \co{smp_rmb()} for \co{smp_load_acquire()}
 on the other.
 However, the wise developer will check such substitutions carefully,
-for example, using the herd tool as described in
+for example, using the \co{herd} tool as described in
 \cref{sec:formal:Axiomatic Approaches}
 on
 \cpageref{sec:formal:Axiomatic Approaches}.
-- 
2.17.1

