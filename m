Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:35830 "EHLO
 mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1756230AbdEKPEH (ORCPT <rfc822;perfbook@vger.kernel.org>); Thu, 11
 May 2017 11:04:07 -0400
Received: by mail-pg0-f66.google.com with SMTP id i63so3872689pgd.2 for
 <perfbook@vger.kernel.org>; Thu, 11 May 2017 08:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=XVsNuyu4LYGzpep6oETxbwk+3A5PUa+4BbowVFa2G/U=;
 b=IGBENIOLbEHAhLLGsnf1RD23iwCEmWPvCNswnypf2Pho6r1Grdf0bT7inlXFvpm+1X
 Lh63nkE9Le4oiITW4MmFNYulxYBPeSjb2BjQBAZTJARFoJtSaxEkndDl4g8CntVeytH7
 8XNdbAsHl4MUd9Rd4ikr3aM1z7Pf3+f4IF2gm/O1Qs8/8nK4j37YlCW2JimtPE3b32MT
 qQfJKCzep8dAP5jM3xmSV9GkAOQkz1BFu4BiOYNIwVHp690B2Zqf/IS5jAEYkbPHIGaF
 KEipl6ZGJfFHGm18OCDSoHplwipygyHAY9g1C4DXe1en4juridyWtImX8b3tF7TkYd8H
 pMfQ==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH 0/2] Use READ_ONCE() and WRITE_ONCE in count_stat_eventual.c
Date: Thu, 11 May 2017 23:03:40 +0800
Message-Id: <1494515022-30278-1-git-send-email-junchangwang@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org
Cc: Junchang Wang <junchangwang@gmail.com>

Hi Paul,

Please check the updated patch. The first patch is to replace existing
ACCESS_ONCE to new READ/WRITE_ONCE primitives, and the second to protect global
share variable stopflag.

BTW, I didn't see any performance differences between versions using volatile
and READ/WRITE_ONCE primitives on my 16 cores Intel machine. I guess the major
reason is that the sample code is simple such that registers are enough even if
keyword volatile is used.


Junchang Wang (2):
  count_stat_eventual: Switch from ACCESS_ONCE() to
    READ_ONCE()/WRITE_ONCE()
  count_stat_eventual: Add READ_ONCE() to protect global shared variable
    stopflag

 CodeSamples/count/count_stat_eventual.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

-- 
2.7.4

