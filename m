Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5+pXFgRkmQESeBfAnrs0a/dQn9sD5RBp9AQubnbgEOY=;
 b=RQGfZR68TnO37gopR0LFpghnLbnmGl8aMLeZSA9msUfdmcsp4kHAd1aHd+CesSrLVv
 XbXtpOaC2AwuexAijv0hoWEtbsXzYPu2KoOCSjfeANfz9KlGzEpGiF6aHgiG1LUN2pHU
 Ia8uTvjJRyTs8NrpHtjXtoLYmxKYO9tGI+ki6DC42svmBEE/RSl0IKJQwTnyZv9VWNmJ
 YMqHkLhjt28nk4rxhVJIw3WuhXZ518oIMr4EHIf1/ry1vNBLFcvaAgeCD7QQA22Gv7Xx
 EJSpFhCxnxw1xBk41+2bPfYPnQg/AWIl1dr5Wrj5OI2+N5Qfa7meZgeuwUxPtINyHEk/
 5lAg==
Subject: Re: [PATCH 2/3] cpu/overheads: Don't break just after nn-mm
References: <2495dd31-1b4c-99e2-46aa-dc55671007ff@gmail.com>
 <479e6ed4-b56d-a9d8-3f98-28439201a348@gmail.com>
 <20171104044025.GU3624@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <0347fa89-d3c2-c11d-f47c-737fa177dfb9@gmail.com>
Date: Sat, 4 Nov 2017 14:24:22 +0900
MIME-Version: 1.0
In-Reply-To: <20171104044025.GU3624@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/11/03 21:40:25 -0700, Paul E. McKenney wrote:
> On Sat, Nov 04, 2017 at 10:40:40AM +0900, Akira Yokosawa wrote:
>> >From 96995ec9781970d633f554579465e9f053ec316a Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Sat, 4 Nov 2017 07:44:36 +0900
>> Subject: [PATCH 2/3] cpu/overheads: Don't break just after nn-mm
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> You lost me with this one.  Shouldn't there be a non-breaking space
> between the "350-500" and the "sheets"?  Or is there some magic here
> that I am missing?

I intentionally chose normal space because the preceding number is
3 digits and "sheets" can't be hyphenated. It can cause large underfil
in 2c layout.
In the current Answer, line breaking is done at different places in
both 1c and 2c layout, so it doesn't matter at the moment.

Also, non-breaking spaces can be enforced by a script something like
hypen2endash.sh. The added pattern in Patch #1 does the conversion
to nbsp. (I use this script for mostly 1c layout.)

Thoughts?

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>> ---
>>  cpu/overheads.tex | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/cpu/overheads.tex b/cpu/overheads.tex
>> index bd4c814..366b071 100644
>> --- a/cpu/overheads.tex
>> +++ b/cpu/overheads.tex
>> @@ -290,8 +290,8 @@ cycles, as shown in the ``Global Comms'' row.
>>  	How can I possibly get my head around them?
>>  \QuickQuizAnswer{
>>  	Get a roll of toilet paper.
>> -	In the USA, each roll will normally have somewhere around 350-500
>> -	sheets.
>> +	In the USA, each roll will normally have somewhere around
>> +	350-500 sheets.
>>  	Tear off one sheet to represent a single clock cycle, setting it aside.
>>  	Now unroll the rest of the roll.
>>
>> -- 
>> 2.7.4
>>
>>
> 
> 

