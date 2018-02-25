Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ct3JF9wF+gtRqKw05+3F/Kavv9CtR90gA1oKLvXpFlg=;
 b=pGy7xsnqzexDXrJKjpaAboEV4ViBdW5phUiTvtVqn6EuJDYtCqqxrAWiLX3wT7kKQX
 xTT6lNOgzFp2RCg3cUO7vu6SYWfnW7gRTvl99XWbGEWg2yrrubxPbEzvEOwGElHvqEUp
 x8jTODU6aRPMNDnnsRI9PCZvKj36pzqCx7OhnUUdTXrWB/cadZ5FzK+dBIJoi0tR3m4z
 fmiaR1AcDfa9Y4Z9RBsUf6PaWpPWnUDT+hQZtL9v3dYurPDzsXNp9h82XXq8P4ZIisjZ
 5f97nTOBvyAEaqObqIgIUf1XlE2Da7SyjuQF4x6y1+iNOHSy2xrc3sfrGldQthXcrGT+
 /Kgg==
Subject: Re: [PATCH] future/QC: Remove 'Readout' in header of 'entanglement
 error rate' row
References: <1e4f8413-f968-9d37-6322-8057bfe97bb7@gmail.com>
 <20180225182303.GE2855@linux.vnet.ibm.com>
 <b8083f74-2290-0280-de67-cdcd69083502@gmail.com>
 <20180225230118.GH2855@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <ed8bd1eb-380d-ef3f-30dd-ab84abe0fbdf@gmail.com>
Date: Mon, 26 Feb 2018 08:22:06 +0900
MIME-Version: 1.0
In-Reply-To: <20180225230118.GH2855@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/02/25 15:01:18 -0800, Paul E. McKenney wrote:
> On Mon, Feb 26, 2018 at 07:30:08AM +0900, Akira Yokosawa wrote:
>> >From 4d1964b2296525414181b8e9b8fc7a77297fa838 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Mon, 26 Feb 2018 07:10:27 +0900
>> Subject: [PATCH] future/QC: Remove 'Readout' in header of 'entanglement error rate' row
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> ---
>> Paul,
>>
>> Looking at the retouched table once again, I find
>> "readout of entanglement gate" doesn't make sense. The "Readout"
>> in the header should be removed, shouldn't it?
> 
> It is quite confusing, now that you mention it!
> 
> I took a slightly different approach with your Reported-by, so please
> take a look and tell me what you think.  I considered adding a few
> qubit operators to the "Qubit Operator" heading like I did for "Qubit
> Entanglement", but wasn't sure whether this would help.  Thoughts?

Looks good.

I'll take care of horizontal space adjustment of the table for 1c layout later,
if it is ever required.

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>>         Thanks, Akra
>> --
>>  future/QC.tex | 14 +++++++-------
>>  1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/future/QC.tex b/future/QC.tex
>> index 1afae2c..a5b1758 100644
>> --- a/future/QC.tex
>> +++ b/future/QC.tex
>> @@ -677,26 +677,26 @@ $10^{-4}$).
>>  }
>>
>>  \subfloat[Multi-Qubit Gate Properties (Entanglement)]{
>> -\begin{tabular}{@{}ll*{6}{S[table-format=2.2]}@{}}
>> +\begin{tabular}{@{}l*{6}{S[table-format=2.2]}@{}}
>>  	\toprule
>> -	& & \multicolumn{6}{c}{Entanglement Connection} \\
>> -	\cmidrule{3-8}
>> -	\multicolumn{2}{c}{Gate Property} &
>> +	 & \multicolumn{6}{c}{Entanglement Connection} \\
>> +	\cmidrule{2-7}
>> +	Gate Property &
>>  		\multicolumn{1}{c}{CX0\_1} &
>>  			\multicolumn{1}{c}{CX1\_2} &
>>  				\multicolumn{1}{c}{CX0\_2} &
>>  					\multicolumn{1}{c}{CX3\_2} &
>>  						\multicolumn{1}{c}{CX4\_2} &
>>  							\multicolumn{1}{c@{}}{CX3\_4} \\
>> -	\cmidrule(r){1-2} \cmidrule{3-8}
>> -	Readout & Error Rate (\%) &
>> +	\cmidrule(r){1-1} \cmidrule{2-7}
>> +	Error Rate (\%) &
>>  		 3.46 &
>>  			 4.07 &
>>  				 3.26 &
>>  					 2.76 &
>>  						 2.23 &
>>  							 2.66 \\
>> -	& Fidelity (\%) &
>> +	Fidelity (\%) &
>>  		 96.54 &
>>  			95.93 &
>>  				96.74 &
>> -- 
>> 2.7.4
>>
>>
> 

