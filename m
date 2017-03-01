Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=35/z/thBbv5FBreOu4A0nk7MMk+JMlQh0WZd/e0GLB0=;
 b=ruDLFWSpTVwoFMplUK3JIG9YzHLRZhe1lkv2nHR33JMGfiZiTDZuVeTBBhvCEdhYd6
 BKt3lfDeeYStdFmlIsT/EkNhTCX1nxGT6veK2MAECr/N0QUTvvEDwsAVtcc2rB7Rpxwr
 TWMceZNcqHwUrlj0ZneA29kHFrgNkLOkHp7zr/LT8r9Vn99po0ZMVz9bD18v6yEYk7GI
 PwA/SVdwVpfNqRICaRdmk+mvfq0o4aLECvX9LTPybTXEUllK79+OhKBBF/cgHyo7UqgC
 cJ4VIDcowWd0wcLiSWxmjubvITlFVz3TGkvzEp1qCErOG19933jCQ8IwZJtuf302kX3O
 aG7w==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/2] Bibliography updates
Message-ID: <b42f2dde-a53b-99dd-ee36-f8d417460695@gmail.com>
Date: Thu, 2 Mar 2017 07:10:01 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From f7c3656241243faf11d23bf17fea9da765c260f3 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 2 Mar 2017 06:52:36 +0900
Subject: [PATCH 0/2] Bibliography updates

Hi Paul,

This is another round of bibliography updates.
Patch 2 enables "pdfborder" of links in bibliography for 1c layout.
Please try it and see if it is not too distracting. If you think
it is good for 2c layout, please let me know.

                                Thanks, Akira

Akira Yokosawa (2):
  Bibliography updates
  appendix: Draw hyperlink border in bibliography for 1c layout

 appendix/appendix.tex | 14 +++++++++-----
 bib/RCU.bib           | 10 ++++++++--
 bib/TM.bib            |  5 +++--
 bib/WFS.bib           |  2 ++
 bib/os.bib            |  3 +++
 bib/parallelsys.bib   |  5 +++++
 bib/syncrefs.bib      |  1 +
 7 files changed, 31 insertions(+), 9 deletions(-)

-- 
2.7.4

