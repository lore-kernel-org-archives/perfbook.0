Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=6+w/0LddHmAN5BgFwz7VnL7hFBM3Ehp8Vy3GJJMgsCU=;
 b=GSsgLF8NYIGA09y1pANPUatk65mVp15xRHQiIax/uvaYhsdiA62HSOiiMeRRAL25d+
 8tdtEhJ/QHCSHbywy2HIvU8j+6mv6kel3QrplHQBj6mUL82aVP/kScOXYb8wG7wP8pTQ
 btL+pVCDPw23oEjY/HHYkktkdN0qKnIxR4YpkApCV782yGex20X+0lG1G548ZCXbvC5I
 zoLq4hjXrEr/mDDT8z9YseKMSjbwLk7ck/3wb0KPsk4puVwVjcclL8XT4cBSmcvK3P3j
 ZAvebVh+eKuL7u9IGPgcUAgCkhWA75fqaTwf/ajuDlmLJOXjN80hZ2urTxXEtiP6VejR
 tDXA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/8] future/QC: Cosmetic fixes and improvements
Message-ID: <8919b898-9e43-8f72-39ce-5d31dc84f45d@gmail.com>
Date: Sat, 17 Jun 2017 12:54:47 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From e5738e83414b3c3d30d616543bb2f70cbb80bcca Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 17 Jun 2017 10:44:54 +0900
Subject: [PATCH 0/8] future/QC: Cosmetic fixes and improvements

Hi Paul,

This patch set mostly fixes and improves LaTeX source of QC section.

Patch 1 adds patterns in hyphen2endash.sh.

Patch 2 gives consistent looks to tables as in other tables in
perfbook.

Patch 3 fixes typos in SI unit symbols and usage of math mode.

Patch 4 Adds whitespaces between numerical values and unit symbols.
This is recommended in NIST style guide (referred to in the change
log). Since this section treats topics covering quantum mechanics,
I want it to have a similar look as a scientific paper.
In other parts of perfbbok, I have quite a few places I want to add
whitespaces, but I'm not sure that matches your preference.
If you'd like such changes, I can produce patches to do so.

Patch 5 uses axis names "X-axis", "Y-axis", and "Z-axis" in the
lists of "Programming Model" section. I also tried other forms of
"x-axis", "x axis", and "X axis", but "X-axis" is my preference.

Patch 6 seems a trivial grammatical fix, but might be unnecessary.
I'm not sure.

Patch 7 gives representation of ket commonly used in quantum mechanics
papers.

Patch 8 changes the look of QC operators. Special treatment of
dagger symbol in description labels might be excessive, but
it gives better result in my point of view.

So, I'm not sure you like patches 4--8. Please try and push as
much as you like. And feel free to ask me a respin of the patches
you don't like as is.

            Thanks, Akira
--
Akira Yokosawa (8):
  hyphen2endash: Add patterns for QC section
  future/QC: Tweak appearance of tables
  future/QC: Fix typo in unit symbol and usage of math mode
  future/QC: Add narrow space before unit symbol
  future/QC: Use consistent axis names
  future/QC: Add missing 'has' in description list
  future/QC: Use \ket{} macro for |0> and |1>
  future/QC: Denote QC operators as such

 future/QC.tex              | 123 +++++++++++++++++++++++----------------------
 perfbook.tex               |   5 ++
 utilities/hyphen2endash.sh |   8 +++
 3 files changed, 76 insertions(+), 60 deletions(-)

-- 
2.7.4

