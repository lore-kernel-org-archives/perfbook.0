Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbiI3Bqn (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 29 Sep 2022 21:46:43 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9464E83F3D
        for <perfbook@vger.kernel.org>; Thu, 29 Sep 2022 18:46:42 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id g23so1898245qtu.2
        for <perfbook@vger.kernel.org>; Thu, 29 Sep 2022 18:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=NAEwp2ggDtuxwKravIHl17iY1KUVKGUdt3QDKp7Zpkg=;
        b=qA1bXR3yNIPpSsdHDq6N8bgom5VsLYW3nZ+mNKuDMuVLxmJensVRHnaKT/t4AMb/jr
         0YC3sBHMpHbe5cgGDMz2PZb6PDWZjgw5ewvGxl/pkFb0W7X9xphLYqdDKynVhyxmvzP/
         XBlnPidwxpnlFvEpApVqWoVUTX0QHP0iekVLOrt1OeBtGL/rLV2IZbdmqzj7gYIHJvDa
         LBGl0YCeDGpA9WVB+Lm0a++t4bq+hLSHcr0/mA4gtvycGLI68f5QTvbKrloCiCveK0v3
         9o0PveVDNpU+zr9cAVEqlCGf4zGeIy6dTjvXEzjJWOGz1lgQ5bsnc1mbvX2G6F6OC+x3
         AMVw==
From: Elad Lahav <e2lahav@gmail.com>
Subject: [PATCH] locking: fix small typo
Date: Thu, 29 Sep 2022 21:46:36 -0400
Message-Id: <20220930014636.429996-1-e2lahav@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org
Cc: Elad Lahav <e2lahav@gmail.com>

Signed-off-by: Elad Lahav <e2lahav@gmail.com>
---
 locking/locking.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/locking/locking.tex b/locking/locking.tex
index 45a12caa..032bd13d 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -1473,7 +1473,7 @@ Should readers be allowed to continue to acquire the lock, possibly
 starving the writer?
 Similarly, suppose that a writer holds the lock and that a large number
 of both readers and writers are waiting to acquire the lock.
-When the current writer release the lock, should it be given to a reader
+When the current writer releases the lock, should it be given to a reader
 or to another writer?
 If it is given to a reader, how many readers should be allowed to acquire
 the lock before the next writer is permitted to do so?
-- 
2.25.1

