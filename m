Return-Path: <SRS0=q6G5=Q2=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kkQH0wwIq1JkL/riTD52GP8mbdT5lmeVaeuZiANY/8Q=;
        b=CjaFaExdBYMbmbYgRbT9yQapC+pyvyUd4rTUe6pzSwqQLN7no5t4glehx+a7wikiwW
         aEwOIbWsJ5evIR/IRQcev5lfaJlYtabI6xiWC3766P/Oya+UI1OXL3521Gl7e4A85+Jo
         7gTOnQ1gSK1WZA3Vmb54WEAwumt3KUKreu23xAzleyKuqZja7Vcy0o/HSI/HRhWDBezu
         xf1OFVj8hx3RbRx5qvyhJw8IDj2ZKsQ4zoYyIDKztGUNac4qCZb/Xn2tZRmPz7Uqbt6e
         cZhjLb3zIUsnXbh9CCEhU7r6GNbSDFpG6XzO+Mfjyh5f2iNqbcPs8QhGDKc+9EEOR07c
         2+bA==
Subject: Re: [PATCH -perfbook 0/4] Address potential widowing of headings
References: <4350078f-4054-cb28-157b-305d6df087ea@gmail.com>
 <20211208195547.GY641268@paulmck-ThinkPad-P17-Gen-1>
 <fe2d7604-8263-357b-a3c7-0ff59038e67a@gmail.com>
 <20211208235858.GA641268@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7ab89db4-75eb-8e40-7601-a302cf1865d3@gmail.com>
Date: Thu, 9 Dec 2021 09:03:50 +0900
MIME-Version: 1.0
In-Reply-To: <20211208235858.GA641268@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Wed, 8 Dec 2021 15:58:58 -0800, Paul E. McKenney wrote:
> On Thu, Dec 09, 2021 at 07:20:20AM +0900, Akira Yokosawa wrote:
[...]
>> So the diff below looks somewhat out of context, because the Quiz
>> part of QQ A.2 is "How could there be such a large gap between
>> successive consumer reads?".
>>
>> ----
>> @@ -175,7 +175,7 @@ seq    & \multicolumn{1}{c}{time (seconds)} & delta~  &  a &  b &  c \\
>>         consumer reads?
>>         See \path{timelocked.c} for full code.
>>  }\QuickQuizAnswer{
>> -       Here are possible scenarios:
>> +       Here are a few of the errors:
>>  
>>         \begin{enumerate}
>>         \item   The consumer might be preempted for long time periods.
>> ----
>>
>> Thoughts?
> 
> I changed this to "Here are a few reasons for such gaps:".  Does
> that work for you?

Works for me!

        Thanks, Akira

> 
> 						Thanx, Paul
> 
>>         Thanks, Akira
[...]
