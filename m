Return-Path: <SRS0=OGBw=6K=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5CM1UiV55TxTvq8HSlxpUVG2s8sW3uDo2hCqNJMVKQ=;
        b=Fv1SsmQGzCwXk8IHqPKMwtQ5qYPct0U2ZgcEX771IBMxowdDyMwhss9n7PaEI/fWof
         zhuqUlqBKE/qIhRPdyUqptxXtmi0HWRGiSDPE/ez3NBV8EZHwj/RfIW9QS5pVmh333aJ
         M2mIyyXLxh28Hz9dr421D00E3qbBlgqX4Df5lh1+/+N5zXn4lcLP1/b9dXrXGZoz/FON
         AnO85EV8YAZVGryCTeB4oe+PM38uMR4WfkEgaqAh4q6anlUdPD5SDT1CpI1YlHPBQapv
         3Uyql7T+luVXoEF7v6xFCxLVvvVgY7NKjUlDyu83PVn/ZRUIS1w82Ku0ngPegqRvnd9q
         ra+Q==
Message-ID: <8f565979-bba0-bab1-7c8e-ebc76c2b4e65@gmail.com>
Date: Tue, 14 Feb 2023 19:03:12 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 0/4] cpu/overheads: Make tables more consistent
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>, Leonardo Bras <leobras.c@gmail.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi,

This patch set is a follow-up to commit 34cc066b1d95 ("cpu: Add a QQz
on table E.1").

Leo posted a patch to improve Table E.1 at [1].

I have gone further to improve consistency among tables on overheads
of atomic operations.

Patch 1/4 changes the layout of those tables and adjusts upper-/
lower-casing (with Reported-by: from Leo).

I found the use of "In-Core" and "Off-Core" in the tables somewhat
strange. Usually, I find pairs of "On/Off" and "In/Out" more natural.
In overheads.tex, "On-Core" vs "Off-Core" looks better to me.

So Patch 2/4 replaces "in-core" with "on-core", and does similar
replacements.

Patch 3/4 adds a page reference in QQz 3.8.

Patch 4/4 is an independent change fixing an issue in -nq builds.
I noticed an extra "," in the anchor box containing QQz 4.20, 4.21,
and 4.22 while skimming through QQz's in those builds.

[1]: https://www.spinics.net/lists/perfbook/msg03827.html

        Thanks, Akira
--
Akira Yokosawa (4):
  cpu: Improve layout and consistency of Tables 3.1, E.1, and E.2
  cpu: Use 'on-core' rather than 'in-core'
  cpu: Add page reference to Table E.1 in QQz 3.8
  toolsoftrade: Fix QQz macro in QQz series

 cpu/overheads.tex             | 161 +++++++++++++++++++++-------------
 perfbook-lt.tex               |   6 ++
 toolsoftrade/toolsoftrade.tex |   2 +-
 3 files changed, 108 insertions(+), 61 deletions(-)


base-commit: 50bb4adf51f683ba2c7d90f269632b6f4b4d4704
-- 
2.25.1

