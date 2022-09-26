Return-Path: <SRS0=gDlb=Z5=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=6Eth1AhSah8DRpb40zrbmR7xoUH2pbVrqRXwRGpLpaQ=;
        b=Tl57ROvdzJ6sUa5xi0Tq0PUJHfPJgv+AisoFjQW5b1bCY2nLbpDmNXBgDYPxxWtrwS
         /MoT40yvVjqLlbmHI66FLYnnV9ASIqrT4dANP4jFwKv8wA4kXlpAOmPtVUplXyo9yo/3
         zuM2lumaA2ou3Yv5Wx9CcQ3R4bl24lEE+tMfIfpBRN4poJ/rZd+6DvniYqi5UG3zbuXy
         i/wF7PV1Px9I3vxV0MHHzAmr2NCWATB9+Da2UgvEVrfTV2Ha+LbNZeZ/byZblHuhb0S9
         8CXsQc0hnH4+4Wf8NSfDvmgfnc9aFq4DULh6RJ6ckKpnlrDyQcJ3B9wz/lUQsiOdo2rS
         jm3g==
Message-ID: <0393d498-03d5-816e-d99c-ee839f825f4e@gmail.com>
Date: Mon, 26 Sep 2022 23:31:34 +0900
MIME-Version: 1.0
Subject: Re: And, at long last, another perfbook release
Content-Language: en-US
References: <20220925225024.GA549132@paulmck-ThinkPad-P17-Gen-1>
 <69602cd9-49af-7842-db73-53d1f19c2914@gmail.com>
 <20220926135647.GJ4196@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20220926135647.GJ4196@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: e2lahav@gmail.com, johann@jklaehn.de, sj38.park@gmail.com, maplewish117@gmail.com, zhouzhouyi@gmail.com, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Mon, 26 Sep 2022 06:56:47 -0700, Paul E. McKenney wrote:
> On Mon, Sep 26, 2022 at 09:05:52PM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> On Sun, 25 Sep 2022 15:50:24 -0700, Paul E. McKenney wrote:
>>> Hello!
>>>
>>> The new v2022.09.25a release of perfbook is available, and the draft
>>> announcement is here:  https://paulmck.livejournal.com/68537.html
>>> Thank you all for your contributions to this release!
>>>
>>> Please let me know if changes are needed.
>>
>> Not on my contribution, but
>>
>>     The code samples now use C11 thread-local storage instead of the
>>     GCC __thread storage class, courtesy of Elad Lahav.
>>
>> IIUC, Elad touched one of many code samples, namely count_end.c.
>> So the conversion has just started.
>>
>> For me, Elad's contribution of adding QNX as a platform for building
>> code samples looks much more interesting.
> 
> Both good points, thank you!
> 
> I updated that paragraph as follows:
> 
> 	One of the code samples now use C11 thread-local storage instead
> 	of the GCC __thread storage class, courtesy of Elad Lahav. Elad
> 	also added support for building code samples on QNX.
> 
> Does that work better?

Works for me!

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>> Just my 2 cents.
>>
>>          Thanks, Akira
>>
>>>                                           If I don't hear otherwise, I
>>> will post this more widely by the end of tomorrow (Monday), Pacific Time.
>>>
>>> 							Thanx, Paul
