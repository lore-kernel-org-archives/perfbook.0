Return-Path: <SRS0=J1Hu=4X=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=qrqLLH5t0WcLiaPChzIYDj5RC0r5Aq7cRx9M+z4396c=;
        b=uwNG/Y3I66K+tT5+htPk+WO3GvqvPo8x6OaDJqQJxjDX3b03Z4WBEwnxZVfASA3ybF
         OeGKJyJ5cdwNf1I9+6wfM8toV734iMF5qf/iu3XE1ypXAa97UKE20Redg7ioBvzexa7q
         pIWuunc60c80Nv6+EfoE56p+aDdsiRTxCz0B+UcKjBazPHbyBr6+eTWqtYy3FZ6jHyMc
         ngGn3FbudLPEiewnwYTvtm9ij2bg3caqvlyIvsaYImPb9L4xwlfmbRJLF/Vl/BGEwecx
         E77rz9k5dmcz24AL09BJ/VHru6V2Sw4ak+I1o3D7Ml1+5QYg1Yq8y8r/Ac96MNw2OUkl
         pbDA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/6] Improve page/column breaks in Appendix E
Message-ID: <0a98646c-eb33-a27c-b974-ff38b8652a44@gmail.com>
Date: Sat, 7 Mar 2020 07:46:44 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

I think I figured out the way to do what you wanted the other day.
Instead of putting \goodbreak in \QuickQ, putting it in \QuickE
looks like the right approach.

Patch 1/6 does the change.
Patch 2/6 fixes a regression in the first attempt to put \goodbreak
in front of QQZ.
Patches 3/6--6/6 fix minor issues in QQAz.
Feel free to rephrase the added opening sentence in Patch 4/6.

        Thanks, Akira
--
Akira Yokosawa (6):
  qqz.sty: Improve page/column breaks in Appendix E
  qqz.sty: Fix position of \goodbreak for accuracy of hyperlinks
  toolsoftrade: Use nbsp in front of single letter variable
  debugging: Add opening sentence in Answer to QQZ 11.2
  defer/rcuusage: Reverse nesting of fcvref and enumerate envs
  SMPdesign/partexercises: Move figure env next to first paragraph in QQA

 SMPdesign/partexercises.tex   | 15 +++++++--------
 debugging/debugging.tex       |  2 ++
 defer/rcuusage.tex            |  4 ++--
 qqz.sty                       | 10 +++++-----
 toolsoftrade/toolsoftrade.tex |  7 +++----
 5 files changed, 19 insertions(+), 19 deletions(-)

-- 
2.17.1

