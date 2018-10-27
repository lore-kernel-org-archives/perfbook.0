Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Y+IJtbdC4ncKcLGL0jIEHIBRBReNtDR3kI6WU1s0D4w=;
        b=MXfyAmRYULIYev7Xn/psrFzFpGliEWfe5r+ozcUXykB68WF2YmnW2rarNnXtJR/eb2
         10Nj5bKop+9W+b+kxmXIJyEfgMefWrHjslrh0sD9ilt0YVTXznNoB6oqbdkHhMnST29W
         eBdd6MEuihGfz8OPZ3uMF4KgE2da3+jyHLzGiXGcf+8N7zGVmS9yyG71HQvi6JYBE0BL
         tDg/DpuzcdKfhrcdAKe8GwhA+Sr9X7tPtfZoM8jbQbJaOoKUMVFN1rEfLpFF6RJwx12Z
         utJ1MzOI1ft4mAXMjPUFKHCA2v5KC8hJjuOZoDJeABZ+TuwqFIRO0DxeIbMkGHqPX8wM
         M3ag==
Subject: Re: perfbook
References: <20181025083609.GA6766@andrea>
 <20181025100235.GR4170@linux.ibm.com> <20181026202014.GA4905@andrea>
 <8e6bc30b-d35f-e03e-9af4-14398bddf5b1@gmail.com>
 <20181026221402.GA5769@andrea>
 <6e0825ca-560d-4774-ce88-399c72053448@gmail.com>
 <20181026230623.GA11970@andrea>
 <f3f1a05c-c626-0f3a-8591-87fb93ea11ca@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2da98be8-9b4a-433d-fd6c-bf882c3ec5f6@gmail.com>
Date: Sat, 27 Oct 2018 09:33:57 +0900
MIME-Version: 1.0
In-Reply-To: <f3f1a05c-c626-0f3a-8591-87fb93ea11ca@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Andrea Parri <andrea.parri@amarulasolutions.com>
Cc: "Paul E. McKenney" <paulmck@linux.ibm.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/10/27 8:43, Akira Yokosawa wrote:
> On 2018/10/27 8:06, Andrea Parri wrote:
>>> And you have a2ping 2.83p, right?  Otherwise, Makefile should
>>> complain. Hmm???
>>
>> Indeed, 2.83p.
>>
>>
>>>
>>> Can you remove "> /dev/null 2>&1" on line 220 of Makefile,
>>> and let me know what a2ping should say?
>>
>> It says:
>>
>> /usr/local/bin/a2ping: not a GS output from gs (0)
> 
> Umm, "gs (0)" suggests exit code of gs is 0, which should indicate
> success. I have no idea what is going on.

Andrea,

Do you happen to set some of environment variables:

    GS_OPTIONS
    GS_DEVICE

and the like?

Akira

> 
> I have a Ubuntu 18.04 virtual machine and a2ping 2.83p works happily
> there. 
> 
> Sorry but I can't help you at the moment.
> 
> Akira
> 
>>
>>   Andrea
>>
>>
>>>
>>> "GPL Ghostscript 9.25: Unrecoverable error, exit code 1" is not
>>> fatal and can be ignored as far as I know.
>>>
>>>       Akira
> 

