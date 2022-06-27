Return-Path: <SRS0=/lTJ=XC=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=3z+qcPQqORi0XmbpWB8ThmNLJT+VTQbtwLsMlO2+pqw=;
        b=UoUkqrzgn3cMBHDBCCmtaf7pn8M8cbOY1nyFrceHTOstc5JGzlNKrHmle0Fg/Zrh7C
         ofVmcrYfAxPvG+0qyPCTbYJMVgiAx0epUw5cugJEUymhx0GVjifFNJPlxa2p0UoxWN4F
         s2UuebRkvA9AqZoWl30Ii2On7aogcHnSOtcjztZlpFeoq+O8CKWeSB8mQ0DIgb+L5krf
         JQaWTOaEuW67dzHvlykEunFGCF5vcHWPmlfgZJCY1d+aERzp454a1bzbyLeituNon2JV
         f0Nh/lymw7DV5gfaPJN85kFCy+WVNGBgiSv8e+aC2OB0rBzml2cuDL1eFp1wl17wKoTw
         M0FQ==
Message-ID: <c341ba87-ba38-11ba-c770-e341c5164b42@gmail.com>
Date: Tue, 28 Jun 2022 00:19:47 +0900
MIME-Version: 1.0
Subject: Re: Is parallel programing hard...
Content-Language: en-US
References: <32CE6D0C-1D26-423E-8A7F-AAC47B085DFF@illinois.edu>
 <20220626030351.GI1790663@paulmck-ThinkPad-P17-Gen-1>
 <efc0a14f-2265-39b7-8d57-b2a6a35e0b46@gmail.com>
 <4004322A-4FF7-435F-8427-A01621C106B1@illinois.edu>
 <0b12a2ee-5edd-d169-2b8c-1a403df7e34c@gmail.com>
 <20220627141106.GD1790663@paulmck-ThinkPad-P17-Gen-1>
 <fb3a89ba-48ec-1943-4f6f-84123b751b37@gmail.com>
 <20220627145628.GE1790663@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20220627145628.GE1790663@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: "Snir, Marc" <snir@illinois.edu>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Mon, 27 Jun 2022 07:56:28 -0700, Paul E. McKenney wrote:
> On Mon, Jun 27, 2022 at 11:52:18PM +0900, Akira Yokosawa wrote:
>> On Mon, 27 Jun 2022 07:11:06 -0700, Paul E. McKenney wrote:
>>> On Mon, Jun 27, 2022 at 07:32:29PM +0900, Akira Yokosawa wrote:
>> [...]
>>>>
>>>> For the record:
>>>>
>>>> It turns out that Marc attempted the build under macOS 12.4, which
>>>> resulted in a corrupted autodate.tex.
>>>> It means utilities/autodate.sh doesn't work as expected under macOS.
>>>>
>>>> The cause might be the difference of primitive tools such as "date",
>>>> "sed", and "grep".  We assume those from GNU, while macOS has those
>>>> of BSD origin.
>>>>
>>>> As I don't have a macOS system at my disposal, I can't help further.
>>>>
>>>> (I was surprised to know that the build scripts worked without a fatal
>>>> error until the first run of pdflatex.)
>>>
>>> In theory, it is possible to use the "findutils" and "brew" commands to
>>> set up gnu utilities on MacOS, and to do so such that your PATH variable
>>> can be used to choose whether the default is the MacOS versions or the
>>> gnu versions.  Or so it says here:
>>>
>>> https://www.google.com/search?q=latex+on+macos&oq=latex+on+macos&aqs=chrome..69i57j0i22i30l9.3869j1j7&client=ubuntu&sourceid=chrome&ie=UTF-8
>>>
>>> I do have an old MacOS system, but it is at home and I am on travel.
>>
>> How old is it?  :-)
> 
> About three years, but running a current MacOS.
> 
>>> I would need to install LaTeX on it (last time I tried, the installation
>>> hung), but Marc proved that it is possible to actually install it.  ;-) If
>>> I can pass that hurdle, I will try making perfbook use the gnu utilities.
>>>
>>> Or is this where someone tells me that  LaTeX on MacOS make use of
>>> scripts that rely on the MacOS variants of these commands?  ;-)
>>
>> I don't think so.
>> If you can make scripts under utilities/ behave as expected,
>> "make" should work.
>>
>> Except:
>>
>> Some of perl scripts have shebang lines of:
>>
>>     #!/usr/bin/perl
>>
>> , and are invoked directly from recipes in Makefile.
>> You need to change them to:
>>
>>     #!/usr/bin/env perl
>>
>> , so that your PATH setting is respected.  You might need similar
>> tweaks for scripts of other languages.
I was confused.  perl is perl.  There is no GNU or BSD flavor...

        Thanks, Akira

>>
>> Good luck!
> 
> I will need it.  ;-)
> 
> 							Thanx, Paul
> 
>>         Thanks, Akira
>>
>>>
>>> Thoughts?
>>>
>>> 							Thanx, Paul
>>>
>> [...]
