Return-Path: <SRS0=Si6l=NB=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=Vr3hnuXmOHY9U/PrCota/YO+nRB73cPM6qk7zvHIkQA=;
        b=axhQY7goaNTCyaImiLOzqVCxkL98bwIfEZ/0MLIQfaHrweCqHs/WEAstheZW3X2n8g
         NVAEl6fMTRnjKtZ17bf4ci7qSjFzpJFAwRAZhZe64GMDd3H2TnQMUV6iSJ099CSfn62v
         LsDGvc/Zeu4tzrKVMd+CHbatL5Y9PvHkPe9Pijzws2MrLfjIE9vrXlDNMsAKC/cIXLbW
         /hiIa+uUlroJZ4mehoXXVK7K8gSO4uP48j9kionKaSxYR/nsbvxoEymNxrCZQWqBFKYH
         4r4Akm8WmhNUbM8M+S2GOpMGmNTf4ORbZ1J3UgyNxL1g+4hqOL47g3ifCXifpRlf3I2Y
         HzUg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/7] Break and capitalize after colon, take three
Message-ID: <ba83888b-a10e-4a9e-d55d-e6e2ca5cacb9@gmail.com>
Date: Tue, 10 Aug 2021 13:33:44 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

Here are colon related changes though Chapter 17.
They don't alter appearance except for capitalization and minor
changes in Patch 3/7 mentioned below.

In Patch 2/7, "dynticks" behind a colon is enclosed by plain {}.
In Patch 3/7, messages from pan are enclosed by \co{}.
In Patch 6/7, "ppc64" behind a colon is enclosed by plain {}.
These are to escape checks by to-be-updated scripts.

The other patches are (hopefully) trivial.

My hope is to complete similar changes in Appendices soon.

FWIW, I have been working on the improvement of appearance of CJK
translations in kerneldoc (pdfdocs) recently [1], hence my low activity
in perfbook.

[1]: [PATCH v4 0/9] docs: pdfdocs: Improve font choice in CJK translations
    https://lore.kernel.org/linux-doc/39d0fb0f-b248-bca4-2dac-df69e8d697b1@gmail.com/#t

        Thanks, Akira
--
Akira Yokosawa (7):
  debugging: Break and capitalize after colon
  formal: Break and capitalize after colon
  formal: Use \co{} for pan messages containing colon
  together: Break and capitalize after colon
  advsync: Break and capitalize after colon
  memorder: Break and capitalize after colon
  easy, future: Break and capitalize after colon

 advsync/advsync.tex      |  31 +++++++-----
 advsync/rt.tex           |  72 +++++++++++++++------------
 debugging/debugging.tex  |  92 +++++++++++++++++++----------------
 easy/easy.tex            |   6 +--
 formal/axiomatic.tex     |   3 +-
 formal/dyntickrcu.tex    |  17 ++++---
 formal/formal.tex        |   7 ++-
 formal/ppcmem.tex        |   4 +-
 formal/spinhint.tex      |  44 ++++++++++-------
 future/cpu.tex           |   5 +-
 future/formalregress.tex |  24 +++++----
 future/htm.tex           |   8 +--
 future/tm.tex            |  30 +++++++-----
 memorder/memorder.tex    | 102 +++++++++++++++++++++++----------------
 together/applyrcu.tex    |   6 +--
 together/count.tex       |  10 ++--
 together/refcnt.tex      |   2 +-
 17 files changed, 269 insertions(+), 194 deletions(-)

-- 
2.17.1

