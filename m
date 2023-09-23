Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695486850;
	bh=KUjdNmNh3EzhS21Zbu7ZstqS/1OyanEnV8wzjRhdrX0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DQldx6zd+kxV/5kyV/0kTIEWhKd/njD8ZL+h+Recl82WULCPgwfs3YLSnbKq2RKoo
	 2YVbyoHgNKxvGRLdKf4c2sNDsU00Y9OKmZH52AYNKXUr3lqjiIJf0W7lB8v/hAPnsJ
	 RSKNoS8AKWMRNHIemwWUMR2V4DtoIyMJgS/V7tAEc5Amkgmmb+syqTwhb+TEAD+IIe
	 vh1K16qRcEjnu4qVWqhBJI4mfDBaAsgwpNqZFiyKjXKE7BTKSVMDiP4NtSfWZ+gojj
	 UxYpmUDIuruB6aqd93aLN8C0AIGoiBIzhDbqHj/NIiEWykowaExOfjYQ06QHV9LV7E
	 EpRkETHpZx6pQ==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 01/10] memorder: Fix typos: s/,/./
Date: Sat, 23 Sep 2023 09:31:55 -0700
Message-Id: <20230923163204.14558-2-sj@kernel.org>
In-Reply-To: <20230923163204.14558-1-sj@kernel.org>
References: <20230923163204.14558-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

Two sentences in memorder.tex are having commas instead of ending
periods.  Fix those.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 memorder/memorder.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 1c882ea4..75e336dc 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -4103,7 +4103,7 @@ The following list of rules summarizes the lessons of this section:
 
 \item	If both legs of the \qco{if} statement begin with identical stores
 	to the same variable, then the control dependency will not order
-	those stores,
+	those stores.
 	If ordering is needed, precede both of them with \co{smp_mb()} or
 	use \co{smp_store_release()}.
 	Please note that it is \emph{not} sufficient to use \co{barrier()}
@@ -4763,7 +4763,7 @@ Perhaps surprisingly, despite the empty critical section, RCU nevertheless
 still manages to forbid the cycle.
 This can again be checked using the \co{herd} tool.
 Furthermore, the reasoning is once again similar to that for
-\cref{lst:memorder:What Happens Before RCU Readers?},
+\cref{lst:memorder:What Happens Before RCU Readers?}.
 Recapping, if \co{P1()}'s \co{WRITE_ONCE()} follows the end of a given
 grace period, then \co{P1()}'s RCU read-side critical section---and
 everything following it---must follow the beginning of that same grace
-- 
2.17.1

