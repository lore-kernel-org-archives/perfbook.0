Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230362AbhJLCgp (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 11 Oct 2021 22:36:45 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 540A6C061570
        for <perfbook@vger.kernel.org>; Mon, 11 Oct 2021 19:34:44 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id 21so6348041plo.13
        for <perfbook@vger.kernel.org>; Mon, 11 Oct 2021 19:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SS11mUVtew5dugNfKkVOx7qyjSGtZZjtYjd30/7M6HA=;
        b=Ac3muVg0vXgh5daMtTDaoFJWLf4XjDuSCE/FX1Uu5uy7ChOtsraguexoU6YajxIdIY
         WtkFD3G9SgymSgQexfCbyCKKdwTv2EZYorDHsGGQ/g8vVXYqzNaVPqKf9TSI/HcuXUmX
         4o2lWYY1j0Rs6hIufO/gsQeRZltLuNZ04EnsHfulkl3cOaRsVLJpGpQkahj23dx5WUnD
         r75y5Z1LH/kt0RKvDyJ2JY3oe+ngE96o+9/BmFSyZdLC/dosuAvKPoH7qCZHhtuHcXZT
         fit8cdei1Vm42kbycYi3KE/beqHji0av3pp2dN/3zTkPw/slrLdkUmIOTeWl5hrR3nSU
         3/cw==
From: Chin En Lin <shiyn.lin@gmail.com>
Subject: [PATCH] toolsoftrade: Fix typo
Date: Tue, 12 Oct 2021 10:34:38 +0800
Message-Id: <20211012023438.5322-1-shiyn.lin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org
Cc: Chin En Lin <shiyn.lin@gmail.com>

Signed-off-by: Chin En Lin <shiyn.lin@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 8c86d728..c9f5b399 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -2052,7 +2052,7 @@ which are up next.
 
 Although it is now much maligned, before the advent of C11 and
 C++11~\cite{PeteBecker2011N3242}, the \apic{volatile} keyword was an
-indispensible tool in the parallel programmer's toolbox.
+indispensable tool in the parallel programmer's toolbox.
 This raises the question of exactly what \co{volatile} means,
 a question that is not answered with excessive precision even
 by more recent versions of this standard~\cite{RichardSmith2019N4800}.\footnote{
-- 
2.24.3 (Apple Git-128)

