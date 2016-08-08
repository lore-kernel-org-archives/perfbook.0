Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=kaYKVZJ9gId+e1fSBXSkdQu+bxK2IH3VCkDQN6yc668=;
 b=DE+Kfuy0ZNXBsvRM3BEEXWud489AT2b/Rc8AGrUuECVmrBlXgHkkEstQLyRd6VSMr6
 XgXjDaQs+WFM6fpavKfxblcjWglQQ3WLXx/u1Sy5XvJqALmqJTToN1Vq9ltfSczSDaAG
 HNcHJroDVFw9GKXNfdCRSG3Pw3MCIgvV0lV0dXyU/H2uwDC/HSKTIS7yGgqdLrcvKYpo
 dPLxICjd2JgnSPfn6mIVuGwSr1JpdcxzyyXmcTa5Io4c1cDXl3ifbQKEG0bIEnrCyTlQ
 giPEqtSgTwYRJ681VWsIv0MlS6/MwMtWHR9g2r95nRgW7TJAxHu1TpBZGUW1+dS3Ekb5
 oO1g==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/5] Several cosmetic fixes
Message-ID: <32c543fd-cad8-f3da-4b1f-15ed2fd919c0@gmail.com>
Date: Tue, 9 Aug 2016 00:00:35 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 572ae1f4ad166e144ceb0306100cb4f5a1235a4e Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 8 Aug 2016 23:06:10 +0900
Subject: [PATCH 0/5] Several cosmetic fixes

Hi,

This patch series consists of mostly cosmetic fixes.

1st one introduces 'extdash' package to enable hyphenation
of fairly long cmnpound words such as "eventually-consistent".

2nd one removes a line break between "lines" and "n-m".

3rd one adds \nbco{} command ("nbco" stands for non breakable co)
to make sure short code snippet not to be broken.

4th one replaces "..." with \ldots for better looking ellipsis.

5th one is just a trial of marking up numbers to avoid using
hyphens as minus signs. There are two types of mark up.
One is \txnum{} which is to be used for values in running text.
The other is \conum{} which is to be used for a value which appears
in a nearby code snippet. This patch contains small number of example
uses. I don't use math mode directly because you can modify the
appearance of each mark-up by modifying just the definition in the
preamble.

The effect of this series can be seen in the first paragraph of
Section 6.1.2.3 "Hashed Double-Ended Queue" in the two column layout.
Before the changes, the following line break looks ugly.

... decreasing numbers (-1, -2, -
3, ...), while a series of ...

There are other ways to prevent the line break here, but I think using
math mode or \nbco{} command is natural enough. 

                                           Thanks, Akira

----------------------------------------------
Akira Yokosawa (5):
  Trial use of extdash package with shortcuts option
  formal/ppcmem: Avoid break-line after 'lines' in source
  Add \nbco{} command for code snippet without line break
  Use \ldots for ellipsis
  Trial of marking up numbers in text

 SMPdesign/SMPdesign.tex              | 4 ++--
 SMPdesign/partexercises.tex          | 4 ++--
 advsync/memorybarriers.tex           | 2 +-
 appendix/rcuhist/RCUinLinux.tex      | 2 +-
 appendix/rcuimpl/rcupreempt.tex      | 6 +++---
 appendix/whymb/whymemorybarriers.tex | 2 +-
 count/count.tex                      | 4 ++--
 datastruct/datastruct.tex            | 2 +-
 formal/ppcmem.tex                    | 7 ++++---
 future/htm.tex                       | 2 +-
 howto/howto.tex                      | 2 +-
 intro/intro.tex                      | 6 +++---
 locking/locking.tex                  | 2 +-
 perfbook.tex                         | 6 ++++++
 rt/rt.tex                            | 2 +-
 toolsoftrade/toolsoftrade.tex        | 4 ++--
 16 files changed, 32 insertions(+), 25 deletions(-)

-- 
1.9.1

