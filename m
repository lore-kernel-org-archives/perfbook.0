Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=waUGCW2Tus4Gk4tsZwoe0vTr+/U7X4WFylgbgpKVKCM=;
 b=Q48d01PhM+AQE+5PH9MfwhQHSUTQ+FNfPtCIAzq8u5wHth0MT7BP84RhabyekgqItm
 jJoBAPdNnC2KeRPciNdT/42dlMiTpsPtkDJDQxjKt+mWzb9s+197lOcISz+oGeym60lM
 cgDsPmAYC+J31eKrGAJK7Shq5DHit0o6f2XwtaKw5Sq/3jU2tBVGPQzvqxubzGOQitb1
 oqZ5DrGImDxyIvgK0h5wtmAMWYM9h75wTGXWyoS/SUmerfa5cIksxSTPOkn6quI/JiNI
 0DkB6N8OBG/0pYZU1jG9BlEPF1+NiyPGgZWmU337g1MJ+Q6R9aDcrhT+DlpSwnZnbwE+
 tMfg==
Subject: Re: [PATCH] Improve messages regarding font installation
References: <0b0668b6-76b8-2490-9777-1e0aa0e10280@gmail.com>
 <09228564-927a-0300-9f7c-7c86915092c0@gmail.com>
 <20160519194651.GV3528@linux.vnet.ibm.com>
 <27cce515-fa2c-f32e-fb35-ae0439a11207@gmail.com>
 <7c8fa167-70f1-9d01-d3db-2c2de2b6161f@gmail.com>
 <20160520041308.GB3528@linux.vnet.ibm.com>
 <169da448-5839-5b48-555f-19ef2d358722@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <96472949-eb2b-a3d8-59ed-25150c83ffba@gmail.com>
Date: Sat, 21 May 2016 08:43:40 +0900
MIME-Version: 1.0
In-Reply-To: <169da448-5839-5b48-555f-19ef2d358722@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/05/20 21:00 +0900, Akira Yokosawa wrote:
> On 2016/05/19 21:13:08 -0700, Paul E. McKenney wrote:
>> On Fri, May 20, 2016 at 07:42:53AM +0900, Akira Yokosawa wrote:
>>> On 2016/05/20 07:18 +0900, Akira Yokosawa wrote:
>>>> On 2016/05/19 12:46:51 -0700, Paul E. McKenney wrote:
>>>>> On Fri, May 20, 2016 at 12:06:58AM +0900, Akira Yokosawa wrote:
>>>>>> >From 42dc2a0371d48c0b23f4ed70d556ef15213b5f69 Mon Sep 17 00:00:00 2001
>>>>>> From: Akira Yokosawa <akiyks@gmail.com>
>>>>>> Date: Thu, 19 May 2016 23:34:27 +0900
>>>>>> Subject: [PATCH] Improve messages regarding font installation
>>>>>>
>>>>>> In commit d8318d8db866 ("Add font installation check"), there was
>>>>>> typos already fixed by commit adc5a0ed9702 ("Fix typo "baloon" ->
>>>>>> "balloon"").
>>>>>> However, it breaks adjustment of "##" characters in the warning
>>>>>> messages.
>>>>>> This commit fixes them.
>>>>>> It also improves explanation of item 1 in FAQ-BUILD.txt by adding
>>>>>> a reference to item 1 of FAQ.txt.
>>>>>> It also adds a comment in Figure 1.1 that refers to item 1 in
>>>>>> FAQ.txt
>>>>>>
>>>>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>>>>
>>>>> Queued, thank you!
>>>>>
>>>>> BTW, I am still getting this:
>>>>>
>>>>> #######################################################################
>>>>> ## Steel City Comic font is not found in the resulting PDF!          ##
>>>>> ## Some speech balloons in the cartoons have been rendered awkwardly.##
>>>>> ## See item 1 in FAQ-BUILD.txt for the solution.                     ##
>>>>> #######################################################################
>>>>>
>>>>> I do have some fonts installed:
>>>>>
>>>>> $ fc-list | grep steel
>>>>> /usr/share/fonts/truetype/steel-city-comic.regular.ttf: Steel City Comic:style=Regular,Normal,obyčejné,Standard,Κανονικά,Normaali,Normál,Normale,Standaard,Normalny,Обычный,Normálne,Navadno,Arrunta
>>>>>
>>>>> This is from steel-city-comic.regular.ttf.  Is there something more that
>>>>> I need?  (I do plead much ignorance on fonts.)
>>>>
>>>> I didn't expect you to hit this...
>>>>
>>>> You mean the characters in Figures 3.1 and 3.2 don't fit in the balloons?
>>
>> They look fine.  It is just that I get the error message above every
>> time I do "make".
>>
>>>> "make touchsvg; make" should help you, but I think you've already tried it.
>>
>> I did that.
>>
>>>> "make neatfreak; make" will rebuild all the pdf files, but I don't expect
>>>> any difference in the result.
>>
>> And I did that, too.
>>
>>>> Could you send me "cartoons/r-2014-Old-man-and-Brat.pdf" off the list?
>>
>> Sent separately.
>>
>>>>                                                     Thanks, Akira
>>>
>>> Or do you happen to have some environment variable set to make grep ignore
>>> binary files, don't you?
>>
>> Not that I know of.  And "strings perfbook.pdf | grep -i steel" gives
>> me no output as well.  Ditto for cartoons/r-2014-Old-man-and-Brat.pdf.
>>
>>> Then the grep in runlatex.sh needs to override it. I'll see what can be done.
>>
>> Color me confused.
> 
> It seems cairo version you are using is 1.10.2.
> The version I'm using is 1.13.1.
> 
> As a band-aid fix, I'll send a patch in reply to this message.
> Please note that there may be conflict with the previous patch
> ("Improve messages regarding font installation").
> 

Hi, Paul.

I've made a better patch series relative to current master.
I tested on both Ubuntu 12.04 and Ubuntu 14.04.
I don't have Ubuntu 16.04 yet, but I'm going to test on it.
I'll send a pull request later.
(Yes, I'm using "git rebase -i")

                                                  Thanks, Akira

>                                                      Thanks, Akira
> 
>>
>> 							Thanx, Paul
>>
>>
>>>>>> ---
>>>>>>  FAQ-BUILD.txt         | 6 +++---
>>>>>>  howto/howto.tex       | 9 +++++----
>>>>>>  utilities/eps2pdf.sh  | 2 +-
>>>>>>  utilities/runlatex.sh | 2 +-
>>>>>>  4 files changed, 10 insertions(+), 9 deletions(-)
>>>>>>
>>>>>> diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
>>>>>> index d963534..e888725 100644
>>>>>> --- a/FAQ-BUILD.txt
>>>>>> +++ b/FAQ-BUILD.txt
>>>>>> @@ -1,6 +1,6 @@
>>>>>> -1.	I have installed the Steel City Comic font, and rebuilt
>>>>>> -	"perfbook.pdf".  But it doesn't seem to have any effect.
>>>>>> -	What am I missing?
>>>>>> +1.	I have installed the Steel City Comic font referring to item 1
>>>>>> +	in FAQ.txt, and rebuilt "perfbook.pdf". But it doesn't seem to
>>>>>> +	have any effect. What am I missing?
>>>>>>
>>>>>>  	A.	If you built "perfbook.pdf" before installing the font,
>>>>>>  		you need to rebuild cartoons whose sources are .svg
>>>>>> diff --git a/howto/howto.tex b/howto/howto.tex
>>>>>> index 6980114..7a70bb4 100644
>>>>>> --- a/howto/howto.tex
>>>>>> +++ b/howto/howto.tex
>>>>>> @@ -354,10 +354,11 @@ Other types of systems have well-known ways of locating files by filename.
>>>>>>  \begin{verbatim}
>>>>>>    1 git clone git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/perfbook.git
>>>>>>    2 cd perfbook
>>>>>> -  3 make
>>>>>> -  4 evince perfbook.pdf & # Two-column version
>>>>>> -  5 make perfbook-1c.pdf
>>>>>> -  6 evince perfbook-1c.pdf & # One-column version for e-readers
>>>>>> +  3 # You may need to install a font here. See item 1 in FAQ.txt.
>>>>>> +  4 make
>>>>>> +  5 evince perfbook.pdf & # Two-column version
>>>>>> +  6 make perfbook-1c.pdf
>>>>>> +  7 evince perfbook-1c.pdf & # One-column version for e-readers
>>>>>>  \end{verbatim}
>>>>>>  }
>>>>>>  \caption{Creating an Up-To-Date PDF}
>>>>>> diff --git a/utilities/eps2pdf.sh b/utilities/eps2pdf.sh
>>>>>> index 1497bdd..0a82d57 100644
>>>>>> --- a/utilities/eps2pdf.sh
>>>>>> +++ b/utilities/eps2pdf.sh
>>>>>> @@ -24,7 +24,7 @@ if ! fc-list | grep -q steel
>>>>>>  then
>>>>>>  	echo "#######################################################################"
>>>>>>  	echo "## Steel City Comic font is not found in the font cache!             ##"
>>>>>> -	echo "## Some speech balloons in the cartoons would be rendered awkwardly.  ##"
>>>>>> +	echo "## Some speech balloons in the cartoons would be rendered awkwardly. ##"
>>>>>>  	echo "## See item 1 in FAQ.txt for how to install the font.                ##"
>>>>>>  	echo "## Nevertheless, this build will resume in a short while.            ##"
>>>>>>  	echo "#######################################################################"
>>>>>> diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
>>>>>> index 9ae9021..94d46d6 100644
>>>>>> --- a/utilities/runlatex.sh
>>>>>> +++ b/utilities/runlatex.sh
>>>>>> @@ -117,7 +117,7 @@ if ! grep -q -i "steel city comic" cartoons/*.pdf
>>>>>>  then
>>>>>>  	echo "#######################################################################"
>>>>>>  	echo "## Steel City Comic font is not found in the resulting PDF!          ##"
>>>>>> -	echo "## Some speech balloons in the cartoons have been rendered awkwardly. ##"
>>>>>> +	echo "## Some speech balloons in the cartoons have been rendered awkwardly.##"
>>>>>>  	echo "## See item 1 in FAQ-BUILD.txt for the solution.                     ##"
>>>>>>  	echo "#######################################################################"
>>>>>>  fi
>>>>>> -- 
>>>>>> 1.9.1
>>>>>>
>>>>>
>>>>>
>>>>
>>>
>>
>>
> 

