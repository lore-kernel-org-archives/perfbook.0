Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=vhu4CwnVsczNkXcSRSLjH7bahkkQERVV1RwMmIz8aE4=;
 b=amN5IZCMFz8C2cW4xyOY0lnXU7hsqhGN4VMRCa/cyApD12ksKNJQMl8HU0QDdWAx5G
 3vYcAOOoNkKSWpHLJIIS3eBnz+/4pAWKYXKd2LmdD5YoC83mxW3/0qFyqSelFH4OpDZO
 TBNhcb49vXU4ENU7p6E8eLkszr6ysIQNCY9uv83kp5uxcGenonsFFI/8+IzMmdSRrcfH
 lHRSuV1jRZ4LZ/AKWo8+6P6LAtDNqZXZ0nuC1Typ3vCITL+9FtCbrhe6zb6NuV483sr2
 xNpGFJYqyJdCDilC/tYYCzyhyeUTVFlL4qhjWP8AajNKMKR8LPGgKEsM81gzV4KhJRBZ
 sv4w==
Subject: [PATCH 2/4] advsync/memorybarriers: Use American spelling
 (initialize)
References: <07d5345b-53d6-243c-8ba4-84b865552852@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <ccc88b8e-4252-e1f3-1cec-9b4dfd022b15@gmail.com>
Date: Sat, 28 Jan 2017 20:11:13 +0900
MIME-Version: 1.0
In-Reply-To: <07d5345b-53d6-243c-8ba4-84b865552852@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From edeae13c28aa406ce984c63f91556b4c6595679b Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 1 Jan 2017 18:17:55 +0900
Subject: [PATCH 2/4] advsync/memorybarriers: Use American spelling (initialize)

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 721d893..98f7787 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -1760,7 +1760,7 @@ RCU system, for example,
 see \co{rcu_dereference()} in \path{include/linux/rcupdate.h}.
 This permits the current
 target of an RCU'd pointer to be replaced with a new modified target, without
-the replacement target appearing to be incompletely initialised.
+the replacement target appearing to be incompletely initialized.

 See also
 Section~\ref{sec:advsync:Cache Coherency}
-- 
2.7.4


