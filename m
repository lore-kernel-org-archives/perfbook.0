Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=YC5bYpHadOnBfgHdofeSspcd4DbXbDu+qlWEdEIm7iA=;
 b=GgvRgbvPbFmSktoYSpT1rbvukSsrcaFpJPGs0BnAHu5/pwEMNYlAsh6BKMxEDvcpXy
 5Psq6jWi5AtOyy3lRPsMfIWhGUbzfnGmSucgjC5SYP5xSRpzRGwYlN0Lv8uGOPwzGGQs
 DdLlFygj13sWXPVT9UhfOGPMBCIe3euc14QzQiuUDrFjYkG/8QHmvjdoJw/+KYbbs+o5
 R7+SN4f6giANA4VuS1T04Zc4Lys9yDja19n/zhN5rFxpatHJ0wsDtmM9GrJKsa4HrfZ0
 nP0KR3TIxyBV97d3e7ryDtJiRmbfjSk1CNcnNKhQC0ya1cOAWJBMOiIYGX7Dc9Mhki4K
 Grgg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/2] Enable hyperlink border in bibliography
Message-ID: <b194a26a-355b-94f5-2bba-57269769d58e@gmail.com>
Date: Fri, 3 Mar 2017 21:27:35 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 5a3db5ddd9458a1787bdf9bd554146079501df18 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 3 Mar 2017 21:21:25 +0900
Subject: [PATCH 0/2] Enable hyperlink border in bibliography

So, this patch set enables hyperlink border for all layouts.
Patch 2 is another update to append doi.

                                Thanks, Akira
--
Akira Yokosawa (2):
  appendix: Enable hyperlink border in bibliography for all layouts
  bib/syncrefs: Add doi to Hoare74

 appendix/appendix.tex | 4 ++--
 bib/syncrefs.bib      | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.7.4

