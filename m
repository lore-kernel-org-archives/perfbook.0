Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sf6AnOMxMVteWVNLUE7/as5HFAwX3Yevk9VJJllvoQU=;
        b=TcS4x7f4wuem6ATkTahHjcPEBt+cnfAMxr3AtX9ULWoZ08lTW956AZGjcZehuU0kil
         WUEsEEKL5UiZdXAnIl7Ej+7AqFn1riEEdkr0X1A/QeH3SIb3+n0lTURt4pjuhpcNQgZe
         hnHrdSp7uZMshZ28syD7YQqtgrhprHwSCtctDgXb/qac9xlpaOZTRPxz/Jf/z1c7AlqV
         cwv9vvOEIexMzVoMz+Z7wtmny/gYM8MJmCp1POn/h40C0DJwYkLrOAbMzkJ9xz963NE8
         N2+aDW+khyXpsxaWecq+RNinPPFWl2ThdG2No31xQqqX55ZODICZxRyHN7MF/DTUvewF
         pwnA==
Subject: Re: perfbook
References: <20181025083609.GA6766@andrea>
 <20181025100235.GR4170@linux.ibm.com> <20181026202014.GA4905@andrea>
 <8e6bc30b-d35f-e03e-9af4-14398bddf5b1@gmail.com>
 <20181026221402.GA5769@andrea>
 <6e0825ca-560d-4774-ce88-399c72053448@gmail.com>
 <20181026230623.GA11970@andrea>
 <f3f1a05c-c626-0f3a-8591-87fb93ea11ca@gmail.com>
 <2da98be8-9b4a-433d-fd6c-bf882c3ec5f6@gmail.com>
 <20181027004319.GA22818@andrea>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <32590983-473a-dcb7-669a-fe5cc8cc40ce@gmail.com>
Date: Sat, 27 Oct 2018 19:11:19 +0900
MIME-Version: 1.0
In-Reply-To: <20181027004319.GA22818@andrea>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Andrea Parri <andrea.parri@amarulasolutions.com>
Cc: "Paul E. McKenney" <paulmck@linux.ibm.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/10/27 02:43:19 +0200, Andrea Parri wrote:
> On Sat, Oct 27, 2018 at 09:33:57AM +0900, Akira Yokosawa wrote:
>> On 2018/10/27 8:43, Akira Yokosawa wrote:
>>> On 2018/10/27 8:06, Andrea Parri wrote:
>>>>> And you have a2ping 2.83p, right?  Otherwise, Makefile should
>>>>> complain. Hmm???
>>>>
>>>> Indeed, 2.83p.
>>>>
>>>>
>>>>>
>>>>> Can you remove "> /dev/null 2>&1" on line 220 of Makefile,
>>>>> and let me know what a2ping should say?
>>>>
>>>> It says:
>>>>
>>>> /usr/local/bin/a2ping: not a GS output from gs (0)
>>>
>>> Umm, "gs (0)" suggests exit code of gs is 0, which should indicate
>>> success. I have no idea what is going on.
>>
>> Andrea,
>>
>> Do you happen to set some of environment variables:
>>
>>     GS_OPTIONS
>>     GS_DEVICE
>>
>> and the like?
> 
> No GS_ variable set.

Hmm.

As a last resort, there are alternative commands to a2ping I'm aware of.

If "ps2epsi", "epstool", and "epstopdf" all work on your system,
I can provide a variant of Makefile which don't rely on a2ping.

How to check:

(You might need to install missing commands if any.)

$ ps2epsi SMPdesign/CPUvsEnet.eps /tmp/CPUvsEnet.epsi
$ epstool --copy --bbox --ignore-errors /tmp/CPUvsEnet.epsi /tmp/CPUvsEnet.epsij
$ cat /tmp/CPUvsEnet.epsij | epstopdf --filter --outfile=/tmp/CPUvsEnet.pdf

If /tmp/CPUvsEnet.pdf (Figure 6.12 in perfbook) is generated, those three
commands should be working properly.

I tried these commands this February when Fedora 28 updated Ghostscript to
9.22, and a2ping (2.77p) stopped working.  Luckily, a2ping's maintainer
released 2.83p in March.

        Thanks, Akira

> 
>   Andrea
> 
> 
>>
>> Akira
>>
>>>
>>> I have a Ubuntu 18.04 virtual machine and a2ping 2.83p works happily
>>> there. 
>>>
>>> Sorry but I can't help you at the moment.
>>>
>>> Akira
>>>
>>>>
>>>>   Andrea
>>>>
>>>>
>>>>>
>>>>> "GPL Ghostscript 9.25: Unrecoverable error, exit code 1" is not
>>>>> fatal and can be ignored as far as I know.
>>>>>
>>>>>       Akira
>>>
>>

