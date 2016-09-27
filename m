Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=d4QLp8FPOxlAh7D4DNFypVfNm3jgTHGyEolTyL2baE8=;
 b=XLIvXGQ4c+Yh5rNl8AyLI7XZ9nKR1YKljdD4/pw6P21V/tWwz2VFays3zesLN2c5QS
 r5t0yIQ/QBW9Q4oA8tTm3n63EOEmb8Dd5n9H3K2kIO15WItzpngFBYLPJaTpP6af29O2
 t0xTH+TNMNwi6cHUdufUALstQHPJaW8OoqXiPqAD7gQXg4hcG5HLz9n2pApG/gLNd882
 K0rVzNRAkLkyEmJodx1QgzaUJJIzZoSug9RcJM0qMOSSf8atG7EoEXUQHCqdzS1LftfQ
 8fCOO5ZZdpANgf4jI2GKqj9qTiZ/VfzHFLHJ0Kxl688xHxhxr1cweVW7Msl6L6XyyU4X
 olAQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v3 15/17] formal/ppcmem: Substitute `paper` with `chapter`
Date: Wed, 28 Sep 2016 06:56:39 +0900
Message-Id: <20160927215641.7330-15-sj38.park@gmail.com>
In-Reply-To: <20160927215641.7330-1-sj38.park@gmail.com>
References: <20160927215641.7330-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: akiyks@gmail.com, perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/ppcmem.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/formal/ppcmem.tex b/formal/ppcmem.tex
index e33ba2f..743a891 100644
--- a/formal/ppcmem.tex
+++ b/formal/ppcmem.tex
@@ -391,10 +391,10 @@ It is worth repeating that formal methods and tools are no substitute for
 testing. The fact is that producing large reliable concurrent software
 artifacts, the Linux kernel for example, is quite difficult. Developers
 must therefore be prepared to apply every tool at their disposal towards
-this goal. The tools presented in this paper are able to locate bugs that
+this goal. The tools presented in this chapter are able to locate bugs that
 are quite difficult to produce (let alone track down) via testing. On the
 other hand, testing can be applied to far larger bodies of software than
-the tools presented in this paper are ever likely to handle. As always,
+the tools presented in this chapter are ever likely to handle. As always,
 use the right tools for the job!

 Of course, it is always best to avoid the need to work at this level
-- 
2.10.0

