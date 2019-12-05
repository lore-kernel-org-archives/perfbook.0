Return-Path: <SRS0=ldQa=Z3=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=D6ZWNYav0bS0V8ag/r1ly05EZMXCmti/rbfD5mPVzzw=;
        b=lVzbCAr7Gcn+hK8quA0RjYcPIuL/r/EQZ5gSbpYUmZQcqwwwZtr5j34V2uAJ852oH4
         u7kNPG//Wq4ioDeIGOBy1BqRLOwWKVNny6sfguVOuBy+YXdSlDT8lWq1DfmpZTure8av
         fnAiqUCAZ+upwpBnpxzOHAexEXeycl7Nl1leFH8+fX7KtZG6QzuoXkoHuhV0xUPEj+1f
         2o2GPNgarJ8iyhHzlOM5X+sVFNSQb40zPjFieRIRRxc+RTr12QXC4Y2//TehNvogRmp7
         h0dZW0Q2nriz06LgsbcUvFCWnomvUadUX+pFb/2RprArDNrq/CjsYEwjU3ktuhxgza8z
         xaAQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/3] Get rid of plain dashes for ranges
Message-ID: <abbbd715-64b5-e210-240a-e18680f4e1ea@gmail.com>
Date: Fri, 6 Dec 2019 00:14:30 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

In your recent updates, I see you have used endashes for range
of numbers.

So I think it is high time to get rid of other plain dashes used
for ranges.  After the change made in commit 38eec3194c9a
("Use \crefrange{}{} for range of figures"), there remain around
twenty such plain dashes.

Patch #1 updates a case under bib/.
Patch #2 takes care of other plain dashes.
Patch #3 updates the section "En Dash" in style guide. It also adds
a section on cross-reference.

Please permit the brevity of change logs in this set.

        Thanks, Akira
--
Akira Yokosawa (3):
  bib/hw.bib: Use endash for volume range
  treewide: Use endash for ranges
  styleguide: Update on cross-reference and endash

 advsync/rt.tex                       |  2 +-
 appendix/styleguide/styleguide.tex   | 92 ++++++++++++++++++++++------
 appendix/toyrcu/toyrcu.tex           |  2 +-
 appendix/whymb/whymemorybarriers.tex |  2 +-
 bib/hw.bib                           |  2 +-
 cpu/overheads.tex                    |  2 +-
 datastruct/datastruct.tex            |  6 +-
 defer/hazptr.tex                     |  2 +-
 easy/easy.tex                        |  2 +-
 future/formalregress.tex             |  2 +-
 legal.tex                            |  2 +-
 locking/locking.tex                  |  4 +-
 12 files changed, 87 insertions(+), 33 deletions(-)

-- 
2.17.1

