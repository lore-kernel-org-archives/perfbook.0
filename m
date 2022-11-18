Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241362AbiKRIYL (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 18 Nov 2022 03:24:11 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52B9E64A3C
        for <perfbook@vger.kernel.org>; Fri, 18 Nov 2022 00:24:08 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id d9so8071040wrm.13
        for <perfbook@vger.kernel.org>; Fri, 18 Nov 2022 00:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VOZaCZndB5AIYWG4ICFCimlllpNrfpRZ1WraXv8WNQA=;
        b=HTDdLQkdVCm4BRMt9RS78ZbqwqUrocbh/ybPinZrjki99OwU94+CkFg9wsHyF7kLrL
         scG62P6ACkdYmYSY2hXaIKvuFGg2lzuFwUBM36Q7Zktl9h0wDYWwsxMextBncpegIJGk
         R9eaPXwju/TxL3G0D7Lx3EfW0MxvzaiYrDesoE+KoC0Tzy1yBUdPUicHgBjtAaQKfKpK
         HrdjMzDeykmddCpQM+IMAozuDCoL6VrF0OanYw2AbDPT8u3dyhiG2+dx8HBbprStMNED
         TqPY3gkubJVk3KUBN4ixCidaFr/0Hi12sJJVXusOyLNpdGZuYzkeDjcWKMT7WdEn85fT
         /GJg==
From: Elad Lahav <e2lahav@gmail.com>
Subject: [PATCH] RCU fundamentals: too many ares
Date: Fri, 18 Nov 2022 03:23:45 -0500
Message-Id: <20221118082344.216904-1-e2lahav@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org
Cc: Elad Lahav <e2lahav@gmail.com>

Signed-off-by: Elad Lahav <e2lahav@gmail.com>
---
 defer/rcufundamental.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index 82d04bba..39b2f7ff 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -546,7 +546,7 @@ that single-item lookups are much more common in practice than are
 full-data-structure traversals.
 After all, full-data-structure traversals are much more expensive than
 single-item lookups, so developers are motivated to avoid such traversals.
-Not only are concurrent updates are less likely to affect a single-item
+Not only are concurrent updates less likely to affect a single-item
 lookup than they are a full traversal, but it is also the case that an
 isolated single-item lookup has no way of detecting such inconsistencies.
 As a result, in the common case, such inconsistencies are not just
-- 
2.34.1

