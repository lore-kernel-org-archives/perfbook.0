Return-Path: <SRS0=286c=RC=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=p8n+djZcrHG/SQyLz011qatJlJ83knwjk5NJr8pDCh4=;
        b=qhVYylY22U+bL484KQzzPil6NoJ41qePiFYIKMyoWTv7WAbziYEwBYmfQoDNaDhfDG
         fcBe8cWtJESWDmXsRNkZMzdhV10tlYIoDKbtuA79+zYIvRtpTX+Bizd990xRMjlRFQv+
         Y0+5mvc+3j3Q7mdSlyddMLxbtY1JToxIKwMvJB0M+OsdsW3a3MTaO1TUcPCPsCPd4tAW
         m26YBY1fSldPG+AK1RW67qw9HPrSe68rk0BILnRie7LqLBYvqGvu1PSI43iTkVV7Vin8
         YhkAOws7q/CiO7U/CiW4ujZnTdgAe52kvNFsdep4Kq9wPDBMUbTBJ/Rxgq4+qpDJGyFn
         I/Dg==
Subject: Re: [PATCH -perfbook] defer: Retouch RCUusecases.svg by Inkscape
 1.1.1
References: <df989143-2daf-1f80-7800-d514a21c9607@gmail.com>
 <3d3d0475-50aa-28dd-92a0-56ad7ba4dca1@gmail.com>
 <20211216152304.GL641268@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f7e2e4d6-09bb-a173-c3e8-3246577a943d@gmail.com>
Date: Fri, 17 Dec 2021 10:17:40 +0900
MIME-Version: 1.0
In-Reply-To: <20211216152304.GL641268@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Thu, 16 Dec 2021 07:23:04 -0800, Paul E. McKenney wrote:
> On Thu, Dec 16, 2021 at 11:06:45PM +0900, Akira Yokosawa wrote:
>> On Thu, 16 Dec 2021 16:59:13 +0900, Akira Yokosawa wrote:
>>> Some of texts in the figure are lost when rendered by Inkscape
>>> 1.1.1 on Fedora 35.
>>> Those texts are placed far left from the viewBox of the figure
>>> when opened in Inkscape 1.1.1.
>>>
>>> This issue is similar to the one resolved by commit 36b07176210d
>>> ("defer: Make RCUspacetime.svg compatible with Inkscape 1.0 and
>>> later").
>>>
>>> Ungroup and adjust x-coordinates of those texts by Inkscape 1.1.1.
>>>
>>> Resulting SVG is compatible with Inkscape 0.92.x on Ubuntu 18.04
>>> and Ubuntu 20.04 as well as Inkscape >=1.0.
>>
>> Well, Firefox still has trouble with this.... (much better, but
>> still)
>>
>> Paul, please wait for v2.
> 
> Idiot here forgot to do the inkscape editing on his Fedora system,
> apologies!
> 
> Let me try that.
> 

I'm seeing the refined SVG in Firefox, and it still lacks some of
texts.

Now I'm opening the SVG in a text editor...

Oh, there actually are a dozen of "transform="rotate(90)"
and "transform="rotate(-90)" directives.
So you did rotate those texts, didn't you?

For perfbook, web-browser compatibility is not an issue,
but it might bite you when you reuse this figure in an
html page.

And I've now noticed that RCUspacetime.svg is not rendered
right in Firefox, either.

Let me see if there is a way to make them browser compatible.

> Ah, and I am expecting to do a release before the end of this year,
> preferably sooner.  This is not a big deal at all:  Release rather
> than edition!

Nice!
I'll review new contents in rcuusage.tex this weekend.

        Thanks, Akira


> 
> 							Thanx, Paul
> 
>>         Thanks, Akira
>>
>>>
>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>> ---
>>> Hi Paul,
>>>
>>> So I said you are safe as far as you don't rotate texts.
>>> Apparently I was wrong!
>>>
>>> I'm suspecting the cause of the incompatibility is likely related to
>>> grouping of texts and doing some operation on the grouped text.
>>>
>>> In this retouch, I did ungrouping only.  So you might need to do
>>> proper grouping if you need further edit.
>>>
>>>         Thanks, Akira
>>> --
>>>  defer/RCUusecases.svg | 1406 +++++++++++++++++++----------------------
>>>  1 file changed, 656 insertions(+), 750 deletions(-)
>>>
>>> diff --git a/defer/RCUusecases.svg b/defer/RCUusecases.svg
>> [...]
