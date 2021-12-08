Return-Path: <SRS0=4u0W=QZ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ebrYA4FU4WpPkP5SHVAgw03SZXSlEJyfl7EwTRtZixI=;
        b=nBd4WQAtLZfIK9VROBvonovbMoDPk1H6zdA2yZxGu2YRYZe9/DPBN2Yo82pT0Xb0PK
         Q/ihypDfDdQSdBjFhp9fMKMvII+YglQljaym6vIVgteEFtqcSKJDx7nJo9d/iBbPReKy
         jVs10bQa4XpqP7CWy1KuKd0ykfu2mtCpZkaWPcgcl+/ksMIkvH3kOvySzn2GrNXafM0x
         WeCOV57ucuXzJswXU0U/cg6mRE74Uo+4dq9FfAyWQ3jqgu4ezL7234IH3iPGotZVzfyD
         4/2ht/DnmHtCVbuqq28AbRv6fxnDsnfXNVT7gwSqolsbbF5IeDBNSwGnCw2rTH2y/ajB
         n4hg==
Subject: Re: [PATCH -perfbook 0/4] Address potential widowing of headings
References: <4350078f-4054-cb28-157b-305d6df087ea@gmail.com>
 <20211208195547.GY641268@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <fe2d7604-8263-357b-a3c7-0ff59038e67a@gmail.com>
Date: Thu, 9 Dec 2021 07:20:20 +0900
MIME-Version: 1.0
In-Reply-To: <20211208195547.GY641268@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Wed, 8 Dec 2021 11:55:47 -0800, Paul E. McKenney wrote:
> On Wed, Dec 08, 2021 at 04:37:26PM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> There was some confusion on my side WRT undesired page/column
>> breaks.
>>
>> While testing the added checks in cleverefcheck.pl, I saw too
>> many potential such cases flagged.  This made me do some tests
>> to reproduce unfortunate page/column breaks.
>>
>> There are three such patterns I have confirmed.
>>
>> 1. "listing" environment (with contents of fancyvrb) next to proper
>> LaTeX headings (\chapter, \section, \subsection, etc.)
>>
>> 2. Any environment (not necessarily float) next to QQA heading
>> of "Answer:"
>>
>> 3. Any environment (not necessarily float) next to epigraph
>>
>> This means commit f106e0e6dc43 ("defer/rcuusage: Move float objects
>> away of section titles") has no merit.  It is safe to revert it if
>> you'd like.  I was confused by patterns 2 and 3 and thought that
>> floating objects can cause undesired breaks. 
>>
>> Patches 1/4--3/4 add tests in cleverefcheck.pl that check patterns
>> listed above respectively.
>>
>> Patch 4/4 fixes problematic places flagged by the updated script.
>> Feel free to wordsmith the leading phrases I added in QQAs.
> 
> Queued and pushed with minor wordsmithing to parts of 4/4,
> thank you!

So the diff below looks somewhat out of context, because the Quiz
part of QQ A.2 is "How could there be such a large gap between
successive consumer reads?".

----
@@ -175,7 +175,7 @@ seq    & \multicolumn{1}{c}{time (seconds)} & delta~  &  a &  b &  c \\
        consumer reads?
        See \path{timelocked.c} for full code.
 }\QuickQuizAnswer{
-       Here are possible scenarios:
+       Here are a few of the errors:
 
        \begin{enumerate}
        \item   The consumer might be preempted for long time periods.
----

Thoughts?

        Thanks, Akira

> 
> 						Thanx, Paul
> 
>>         Thanks, Akira
>> --
>> Akira Yokosawa (4):
>>   cleverefcheck.pl: Add test of listing next to heading
>>   cleverefcheck.pl: Add test of \begin{...} at head of QQA
>>   cleverefcheck.pl: Add test of \begin{...} next to epigraph
>>   treewide: Address potential widowing of headings
>>
>>  appendix/questions/after.tex  |  4 +++
>>  datastruct/datastruct.tex     | 14 +++++-----
>>  defer/refcnt.tex              | 24 ++++++++---------
>>  formal/axiomatic.tex          | 22 +++++++--------
>>  locking/locking-existence.tex |  9 ++++---
>>  memorder/memorder.tex         |  6 ++---
>>  utilities/cleverefcheck.pl    | 50 +++++++++++++++++++++++++++++++++++
>>  7 files changed, 92 insertions(+), 37 deletions(-)
>>
>>
>> base-commit: f106e0e6dc436683bb119dd8992c6f173994d182
>> -- 
>> 2.17.1
>>
