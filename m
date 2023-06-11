Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686503773;
	bh=ORKhaHSdcjtN1KYRxQrUKXwjr2HzMm84qARM+qdmhkI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fkp8oyT7p39DGHZfonc2F+eHTL39A1kp2zZIdfXKkprYBqZOgFHSj16iAUcI6UHPq
	 GBpw1bxe111zIYSuR9WSssZf4SjBzmeYJ3PaIRUqThaQek23bXmIK6Y6y+/kpXXf7s
	 MDSUI+r0qNPI8Wox3Z6QFc97Itkr6N9XGzDwjrIbKeOfoaor0x8a4Bjm80hJ9cxIcV
	 4xDMbg0GdT/dLfNNvHJVpKCvjBgs5HoSKchECc6/7QZ0qvbwbuln2kJAQkiNLVWvP5
	 GVlkeKPNDWDmXdbmy/Mih4967nAdzSRwG68iUi6UgNICeomBe6RUxA6+e9RHVr/5xV
	 wchOhnI/Q/6Qw==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 2/2] advsync/rt: Mention the tree of Documentation/ directory
Date: Sun, 11 Jun 2023 10:15:06 -0700
Message-Id: <20230611171506.32033-3-sj@kernel.org>
In-Reply-To: <20230611171506.32033-1-sj@kernel.org>
References: <20230611171506.32033-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

A sentence in rt.tex is mentioning a file under Linux source tree's
Documentation/ directory without the explanation of the tree.  Add it so
that readers can easily find the mentioned file.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 advsync/rt.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/advsync/rt.tex b/advsync/rt.tex
index 5bcdfabc..e02da57a 100644
--- a/advsync/rt.tex
+++ b/advsync/rt.tex
@@ -1626,7 +1626,7 @@ real-time and heavy-compute workloads, but hurts other workloads
 that feature high rates of system calls and
 I/O~\cite{AbdullahAljuhni2018nohzfull}.
 Additional limitations, tradeoffs, and configuration advice may be
-found in \path{Documentation/timers/no_hz.rst}.
+found in \path{Documentation/timers/no_hz.rst} file in the Linux source tree.
 
 As you can see, obtaining bare-metal performance when running
 CPU-bound real-time threads on a general-purpose OS such as Linux
-- 
2.17.1

