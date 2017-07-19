Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=23Ga+dmIwBsf/Y06atLoAt5VAbBXRrlwpv5525NNsto=;
 b=DVJKiRrRwVsUA/lvIYlZW6Ty4h5RHqNavf0zeswi9gMYnN7VRoNaS3qwFQAvkx8XKh
 cULG3AJfdfZXg9xOES1Se+cA9/IZl9BfYCG8ZWghDoDVti/DTAg7B3GVpA/POegh2eKa
 1ILURK7XyJDAomVkGbD0NygUOaopCKxii56yr1D/YEjqtEJGT2MutqxzA0o+pR2Wpj7Q
 rueJLUadNONsc2UxKeNozJe0REwB1Fk6v6D2KNLitXcg/0pFDCAGs7YSrOzlDwjhguKM
 MLBGS+dJIYg+t/3YK6OEa8YWmKn11UVsXQ7Je1oKauGwWuMwj1PGgy4lwc62r1kcBomn
 SW0g==
Subject: Re: [PATCH] advsync: Fix control-dependency no-transitivity example
References: <165340ca-3acd-a8be-43ad-ccf64582aa21@gmail.com>
 <20170719173026.GF3730@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b077dd7c-322f-23e7-dfd5-f0c316c63c94@gmail.com>
Date: Thu, 20 Jul 2017 06:53:10 +0900
MIME-Version: 1.0
In-Reply-To: <20170719173026.GF3730@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/07/20 2:30, Paul E. McKenney wrote:
> On Fri, Jul 14, 2017 at 11:34:45PM +0900, Akira Yokosawa wrote:
>> >From 8740c546fbb6988c2fcf4a88c4314df972d0b9b7 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Fri, 14 Jul 2017 22:48:37 +0900
>> Subject: [PATCH] advsync: Fix control-dependency no-transitivity example
>>
>> The corresponding assert condition in memory-barriers.txt was
>> fixed in commit 5646f7acc95f ("memory-barriers: Fix control-
>> ordering no-transitivity example") of Linux kernel repository.
>> Somehow it was imported to perfbook in a wrong form and has
>> survived since.
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> And I did take this, thank you very much, and please accept my apologies
> for the delay.
> 
> If I understand correctly, I should leave your second patch alone.

For the moment, yes!

But as I said in the other thread, I'm beginning to think of
rewriting these examples in pseudo-asm form.

          Thanks, Akira

> If I am confused, please let me know!
> 
> 							Thanx, Paul
> 
>> ---
>>  advsync/memorybarriers.tex | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
>> index c9c975c..25a90b2 100644
>> --- a/advsync/memorybarriers.tex
>> +++ b/advsync/memorybarriers.tex
>> @@ -3036,9 +3036,9 @@ not), then adding the following CPU would guarantee a related assertion:
>>  \begin{tabular}{l}
>>  	\nf{CPU 2} \\
>>  	\hline
>> -	\tco{WRITE_ONCE(y, 1);} \\
>> +	\tco{WRITE_ONCE(x, 2);} \\
>>  	\multicolumn{1}{l}{~} \\
>> -	\multicolumn{1}{l}{\tco{assert(!(r1 == 1 && r2 == 1 && x == 1));}} \\
>> +	\multicolumn{1}{l}{\tco{assert(!(r1 == 2 && r2 == 1 && x == 2));}} \\
>>  \end{tabular}
>>  \end{minipage}
>>  \vspace{5pt}
>> -- 
>> 2.7.4
>>
> 
> 

