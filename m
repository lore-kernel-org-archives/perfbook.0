Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=XflTg/Ptcb7VTVIxRhwRTk/VU5w7KwIjYh54YUTh6Vw=;
 b=on2pptgPbFfvq0QeKIA53yqxEx/dJ0oi8S4Ovq4oXysQjR1xFytXgwUnRsvUvLxHVS
 iYvYr1/uVeIK3aCn6P0FcjB19GfTpfWxBEKK46wUevIs9k5Ek+V4OlgUa4kEyN+nPMtx
 jIAy8DDdQN17hn3ISQAAVJVolvACjSxbCLfQjo0Vh5lzm4UdqOg2e+0h2lpBm3nIJKWJ
 5qZ9jm6Km70kG/PqW98+GLBb5+NLvy+LfY5+rI+IdQX9pyCMIRImWraVvDasgGUUZjx0
 WwVYdpnzmRg89FcMBggIqxXozt62donviR1mwVjHE//jsExIzAVJJyyr8YVLl2Eo+ZFP
 6hHA==
Subject: Re: [PATCH] Choose 'cmtt' font for code snippets in targets 'msnt'
 and 'mstx'
References: <a0f0786c-d28a-1a9d-0159-58656f6490eb@gmail.com>
 <20170321183553.GP3637@linux.vnet.ibm.com>
 <35f08b5e-cd04-897a-647a-caac9dbf59a1@gmail.com>
 <20170321224120.GS3637@linux.vnet.ibm.com>
 <6e57b3eb-3ff8-1780-a97f-abafb38b4a17@gmail.com>
 <88900e12-75a9-adb9-825e-19a1e4cb7ae9@gmail.com>
 <b59623d8-2e35-4984-3b30-b494d99f2130@gmail.com>
 <20170323125013.GZ3637@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <eaf565b9-6364-ba82-992c-f6e454a7a8f0@gmail.com>
Date: Thu, 23 Mar 2017 22:57:39 +0900
MIME-Version: 1.0
In-Reply-To: <20170323125013.GZ3637@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/03/23 05:50:13 -0700, Paul E. McKenney wrote:
> On Thu, Mar 23, 2017 at 09:00:00PM +0900, Akira Yokosawa wrote:
>> On 2017/03/22 20:05:36 +0900, Akira Yokosawa wrote:
>>> On 2017/03/22 07:54:24 +0900, Akira Yokosawa wrote:
>>>> On 2017/03/21 15:41:20 -0700, Paul E. McKenney wrote:
>>>>> On Wed, Mar 22, 2017 at 07:04:45AM +0900, Akira Yokosawa wrote:
>>>>>> On 2017/03/22 3:35, Paul E. McKenney wrote:
>>>>>>> On Mon, Mar 20, 2017 at 01:58:15PM +0900, Akira Yokosawa wrote:
>>>>>>>> >From 25fb5aea63049454a5df2c923dac59285fe40720 Mon Sep 17 00:00:00 2001
>>>>>>>> From: Akira Yokosawa <akiyks@gmail.com>
>>>>>>>> Date: Mon, 20 Mar 2017 13:10:38 +0900
>>>>>>>> Subject: [PATCH] Choose 'cmtt' font for code snippets in targets 'msnt' and 'mstx'
>>>>>>>>
>>>>>>>> By specifying "cmtt" (Computer Modern Teletype) font as \ttdefault
>>>>>>>> in verbatim, verbbox, table, tabular, tabulary, and minipage
>>>>>>>> environments, we can improve consistency of looks independent of
>>>>>>>> monospace font choice for main text. cmtt font is more than suitable
>>>>>>>> for listing of code snippet and program output.
>>>>>>>>
>>>>>>>> However, when mixed used with Times Roman (clone) font, cmtt's
>>>>>>>> slightly lower x-height than Times Roman, and its similar thickness
>>>>>>>> as Times Roman, it is not distinctive enough as can be seen in
>>>>>>>> "mslm" target.
>>>>>>>>
>>>>>>>> In this respect, "txtt" and its enhanced version "newtxtt" fonts
>>>>>>>> are more suitable as is described in [1].
>>>>>>>>
>>>>>>>> This commit enables the font choice of cmtt for code snippets in
>>>>>>>> targets "msnt" and "mstx".
>>>>>>>>
>>>>>>>> Help messages in Makefile are updated accordingly.
>>>>>>>>
>>>>>>>> Any feedback on the font choice is welcome.
>>>>>>>>
>>>>>>>> [1] Excerpt from newtxtt documentation:
>>>>>>>>
>>>>>>>>     This package provides an interface to another alternative---the
>>>>>>>>     typewriter fonts provided with txfonts, with some enhancements.
>>>>>>>>     They have the same widths as cmtt, but are taller, heavier,
>>>>>>>>     more geometric and less shapely, with very low contrast, and
>>>>>>>>     are more suited to match Roman fonts of height and weight
>>>>>>>>     approximating that of Times.
>>>>>>>>
>>>>>>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>>>>>>
>>>>>>> Queued and pushed, thank you!
>>>>>>>
>>>>>>> I did remove some trailing whitespace that this patch added to
>>>>>>> perfbook.tex.  Please let me know if this whitespace was needed for
>>>>>>> some reason.
>>>>>>
>>>>>> My bad. And thanks for the fix.
>>>>>>
>>>>>> Is there any config option to flag trailing whitespaces at "git add"?
>>>>>
>>>>> There is!
>>>>>
>>>>> You can create a pre-commit hook, which is a script that lives in your
>>>>> .git/hooks/pre-commit file.  I believe that the default hook checks for
>>>>> trailing whitespace.  You need to make the script executable.  To make
>>>>> the commit fail, make the script exit non-zero.  If you want to force the
>>>>> commit despite the script complaining, give "git commit" the "-n" flag.
>>>>>
>>>>> It has been years since I set mine up, so I am probably forgetting
>>>>> something, but there is always:
>>>>>
>>>>> 	https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks
>>>>
>>>> Thanks! I'll try it.
>>>>
>>>>>
>>>>>> And please try the modified targets and see if you really want to promote
>>>>>> "msnt" as the default font choice.
>>>>>
>>>>> Now that you mention it, I get this:
>>>>>
>>>>> 	! LaTeX Error: File `newtxtt.sty' not found.
>>>>>
>>>>> I downloaded this file from:
>>>>>
>>>>> 	ftp://ftp.dante.de/tex-archive/fonts/newtxtt/tex/newtxtt.sty
>>>>>
>>>>> and it was much happier.
>>>
>>> Well, font packages do not work properly by placing just .sty files.
>>> You need to get the whole font package if you need to manually install
>>> it on older TeX distribution.
>>>
>>> "newtxtt" font package can be downloaded from:
>>>
>>>      http://mirrors.ctan.org/install/fonts/newtxtt.tds.zip
>>>
>>> The way to manually install a package can be found at:
>>>
>>>      http://tex.stackexchange.com/questions/73016/
>>>
>>> Method 3 in the answer is your option. (If you really want to do so.)
>>
>> Oops, for font packages, you also need to update font-map database. See:
>>
>>       http://tex.stackexchange.com/questions/88423/
>>
>> I'll prepare a patch to update FAQ-BUILD.txt regarding this issue.
>>
>> But "msnt" as default seems premature.
>> "mslm" would be a moderate option for default. Thoughts?
> 
> Agreed -- I cannot be the only one still on 14.04.  And you are right,
> I have been intending to move to 16.04 for the better part of a year
> now.  :-/

So, I'll prepare a patch to promote "mslm" for official targets (2c, 1c, hb).
For other targets, "cmtt" font will be used for code snippets.
Current default will be kept as target "mss" (as before), and
it will still use "couriers" for code snippets.

                                     Thanks, Akira

> 
> 							Thanx, Paul
> 
>>                                     Thanks, Akira
>>
>>>
>>> But you can just try "make mstx" instead. This gives mostly the same
>>> result give or take the shape of "0" (hashed in mstx).
>>>
>>>>>                           But I bet that I should put it somewhere
>>>>> other than in the main perfbook directory, given that I don't want
>>>>> "git status" to gripe about it forever.  Any advice on location?
>>>>
>>>> I thought you are already on Ubuntu 16.04. TeX Live 2015/Debian package
>>>> should have this package. But let me check later.
>>>
>>> On Ubuntu 16.04, installing texlive-fonts-extra should be enough.
>>>
>>> Hope this helps.
>>>
>>>                                         Thanks, Akira
>>>
>>>>
>>>>>
>>>>> One thing I am not all that happy with is that it is hard for me
>>>>> to distinguish the inline fixed-width font from the normal font.
>>>>> Or is that the fault of my setup?
>>>>
>>>> You might be accustomed to the thinner courier font.
>>>> newtxtt font looks thiker than Times Roman, doesn't it?
>>>>
>>>>                                         Thanks, Akira
>>>>>
>>>>> 						Thanx, Paul
>>>>>
>>>>> 							Thanx, Paul
>>>>>
>> [snip]
>>
> 
> 

