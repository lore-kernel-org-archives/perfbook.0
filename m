Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:34171 "EHLO
 mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S932444AbdBVOaC (ORCPT <rfc822;perfbook@vger.kernel.org>); Wed, 22
 Feb 2017 09:30:02 -0500
Received: by mail-pg0-f67.google.com with SMTP id s67so640345pgb.1 for
 <perfbook@vger.kernel.org>; Wed, 22 Feb 2017 06:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=mEHzyoMJEI41kYn1csC3Qio0gTbcPHhwmWpPweIggL4=;
 b=glskYHKTWWIpqpZO+tdsn7IfZZHJoaE9yodqKqdM7UgWDt0zLkcqlrJ5izND7nwgxM
 yP1wIWGY3Bv/xZiv+M/Ba9L3ZZMIrqpOyXvpsLmkrbvTK8OKdfap38EWXSmuemMgrVn/
 v3Y1WDnFtTKxMBp55lpumiXQ396pxoiNkqvRCnMsPDCrD7gM3ZlTy7p2CP/B1f6T1JP1
 W4cuW1TV7p74XiaP2OmxDAByzG4/uOrpbhh3SLDPcF025hpWCQApYvMgbfJjChkvNN2d
 FyMLarde3HAXyyYVIsXZgXr5P3aSpi81XS3AmOeAs1tHmcTz1Siw7wDw4UYyPpegVYK8
 adVw==
Subject: [PATCH 2/3] bib/TM: Append location to Volos2008TRANSACT
References: <f6da3408-03f7-a4d4-4910-0181e1df7172@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <dc1ce03f-84dd-3a10-cf03-b17d8d51a2ed@gmail.com>
Date: Wed, 22 Feb 2017 23:29:58 +0900
MIME-Version: 1.0
In-Reply-To: <f6da3408-03f7-a4d4-4910-0181e1df7172@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

From a1b4a9d66ca9a256e3c4b4519e499300f35fddfa Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 12 Feb 2017 13:13:57 +0900
Subject: [PATCH 2/3] bib/TM: Append location to Volos2008TRANSACT

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/TM.bib | 1 +
 1 file changed, 1 insertion(+)

diff --git a/bib/TM.bib b/bib/TM.bib
index 04d45ad..8afec90 100644
--- a/bib/TM.bib
+++ b/bib/TM.bib
@@ -491,6 +491,7 @@ and Haris Volos and David A. Wood"
 ,booktitle = {3rd ACM SIGPLAN Workshop on Transactional Computing}
 ,month = "February"
 ,year = {2008}
+,location = {Salt Lake City, Utah, USA}
 ,publisher = {ACM}
 ,address = {New York, NY, USA}
 ,note="Available:
-- 
2.7.4


