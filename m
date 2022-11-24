Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669316318;
	bh=RJ2Sl3gkB+0t9kTgbDLGvY13yRyqVQtSB4qAevHb+Zc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bnipblbwKFQjb5M5e0RujzniCvV4JB4urSJ3EZocR2HVnWy5/YR6gq2Jybdo6jPEY
	 A8gx2aIHJhRSYwj2Ivsj0hZ1SfAWTzDT5UYN/MUfie/3ELw6PdNFffHE8WcknoloqQ
	 eVIZqAAGiGXDM8pQVzxAtSMApROTH3QFLt9T2HUE72kWzLNasTZaQK7KS4y+lyM2Mx
	 4lzwgd/EZK93tRzP02IjpFT3KE0AOrKMCZcJd1CId9lBfapHZnPi2TIG4wSxfSnZz4
	 zfxdpR/0NEnP+mcx2KlnCy2NP3lmkMPp26V3uCHhI+bSSg1iV7P4IvKLwnWc9u7p3k
	 mRMZOtw2k/OMg==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 04/13] defer/rcuapi: Use \co{} for boolean return value
Date: Thu, 24 Nov 2022 10:57:54 -0800
Message-Id: <20221124185803.8150-6-sj@kernel.org>
In-Reply-To: <20221124185803.8150-1-sj@kernel.org>
References: <20221124185803.8150-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

\co{} is used for some boolean return value and not for some other case.
To make it consistent, use \co{} for all.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 defer/rcuapi.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index 425c64ff..9ac2d26c 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -785,7 +785,7 @@ Should a reader encounter a \co{NULL} pointer not matching the index of
 the bucket it started from, that reader knows that an element it was
 traversing was moved to some other bucket during the traversal, taking
 that reader with it.
-The reader can use the \apik{is_a_nulls()} function (which returns true
+The reader can use the \apik{is_a_nulls()} function (which returns \co{true}
 if passed an \co{hlist_nulls} \co{NULL} pointer) to determine when
 it reaches the end of a list, and the \apik{get_nulls_value()} function
 (which returns its argument's \co{NULL}-pointer identifier) to fetch
@@ -1156,7 +1156,7 @@ type of RCU read-side critical section.
 
 Because \co{rcu_read_lock()} cannot be used from the idle loop,
 and because energy-efficiency concerns have caused the idle loop
-to become quite ornate, \apik{rcu_is_watching()} returns true if
+to become quite ornate, \apik{rcu_is_watching()} returns \co{true} if
 invoked in a context where use of \co{rcu_read_lock()} is legal.
 Note again that \co{srcu_read_lock()} may be used from idle and
 even offline CPUs, which means that \co{rcu_is_watching()} does not
-- 
2.17.1

