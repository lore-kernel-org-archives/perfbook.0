Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239314AbiKQHaF (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 17 Nov 2022 02:30:05 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C5B5663D8
        for <perfbook@vger.kernel.org>; Wed, 16 Nov 2022 23:30:03 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id r7-20020a1c4407000000b003cffd336e24so579412wma.4
        for <perfbook@vger.kernel.org>; Wed, 16 Nov 2022 23:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3ghu1xEdXR2q4+9ud9Ynydx8Hb5O03Uehn5n0vpc1Nc=;
        b=Gn7IjG7AlHtGFFburqwuYx0Z3xE78r9niI3IR0lo+5WgGKg7oo9+MjUWBYxSrM3uEr
         nYdEf0AHVzdOmvxlzHgApTni9m8+g48NaUzR5JZehmgSWh6oBeNI9MyLDTxLRC8ircQq
         q2dcXBVMD4XNEkRIPf4KwWSsj6lTbs/EbiZyOn7nzLZe6RV06qmXimhJBprz8sh1OuO1
         ffmiNai6lpRz1n7OjR/UcM234yApUcdDs6JDZKaZm3qDkqFzbjhKtnOTh5Tf6hmb10Pw
         tEo0qkyamr41oe+slL4Kjim01fvj518XRYxwy3sipGwacO+yebpEhymP/QXAQaa2Gp5L
         VlcA==
From: Elad Lahav <e2lahav@gmail.com>
Subject: [PATCH] RCU fundamentals: fix tense
Date: Thu, 17 Nov 2022 02:29:31 -0500
Message-Id: <20221117072930.155865-1-e2lahav@gmail.com>
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
index 87dfaa95..e3cda306 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -17,7 +17,7 @@ being used to allow readers to tolerate concurrent insertions and deletions.
 \Cref{sec:defer:Publish-Subscribe Mechanism}
 describes the publish-subscribe mechanism used for insertion,
 \cref{sec:defer:Wait For Pre-Existing RCU Readers}
-describes how waiting for pre-existing RCU readers enabled deletion,
+describes how waiting for pre-existing RCU readers enables deletion,
 and
 \cref{sec:defer:Maintain Multiple Versions of Recently Updated Objects}
 discusses how maintaining multiple versions of recently updated objects
-- 
2.34.1

