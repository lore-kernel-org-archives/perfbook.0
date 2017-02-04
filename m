Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pf0-f172.google.com ([209.85.192.172]:34781 "EHLO
 mail-pf0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750851AbdBDPHy (ORCPT <rfc822;perfbook@vger.kernel.org>); Sat, 4
 Feb 2017 10:07:54 -0500
Received: by mail-pf0-f172.google.com with SMTP id e4so12920751pfg.1 for
 <perfbook@vger.kernel.org>; Sat, 04 Feb 2017 07:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=XNE7jNVxvEDdSMAY/3ls8vpAb72QW287PfClMlp5p9I=;
 b=GF9xfaefUTjoyyrhajZvgrQ+HbCEVUtyCrAvgjX94rlXo/5wBxsiHzLItHWGGLc1Nv
 F+TBjjj4M5iDcZuJfeS6lEsjM8K2UkzVVcVL/ty2TiMD21YHXy9b/x5XRVap+WSmapyu
 7AEM46JC9tCz3MJwv9si3I1d+0RvaM4SJOysBbjl1Vl29QSNG4afGTAeCU92w+Rgj0zj
 j/59Lg1omjLPXTb3sOK6wwp8NCy1yP05OnzkpWY8hSIpgh35SAAZPel1h+7r2oxhFvmy
 l00sxPNUqUsHezoXXzIdJmwFqIDDtDtTslBYSGWFoAIIXF9Ic9IKyBFdbeUgut7Z2FXz
 xjLw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] SMPdesign/beyond: Remove redundant 'although'
Message-ID: <ab3d990e-b19c-d0cb-6f08-613e990221e9@gmail.com>
Date: Sun, 5 Feb 2017 00:07:48 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

From 4c4f3e57a64fc74e312bf24c00174b2db3dbe27f Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 4 Feb 2017 23:49:51 +0900
Subject: [PATCH] SMPdesign/beyond: Remove redundant 'although'

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

This "although" seems redundant, doesn't it?

                                        Thanks, Akira
--
 SMPdesign/beyond.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/SMPdesign/beyond.tex b/SMPdesign/beyond.tex
index 0f86303..ee1a27d 100644
--- a/SMPdesign/beyond.tex
+++ b/SMPdesign/beyond.tex
@@ -626,7 +626,7 @@ to be retrofitted into existing programs.
 \section{Partitioning, Parallelism, and Optimization}
 \label{sec:SMPdesign:Partitioning, Parallelism, and Optimization}

-Most important, although this chapter has demonstrated that although applying
+Most important, although this chapter has demonstrated that applying
 parallelism at the design level gives excellent results, this final
 section shows that this is not enough.
 For search problems such as maze solution, this section has shown that
-- 
2.7.4

