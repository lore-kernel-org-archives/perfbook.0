Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2zPlKE/jioGPvMPX9OCPUrwcGei4IsdF1JbbZfqneO0=;
 b=fkvft8JvKMWADgk1E5VLyd2bqFDPQ2e5IeSMcQmItSO6W/+tddpQ2P1OzZcShWjA0j
 kpzwatXhXUf96LI/nCnBFq2vI3X75GgL+I5owaRyOMIkl9lUvYZ/IxrPHNOdMgj1oQn3
 f8z6uCQysjOHYVVGN+cBIehWBa7sF/3mmQGbCU5x3LlCozB/jFBxgW2Vzf6OjmsjyY29
 XDByji+oyB5FsBMe2XvJ4kjpCpJMRSI6Kzgwf7yKGzKqz/GQKqrF8A25/UqrPL+xfmk2
 Vb27EuM5LDn+BInO5cgbpjsOS26ZaP8B/NF8IaIizGPOwQ7yDQrL1HeZTyE42TvxqK9Z
 1PyA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 3/8] together: Fix wrong function name quotations
Date: Tue, 11 Oct 2016 08:07:33 +0900
Message-Id: <20161010230738.14452-4-sj38.park@gmail.com>
In-Reply-To: <20161010230738.14452-1-sj38.park@gmail.com>
References: <20161010230738.14452-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Few sentences calls `kref_sub()` function as `kref_put()`.  This commit
fixes the wrong citations.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 together/refcnt.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/together/refcnt.tex b/together/refcnt.tex
index a7e6c7bd0332..22d0a8d1d08e 100644
--- a/together/refcnt.tex
+++ b/together/refcnt.tex
@@ -304,11 +304,11 @@ optimizations on all platforms, but the fact that the \co{kref}
 primitives are in a separate module and that the Linux kernel build
 process does no cross-module optimizations has the same effect.

-The \co{kref_put()} function on lines~16-28 atomically decrements the
+The \co{kref_sub()} function on lines~16-28 atomically decrements the
 counter, and if the result is zero, line~24 invokes the specified
 \co{release()} function and line~25 returns, informing the caller
 that \co{release()} was invoked.
-Otherwise, \co{kref_put()} returns zero, informing the caller that
+Otherwise, \co{kref_sub()} returns zero, informing the caller that
 \co{release()} was not called.

 \QuickQuiz{}
-- 
2.10.0

