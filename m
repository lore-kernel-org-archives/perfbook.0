Return-Path: <SRS0=2IHd=SG=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Ty8JLVzh0LAkiO+z55olNrpLMxGS9lavHH4gBuCtPtg=;
        b=Y8DHr0BX0qVwt6d5+PCuWIxGfm3tEGLFcd6lENshohms0jhVOqsd4m5fpDxXhxd+hr
         +QgtD3mMl34TPTIHhS0T2dXY+hlXPIuDVzELTMdFvYcDSzGwtecwFRJFf8/wN1XZbA03
         Z3NDkKG+nOe5M09VJL3KQqMY/wY7UrIexN4BwXjQutF+UZeQ5C8JHSmSfD3vgs6JnLFB
         G47Pl0D9depp0ZyEpEcPmptzMg/NnjWvi6unOZIwYexn2dvjjX5NYgYuqdDObCs3/qIS
         vFW5AZ4AUldb7j1X2nN2OVHVN2Td2SstJ7mppefkHUY/4fZ8SvDuTBhpBVs3nXQeaAMg
         /b9A==
Message-ID: <91e8134b-363c-2d82-fe38-2e593355c867@gmail.com>
Date: Sat, 22 Jan 2022 09:54:06 +0900
MIME-Version: 1.0
Subject: Re: [NOT A PATCH -perfbook] index of 'Non-Blocking' in Glossary
Content-Language: en-US
References: <c4add712-74a7-cb57-77c8-6ee8d9b529a4@gmail.com>
 <20220122001258.GB947480@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20220122001258.GB947480@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Fri, 21 Jan 2022 16:12:58 -0800, Paul E. McKenney wrote:
> On Fri, Jan 21, 2022 at 09:29:24AM +0900, Akira Yokosawa wrote:
>> Not-signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> ---
>> Hi Paul,
>>
>> This is a reminder in sent as a patch.
>>
>> I find the indexing tag you put to "Non-Blocking" looks strange.
>> This entry talks about some classes of forward-progress guarantees,
>> not much about synchronization.
>> Also, the existing tags of NBS are \IXacr{}.  You therefore
>> need to use \glsuseriii{nbs} as shown below in a separate entry
>> of "Non-Blocking Synchronization (NBS)".
>>
>> I think NBS deserves its own entry in the Glossary.
>>
>>         Thanks, Akira
>>
>> --
>>  glossary.tex | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/glossary.tex b/glossary.tex
>> index 86d9a025..4ea87f60 100644
>> --- a/glossary.tex
>> +++ b/glossary.tex
>> @@ -425,7 +425,7 @@
>>  	These are used for hardware-specific purposes such as profiling.
>>  	The advantage of using NMIs for profiling is that it allows you
>>  	to profile code that runs with interrupts disabled.
>> -\item[\IXGaltr{Non-Blocking}{Non-blocking synchronization (NBS)}:]
>> +\item[\IXG{Non-Blocking}:]
>>  	A group of academic forward-progress guarantees that includes
>>  	bounded population-oblivious wait free,
>>  	bounded wait free,
>> @@ -437,6 +437,8 @@
>>  	deadlock free.
>>  	See \cref{sec:advsync:Non-Blocking Synchronization}
>>  	for more information.
>> +\item[Non-Blocking Synchronization (NBS):]\glsuseriii{nbs}
>> +	%@@@ Need expansion @@@
>>  \item[NUCA:]\glsuseriii{nuca}
>>  	Non-uniform cache architecture, where groups of CPUs share
>>  	caches and/or store buffers.
> 
> Good points!
> 
> How about like this?

Looks good to me!

        Thanks, Akira

> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> commit a8152ff934df7cfaccb8bdc1fa376c5d11737995
> Author: Paul E. McKenney <paulmck@kernel.org>
> Date:   Fri Jan 21 16:11:09 2022 -0800
> 
>     glossary: Update non-blocking and add NBS
>     
>     Took index-addition commands from Akira's email dated January 20.
>     
>     Suggested-by: Akira Yokosawa <akiyks@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> 
> diff --git a/glossary.tex b/glossary.tex
> index 86d9a025..1d4a2404 100644
> --- a/glossary.tex
> +++ b/glossary.tex
> @@ -425,7 +425,7 @@
>  	These are used for hardware-specific purposes such as profiling.
>  	The advantage of using NMIs for profiling is that it allows you
>  	to profile code that runs with interrupts disabled.
> -\item[\IXGaltr{Non-Blocking}{Non-blocking synchronization (NBS)}:]
> +\item[\IXG{Non-Blocking}:]
>  	A group of academic forward-progress guarantees that includes
>  	bounded population-oblivious wait free,
>  	bounded wait free,
> @@ -437,6 +437,13 @@
>  	deadlock free.
>  	See \cref{sec:advsync:Non-Blocking Synchronization}
>  	for more information.
> +\item[Non-Blocking Synchronization (NBS):]\glsuseriii{nbs}
> +	The use of algorithms, mechanisms, or techniques that provide
> +	non-blocking forward-progress guarantees.
> +	NBS is often used in a more restrictive sense of providing one
> +	of the stronger forward-progress guarantee, usually wait free or
> +	lock free, but sometimes also obstruction free.
> +	(See ``Non-blocking''.)
>  \item[NUCA:]\glsuseriii{nuca}
>  	Non-uniform cache architecture, where groups of CPUs share
>  	caches and/or store buffers.
