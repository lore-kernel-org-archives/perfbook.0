Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=mHwSuU+dWqSuCbqFP6Q+Q/miwcDtE4PpYSlxAKr6T0s=;
 b=RrhO+VvlDkm0X7rmrKIpM0QSNtUXkG2z82JvvLpIIFZosN+Jnyg6ckq/x9+NPxiBBm
 ukIkYT2473Q7/s93PdskV9VFzWLD6Rou+UbLCigmfEt88OvIawGPqzG//J1yl9CpcOX0
 qLuACg+yqAXmMEsrXKwWHY5AYKHtlPdECwt/QvKadDK64DeS3ReGZAgmkUcicac+Ok4e
 cyWC8Sl/gi7XyI7DLJDm1BwI+dooaLWEEiFsFEfIRdc2C9eQA2pXUh+YBzrM/OeaWEpK
 NMVnqJ9m5O6zsN4Wb0sDFJlgQjJv8m+kGWhZ8ucs7JFBRgtmeIVl2GjhR37mQxaDNaX1
 r6wA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 00/14] advsync: Use pseudo asm in code sequence
Message-ID: <be8c3cb5-9ee2-9f60-bfcd-e729389304f9@gmail.com>
Date: Mon, 17 Apr 2017 07:11:37 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 6efc224d8e6d2b64bf7a86b52d03de01ccea7032 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 17 Apr 2017 06:53:11 +0900
Subject: [PATCH 00/14] advsync: Use pseudo asm in code sequence

Hi Paul,

This series substitutes pseudo-asm codes for C style statements
in code sequences in 'Memory Barrier' section.

Other than the substitution, Patch 2 replaces ACCESS_ONCE(),
Patch 4 is a backport of the changes made in memory-barriers.txt,
Patches 8 and 12 add footnotes to imply the necessity of data
dependency barrier, and Patch 11 renames Section "Guarantee"
to "Minimal Guarantee".

My guess is that the original intention of the "Guarantee"
section was to present minimal guarantees free of memory barriers.
When the necessity of read dependency barrier was recognized,
the barrier sneaked into this section.

In LaTeX, as footnotes can prevent readers' misunderstanding,
We can preserve the original intention.

Thoughts?

                                  Thanks Akira
--
Akira Yokosawa (14):
  advsync: Use pseudo asm in sequence in 'Paring' section
  advsync: Substitute READ_ONCE()/WRITE_ONCE() for ACCESS_ONCE()
  advsync: Use pseudo asm in sequence in 'Review of Locking Impl'
  advsync: Backport upstream commits regarding reordering example
  advsync: Use pseudo asm in reordering example
  advsync: Use pseudo asm in another reordering example
  advsync: Avoid indent after minipages
  advsync: Add footnote to imply necessity of data dependency barrier
  advsync: Use READ_ONCE()/WRITE_ONCE() in sequence of 'Device
    Operations'
  advsync: Use READ_ONCE()/WRITE_ONCE() in sequence in 'Guarantees'
  advsync: Rename Section 'Guarantee' to 'Minimal Guarantee'
  advsync: Add another footnote implying data dependency barrier
  advsync: Use pseudo asm in sequence in 'Data Dependency Barriers'
  advsync: Use pseudo asm in sequence in 'SMP Barrier Pairing'

 advsync/memorybarriers.tex | 321 ++++++++++++++++++++++++---------------------
 1 file changed, 172 insertions(+), 149 deletions(-)

-- 
2.7.4

