Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D3kB0EwQN6yYwH1+KYndxVLe/OXMDxv3t8mJU9kmVIY=;
 b=eFJ0CjYKGNZ6YgYBpULBqzPy4f6gFC3C8lyHHGbp6b07BI/umUHoZd6jarYnBwNwH7
 esTKuNJymHzGWawhl4AL5I+g+UYudwxizh6+hO6MnYSIIAQT812JMyp2zhIi6zlmcLmR
 fe/cvMjjKW6OEL5HXUSqkHFV7DtjPupbt6OGY6ZGBAzmwtHzxWIDjsqFgkeXhbss5szL
 8d9LoKGnRomsX2sAbV36fxBS5OZzWfvSY9ptC3I06ZcvRvWy/UHtqrapGK6GE+PKwCHJ
 H4cfi3SBBIzER21DAFn8Pqdlv4EFtoqdxJeX92OLwG6chL2lvgXiXwlW7I7K38aBcVIV
 R0ZA==
Subject: Re: Question on updated Figure 5.1 "Atomic Increment Scalability on
 Kaby Lake"
References: <1ac811fa-ad08-43aa-ac74-e6367c33e742@gmail.com>
 <CAFMy-Rk76bc+oOXq7ijGT4wzYkFbs1F7bkLWQ-VwE_O2Q-Z2VQ@mail.gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <45701c97-023a-190f-0113-9b272fbd8e41@gmail.com>
Date: Wed, 12 Sep 2018 19:51:28 +0900
MIME-Version: 1.0
In-Reply-To: 
 <CAFMy-Rk76bc+oOXq7ijGT4wzYkFbs1F7bkLWQ-VwE_O2Q-Z2VQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Imre Palik <imrep.amz@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

(Added CC to Paul and perfbook list.)

On 2018/09/12 07:54:06 +0200, Imre Palik wrote:
> Hi Akira,
> 
> sorry for the confusion.  I should have taken better care.  I attached
> the row data from a measurement.

Thank you!

I just skimmed the output of count_nonatomic.

---
count_nonatomic 1 uperf 2
n_reads: 0  n_updates: 778797305000  nreaders: 0  nupdaters: 1 duration: 240
ns/read: -nan  ns/update: 0.000308167
count_nonatomic 1 uperf 2
n_reads: 0  n_updates: 779548753000  nreaders: 0  nupdaters: 1 duration: 240
ns/read: -nan  ns/update: 0.00030787
count_nonatomic 1 uperf 2
n_reads: 0  n_updates: 801753128000  nreaders: 0  nupdaters: 1 duration: 240
ns/read: -nan  ns/update: 0.000299344
count_nonatomic 1 uperf 2
n_reads: 0  n_updates: 783816136000  nreaders: 0  nupdaters: 1 duration: 240
ns/read: -nan  ns/update: 0.000306194
count_nonatomic 1 uperf 2
n_reads: 0  n_updates: 786531305000  nreaders: 0  nupdaters: 1 duration: 240
ns/read: -nan  ns/update: 0.000305137
count_nonatomic 2 uperf 2
!!! Count mismatch: 1566325493000 counted vs. 776288032000 final value
n_reads: 0  n_updates: 1566325493000  nreaders: 0  nupdaters: 2 duration: 240
ns/read: -nan  ns/update: 0.00030645
count_nonatomic 2 uperf 2
!!! Count mismatch: 1637607003000 counted vs. 825312711000 final value
n_reads: 0  n_updates: 1637607003000  nreaders: 0  nupdaters: 2 duration: 240
ns/read: -nan  ns/update: 0.000293111
count_nonatomic 2 uperf 2
!!! Count mismatch: 1525890163000 counted vs. 768873049000 final value
n_reads: 0  n_updates: 1525890163000  nreaders: 0  nupdaters: 2 duration: 240
ns/read: -nan  ns/update: 0.00031457
count_nonatomic 2 uperf 2
!!! Count mismatch: 1487184107000 counted vs. 717784175000 final value
n_reads: 0  n_updates: 1487184107000  nreaders: 0  nupdaters: 2 duration: 240
ns/read: -nan  ns/update: 0.000322758
count_nonatomic 2 uperf 2
!!! Count mismatch: 1512515450000 counted vs. 751090603000 final value
n_reads: 0  n_updates: 1512515450000  nreaders: 0  nupdaters: 2 duration: 240
ns/read: -nan  ns/update: 0.000317352
--

These results look too fast. I checked CodeSamples/count/count_nonatoimc.c
and found that it has no READ_ONCE()/WRITE_ONCE() to access count.

I'm submitting a patch to fix it soon.
Can you share the raw data after applying it?

> 
> Thanks,
> 
> Imre

And apologies for my confusion of your first name.

Thanks, Akira

> On Sun, Sep 2, 2018 at 10:55 AM Akira Yokosawa <akiyks@gmail.com> wrote:
>>
>> Hello Palik,
>>
>> I'm looking at Figure 5.1 of perfbook which was updated by commit
>> 3b62f67a76e1 ("Regenerating the atomic counter graph on a more
>> modern CPU"), and wondering the time to increment at x = 1 looks
>> too small.
>>
>> As is described in the Answer to Quick Quiz 5.8, atomic increment
>> should take a bit longer than the ideal non-atomic increment even
>> when the number of updaters is 1.
>>
>> Or on Kaby Lake, some special optimization results in almost no
>> cost in this case? If that is the case, the Quick Quiz needs update...
>>
>> Also, the horizontal dashed line should be closer to the x-axis,
>> I suppose. The time of the ideal non-atomic increment is embedded on
>> line 44 of CodeSamples/count/plots.sh as "8.81772".
>> You might need to use a proper value for Kaby Lake (should be near
>> zero) instead.
>>
>> If I understand the circumstances right, raw data for the previous
>> version of the graph reside in
>> CodeSamples/count/data/count_atomic:u.2009.05.03a.dat.
>>
>> Can you share the corresponding raw data on Kaby Lake?
>>
>> Also, in the above mentioned commit, atomic125.{eps|png} were
>> overwritten accidentally. They were graphs of 125-thread case,
>> and should not have been updated IMO. They are not used in perfbook
>> at the moment, but I'd like to have the original ones in the repository.
>>
>> If you could share the raw data for Kaby Lake, I'd be happy to fix
>> these issues for you.
>>
>> I'm not blaming any of you. I could blame the ad-hoc design of plots.sh,
>> but it was written by Paul for his own use. Such scripts tend to be
>> ad-hoc. ;-)  I might be able to improve the script.
>>
>>         Thanks, Akira

