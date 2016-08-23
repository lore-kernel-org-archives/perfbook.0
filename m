Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc;        bh=EWlh8jaT+1b++35jvZHy8LuKsCmKR5Nb587AxNJ1Fqc=;
 b=vIQXIla83H89irvCMhPhsGJ+mIsl7GidBZyqyFUUQD/WTzSJplebw8qWlt2CePqKta
 Gv7/jgYz5+gDrqDPs0S6bSC/5nJ5cthZsPyfaN63KAzA8GX29w+DZ30KaLcRxbzoL2KS
 4asZVJsevvZI+emY2nLByNDsOT9eonZemen95Jm8XLZUj1hQqqwK5CmV8HlYeTw+zvow
 q5uVHYTzQ10RSFBqCS1qXTObY4Sq041/kuO/97BSfb7daC6DKZueWFHzqBYQQQw1nFhT
 HxVSq92lEJWDD++i2y6Bk2aWZY8NoBCX29ob9Q+WEw8RQocDG+/kxVSs/1+WeNO7kXS/
 d5tQ==
MIME-Version: 1.0
In-Reply-To: <20160823004910.GX3482@linux.vnet.ibm.com>
References: <1471910788-24070-1-git-send-email-sj38.park@gmail.com>
 <20160823004910.GX3482@linux.vnet.ibm.com>
From: SeongJae Park <sj38.park@gmail.com>
Date: Tue, 23 Aug 2016 09:59:16 +0900
Message-ID: 
 <CAEjAshpJKFmY3HzE_XaO_UO3ouLPQQA6mbucrpyV=LUtbO2Vvw@mail.gmail.com>
Subject: Re: [PATCH 0/2] debugging: Trivial fixups
Content-Type: text/plain; charset=UTF-8
To: Paul McKenney <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Tue, Aug 23, 2016 at 9:49 AM, Paul E. McKenney
<paulmck@linux.vnet.ibm.com> wrote:
> On Tue, Aug 23, 2016 at 09:06:26AM +0900, SeongJae Park wrote:
>> This patchset contains trivial fixups under debugging/ that found during Korean
>> translation.
>>
>> SeongJae Park (2):
>>   debugging: Add missing tilde
>>   debugging: Fix contextual typos
>>
>>  debugging/debugging.tex | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> Good catches, applied, thank you!
>
> Though I must confess that there have been times that it seemed that
> running programmers under debuggers might be a good idea.  ;-)

I hesitated to determine that as a typo for the same reason, too.  However, I
took heart as I realized that there is no one to be the ``programmer under
debugger'' if the situation comes _instead of_ me. ;)


Thank,
SeongJae Park

>
>                                                         Thanx, Paul
>

