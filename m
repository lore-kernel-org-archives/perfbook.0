Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbiJKDVC (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 10 Oct 2022 23:21:02 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 186EC79605
        for <perfbook@vger.kernel.org>; Mon, 10 Oct 2022 20:21:01 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id e62so15031083yba.6
        for <perfbook@vger.kernel.org>; Mon, 10 Oct 2022 20:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0n0IkFlKtKUQwcMtCpPGN1HngC5BLoUuGpvANAdLQOw=;
        b=Jyy20l3QSqBIyZVUOAWTcgz16czGtrrv7G4O07o+70ZIGD+Lx6klFYl8RNMnDnuMyA
         scyPgKA+jgusS9OjCa3pT5OPi/C3GuotRdBPy78biUXsxOR9whNhGicg8a3Ri/syPUHS
         rdajAmiiVFhaJNdRpHWYRr8E3Yc6jMjxD7yVsLwecYR5OU4ulSRRo42/FawcCDxs8WJx
         kFXcq1gxaEe2mx5FG+03X7hlRzWXlwRWqTmQHO66EsFnbnpBh9NoD4hov/ewz9zzkA5x
         zjRor0paOlCaAfXYglstGXH7wIVs9IvnJ3AuJLDV4mRWNghZ93ZagsDZ4sPLcW9qQVLx
         kXHw==
MIME-Version: 1.0
From: Patrick Yingxi Pan <pyxchina92929@gmail.com>
Date: Tue, 11 Oct 2022 11:20:49 +0800
Message-ID: <CANJ3EgF8SzbAy8Wd7JANT20DCMtC7U3Z6Pzix3z9zJ-A3hYn+Q@mail.gmail.com>
Subject: [PATCH] memorder.tex: correct the transformed code by compiler.
Content-Type: text/plain; charset="UTF-8"
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hello!

I have added the missing READ_ONCE(). Please take a look. Thanks.

Signed-off-by: Patrick Pan <pyxchina92929@gmail.com>
---
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index a0a87d0a..50ff2882 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -2869,7 +2869,7 @@ An equals comparison on \clnref{equ} might lead
the compiler to (incorrectly)
 conclude that both pointers are equivalent, when in fact they carry
 different dependencies.
 This means that the compiler might well transform \clnref{pc} to instead
-be \co{r2 = q->c}, which might well cause the value 44 to be loaded
+be \co{r2 = READ_ONCE(q->c)}, which might well cause the value 44 to be loaded
 instead of the expected value 144.
 \end{fcvref}


base-commit: 7f12a9358e220f3d0c3a0880d01bc283113d7a5b
--
