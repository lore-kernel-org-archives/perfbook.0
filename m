Return-Path: <SRS0=kIIP=5K=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=D/HWGirN/kE8Y9kobYF7fAhqN0WCnwvXE3/dRTdLLbU=;
        b=BwXt3pad5H5K88KyoD1Udst44qGZ1mxdP5kq3b++6v4sNm4pMHPQMIpyXFZRIQO/V6
         Hb3GMIwnf9xpvi7zEdMwtrvv+icJ5cOQP8X/ZjkiJ0xWhhfg6iHjdczbsMjrhAuyc/Os
         kwepfekXof0hrmFkW1qwQWUwWyIikJx8Hswyng73jgATVBOWkEsjGSjO/ZrNp9yhHPqe
         +rRhP/V6P7EAVoEKMNkDHYXippqGNQNhvUlB1L4MelpymPH1bKCW09CdsBD6qjWsU+SH
         nJVJqRI17C9p+QeC4/5HKUu8THeO2jUIPv6iRp5VPc2GRB6h9L6lcg6nSqK2iMzXtqVo
         rDzQ==
Subject: Re: [RFC NOT PULL] Add experimental target 'noqq' (sans inline Quick
 Quizzes)
References: <26b6add2-3819-dffe-38b1-d62a566e9a7b@gmail.com>
 <20200322182415.GD3199@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <1524bbf2-460c-7020-79b1-8ddfcfd830cf@gmail.com>
Date: Thu, 26 Mar 2020 00:19:56 +0900
MIME-Version: 1.0
In-Reply-To: <20200322182415.GD3199@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sun, 22 Mar 2020 11:24:15 -0700, Paul E. McKenney wrote:
> On Sat, Mar 21, 2020 at 11:24:14AM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> So this in an improved "noqq" relative to qqz.2020.03.17a.
>> It presents anchors to Appendix E in framed boxes.
>>
>> To display essential quizzes inline, I added additional macros to be
>> used in the form of:
>>
>>     \EQuickQuiz{
>>         quiz part
>>     }\EQuickQuizAnswer{
>>         answer part
>>     }\EQuickQuizEnd
>>
>>
>> To improve the looks of consecutive quizzes, I further added macros
>> to be used for sequence of Quick Quizzes in the form of:
>>
>>     \QuickQuizSeries{%
>>     \QuickQuizB{
>>         quiz part 1
>>     }\QuickQuizAnswerB{
>>         answer part 1
>>     }\QuickQuizEndB
>>     %
>>     \QuickQuizM{
>>         quiz part 2
>>     }\QuickQuizAnswerM{
>>         answer part 2
>>     }\QuickQuizEndM
>>     %
>>     \QuickQuizE{
>>         quiz part 3
>>     }\QuickQuizAnswerE{
>>         answer part 3
>>     }\QuickQuizEndE
>>     }                 % end of \QuickQuizSeries
>>
>> As a PoC, I applied schemes above to count/count.tex.
>> Does this amount of changes in .tex files look acceptable to you?
>>
>> If you think they are acceptable, I'll do the changes in other consecutive
>> quick quizzes.
>>
>> Futher tuning of noqq's look can be done by tweaking qqz.sty. I think 
>> "noqq" looks OK, though.
>>
>> Any feedback is welcome!
> 
> These are now on branch qqz.2020.03.22a, which is on top of the earlier
> qqz.2020.03.17a.
> 
> I do like the comma-separated list of quick-quiz IDs for the -noqq
> variant, and marking a few of the quizzes as "essential" makes sense.
> 
> I believe that the churn should be fine in this case.  This does after
> all at least partially address a long-standing complaint from a small
> but noisy group of people.  ;-)
> 
> Should the "hb" target also put boxes around the quick quizzes?
> (I freely confess to having lost track of what most of the targets do!)

Prompted by this question, I was looking into the -hb build.
It turned out that the change made in commit 648af1774e3a ("Stop using
modified book.cls") I submitted back in April 2018 broke the -hb build
in that pdflatex generates PDF having page size of normal letterpaper.

It looks like the letterpaperhb option needs to be in the modified
book.cls file.
As there was no complaint regarding this regression, I guess nobody
cares -hb build.

And I'm wondering how the -hb build is supposed to work.

Do you choose paper of 10.75in x 8.25in in printing -hb PDF?
Or do you use normal letterpaper and cut edges by 0.25in afterwords?

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>>         Thanks, Akira
>> --
>> The following changes since commit 01dcc70d3f66a1224ba63dc50bbe8370d3711c1b:
>>
>>   qqz.sty: Add background color to Quiz part of Quick Quizzes (2020-03-17 20:24:09 +0900)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/akiyks/perfbook.git tags/for-paul-2020.03.21a
>>
>> for you to fetch changes up to 77e161e26d37453b751429799fd3c8b49cf7e0c9:
>>
>>   qqz.sty: Make noqq's Appendix E look same as that of 2cqq's (2020-03-21 10:53:16 +0900)
>>
>> ----------------------------------------------------------------
>> Akira Yokosawa (3):
>>       Add experimental target 'noqq' (sans inline Quick Quizzes)
>>       Permit consecutive QQs to appear in a framed box
>>       qqz.sty: Make noqq's Appendix E look same as that of 2cqq's
>>
>>  Makefile                |   5 +-
>>  count/count.tex         | 270 ++++++++++++++++++++++++++----------------------
>>  perfbook.tex            |   3 +
>>  qqz.sty                 |  73 ++++++++++++-
>>  utilities/extractqqz.sh |   8 +-
>>  5 files changed, 231 insertions(+), 128 deletions(-)
