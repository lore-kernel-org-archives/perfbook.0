Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=G0Fo4vd8srQICkhv8rUQ6HP1U+bSyUfAao7BdkxlCrs=;
 b=G8upVFAsvhzQ5XSJ1roU1ZJ0Z9GdkKY9NpwypFXNRQBoxp8rDmxLYY9PXpq1Bgkfsf
 XebJKAM4VacMv/zo3at9Lfz1NUopZ9oyNN1wUBhOGGk/B9yTaI5nmF96I+jilFhtvzIv
 84aIQM4WQ1xzF5DRFkluY+PnXACeJ4EEltvQ41299tsC0DihEJoKqLa504VglhmHoGtX
 Nn6cmmTwlLALp8CSQ+pqdrVBokzYHXm7/KkGnwgDhFsnFk2NL9khTXq3yFj8ue1hKTUL
 Vvq8D04uS1Mv72JoSCSODqM93imZjzCZUisqspfKzCME1aEZ5zCD17pE1lnaV05z3Eju
 zPEQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [GIT PULL] Preamble and qqz fixes
Message-ID: <69dfc090-de59-583a-73a9-885a204ee394@gmail.com>
Date: Sat, 25 Jun 2016 20:53:21 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

Here is another pull request.
This time, I did some functional fixes in preamble and qqz.sty.

1st patch fixes typos in the definition of \co{} macro.
Yea, at first glance, they are hard to catch, but...
Now, line-breaks at white spaces are enabled and the increased room
for line-breaks results in better looking typesetting.

Fixes in qqz.sty are not actually fixes but improvements.
2nd patch adds macro definitions for referencing qqz's, which has been
done manually in count/count.tex. It also adds hyperref to the qqz at
a referencing text.

3rd patch improves accuracy of hyperref to QQA's by tweaking the
position of \refstepcounter macro.  Now, a click on a "Quick Quiz" in
the text will bring you exactly where you'd expect.

                                                Thanks, Akira

---
The following changes since commit a3611df3582024130563ccb5167e39ca330aa804:

   Add 'footnotebackref' package (2016-06-22 06:56:26 +0900)

are available in the git repository at:

   https://github.com/akiyks/perfbook.git preamble-qqz-fixes

for you to fetch changes up to 5490f317396516659927dd615cb4ca5affb3cf39:

   qqz: Improve accuracy of hyperref to QQA (2016-06-25 18:04:56 +0900)

----------------------------------------------------------------
Akira Yokosawa (3):
       Fix typo in the definition of \co macro
       qqz: Add macro's for referencing quick quizzes
       qqz: Improve accuracy of hyperref to QQA

  count/count.tex | 16 ++++++++--------
  perfbook.tex    |  5 +++--
  qqz.sty         | 22 +++++++++++++++-------
  3 files changed, 26 insertions(+), 17 deletions(-)

