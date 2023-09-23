Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695486852;
	bh=eRISUDI3ul5rF7GkRlPe5F/5dujIiWsork27v4flhj4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sWe0uVl/RUj6e8kuayFt6plTHnfqrEV5FMx6mojxanFmjoMw/Z5/68mMSoOc3ji5S
	 tCfAA3JcalUhKvh1XEcPkWhCegj+26tJ4SO2snNsCT3brgWsIW1DsmABLMDhvXtBku
	 ALk/W/ds5Q+UbSp2DX6axj7UlnB8LH7FMNwEeJNM0FJJHG1zBRbmq03RhYf30V0NDZ
	 eTSXKO1tMSP5ydpvK0wFpJg2OLHlnD4XFKpQSb+rczT+/WfmEsDtqHQcYxBHoLbZsz
	 PwXQHbb1N5v/uRDAKV+NOn8ZNYvdNWnJOCkYKdO0EeG4mWLxIThyB3L/7EZ37f4bgT
	 wDN3KsZ5ZZcOg==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 09/10] memorder: Make clear the scope of READ_ONCE()/WRITE_ONCE() heavy uses
Date: Sat, 23 Sep 2023 09:32:03 -0700
Message-Id: <20230923163204.14558-10-sj@kernel.org>
In-Reply-To: <20230923163204.14558-1-sj@kernel.org>
References: <20230923163204.14558-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

A sentence in memorder.tex is saying READ_ONCE() and WRITE_ONCE() will
be heavily used in a section.  But, it's widely used in the chapter.
Modify the sentence to make it more clear.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index bd24b14c..5c978fbe 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -668,7 +668,7 @@ even on relatively strongly ordered systems such as x86.
 	\co{READ_ONCE()} and \co{WRITE_ONCE()}
 	prevent the compiler from reordering.
 	And also from doing much else as well, so the examples in this
-	section will be making heavy use of
+	chapter will be making heavy use of
 	\co{READ_ONCE()} and \co{WRITE_ONCE()}.
 	See \cref{sec:memorder:Compile-Time Consternation}
 	for more detail on the need for \co{READ_ONCE()} and \co{WRITE_ONCE()}.
-- 
2.17.1

