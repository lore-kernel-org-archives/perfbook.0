Return-Path: <SRS0=JJWl=5G=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=aMa/DDMI6x9cO7MtnqpZRTAQy6WL+FR6Ree8PWIjLao=;
        b=iLB3nRilBJ9zN9jopI3TjcLjyvEnpqk1aj8b8m/aO6fNCS0vNqg3XUZ7oTB2Wv6nVC
         N64DDSizzEgWt6yG67bX/NUMQKA8v/28Hdqen3+H9OHhZNE4pJRd6q6J/ydYbzG6Q3QG
         it9f/JXU6M6HlypALiAM7idhiMWYTxUzjJkKxYkHxzICGIPMLIYdmpnGvARHwAZWcddg
         mfXBo4JXwQJpYj6IZyavm8unBxzXSTbrbgf5YdCqqWqDGniBE1gLJJda/D4p1L0Js4ly
         +kOjz+s448276mmLE81JZXfuRFDlz4DZVhoSTTOXI1voVwpb75y1gHtpL0PTuALQpEEw
         CK7A==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [RFC NOT PULL] Add experimental target 'noqq' (sans inline Quick
 Quizzes)
Message-ID: <26b6add2-3819-dffe-38b1-d62a566e9a7b@gmail.com>
Date: Sat, 21 Mar 2020 11:24:14 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

So this in an improved "noqq" relative to qqz.2020.03.17a.
It presents anchors to Appendix E in framed boxes.

To display essential quizzes inline, I added additional macros to be
used in the form of:

    \EQuickQuiz{
        quiz part
    }\EQuickQuizAnswer{
        answer part
    }\EQuickQuizEnd


To improve the looks of consecutive quizzes, I further added macros
to be used for sequence of Quick Quizzes in the form of:

    \QuickQuizSeries{%
    \QuickQuizB{
        quiz part 1
    }\QuickQuizAnswerB{
        answer part 1
    }\QuickQuizEndB
    %
    \QuickQuizM{
        quiz part 2
    }\QuickQuizAnswerM{
        answer part 2
    }\QuickQuizEndM
    %
    \QuickQuizE{
        quiz part 3
    }\QuickQuizAnswerE{
        answer part 3
    }\QuickQuizEndE
    }                 % end of \QuickQuizSeries

As a PoC, I applied schemes above to count/count.tex.
Does this amount of changes in .tex files look acceptable to you?

If you think they are acceptable, I'll do the changes in other consecutive
quick quizzes.

Futher tuning of noqq's look can be done by tweaking qqz.sty. I think 
"noqq" looks OK, though.

Any feedback is welcome!

        Thanks, Akira
--
The following changes since commit 01dcc70d3f66a1224ba63dc50bbe8370d3711c1b:

  qqz.sty: Add background color to Quiz part of Quick Quizzes (2020-03-17 20:24:09 +0900)

are available in the Git repository at:

  https://github.com/akiyks/perfbook.git tags/for-paul-2020.03.21a

for you to fetch changes up to 77e161e26d37453b751429799fd3c8b49cf7e0c9:

  qqz.sty: Make noqq's Appendix E look same as that of 2cqq's (2020-03-21 10:53:16 +0900)

----------------------------------------------------------------
Akira Yokosawa (3):
      Add experimental target 'noqq' (sans inline Quick Quizzes)
      Permit consecutive QQs to appear in a framed box
      qqz.sty: Make noqq's Appendix E look same as that of 2cqq's

 Makefile                |   5 +-
 count/count.tex         | 270 ++++++++++++++++++++++++++----------------------
 perfbook.tex            |   3 +
 qqz.sty                 |  73 ++++++++++++-
 utilities/extractqqz.sh |   8 +-
 5 files changed, 231 insertions(+), 128 deletions(-)
