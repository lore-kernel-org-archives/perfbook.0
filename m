Return-Path: <SRS0=wHCD=7N=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Xbe6riVPHhRAnUbZ7/mADIbuIWoI73WKHxyeWbV/gKk=;
        b=aGbdEYBJAbzqRAZeBWqeCGDeTKjHakumlP6Aut5bvtLwZ0qD5Bwwu1LvrMkj2QTIEm
         wTUuhs/zZVX5Q5Gf4YaurlaKXyj9fkKg4yURIxJDvRRb83vtZTe9fJ/BDE6kigXHoZVL
         3VMvtC4Z9oNlBh369ExMy3xtsQQNY54WZn/MquuK7XNlWH7+7Us0dzrNDKigKr23Am+b
         mhy9QleYbjy7Q7JTGpIMKIqtI68kpO20NkOgeJzqhXr9NcDTq7q0KDLQfSTehECAyXcr
         lgM2Vm0GeNd2bf4Jye4WsjH+rzuMBeR/vjEP/5twq13QWsL6zs9F0x4NKFaq7SORKUn6
         iUzg==
Subject: Re: [PATCH 0/3] defer: misc updates
References: <64483a19-eee6-f406-7456-01feb232d019@gmail.com>
 <20200531165023.GL2869@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <fedc50c6-1f06-f223-25df-4001d6457120@gmail.com>
Date: Mon, 1 Jun 2020 08:11:06 +0900
MIME-Version: 1.0
In-Reply-To: <20200531165023.GL2869@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sun, 31 May 2020 09:50:23 -0700, Paul E. McKenney wrote:
> On Sun, May 31, 2020 at 09:30:44AM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> This is misc updates in response to your recent updates.
>>
>> Patch 1/3 treats QQZ annotations for "nq" build.
> 
> Good reminder, thank you!
> 
>> Patch 2/3 adds a paragraph in #9 of FAQ.txt.  The wording may need
>> your retouch for fluency.
>> Patch 3/3 is an independent improvement of runlatex.sh.  It will avoid
>> a few redundant runs of pdflatex when you have some typo in labels/refs.
> 
> Nice, queued and pushed, thank you!
> 
>> Another suggestion to Figures 9.25 and 9.29.
>> Wouldn't these graphs look better with log scale x-axis?
>>
>> X range can be 0.001 -- 10.
>>
>> You'll need to add a few data points in sub-microsecond critical-section
>> duration to show plausible shapes in those regions, though.
> 
> I took a quick look and didn't find any nanosecond delay primitives
> in the Linux kernel, but yes, that would be nicer looking.
> 
> I don't expect to make further progress on this particular graph
> in the immediate future, but if you know of such a delay primitive,
> please don't keep it a secret!  ;-)

I find ndelay() defined in include/asm_generic/delay.h.
I'm not sure if it works as you would expect, though.

        Thanks, Akira

> 
> 						Thanx, Paul
> 
>>         Thanks, Akira
>> --
>> Akira Yokosawa (3):
>>   defer: Annotate consecutive QQZs as such for 'nq' build
>>   FAQ.txt: Advertise 'nq' build in #9
>>   runlatex.sh: Give up early on undefined refs
>>
>>  FAQ.txt               |  8 ++++++--
>>  defer/rcuusage.tex    | 20 +++++++++++---------
>>  utilities/runlatex.sh | 42 +++++++++++++++++++++++++-----------------
>>  3 files changed, 42 insertions(+), 28 deletions(-)
>>
>> -- 
>> 2.17.1
>>
