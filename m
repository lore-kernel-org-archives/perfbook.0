Return-Path: <SRS0=onBR=PQ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=VdskEVg5zNH1+cJgzPKwFr/KGix9y8vbVdftxwePfw0=;
        b=lTohrJvkWq7rjmAZyBuxTHaCLh63Xa8rLHA6/4p5vayFac7QRekFPUlelB1olqL1nB
         HUfWBta3zAkh8o04cYUD01t+Sv6wSf3o3tgl2+t4wUGZinwy4sSJ3Dxjv04yMl/nWjHQ
         /VKM61klA9EfVE/s52zLg4gZ3Misr1+A/7t3DwKaDlfm3yL1xI9z1pOme+Wj5733HLTO
         G7+aSTC4UUY8n23brZnrg8Q1h7NNPTGayFk9vuDBI54eWRDuLlDfEDg28ExXSaMTeIvY
         IoaiRARoXG5LDrx3gAHwart8GG60fFqB9VhHQ41SwG4jEnM9nMvBaNcIPD82FoVvjcgw
         w2vA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 0/5] Misc tweaks of figures
Message-ID: <48719e0e-2828-7017-8efe-249dff1ef2a2@gmail.com>
Date: Thu, 28 Oct 2021 09:12:32 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This patch set consists of minor tweaks of figures.

Patch 1/5 shrinks a couple of unnecessarily large figures.

Patches 2/5--4/5 take care of Figure 10.19 and its derivative,
Figure E.7.
Consistently using solid traces for resizable hash tables
helps readers to follow the discussion.
Patch 4/5 also adds a footnote on the upper three traces which
look like two traces.

Patch 5/5 changes marks of "x)" to "(x)" so that they match
how they are called out in the text.

        Thanks, Akira
--
Akira Yokosawa (5):
  Shrink Figures 9.27 and 14.3 in 2c builds
  datastruct: Break gnuplot command line per each plot trace
  datastruct: Use consistent dash type in Figures 10.19 and E.7
  datastruct: Expand on the dash type of traces in Figure 10.19
  datastruct: Change marks in Figures 10.20 and 10.21 to "(x)"

 .../data/hps.resize.2020.09.05a/perftestresize.eps | 10 +++++-----
 .../data/hps.resize.2020.09.05a/plots-resize.sh    |  7 ++++++-
 .../hps.resize.2020.09.27a/perftestresizebig.eps   | 10 +++++-----
 .../data/hps.resize.2020.09.27a/plots-resize.sh    |  8 +++++++-
 advsync/rt.tex                                     |  2 +-
 datastruct/datastruct.tex                          | 13 ++++++++-----
 datastruct/zipperhashgrow.svg                      | 14 +++++++-------
 datastruct/zipperhashshrink.svg                    | 12 ++++++------
 defer/rcuusage.tex                                 |  2 +-
 9 files changed, 46 insertions(+), 32 deletions(-)


base-commit: 333422f99c550d4ba5809525e7eeebf1a5ab16e8
-- 
2.17.1

