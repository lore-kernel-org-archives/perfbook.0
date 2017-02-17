Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:36565 "EHLO
 mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1754904AbdBQByj (ORCPT <rfc822;perfbook@vger.kernel.org>); Thu, 16
 Feb 2017 20:54:39 -0500
Received: by mail-pg0-f66.google.com with SMTP id a123so660050pgc.3 for
 <perfbook@vger.kernel.org>; Thu, 16 Feb 2017 17:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=t+6SNyVFFhdWTOLhD002iJiMmfTom250L59SAThVj0I=;
 b=h/YJrv/EXZVVK19DVakDbeq2YPo+b1VPJ69AEprBWmEqT50ZTEHm+VMuBNzbu4wP4c
 Q6O5Y5FnLt+pMwRj+P59TqoLOrWvliKcv5ulI+1awJRmAKlG79vwZU64YAuZ7sX4Uxs4
 kZitBAw2Uaczkqyyn7FXKVTQHBvIuEoxpEzUA8gvr57k0sakyN8PPb3OTJpudYmWn9jX
 pZt859jqko/Yw1vUR4pPkHg5kVhg2/94ze0HXn/H9jzdYoLf+QFpsSmNzbYuy9iYjjxk
 q+6vATqHSq0nrxNZy9eXJuNM3xvgsEaWcmkfUwTl/gxJk629kyPw+oxNrC4Z+/D8zQlk
 e7bw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH] appendix/whymb: Fix a typo, smb_wmb into smp_wmb
Date: Fri, 17 Feb 2017 10:54:15 +0900
Message-Id: <20170217015415.32519-1-sj38.park@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 appendix/whymb/whymemorybarriers.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index 9002047a9878..3a22e46beb0c 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -2265,7 +2265,7 @@ a write to a given MMIO register affects the value that will next be
 read from {\em some other} MMIO register.

 It is not clear why SPARC does not define \co{wmb()} to be
-\co{membar #MemIssue} and \co{smb_wmb()} to be
+\co{membar #MemIssue} and \co{smp_wmb()} to be
 \co{membar #StoreStore},
 as the current definitions seem vulnerable to bugs in some drivers.
 It is quite possible that all the SPARC CPUs that Linux runs on
-- 
2.10.0

