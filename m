Return-Path: <SRS0=/lTJ=XC=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:subject:to:cc
         :references:content-language:in-reply-to:content-transfer-encoding;
        bh=3kTbOHJ1SgupCyBlmaODl2Yk8Ff7i71DvggDDCSEnDk=;
        b=BkagJiest+w7PY/M5ClIXlQmRt3DuAe7WG6VZjR4BfknQKR/v0JpECDv7Ra67dy3mg
         lNCjIDdyZuz//VaYMZbITjQ7CFDXlogKt6Y8x7Iohd0FyERgaVA0syJQPCqA2gM0/dwF
         mDOG0wLmn4JmsLzFY3rrwCA5H0cG3QsflvwE6lRmQn5nNnHlTkJQCmRaI9XB/3R0puvD
         gpBD2iDw5tLc4MVs3i/S7FfH+p5MK7kPxJ5ZTExHokjMEq2WBWwxqnpt3aydlXKBfFBM
         3KZxFtUsrggNGeidJfpcCmuxwCfCybLgyV+TN0kHgCkmVrepyYDSNqHHtayU1SalrZvx
         X9Jg==
Message-ID: <0b12a2ee-5edd-d169-2b8c-1a403df7e34c@gmail.com>
Date: Mon, 27 Jun 2022 19:32:29 +0900
MIME-Version: 1.0
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: Is parallel programing hard...
References: <32CE6D0C-1D26-423E-8A7F-AAC47B085DFF@illinois.edu>
 <20220626030351.GI1790663@paulmck-ThinkPad-P17-Gen-1>
 <efc0a14f-2265-39b7-8d57-b2a6a35e0b46@gmail.com>
 <4004322A-4FF7-435F-8427-A01621C106B1@illinois.edu>
Content-Language: en-US
In-Reply-To: <4004322A-4FF7-435F-8427-A01621C106B1@illinois.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: "perfbook@vger.kernel.org" <perfbook@vger.kernel.org>, "Snir, Marc" <snir@illinois.edu>, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sun, 26 Jun 2022 18:52:26 +0000, Snir, Marc wrote:
> lm is installed
> 
>> On Jun 25, 2022, at 11:12 PM, Akira Yokosawa <akiyks@gmail.com <mailto:akiyks@gmail.com>> wrote:
>>
>> On Sat, 25 Jun 2022 20:03:51 -0700, Paul E. McKenney wrote:
>>> [ Adding the perfbook email list on CC. ]
>>>
>>
>>> On Sun, Jun 26, 2022 at 02:00:40AM +0000, Snir, Marc wrote:
>>>> Hi:
>>>> I got a fatal latex error trying to create the pdf on my own. I append
>>>> below the last lines of the log and the full log. Latex seems to fail
>>>> soon after \maketitle
>>>
>>> This is a new one on me!
>>>
>>> One workaround is to us int Dockerfile template under the docker/
>>> subdirectory. This is described in question 13 in FAQ-BUILD.txt
>>> in the top-level directory.
>>>
>>> What environment are you running in? There are quirks for a few
>>> of them.
>>>
>>>> I send this FYI, in case it might help you; I loaded the pdf file,
>>>> and this works for me.
>>>
>>> Glad the PDF file worked!
>>>
>>> Which reminds me, it is past time for me to do another release.
>>>
>>>> Thanks for putting all this material on the web.
>>>
>>> Glad you like it, and I hope that it proves helpful!
>>>
>>> Thanx, Paul
>>>
>>>> Marc
>>
>> Hi Marc,
>>
>> I see in your log, you are using vanilla TeX Live 2022.
>>
>> I'm regularly building with vanilla TeX Live, and have not seen
>> such an error.
>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>> (/usr/local/texlive/2022/texmf-dist/tex/latex/newtx/ts1ntxtlf.fd
>>>> File: ts1ntxtlf.fd 2015/01/18 v1.0 fd file for TS1/ntxtlf
>>>> )
>>>> LaTeX Font Info: Font shape `TS1/ntxtlf/m/n' will be
>>>> (Font) scaled to size 12.0pt on input line 605.
>>>> LaTeX Font Info: Font shape `TS1/ntxtlf/m/n' will be
>>>> (Font) scaled to size 8.8pt on input line 605.
>>>> LaTeX Font Info: Font shape `TS1/ntxtlf/m/n' will be
>>>> (Font) scaled to size 6.6pt on input line 605.
>>>>
>>>>
>>>> ! LaTeX Error: There's no line here to end.
>>
>> In my build, messages in the log around here proceeds as follows:
>>
>> (/usr/local/texlive/2022/texmf-dist/tex/latex/newtx/ts1ntxtlf.fd
>> File: ts1ntxtlf.fd 2015/01/18 v1.0 fd file for TS1/ntxtlf
>> )
>> LaTeX Font Info: Font shape `TS1/ntxtlf/m/n' will be
>> (Font) scaled to size 12.0pt on input line 607.
>> LaTeX Font Info: Font shape `TS1/ntxtlf/m/n' will be
>> (Font) scaled to size 8.8pt on input line 607.
>> LaTeX Font Info: Font shape `TS1/ntxtlf/m/n' will be
>> (Font) scaled to size 6.6pt on input line 607.
>> LaTeX Font Info: Trying to load font information for T1+lmtt on input line 6
>> 07.
>>
>> (/usr/local/texlive/2022/texmf-dist/tex/latex/lm/t1lmtt.fd
>> File: t1lmtt.fd 2015/05/01 v1.6.1 Font defs for Latin Modern
>> )
>>
>> I think "Latin Modern" font is one of essential font packages on TeX Live
>> these days, but do you have the "lm" font package installed on your system?
>>
>> Thanks, Akira

For the record:

It turns out that Marc attempted the build under macOS 12.4, which
resulted in a corrupted autodate.tex.
It means utilities/autodate.sh doesn't work as expected under macOS.

The cause might be the difference of primitive tools such as "date",
"sed", and "grep".  We assume those from GNU, while macOS has those
of BSD origin.

As I don't have a macOS system at my disposal, I can't help further.

(I was surprised to know that the build scripts worked without a fatal
error until the first run of pdflatex.)

        Thanks, Akira

>>
>>>>
>>>>
>>>> See the LaTeX manual or LaTeX Companion for explanation.
>>>> Type H <return> for immediate help.
>>>> ...
>>>>
>>>> l.605 \IfTwoColumn
>>>> {
>>>> ?
>>>> ! Emergency stop.
>>>> ...
>>>>
>>>> l.605 \IfTwoColumn
>>>> {
>>>> Your command was ignored.
>>>> Type I <command> <return> to replace it with another command,
>>>> or <return> to continue without it.
> 
