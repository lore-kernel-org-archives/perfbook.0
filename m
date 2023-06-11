Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686503773;
	bh=KDajG7FiIJ/8jZBOUb+6JBe3yL07cyzHiCh9oN4GlFk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dSoXFDuBY1a3MjUAK7ANZaEzjVQasOvN2Jik05zMG/t7ZkfgNJ8u6PvlhflYZ0671
	 9WNSHFyhrTJOih5V3AKofSeeKp8iGzYhCwFXetYDUOT8jtppV1CWb2YCUHGdb7ED9o
	 Cm3kzYSziz9gpCVig6Zluut5Ydj4SY7Wyzb0o4VSDXjG5dEaehPQEA57QY5waS37/N
	 9/a+qMZABY1/+Q64yiSbI0HhbMT2Pc3XbElh+8klgerV4X7AsNrT0NHrrEFz2dzRGX
	 97xNlvhCX5l+pJqLb/+eBRGRq7cf1mBxTAQ/NNczzDWkSc7AJTOu0CXzW894FTDwED
	 OjeiRCcXqcvTw==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 1/2] advsync/rt: Update path to kernel-per-CPU-kthreads document
Date: Sun, 11 Jun 2023 10:15:05 -0700
Message-Id: <20230611171506.32033-2-sj@kernel.org>
In-Reply-To: <20230611171506.32033-1-sj@kernel.org>
References: <20230611171506.32033-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

Linux commit 4f4cfa6c560c ("docs: admin-guide: add a series of orphaned
documents") has moved Documentation/kernel-per-CPU-kthreads.txt to
Documentation/admin-guide/kernel-per-CPU-kthreads.rst.  Update the old
path in advsync/rt.tex.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 advsync/rt.tex | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/advsync/rt.tex b/advsync/rt.tex
index c4d9c3c2..5bcdfabc 100644
--- a/advsync/rt.tex
+++ b/advsync/rt.tex
@@ -1486,7 +1486,8 @@ initiation take place on housekeeping CPUs, that special kernel
 Kconfig or boot parameters be selected in order to direct work away from
 the worker CPUs, or that worker CPUs never enter the kernel.
 Specific per-kthread advice may be found in the Linux kernel source
-\path{Documentation} directory at \path{kernel-per-CPU-kthreads.txt}.
+\path{Documentation} directory at
+\path{admin-guide/kernel-per-CPU-kthreads.rst}.
 
 A third source of OS jitter in the Linux kernel for CPU-bound threads
 running at real-time priority is the scheduler itself.
-- 
2.17.1

