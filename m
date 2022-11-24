Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669316318;
	bh=EofBVXBOCL1UhUG96b09oMtv/X2+7aeYgpSuunVfXUk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KQPVQyk2TcLruZWuDHcTZLVl8XQcX7RHRIOXUsj9jTE0E+uyDqOf3E/x/4Dn+GtXA
	 f6e9Y5LCGB7Y+PAN/VmihSI0i/6A97XxZUTKbaZbPcEgCt3BI7zVNwRKNQnFVtT53r
	 kthHV8Q7RjaTR3mRvK0YexzEHUkqW7szdKvUWnmHgvNUfusXkwQ+kFD5aL0rv5rVa4
	 YolabuIneb4Fc2hROYpUzWpDGap3E65Ekq52HaxYf1tSpelMh+Gr+43Z2mWzeKBYN8
	 dU/3IJN1B3h4ixflkKDyCHF/Ape7ozEoxSmZDPkKt1ixwkuqWdXJYaYkw017dWfpe7
	 Mn1O3FjubYy/A==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 02/13] defer/rcufundamental: Add non-breaking spaces
Date: Thu, 24 Nov 2022 10:57:52 -0800
Message-Id: <20221124185803.8150-4-sj@kernel.org>
In-Reply-To: <20221124185803.8150-1-sj@kernel.org>
References: <20221124185803.8150-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

Linked list example in rcufundamental.tex misses non-breaking spaces
between 'and' and a data item.  Add it for better compilation of the
book.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 defer/rcufundamental.tex | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index 39b2f7ff..5e7d6675 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -153,7 +153,7 @@ structures without disrupting concurrent readers.
 	items from a linked list while a reader is iterating over that
 	same list.
 	Specifically, suppose that a list initially contains elements
-	A, B, and C, and that an updater removes element A and then
+	A, B, and~C, and that an updater removes element A and then
 	adds a new element D at the end of the list.
 	The reader might well see \{A, B, C, D\}, when that sequence of
 	elements never actually ever existed!
@@ -163,8 +163,8 @@ structures without disrupting concurrent readers.
 	In the universe where an iterating reader is only required to
 	traverse elements that were present throughout the full duration
 	of the iteration.
-	In the example, that would be elements B and C\@.
-	Because elements A and D were each present for only part of the
+	In the example, that would be elements B and~C\@.
+	Because elements A and~D were each present for only part of the
 	iteration, the reader is permitted to iterate over them, but not
 	obliged to.
 	Note that this supports the common case where the reader is simply
-- 
2.17.1

