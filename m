Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbiJKDRi (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 10 Oct 2022 23:17:38 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAFB772EDE
        for <perfbook@vger.kernel.org>; Mon, 10 Oct 2022 20:17:37 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id b145so15094635yba.0
        for <perfbook@vger.kernel.org>; Mon, 10 Oct 2022 20:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rwd5SBM6FOdIDDW8SfzY28uMBAYLoXxISWP8aJcyteM=;
        b=Q69U6RxyrtV7Cuq8wqQIS5WnZpnQKoM4AYhoKvNkMVcsoS1j1CnwhJD49uda3L9T+T
         Y387KOT3JEZ2oyCQ4L0DSKLJoYtfyFw8Xp8F7qdv+6IOjv+7SU1tdWriMxI0iglpYBFX
         /AP/kvIveAOCEhq4HUTZ8m/NkUw9f3F2hNZT/p+6n2Ul8jpzRsIY9aZR6Zg13GNi2MWT
         QCFZowcNrSkvKpyo3F98NO6K9VlRYUyyYIq0W4KYYKp4of2fF0NK3ufDnjYFLnV5qygi
         ZQ+kOGTDku/ibNCcoNzNUIS/9RMc4f/cKUs4vMMf21/kuDWFxI7hXA8XhnuAO4R62r4r
         tkMQ==
MIME-Version: 1.0
From: Patrick Yingxi Pan <pyxchina92929@gmail.com>
Date: Tue, 11 Oct 2022 11:17:25 +0800
Message-ID: <CANJ3EgF5G-rK+VVTigRkDp97=UtAh3TcVWr0tcpZv2NF_0n-Hw@mail.gmail.com>
Subject: [PATCH] memorder.tex: the exists clause in Listing 15.35 should never
 be satisfied.
Content-Type: text/plain; charset="UTF-8"
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hello!

According to the context and my understanding of locking primitives, I
suppose the 'exists' clause in the litmus test shouldn't be satisfied.

Signed-off-by: Patrick Pan <pyxchina92929@gmail.com>
---
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index a0a87d0a..9c1846d0 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -3452,7 +3452,7 @@ following subsequent critical sections?
 This question can be answered for the Linux kernel by referring to
 \cref{lst:memorder:Accesses Outside of Critical Sections}
 (\path{C-Lock-outside-across.litmus}).
-Running this litmus test yields the \co{Sometimes} result,
+Running this litmus test yields the \co{Never} result,
 which means that accesses in code leading up to a prior critical section
 is also visible to the current CPU or thread holding that same lock.
 Similarly, code that is placed after a subsequent critical section

base-commit: 7f12a9358e220f3d0c3a0880d01bc283113d7a5b
--
