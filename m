Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:38516 "EHLO
 mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1752041AbdLLPdX (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 12
 Dec 2017 10:33:23 -0500
Received: by mail-pf0-f196.google.com with SMTP id u25so14456769pfg.5 for
 <perfbook@vger.kernel.org>; Tue, 12 Dec 2017 07:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=cUK+PO2U0yyEwC4+1t3/AtpEX8mAzYBhSMpo0nj+6DE=;
 b=SghO+lDuk8Ji60u2vqhBnEdRV2tTPtW7ft/K6jkDMlUv2oJ4LhqU51wLbahO6+C4Bo
 avsdCCtXj2E/ujruDk+/fsf3OgJRN+6Dq2wY4mr6S/1khz3tWQ5+5inI5QtgRWGxw1sE
 FUaTT2m6DqL4/P3Ao3BqsJ3eHygEKBtkSclDzahc1Z7pYi/0US3QbDBk9+nqzu1L3nJ1
 u78rFCK29DAXsRjVEFoDHWiwrIequS4/CPT+EcY1L2+VfgN+aFLbndXHFc2NKlecJUGG
 MFtDwMl4RA371MaE4tslzFWZBBCFdeyvvcvou6nEE/6rNrK/ZTfMw40Ua6RTyL+yKU2V
 165w==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] CodeSamples/formal/herd: Tame 'sort' command by setting
 LC_ALL
Message-ID: <f0cbd8a6-921b-f863-b1bd-97fd35b6ccdd@gmail.com>
Date: Wed, 13 Dec 2017 00:33:17 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

From d6979ecb0635bd0418c049c89357cadb50cb32de Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 12 Dec 2017 23:56:07 +0900
Subject: [PATCH] CodeSamples/formal/herd: Tame 'sort' command by setting LC_ALL

Otherwise, results of sorting in targets run-absperf and
run-absperf-all will depend on locale setting.

Fixes: ef392264b2b1 ("CodeSamples/formal/herd: Make use of absperf scripts in make targets")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

I suppose your locale setting is "en_US.UTF-8".
If this is the case, the result of run-absperf with a short timeout
will look something like:

    C-SB+l-o-o-u+l-o-o-u-X.litmus 0.04 0.04 0.04
    C-SB+l-o-o-u+l-o-o-u-XE.litmus 0.09 0.09 0.09
    C-SB+l-o-o-u+l-o-o-u+l-o-o-u-X.litmus 1.55 1.55 1.55
    C-SB+l-o-o-u+l-o-o-u+l-o-o-u-XE.litmus 5.26 5.26 5.26
    C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u.litmus 0.6 0.60 0.60
    C-SB+l-o-o-u+l-o-o-u+l-o-o-u.litmus 0.06 0.06 0.06
    C-SB+l-o-o-u+l-o-o-u+l-o-o-u-C.litmus 1.22 1.22 1.22
    C-SB+l-o-o-u+l-o-o-u+l-o-o-u-CE.litmus 2.65 2.65 2.65
    C-SB+l-o-o-u+l-o-o-u.litmus 0.01 0.01 0.01
    C-SB+l-o-o-u+l-o-o-u-C.litmus 0.04 0.04 0.04
    C-SB+l-o-o-u+l-o-o-u-CE.litmus 0.06 0.06 0.06

I used "sort -r" to have the ordering as:

    C-SB+l-o-o-u+l-o-o-u.litmus 0.01 0.01 0.01
    C-SB+l-o-o-u+l-o-o-u-XE.litmus 0.09 0.09 0.09
    C-SB+l-o-o-u+l-o-o-u-X.litmus 0.04 0.04 0.04
    C-SB+l-o-o-u+l-o-o-u-CE.litmus 0.06 0.06 0.06
    C-SB+l-o-o-u+l-o-o-u-C.litmus 0.04 0.04 0.04
    C-SB+l-o-o-u+l-o-o-u+l-o-o-u.litmus 0.06 0.06 0.06
    C-SB+l-o-o-u+l-o-o-u+l-o-o-u-XE.litmus 5.26 5.26 5.26
    C-SB+l-o-o-u+l-o-o-u+l-o-o-u-X.litmus 1.55 1.55 1.55
    C-SB+l-o-o-u+l-o-o-u+l-o-o-u-CE.litmus 2.65 2.65 2.65
    C-SB+l-o-o-u+l-o-o-u+l-o-o-u-C.litmus 1.22 1.22 1.22
    C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u.litmus 0.6 0.60 0.60

This change ensures the intended ordering no matter what your locale is.
(Well, this is not ideal, but close enough.)

        Thanks, Akira
--
 CodeSamples/formal/herd/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CodeSamples/formal/herd/Makefile b/CodeSamples/formal/herd/Makefile
index 7bbfeaf..8e0635a 100644
--- a/CodeSamples/formal/herd/Makefile
+++ b/CodeSamples/formal/herd/Makefile
@@ -79,6 +79,7 @@ absperf.out: ABSPERF_LIST = $(ABSPERF_SHORT)
 absperf.out: $(ABSPERF_SHORT)
 absperf-all.out: ABSPERF_LIST = $(ABSPERF_TEST)
 absperf-all.out: $(ABSPERF_TEST)
+$(ABSPERF_OUT): export LC_ALL = C

 $(ABSPERF_OUT):
 	mkdir -p absperf
-- 
2.7.4

