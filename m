Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0QT2LRqdfOk6TFu+jodbjCYQn/PJ3EE0QMXwIe451Lg=;
        b=Q/BGHA+MKi5IRd0j02hg4/eIf6klYZkmdS2x1vM71GT0PJN1PRM+xh+OHvrmSLwws8
         h7TG8Ooh4Ko/DrO5zjXRLchiFLhms/4P0m9wRgOi4Q2hptz3vj0CDmiFkA8Zh5v1pUAJ
         SsRzYYBViGPpE6FcgH4sPus8Zfp7Fv73L7e3Huxg/1sXKM7H1sy3CNbUT9TJGdJ/RzE8
         bWmftsaYuvFGV4AyVec2eHKwchRjS+sB0XuPZpLKVndnC+7XLrSAE7V6Pkjq7KJ+5uXn
         YEgP5JNxV+THQk/x+dotJdgliprafVyh7NXRZVQMihSQoFpkdHgArItTewGi8JFJRdYz
         O0fA==
Subject: Re: perfbook
References: <20181025083609.GA6766@andrea>
 <20181025100235.GR4170@linux.ibm.com> <20181026202014.GA4905@andrea>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <8e6bc30b-d35f-e03e-9af4-14398bddf5b1@gmail.com>
Date: Sat, 27 Oct 2018 06:02:02 +0900
MIME-Version: 1.0
In-Reply-To: <20181026202014.GA4905@andrea>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Andrea Parri <andrea.parri@amarulasolutions.com>
Cc: "Paul E. McKenney" <paulmck@linux.ibm.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/10/26 13:58:45 -0700, Andrea Parri wrote:
> On Thu, Oct 25, 2018 at 03:02:35AM -0700, Paul E. McKenney wrote:
>> On Thu, Oct 25, 2018 at 10:36:09AM +0200, Andrea Parri wrote:
>>> Hi Paul,
>>>
>>> could you forward me the info about perfbook you sent last week
>>> including the PDF?  I did try to compile from the repo but have
>>> not been successful yet: here's the last one.
>>>
>>> sh ./utilities/gen_snippet_d.sh
>>> sh utilities/autodate.sh >autodate.tex
>>> CodeSamples/SMPdesign/smpalloc.canonical.eps --> CodeSamples/SMPdesign/smpalloc.canonical.pdf
>>> Makefile:211: recipe for target 'CodeSamples/SMPdesign/smpalloc.canonical.pdf' failed
>>> make: *** [CodeSamples/SMPdesign/smpalloc.canonical.pdf] Error 255
>>
>> Hello, Andrea,
>>
>> Please see attached for the current PDF.  It looks to me like you are
>> missing one of the required packages, which are listed in FAQ-BUILD.txt
>> in the perfbook repo.
>>
>> Adding the perfbook email list in case someone has more exact advice.  ;-)
> 
> Thanks.
> 
> Please let me know if I should provide info about my setup/log.

Hello Andrea,

The commands involved in the failed recipe is "a2ping".
It invokes "gs" (Ghostscript) internally.

Current Makefile does not check the existence of "gs".
Do your system have Ghostscript installed?

        Thanks, Akira
 

> 
>   Andrea
> 
> 
>>
>> 							Thanx, Paul
> 
> 

