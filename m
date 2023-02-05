Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675621312;
	bh=b01TfTqSKoCYfudRBgT8dcGhM5OBDglkkpIN/mQaQQ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iR2Sf0NzYqB/tzMvFhrKrtWUINcbrG7zrMOg7ynPvte2Y0ZmPAT4zMUIBOEAKhKQ0
	 DZCMTpe7BntlkXzIKntI89n2q93nAEInRYfBfv+aRDBxAroE45GALSJV+M+cnSqk5C
	 cZkrFMq6YAYVNVIDGYJi7nFBEZXLCQ2mIAxQmUWqwQrisNwXFeXLXAXeuhSUwtieZL
	 Zh+mHwXonvyZDBQ/ZQoR5WNyoKP6plzZf55X0ioakKOoCbbfC5KZq8QpPUmZMm6Ay7
	 xdmTKyHHFUBun2EugPmNV2Wc/v1XRffommwjsXzcSiMmsAzDAm4Qu6vUeCmEQpYcXz
	 zJlDrdjJBZgHQ==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 2/5] debugging: Use \co{} for 'git' and 'Fixes:'
Date: Sun,  5 Feb 2023 10:21:25 -0800
Message-Id: <20230205182128.19044-3-sj@kernel.org>
In-Reply-To: <20230205182128.19044-1-sj@kernel.org>
References: <20230205182128.19044-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

In 'debugging/', 'git' is a command and 'Fixes:' is a string in command
output, which usually enclosed via '\co{}', but those are enclosed with
'\emph{}'.  Use '\co{}' instead for being more consistent.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 debugging/debugging.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index 3104bb95..3ce74469 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -862,8 +862,8 @@ by the author's invalid assumptions, and who might also test the code.
 	hackers of harboring???
 }\QuickQuizAnswer{
 	Those wishing a complete answer to this question are encouraged
-	to search the Linux kernel \emph{git} repository for commits
-	containing the string ``Fixes:''.
+	to search the Linux kernel \co{git} repository for commits
+	containing the string \co{Fixes:}.
 	There were many thousands of them just in the year 2020, including
 	fixes for the following invalid assumptions:
 
-- 
2.17.1

