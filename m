Return-Path: <SRS0=/TqJ=YR=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=EdR8XI+ONblvrbFyIRQvJUlPa6etJb8S9A4AsTaAdoI=;
        b=mIQq7LqRjeKHXNHsQXsOxGn94OZVedf+4tKpwXkny0Zef+FGNwHsItZz1Caye3Cadi
         8nkiVUp3AR1lSOhXxTGRCZhCpkjbuWDj4P4F6dla9Qerz5cLuY/0MIEHCMo531W3t3aS
         YSkEHSUV0GN25RzgFaSSzR4navsvxbCbwfYu1LRZ1K1Ge4iLItWcpBnOsOIjSYKMZ79d
         LB6MXDG74DrBroAtJ79cSLN8bAa0aahUs+8RqxLHcvdARHAYW8yRb74xRzZDdrw9fly/
         WrqcsBZ/Ajv9D8j4NyIAmcTJ1fErGACCi4ci1nGquSgOXrIKDkgOB1Hg3BMZQYlLanLm
         gaeQ==
Message-ID: <e5a0ed28-c925-aea5-00fe-56cef7940362@gmail.com>
Date: Sat, 13 Aug 2022 11:12:07 +0900
MIME-Version: 1.0
Subject: Re: [PATCH-perfbook] count: The fast path is for the write side
Content-Language: en-US
References: <CAJbg=FV_ngVf2dKkaTMD0QM1713ppDBj-yfQJTOuqmnUUyOncw@mail.gmail.com>
 <20220812211508.GF2125313@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20220812211508.GF2125313@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>, Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi,

A minor nit:

On Fri, 12 Aug 2022 14:15:08 -0700, Paul E. McKenney wrote:
> On Fri, Aug 12, 2022 at 02:38:06PM -0400, Elad Lahav wrote:
>> Sent as an attachment because I'm behind a corporate firewall and can
>> only use Gmail's ^$*&^@# web interface. If that's not acceptable I'll
>> find another method to send a Real Text Email, just like mother nature
>> intended it to be.
> 
> For the time being, it is fine.  Longer term, it would be good to find
> a way to send a Real Text Email, for old time's sake.  ;-)
> 
> Queued and pushed, thank you!
> 
> 							Thanx, Paul
> 
>> --Elad
> 
>> From 153cd4261fe58ed7f26bb0b1232eae2de43070ad Mon Sep 17 00:00:00 2001
>> From: Elad Lahav <elahav@qnx.com>
>> Date: Fri, 12 Aug 2022 13:04:08 -0400
>> Subject: [PATCH] count: The fast path is for the write side, not the read
>>  side.
>>
>> Signed-off-by: Elad Lahav <e2lahav@gmail.com>

So, the email addresses in From: and S-o-b: tags don't match.

Technically speaking, this commit does not have its author's S-o-b:,
which means the lack of "Developer's Certificate of Origin".

I think in this case, Paul can amend the author field of the commit
and force push.

As for me, in my early contributions to perfbook, I misconfigured
git's user.email, and ended up in dozens of commits with S-o-b of
a non-reachable email address during April--May of 2016.  :-/

        Thanks, Akira 

>> ---
>>  count/count.tex | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/count/count.tex b/count/count.tex
>> index 7e74d58f..523789e2 100644
>> --- a/count/count.tex
>> +++ b/count/count.tex
>> @@ -2262,7 +2262,7 @@ be run all the way to either of its limits, but it does so at the
>>  expense of adding atomic operations to the fastpaths, which slow down
>>  the fastpaths significantly on some systems.
>>  Although some workloads might tolerate this slowdown, it is worthwhile
>> -looking for algorithms with better read-side performance.
>> +looking for algorithms with better write-side performance.
>>  One such algorithm uses a signal handler to steal counts from other
>>  threads.
>>  Because signal handlers run in the context of the signaled thread,
>> -- 
>> 2.25.1
>>
> 
