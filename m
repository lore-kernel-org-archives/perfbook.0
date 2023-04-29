Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682787749;
	bh=F+mm6swiIl7JY6BsfMRG1OeEDEyRMbBJT6DLnfgf8JU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Akqf7kMJYAx1W9KRCOXfvWt/ebb6Ya18Fy40YYFnK+TVsSnLWmsQo5dPKh3T4o6Lc
	 94jWBWm+bNhhhYPrcwXKMn7wMjXwVFKNgy00hlS6lJW6ELSF59Hbnl1ZsmtFl7KsaO
	 Y9e5NxFh4sWSDhjP428nUQiwKl5AEW6fiqxgtttbRFz+0IV2aOMm9RXcKclBnH9/BE
	 MQAGr6RZdCCF4HkKfWl+lDZglRb6TxTPIPmw1KImru5cXEWcRJZtD4acpJvdTRMFoZ
	 aM8SbqYRwuUID4dtEPi/HGHzgb8bsNC4/VPmfZloVIQ5XTEZ9BFOfEmjh+n+TCcRoo
	 jYhNRzkTKEwEA==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 1/2] together/refcnt: Use \tco{} for code quoting
Date: Sat, 29 Apr 2023 10:02:25 -0700
Message-Id: <20230429170226.3640-2-sj@kernel.org>
In-Reply-To: <20230429170226.3640-1-sj@kernel.org>
References: <20230429170226.3640-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

Some sentences in refcnt.tex is using only quote for some code words.
Use \tco{} instead, as it is intended to be used for the case.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 together/refcnt.tex | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/together/refcnt.tex b/together/refcnt.tex
index 56caed67..4abe1c60 100644
--- a/together/refcnt.tex
+++ b/together/refcnt.tex
@@ -467,15 +467,15 @@ as shown below.
 
 \QuickQuiz{
 	Why can't the check for a zero reference count be
-	made in a simple ``if'' statement with an atomic
-	increment in its ``then'' clause?
+	made in a simple \tco{if} statement with an atomic
+	increment in its \tco{then} clause?
 }\QuickQuizAnswer{
-	Suppose that the ``if'' condition completed, finding
+	Suppose that the \tco{if} condition completed, finding
 	the reference counter value equal to one.
 	Suppose that a release operation executes, decrementing
 	the reference counter to zero and therefore starting
 	cleanup operations.
-	But now the ``then'' clause can increment the counter
+	But now the \tco{then} clause can increment the counter
 	back to a value of one, allowing the object to be
 	used after it has been cleaned up.
 
-- 
2.17.1

