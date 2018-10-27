Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=34+rlaGoufcwTcHhrIrubIdqh0ZJqULr8jIfw7f/OxM=;
        b=nTK7dHZZU9ap+8WCsWcGHqYyOpI2N1xIJ7QYUBcfDHK/luFx8NfBMIoWM/DEiiziUX
         4qTdT1bU+bVYJ31Vm2eIRrU7e/HtZMU0Fo9dWuB4iITZCdfHVGVq8QLb493sovRDvaXo
         y5VJRTHfzDZG41QVNcnzDqJVzB2kF20SA6bBoz7P9FdK8dD9tZnsXnExW4eYQ6kGHPdj
         +hqy+rEXTHoAWDXbRYaxR/gqBjqQPJviQ7x5Dz6OyT4qJek+RiRONSng9zeh2HLc0Id+
         oH0LBD0u/chqehLUM/62NG6IHSydpd/vn9OwxadtmsSTBeJ9ddkxYrIKHEeO1OWMmxf3
         /bjA==
Subject: Re: perfbook
References: <20181025083609.GA6766@andrea>
 <20181025100235.GR4170@linux.ibm.com> <20181026202014.GA4905@andrea>
 <8e6bc30b-d35f-e03e-9af4-14398bddf5b1@gmail.com>
 <20181026221402.GA5769@andrea>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <96dcab56-15ff-0af2-0322-1b95b561c16b@gmail.com>
Date: Sat, 27 Oct 2018 12:50:38 +0900
MIME-Version: 1.0
In-Reply-To: <20181026221402.GA5769@andrea>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Andrea Parri <andrea.parri@amarulasolutions.com>
Cc: "Paul E. McKenney" <paulmck@linux.ibm.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/10/27 7:14, Andrea Parri wrote:
> On Sat, Oct 27, 2018 at 06:02:02AM +0900, Akira Yokosawa wrote:
>> On 2018/10/26 13:58:45 -0700, Andrea Parri wrote:
>>> On Thu, Oct 25, 2018 at 03:02:35AM -0700, Paul E. McKenney wrote:
>>>> On Thu, Oct 25, 2018 at 10:36:09AM +0200, Andrea Parri wrote:
>>>>> Hi Paul,
>>>>>
>>>>> could you forward me the info about perfbook you sent last week
>>>>> including the PDF?  I did try to compile from the repo but have
>>>>> not been successful yet: here's the last one.
>>>>>
>>>>> sh ./utilities/gen_snippet_d.sh
>>>>> sh utilities/autodate.sh >autodate.tex
>>>>> CodeSamples/SMPdesign/smpalloc.canonical.eps --> CodeSamples/SMPdesign/smpalloc.canonical.pdf
>>>>> Makefile:211: recipe for target 'CodeSamples/SMPdesign/smpalloc.canonical.pdf' failed
>>>>> make: *** [CodeSamples/SMPdesign/smpalloc.canonical.pdf] Error 255
>>>>
>>>> Hello, Andrea,
>>>>
>>>> Please see attached for the current PDF.  It looks to me like you are
>>>> missing one of the required packages, which are listed in FAQ-BUILD.txt
>>>> in the perfbook repo.
>>>>
>>>> Adding the perfbook email list in case someone has more exact advice.  ;-)
>>>
>>> Thanks.
>>>
>>> Please let me know if I should provide info about my setup/log.
>>
>> Hello Andrea,
>>
>> The commands involved in the failed recipe is "a2ping".
>> It invokes "gs" (Ghostscript) internally.
>>
>> Current Makefile does not check the existence of "gs".
>> Do your system have Ghostscript installed?
> 
> Hi Akira.  Yes, I have v9.25 (2018-03-21) from ubuntu 18.04.

Just want to make sure the gs version.

"gs -v" on my Ubuntu 18.04 says:

GPL Ghostscript 9.25 (2018-09-13)
Copyright (C) 2018 Artifex Software, Inc.  All rights reserved.

What does your "gs -v" say?

        Akira

> 
>   Andrea
> 
> 
>>
>>         Thanks, Akira
>>  
>>
>>>
>>>   Andrea
>>>
>>>
>>>>
>>>> 							Thanx, Paul
>>>
>>>
>>

