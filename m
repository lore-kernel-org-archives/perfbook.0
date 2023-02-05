Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675621312;
	bh=lt8yT8YO15Y+Ax/5eGImfBvt5WbfuEpD++Fhfos+GVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UiEiVvEeJYpuA8ZQKQlGuQXhX6mUUlrdG7AHqFB1Yq+VfkPB+xAqBHH+g25MZhUAy
	 0umBjNOUcA9v6BHwlpkDm+X15ZAyHQmu+wHPlKjMsbY2C8dd+39Uikoq2O/HyMqroG
	 KTBtwUYyjnvW7kjRFhuFoBzxQUq7iI7kQpA5Ehw7jMlC6o1OjUYemjakFhZCcTgaWt
	 Smr6edM+TGs6putqX9Ik42nOH0fdofA9YWnO2+uTYP5dSOJyJn9euFDzNothMQ010D
	 uKl2jNo8qXzSrFFhFrWkirUOrmXnRRoDNhugR8b2ahSvuepz+YdFky7TpLhv7AL0yT
	 Zjp/22kyEPBlw==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 4/5] debugging: Remove unnecessary space in a sentence
Date: Sun,  5 Feb 2023 10:21:27 -0800
Message-Id: <20230205182128.19044-5-sj@kernel.org>
In-Reply-To: <20230205182128.19044-1-sj@kernel.org>
References: <20230205182128.19044-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

Two spaces are usually used between sentences, but a sentence in
debugging is using two spaces inside a sentence.  Make it uses only one
space for consistency.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 debugging/debugging.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index 1903c5db..53c7fb94 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -2153,7 +2153,7 @@ serve four major purposes:
 	against your competitors' offerings.
 \end{enumerate}
 
-Of course,  the only completely fair framework is the intended
+Of course, the only completely fair framework is the intended
 application itself.
 So why would anyone who cared about fairness in benchmarking
 bother creating imperfect benchmarks rather than simply
-- 
2.17.1

