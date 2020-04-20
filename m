Return-Path: <SRS0=sCky=6E=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=u4/4lL0iaUnFa5/K0qXg8hFncRyJr24QRgN/Dqo5fz8=;
        b=ikN+cyOqrlx76um5sLAjJUQoEyUHfGsmDODbuJTMbh5cdsRSGsrZJ0Fc4IxZTuW3Qj
         MWObR3M0w9vKqsyd0ph4Vwrc/pRJVvWIc626/fjaXAUOtf/yQ2RMBIpGPTD6zrajzdke
         ukta0r7Vxdvbozls+nNdAGP7qQo8P+Qpo7DKOmpfeJ4fHkvu1tJwpEENKynlnu6RQwV9
         ultQ/4TIpyDJ3YuxeIv64sC+zOSI02OlBT7GKgh0+foIa6UQcxgiRxaXiNp5VEkrDmV7
         /vdENvtuntFbo4us67axM5tWOdZfbKgpRPlgBGsQHN3CHAvVRCFrgDfXk7oi4QsDRSGY
         RMDQ==
Subject: Re: [PATCH] owned: Fix trivial typo
References: <3f299e03-f6c6-e0a1-017d-374fefa40c91@gmail.com>
 <20200420145843.GA17661@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <11a736e7-5ea8-4df7-146f-3d4c7108331e@gmail.com>
Date: Tue, 21 Apr 2020 07:07:57 +0900
MIME-Version: 1.0
In-Reply-To: <20200420145843.GA17661@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Mon, 20 Apr 2020 07:58:43 -0700, Paul E. McKenney wrote:
> On Mon, Apr 20, 2020 at 11:16:32PM +0900, Akira Yokosawa wrote:
>> >From 531deebc3597b87e9ed992d7a3f3608c846b4fe8 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Mon, 20 Apr 2020 17:10:11 +0900
>> Subject: [PATCH] owned: Fix trivial typo
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> Good eyes, but the object of "is" is "number" rather than "mechanisms".
> But yes, confusing.

Ah, so this is not "trivial" at all. ;-)
It was my school-book pattern matching...

> 
> Maybe "There are many such mechanisms"?

No, let's keep it as is.

Sorry for the noise.

-- Akira

> 
> 							Thanx, Paul
> 
>> ---
>>  owned/owned.tex | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/owned/owned.tex b/owned/owned.tex
>> index b45fabb1..945d7144 100644
>> --- a/owned/owned.tex
>> +++ b/owned/owned.tex
>> @@ -250,7 +250,7 @@ page~\pageref{lst:count:Signal-Theft Limit Counter Subtract Function}).
>>  	What mechanisms other than POSIX signals may be used for function
>>  	shipping?
>>  }\QuickQuizAnswer{
>> -	There is a very large number of such mechanisms, including:
>> +	There are a very large number of such mechanisms, including:
>>  	\begin{enumerate}
>>  	\item	System V message queues.
>>  	\item	Shared-memory dequeue (see
>> -- 
>> 2.17.1
>>
