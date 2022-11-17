Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234754AbiKQHon (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 17 Nov 2022 02:44:43 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 585552BC4
        for <perfbook@vger.kernel.org>; Wed, 16 Nov 2022 23:44:42 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id a14so2277824wru.5
        for <perfbook@vger.kernel.org>; Wed, 16 Nov 2022 23:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4YDxrpfxwhELTh7t2+i7RFIoFQ9lSb/AmHOKJrNGtt4=;
        b=Wz+/ARj4irP4dymR30dbU12/SLGkYkIAUT18f6OdVfvL2SDVEYfXqHJui9p6xNdRmv
         mXjyiU1GMwagz1VUsM/xoolMtI1LuYonVFPcoQxhHD8hido9G28JpUa/Aee3ytgcu3MH
         Ut7/J5o5pPUyT5YOStd4WSIu/xoKUIyoQs7xq88bytw4qqxbO8k9nLrqng/R4YDOWwNX
         RZWa3fAibPLGixQUH5dOvBYxifxfUYbHjBx4/bBYjzD7EosCsbHNIdvYSaFPTWk0i1Ms
         SusvE/uBA1zw2puqw0KKyD1c42gX8nLaS+Sz5NJ1qziRbhLkbtLUsr+jRaVRa+13V317
         IKYg==
From: Elad Lahav <e2lahav@gmail.com>
Subject: [PATCH] RCU fundamentals: reader is access_route() not read_gptr()
Date: Thu, 17 Nov 2022 02:44:26 -0500
Message-Id: <20221117074425.157105-1-e2lahav@gmail.com>
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
index 87dfaa95..4abd9d07 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -56,7 +56,7 @@ It is instead necessary to inform both the compiler and the CPU
 of the need for care, as can be seen from
 \cref{fig:defer:Publication/Subscription Constraints},
 which illustrates interactions between concurrent executions of
-\co{ins_route()} (and its caller) and \co{read_gptr()} from
+\co{ins_route()} (and its caller) and \co{access_route()} from
 \cref{lst:defer:Insertion and Deletion With Concurrent Readers}.
 
 The \co{ins_route()} column from
-- 
2.34.1

