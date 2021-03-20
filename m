Return-Path: <SRS0=Ggdu=IS=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Sqtjvg7Hq+DrPspJXHB+ywliitsO3H4FKz6tjhymAvw=;
        b=ljNNRJDwU/ZAt0wZ7ea75CrG53sJcMRNuQHg85aPJcLAhugKP3VnAquSjDMSEjaJYc
         Pqo+x0DZGMZlYRfjTwXF1tIkOQWs00gvQ/AUb2qBK0+lZ7EE3VFNr1X2b2A4WME+Issn
         xeOPnzbP39k+Lq2bweDnPZtO0XavaMr00BLU47kv/YsQkGg1cf3sp+zHiu4iGsQSdgX9
         gA0YmEMr/FdoBGrbCLCcWFTdpp3WhEeV9PiCebtQti8B4Cxyp/997b4503ZGTm0xXXrK
         9JiM75ld+uu71oVmavY4yW5f1Sn2OQqJJ1QUtqDFXsK7tytjWkybreAcXkGW6XZRiG7G
         sgCg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [GIT PULL -perfbook] Minor tweaks and styleguide update for
 Edition 2, take 4
References: <1bab2519-02be-a38c-0d20-ac40567c084e@gmail.com>
 <095ffc25-da49-7742-b7b9-8772ff1899e9@gmail.com>
 <20210318175835.GG2696@paulmck-ThinkPad-P72>
Message-ID: <cc6345e3-3c38-3b11-6184-e816ecb84073@gmail.com>
Date: Sat, 20 Mar 2021 09:07:24 +0900
MIME-Version: 1.0
In-Reply-To: <20210318175835.GG2696@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Thu, 18 Mar 2021 10:58:35 -0700, Paul E. McKenney wrote:
> On Thu, Mar 18, 2021 at 10:46:18PM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> I added a section on full stop spacing example in styleguide.
>> There were a couple of typo fixes in memorder.
>>
>> This is relative to the earlier pull request of take 3.
>>
>> Typo fixes are intentionally divided as individual commits.
> 
> I pulled in the whole stack, thank you!  We overlapped on only one typo.  ;-)
> 
> I updated the style guide to explicitly call out which full-stop
> hints work.

Thanks!

>             You may wish to update to pick a preferred method for the
> "Mr. Smith" example.  

"Mr Smith" would be an option in British English these days.  ;-)

Getting back to the point, as for "Mr.", "Mr.~Smith" should work almost
always.
Other abbreviations such as "etc.", "et al." and so on might not
always need "~".
When a line break is acceptable, you can use either "et al.\ " or
"et al.\@ ".
Which one to choose is up to your preference.
Who prefers symmetry might choose ".\@", I guess.

>                       I expect that it will take quite some time for me
> to form the habit of typing either of the three, but maybe checking for
> this can be scripted?

As long as the rule mentioned at the bottom of Appendix D.1,
yes, I think it is possible to detect full stops not properly
annotated.

In the middle of a source line, "xxx. yyy" is bad.
"xxx.~yyy", "xxx.\ yyy", or "xxx.\@ yyy", is good.
"xxx\@. yyy" is against the rule.

At the end of a source line, "xxx YYY." is bad. 
It needs to be "xxx YYY\@."

So surely these checks can be scripted.

May be sometime after the release of Second Edition.

By the way, I think most rough edges have been taken
care of, and I'm expecting the release this weekend.
I'll send a last minute pull request if I catch something.

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>>         Thanks, Akra
>>
>> --------
>> The following changes since commit 194bd0a454fc3ca2e6d50c39c248e35fd24ff61a:
>>
>>   datastruct: Remove redundant line (2021-03-18 10:01:20 +0900)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/akiyks/perfbook.git tags/for-paul-2021.03.18d
>>
>> for you to fetch changes up to a70d76c76d8e3b4338f813da9ddfb8fa880a653c:
>>
>>   memorder: Fix usage of \pageref{} (2021-03-18 22:14:28 +0900)
>>
>> ----------------------------------------------------------------
>> Akira Yokosawa (6):
>>       styleguide: Use \Cref{} at start of sentence
>>       sytleguide: Add a section on full stop
>>       memorder: Fix typo
>>       memorder: Fix typo
>>       memorder: Fix typo
>>       memorder: Fix usage of \pageref{}
>>
>>  appendix/styleguide/styleguide.tex | 83 ++++++++++++++++++++++++++++++++------
>>  memorder/memorder.tex              |  8 ++--
>>  2 files changed, 75 insertions(+), 16 deletions(-)
>>
