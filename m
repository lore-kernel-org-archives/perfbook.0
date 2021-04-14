Return-Path: <SRS0=Bw3l=JL=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=DcQ8/RMAozT2DnI5LRQsxOX7+f0bGCaqQf9VgE3XjHE=;
        b=CfNOfKAMJIFc8c3/+uzuBhECbCOFn861BAQswo1cnkH9Aqy0O8YhA3VRgKJk6lgoWz
         QPA8ojKmSHq+GPG3TtoRttsYvpwwkP8N1WfvpNZiGV30VJ6vXRx/8IA6yL/AHeDcGaG3
         gkb+nsnj2bokEbORwO/NlKEKGf64g23bn39MzZ2ds+qcFErMQALCQfd9a1987KJ8WPrI
         21gseKMl1N+jxO5EyzudEElzqDnK6IwHEvMZvl/pdXb4iuJ3WubFlmxL8PeHyUfnofI6
         U8KsHzJkf8MALnB2BcMBzki95Ku64xduWCFy+zw+8K7gat4XG4PIBRRhZJRqTm0BCrdx
         1IKw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 0/5] Updates of qqz.sty
Message-ID: <b1bb1f84-9195-33ab-b6d1-ac68be1dca84@gmail.com>
Date: Wed, 14 Apr 2021 19:47:51 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

A change in upstream hyperref package (v7.00j) breaks code in
qqz.sty.
Now, \refstepcounter in vertical mode can cause a page break.
Our use of \refstepcounter in framed Quick Quiz is in vertical
mode and if a page break happens at that point, destination point
set by \refstepcounter is discarded by tcolorbox, which results in
a missing destination.

This can be fixed by leaving vertical mode in front of \refstepcounter,
which is what Patch 1/5 does.

The updated code is compatible with older versions of hyperref as
long as our usage patterns are concerned.
Aa a bonus, new link-target positions look nicer (not too close to the
"Quick Quiz" labels).

Patches 2/5--4/5 are (in my opinion) improvements to the -nq build.
Seeing both Quizzes and Answers in the final section, one would
just see the answer without taking time to think about a quiz.
So these patches modify the -nq build so that chapter-wise sections
have only the quiz parts.
Answers are presented in Appendix E in the same way as the other
builds.

Patch 5/5 adds page references in the answers of non-nq builds.

        Thanks, Akira

--
Akira Yokosawa (5):
  qqz.sty: Use \refstepcounter after leaving vmode in tcolorbox
  qqz.sty: Modify -nq build to have chapterwise quiz-only section
  perfbook-lt.tex: Remove boolean qqzchpend
  howto, Makefile: Update answer to Quick Quiz 1.3 and 'make help-full'
  qqz.sty: Add page reference to QQA Appendix as the same as -nq build

 Makefile               |   5 +-
 advsync/rt.tex         |  18 -------
 howto/howto.tex        |  17 +-----
 perfbook-lt.tex        |   3 --
 qqz.sty                | 118 ++++++++++++++++++++++++-----------------
 utilities/divideqqz.pl |  25 ++++++++-
 6 files changed, 97 insertions(+), 89 deletions(-)

-- 
2.17.1

