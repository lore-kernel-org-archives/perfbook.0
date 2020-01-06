Return-Path: <SRS0=hguf=23=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ugYDrVC144ZEKUF6gthUopr3OVSmlpmFvoWrwsOF4xk=;
        b=u7+i7w/EHU5Dgjv7vwywOZ3znbpiSnAlq6FNXVFqsNbpgMdSkMfkcyb5ZzRjjOKUwV
         5wFqKg3Xt95OdKpF3LxEsuq6JzyOdJCkwksLdfZPgvfwJyFUv50cPgUpyPMVEN251Om8
         76BYHBSwLbYO1lRiC5LMRVvesVwkoy+qB3d3WjN8RCaOh24sI1Ez3UcNfJXMjfyX8cBb
         JAbDDUAJZm1UHkm7lIOQfoyi8adh8ugDAk3Kk5G5Qv0w4SuxHF+FazXXGidhOZjty3sM
         Vd5k6YSRS7lkBDT486CCS6LviHeVtGLA8UQL6/UBlr2MV1vwWUyMmfmM6rLo99moD65j
         qRmw==
Subject: Re: [RFT PATCH] utilities/toarxiv.sh: Get rid of borders around
 hyperlinks
References: <70c586e6-a76d-f107-43be-e2f1ee1fa1c9@gmail.com>
 <20200106012531.GH13449@paulmck-ThinkPad-P72>
 <20200106033147.GB18139@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <df58faeb-3e87-9878-734b-a34872b7fc93@gmail.com>
Date: Tue, 7 Jan 2020 00:17:07 +0900
MIME-Version: 1.0
In-Reply-To: <20200106033147.GB18139@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sun, 5 Jan 2020 19:31:47 -0800, Paul E. McKenney wrote:
> And I placed the arxiv PDF here:
> 
> http://www2.rdrop.com/~paulmck/submission/perfbook-arxiv.pdf
> 
> Thoughts?

Thank you for testing this.
It looks mostly identical to our -2c build, give or take the
footnotebackref package. So the workaround code seems to work!

Didn't you get any warning message from arxiv's build system?

Arxiv.org says it has TeX Live 2016 installed now, and I guess
footnotebackref should also be available. 

        Thanks, Akira

> 
> 							Thanx, Paul
> 
> On Sun, Jan 05, 2020 at 05:25:31PM -0800, Paul E. McKenney wrote:
>> On Sun, Jan 05, 2020 at 12:40:50AM +0900, Akira Yokosawa wrote:
>>> >From 1edf6fb9b98cd74d37a3580f2b482d4d9c0197ad Mon Sep 17 00:00:00 2001
>>> From: Akira Yokosawa <akiyks@gmail.com>
>>> Date: Sat, 4 Jan 2020 20:15:27 +0900
>>> Subject: [RFT PATCH] utilities/toarxiv.sh: Get rid of borders around hyperlinks
>>>
>>> Based on a Q&A on StackExchange [1], putting "nohypertex" in
>>> 00README.XXX looks like the cause of all those ugly borders.
>>>
>>> To override the default behavior of arxiv's hyperref,
>>> add a boolean "toarxiv" in perfbook.tex and set it "true" in
>>> toarxiv.sh so that the workaround code added in the preamble
>>> shall be enabled.
>>>
>>> [1]: https://tex.stackexchange.com/questions/30243/
>>>
>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>> ---
>>> Hi Paul,
>>>
>>> I looked at v2019.12.22a on https://arxiv.org/abs/1701.00854 and found that
>>> some pages in the PDF almost impossible to read because of frequent borders
>>> around hyperlinks.
>>>
>>> I'm not sure this change in toarxiv.sh and perfbook.tex actually works on
>>> arxiv.org, but can you try building there and see whether it works or not?
>>
>> Queued and pushed.  I have started the arxiv.org processing step, but it
>> usually takes awhile.  ;-)
>>
>> 							Thanx, Paul
>>
>>>         Thanks, Akira
>>> -- 
>>>  perfbook.tex         | 14 +++++++++++++-
>>>  utilities/toarxiv.sh |  4 ++--
>>>  2 files changed, 15 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/perfbook.tex b/perfbook.tex
>>> index 0fae78fb..db334ae4 100644
>>> --- a/perfbook.tex
>>> +++ b/perfbook.tex
>>> @@ -110,10 +110,12 @@
>>>  \newboolean{nimbusavail}
>>>  \setboolean{nimbusavail}{false}
>>>  \newcommand{\IfNimbusAvail}[2]{\ifthenelse{\boolean{nimbusavail}}{#1}{#2}}
>>> -
>>>  \newboolean{colorlinks}
>>>  \setboolean{colorlinks}{false}
>>>  \newcommand{\IfColorLinks}[2]{\ifthenelse{\boolean{colorlinks}}{#1}{#2}}
>>> +\newboolean{toarxiv}
>>> +\setboolean{toarxiv}{false}
>>> +\newcommand{\IfToArxiv}[2]{\ifthenelse{\boolean{toarxiv}}{#1}{#2}}
>>>  
>>>  \IfTwoColumn{}{
>>>  \setboolean{colorlinks}{true}
>>> @@ -123,6 +125,16 @@
>>>  \hypersetup{colorlinks=true,allcolors=MediumBlue}
>>>  }{}
>>>  
>>> +\IfToArxiv{
>>> +\hypersetup{
>>> +    colorlinks=true,
>>> +    linkcolor=black,
>>> +    citecolor=black,
>>> +    filecolor=black,
>>> +    urlcolor=black,
>>> +}
>>> +}{}
>>> +
>>>  \IfNimbusAvail{
>>>  \usepackage{nimbusmononarrow}
>>>  }{}
>>> diff --git a/utilities/toarxiv.sh b/utilities/toarxiv.sh
>>> index 29bce4ea..5e1c6388 100644
>>> --- a/utilities/toarxiv.sh
>>> +++ b/utilities/toarxiv.sh
>>> @@ -79,6 +79,6 @@ rm ${destdir}/SMPdesign/DiningPhilosopher5TB.tex
>>>  
>>>  # The following changes work around arxiv.org limitations
>>>  sed	-e '/usepackage{footnotebackref}/d' \
>>> -	-e 's/\[bookmarks=true,bookmarksnumbered=true,pdfborder={0 0 0}]/[bookmarks=false]/' \
>>> +	-e 's/{toarxiv}{false}/{toarxiv}{true}/' \
>>>  	< perfbook.tex > ${destdir}/perfbook.tex
>>> -echo "nohypertex" > ${destdir}/00README.XXX
>>> +# echo "nohypertex" > ${destdir}/00README.XXX
>>> -- 
>>> 2.24.1
>>>

