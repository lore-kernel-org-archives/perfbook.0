Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OM9dudjE44RjDMKLFkqaQ7CHm2c0notobwDClNqjIMc=;
 b=dYHDCfj46jl/W+YQeLB8z9paJDNAf2fxLis8/XwALl00UiEK9JS0fK7hudpGtRhsnt
 9nMO/TpqL03biVQSNh0WQRKfZDMXaldV5WbjyaTCjGmxKSxVKqqjJi/g0jle6A0HGmVf
 2SSvd3Vf8rglk1tlAMIZsoYc4C7ehLuKc+J3mddXk7Yvm8zB1S8QYvmtCdrjjyEnFRgw
 dbk7AzJzHeSVfL7AwVlbw5a5B5nql4RIAcTOcybiNlS3EF8UcBHjj6jCfubqK3TkyfhH
 TNz8QbYVrRiGtuNtRWQh6vq2Oz3e49G2l0HRxGItzmjaGQIGYdA3bYFAWaEryVCXFPUF
 oANg==
Subject: Re: Section 4.2: wrong error reporting for pthread functions
References: 
 <CAJbg=FVjq_rwhvSw3Y=7xOxUqN_kV4P=wD42HU9=1u3KGnyJpg@mail.gmail.com>
 <20180714233313.GH12945@linux.vnet.ibm.com>
 <4131cfaa-45c2-e0e0-ecc0-dfa3058c53c3@gmail.com>
 <20180716163924.GZ12945@linux.vnet.ibm.com>
 <2def0b9d-d197-d1dd-2489-72b9c9d2be26@gmail.com>
 <20180717161531.GM12945@linux.vnet.ibm.com>
 <53b135c3-d9ac-915b-49ee-332efe4e60e5@gmail.com>
 <20180718131448.GZ12945@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <466d5063-ff10-af62-4867-88fa2db90af6@gmail.com>
Date: Wed, 18 Jul 2018 22:42:45 +0900
MIME-Version: 1.0
In-Reply-To: <20180718131448.GZ12945@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Elad Lahav <e2lahav@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/07/18 06:14:48 -0700, Paul E. McKenney wrote:
> On Wed, Jul 18, 2018 at 09:15:12PM +0900, Akira Yokosawa wrote:
>> On 2018/07/17 09:15:31 -0700, Paul E. McKenney wrote:
>>> On Wed, Jul 18, 2018 at 12:43:16AM +0900, Akira Yokosawa wrote:
[...]
>>>> So in theory, we can do what you want, but need somewhat ad-hoc
>>>> manual tweaks. Still, it might be possible to write a script or two
>>>> to do such tweaks in a semi-automated way.
>>>
>>> I already use scripts to do the auto-numbering and auto-intenting
>>> for the old-style listings, so why not?  ;-)
>>>
>>> If I haven't already made these available, please let me know and
>>> I can send them on.  They aren't exactly profound.
>>
>> So, there are 3 symbolic links under utilities/ in the Git repo:
>>
>>     c2latex.sh -> /home/paulmck/bin/c2latex.sh
>>     extractClatex.sh -> /home/paulmck/bin/extractClatex.sh
>>     latex2c.sh -> /home/paulmck/bin/latex2c.sh
>>
>> Now I know why I have no idea how you manage code snippets. ;-)
> 
> Heh!  I extract the code by hand and remove comments and any resulting
> extraneous blank lines.  I run it through c2latex.sh, and occasionally
> need to manually fix indentation.  Then I do any needed renumbering
> manually in the text.
> 
> And latex2c.sh is more or less the inverse of c2latex.sh.

Well, I mean if you don't mind, I'd like to see those scripts
in the Git repo rather than the symbolic links.

        Thanks, Akira

> 
>>>> If you'd like to see what the code snippet and reference to labels
>>>> would be,  I can prepare a experimental branch which is relative to
>>>> commit f2b9d37d3b95 ("count: Expand on gap between C11 atomics and
>>>> the Linux kernel").
>>>>
>>>> Thoughts?
>>>
>>> Sounds worth a try, thank you!
>>
>> OK.
>> I'll send a pseudo pull request when it is ready.
>> Hopefully in a couple of days.
> 
> Sounds good!
> 
> 							Thanx, Paul
> 
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

