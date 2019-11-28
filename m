Return-Path: <SRS0=65dD=ZU=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=uaUQPSp2xIr0ojglEwBpNQWa8TwqInZxZDblaIAsSVw=;
        b=Xg4NAcrLOGSNNrT/aqXYEcvSODYzNLBAv5+LeOT0iSWayAlfMZd7+wKEqGhrDM2TpC
         eUNgPM1QL1iS580un2VJBPPWJPSDyP28LCnm2OSYMTlT8BzqLk9h06jpbuesvW5sdbBx
         0A5WVmRxnc1m6DD33gGwwqBoOTtmb524Vb1WpdxHLdZdfGDn3U+rvoFQoWiNq4BD0XFs
         6UDQjbzUY1m2Xuono7JnINikvAAoqGSZhkotxFZT71CO8gWuKc+pgH2ZipYpVp8JZ6N/
         GVxIxq4A4GUbvQcpYnCRiyktW0REEVsuTyUVtRgEqy5yWFV1hqncFUo/69ixsT36oJpa
         P2MQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/3] toolsoftrade: Backport updates in LWN article
Message-ID: <c132d968-1c16-ebfa-ca7f-9b3caff5eecb@gmail.com>
Date: Fri, 29 Nov 2019 07:24:21 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This patch set backports changes made in the LWN article "Who's afraid
of a big bad optimizing compiler?" around store tearing.
Although the origin of the article was Section 4.3.4.1, we can think
of the article as the original publication of the section. There will
likely be further updates in perfbook on this matter.

Patch #1 adds entries in bib/swtools to be cited in Patch #2.
Patch #2 does the backport, with the report in 2013 being kept
in a citation.
Patch #3 is a cosmetic change in the beginning of Section 4.3.4.4.

        Thanks, Akira
--
Akira Yokosawa (3):
  bib/swtools: Add entries of reports on store tearing
  toolsortrade: Backport LWN article
  toolsoftrade: Use 'quote' for made-up dialogue

 bib/swtools.bib               | 18 ++++++++++++++++
 toolsoftrade/toolsoftrade.tex | 39 +++++++++++++++++++++++++----------
 2 files changed, 46 insertions(+), 11 deletions(-)

-- 
2.17.1

