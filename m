Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=l4BwqhKr9cEKQV6ovcjXm1U7WHYTkyFaWhABfEsTWs0=;
 b=pQvrLOT64Rl5jP2hdEa9zJaKXv1jkvr46+thJtAkpjSnccPs3q/OD0X4ayBsDbzbZy
 fbKhDP2tV71n/Ydy/kgfM6y3lY04zCVuMjmVd9fcf077TZ3/v52A9VdvRsLlYGdD9gAR
 kTlO4yV9IIXWjkOsX+I763Y8wUL+OapMnKSqF9bdhaH5YREZLFEsn1UL73aAXCkeZSZP
 c4mRQv9MkWigN6b872CpYndxFx7wovEHtiLPZnv5nkKhuTognsabsMWZtl6srqPKpDGH
 aoXdBv0x0R/aPR01aQFcWKW1L2PlyzKaHRZ2pRpX9AlfWphmKE9vCDvdeZ6bm3jGxUJj
 kLRA==
Subject: Re: [PATCH] cpu: Fix numbers in Performance of Mechanisms table in
 qqz
References: <9b971ea3-e84c-b4e1-e75b-7c545b24f7e3@gmail.com>
 <20160615235138.GG3923@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <aa44a017-bd59-6961-b968-d40eadd81579@gmail.com>
Date: Sat, 18 Jun 2016 11:48:37 +0900
MIME-Version: 1.0
In-Reply-To: <20160615235138.GG3923@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/06/15 16:51:38 -0700, Paul E. McKenney wrote:
> On Sat, Jun 11, 2016 at 03:39:31PM +0900, Akira Yokosawa wrote:
>> >From 1ff97081c713ff51d5bc2e15f8ba7649427fac4f Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Sat, 11 Jun 2016 15:28:20 +0900
>> Subject: [PATCH] cpu: Fix numbers in Performance of Mechanisms table in qqz
>>
>> Numbers given in 'Comms Fabric' and 'Global Comms' rows in
>> Table D.1 seem wrong.
>>
>> Their costs are given in ns unit, so they should match those given
>> in Table 3.1.
>>
>> Also, their ratio should be calculated by cost(ns)/0.36(ns).
>>
>> This commit fixes those numbers.
> 
> Great catch, but let's talk about the fix.
> 
> The 130ms is the time required for light to circumnavigate the earth
> in a vacuum.  The 195ms is that for light to circumnavigate the earth
> in glass, as in an optical fiber.  There is some variation due to
> different refractive indexes of different types of fiber.
> 
> So making both of those entries be 195,000,000 seems like the right
> approach.  An even better approach would be to use the ping time to
> some system on the other side of the world, but I am coming up empty.
> Pinging google.com gets me 216.58.217.46 for about 47ms.  If you are
> far away from West Coast USA, please see what you get.  Not that I
> would put it past Google to spread a single IP address worldwide to
> defeat this, but worth a try...
> 
> On the Comms Fabric number, I suspect that I just googled this at
> two different times and got two different numbers.  Not surprising,
> as different products would be optimized differently at different
> times.
> 
> So how about https://en.wikipedia.org/wiki/InfiniBand?  Choose the
> value in effect when Nehalem was released for the QQ table, and choose
> the value in effect when the AMD Opteron 844 was released for the
> table in Chapter 3.
> 
> Seem reasonable?
> 
> Oh, and also add a Latex comment saying where the data came from!  ;-)

Hi,

I took some time collecting latency data, and composed v2 of the
patch. Will send it in reply to this mail.

                                              Thanks, Akira

> 
> 							Thanx, Paul
> 
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> ---
>>  cpu/overheads.tex | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/cpu/overheads.tex b/cpu/overheads.tex
>> index 311c43e..0cf83f3 100644
>> --- a/cpu/overheads.tex
>> +++ b/cpu/overheads.tex
>> @@ -224,11 +224,11 @@ global agreement.
>>  	\hline
>>  	CAS cache miss		&          95.9	&         266.4 \\
>>  	\hline
>> -	Comms Fabric		&       4,500\textcolor{white}{.0}
>> -						&	7,500\textcolor{white}{.0} \\
>> +	Comms Fabric		&       3,000\textcolor{white}{.0}
>> +						&	8,330\textcolor{white}{.0} \\
>>  	\hline
>> -	Global Comms		& 195,000,000\textcolor{white}{.0}
>> -						& 324,000,000\textcolor{white}{.0} \\
>> +	Global Comms		& 130,000,000\textcolor{white}{.0}
>> +						& 361,000,000\textcolor{white}{.0} \\
>>  \end{tabular}
>>  \caption{Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System}
>>  \label{tab:cpu:Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System}
>> -- 
>> 1.9.1
>>
> 
> 

