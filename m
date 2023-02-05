Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675621312;
	bh=tuS5Si6HtKNQK2d9dQukN1yJnXuryAKjZ8e63CUPNME=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aVn3J0jEmkQlbfs/qWKDr+p2X1CpzITBR+bD6D0zKnSsf74bMCpD7jIjm0zZ34ThN
	 WYzT1jL0pqT2NUkWJq69gHNG6pMbb03hwbDg3dSa1QAJ7gRThYIzKDL8JYo0lsnjHB
	 tswOOQylfxHCQrJQuWmapNCybsBZwmoV6UxYZc36khDBvFP0SWEjMNzCF3tUsy13i2
	 EymfJN0mVjLjh6GwSHmShjFJ0PFGMuuSbFCGgMWDdq4eNydsq0FKj1iwa47+M/BkI+
	 f3itVH9VEXTMBp8b10C9pGeY3UCUOrDFtZh7Etk64m/HFjq0TwCoQ+XSlBRebI7ry6
	 /xbC2DZlB/5sA==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 5/5] debugging/debugging: s/remainder of a section/following sections/
Date: Sun,  5 Feb 2023 10:21:28 -0800
Message-Id: <20230205182128.19044-6-sj@kernel.org>
In-Reply-To: <20230205182128.19044-1-sj@kernel.org>
References: <20230205182128.19044-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

A sectence in 'Microbenchmarking' section is mentioning the remainder of
the section will look at ways for dealing with conflicts in measurement
error advices, but those are not dealt in the remainder of the section
but its following sections.  Fix the sentence.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 debugging/debugging.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index 53c7fb94..225a4184 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -2302,7 +2302,7 @@ to creep in, including:
 
 The first and fourth sources of interference provide conflicting advice,
 which is one sign that we are living in the real world.
-The remainder of this section looks at ways of resolving this conflict.
+The following sections look at ways of resolving this conflict.
 
 \QuickQuiz{
 	But what about other sources of error, for example, due to
-- 
2.17.1

