Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:33142 "EHLO
 mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750865AbdAPPHR (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 16
 Jan 2017 10:07:17 -0500
Received: by mail-pg0-f68.google.com with SMTP id 194so5571506pgd.0 for
 <perfbook@vger.kernel.org>; Mon, 16 Jan 2017 07:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=nW8V8HlRTiW2IYWCnCcqO8yNYDLiorihaVP8dxk8ihk=;
 b=fInYWK2BCwzwuhvwb0ZPn4IXrdowrpvSBuD2jT8ZKhG72h+z9tUlWQsPwStOXK9M2x
 7GlS32WMyiCCaIHJSwb3BjLCrk3Nrqezt68qHSajieRpNzcPD/c4r/A0Gs7ES09sZtXB
 IHpFCfUQ5LW42Rs00LvALnsggtU+e4vq5X4AIcXIBfyLiGcL6q6JFe0JPf7C5MR1WFPb
 znq8EPAKPSmrUo+8U+cIdxM4O6j17QqwngAEhCQqkAMb5QjuO5lAiEcf7gxwy0xt/7q5
 rY2qtASTW/ueeZYvO9HZwG1XUVghEqKhn4/KuOaYh5FWJpHM5cZxs8hJXRIWG3I4DMIW
 qTwA==
Subject: [PATCH 7/8] Comment out 'process' in hyphenation exceptions
References: <2c5427c4-463a-d118-3c30-d2c9f7ffd5a7@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <d30e67f5-fe74-526f-9749-cefadb439146@gmail.com>
Date: Tue, 17 Jan 2017 00:07:14 +0900
MIME-Version: 1.0
In-Reply-To: <2c5427c4-463a-d118-3c30-d2c9f7ffd5a7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

From 4a4f91cb615152b18d07c88887cf2ed95050c1a7 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 15 Jan 2017 19:40:02 +0900
Subject: [PATCH 7/8] Comment out 'process' in hyphenation exceptions

Hyphenation of "pro-cess" should be acceptable for perfbook.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 ushyphex.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ushyphex.tex b/ushyphex.tex
index 3f3075c..9a81811 100644
--- a/ushyphex.tex
+++ b/ushyphex.tex
@@ -862,7 +862,7 @@
   pret-ty-prin-ter
   pret-ty-prin-ting
   pro-ce-dur-al
-  process
+%  process       pro-cess is acceptable for perfbook
   pro-cur-ance
   prog-e-nies
   prog-e-ny
-- 
2.7.4


