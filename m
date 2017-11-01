Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/bax6lyuNh3ofhaK1qPWCsBJFGF2bV6htJ3Bi+cCCag=;
 b=GuP65bh9s3izZDmp0TjAAjw7ls2pqy4HdyewjiZi38y5hAQ4e8Pha0XF/R0sSzAnWG
 a4PKKmzoVSEX/7nYMxoxquqGUfxkv9/tlZPNJfviCooZ/lS3op0C6VaaSvi8W25QUClt
 bDW+ty+hgekeE1QIf2BBUHf6lMlD8JKly6tlWySnfxQuU2u4oRjIpqzgEmUyYuz/fS+B
 gNkS2+TbjHs1MUO8fgxK2DB+Rrs5ykj2FvV+tszVjTe/byG1vaZOpGSKrUuOqaRV+FBv
 v/ejELpScQ3a52tq7bLxdoJinHQE63vKpG1ZZY51jiXr6LIKjWm6j/LS+VHTB7v9vm2C
 VzgA==
Subject: Re: [PATCH] memorder: Adjust height of Table 15.5's header
References: <0337637d-91f3-df97-7dd0-2f7b66676145@gmail.com>
 <20171101145145.GR3659@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <92faef57-7568-92b5-bc8d-a23c2836f472@gmail.com>
Date: Thu, 2 Nov 2017 00:10:17 +0900
MIME-Version: 1.0
In-Reply-To: <20171101145145.GR3659@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/11/01 07:51:45 -0700, Paul E. McKenney wrote:
> On Wed, Nov 01, 2017 at 11:27:10PM +0900, Akira Yokosawa wrote:
>> >From a7e4a7ee67e980055dbef5808b89335fc0eba483 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Wed, 1 Nov 2017 23:14:44 +0900
>> Subject: [PATCH] memorder: Adjust height of Table 15.5's header
>>
>> While we are here, for the ease of maintenance of the table,
>> define a helper macro "\cpufml{}" to be used in the header.
>>
>> Also adjust hspace for 1c layout and comment out a paragraph
>> which is pointless for the moment.
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> Good catch on the stray paragraph, and \cpufml{} does make things much
> nicer, thank you!!!  Queued and pushed.
> 
> There is another tables that could use this trick in locking/locking.tex.
> I believe that the definitions should be local to each table because
> the heights differ, and which quite oddly seem to need to be hard-coded.
I see. I'll take care of it tomorrow.

Akira

> 
> 							Thanx, Paul
> 
>> ---
>>  memorder/memorder.tex | 45 ++++++++++++++-------------------------------
>>  1 file changed, 14 insertions(+), 31 deletions(-)
>>
>> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
>> index db5e065..b7d20f0 100644
>> --- a/memorder/memorder.tex
>> +++ b/memorder/memorder.tex
>> @@ -3980,39 +3980,22 @@ dependencies.
>>  \rowcolors{4}{}{lightgray}
>>  \small
>>  \centering
>> -\renewcommand*{\arraystretch}{1.2}\OneColumnHSpace{-.6in}
>> +\newcommand{\cpufml}[1]{\begin{picture}(6,50)(0,0)\rotatebox{90}{#1}\end{picture}}
>> +\renewcommand*{\arraystretch}{1.2}\OneColumnHSpace{-.35in}
>>  \begin{tabular}{llccccccccc}
>>  	\toprule
>>  	\multicolumn{2}{l}{~} & \multicolumn{9}{c}{CPU Family} \\
>>  	\cmidrule{3-11}
>>  	\multicolumn{2}{c}{\raisebox{.5ex}{Property}}
>> -	& \begin{picture}(6,60)(0,0)
>> -		\rotatebox{90}{Alpha}
>> -	  \end{picture}
>> -	& \begin{picture}(6,60)(0,0)
>> -		\rotatebox{90}{ARMv8}
>> -	  \end{picture}
>> -	& \begin{picture}(6,60)(0,0)
>> -		\rotatebox{90}{ARMv7-A/R}
>> -	  \end{picture}
>> -	& \begin{picture}(6,60)(0,0)
>> -		\rotatebox{90}{Itanium}
>> -	  \end{picture}
>> -	& \begin{picture}(6,60)(0,0)
>> -		\rotatebox{90}{MIPS}
>> -	  \end{picture}
>> -	& \begin{picture}(6,60)(0,0)
>> -		\rotatebox{90}{\Power{}}
>> -	  \end{picture}
>> -	& \begin{picture}(6,60)(0,0)
>> -		\rotatebox{90}{SPARC TSO}
>> -	  \end{picture}
>> -	& \begin{picture}(6,60)(0,0)
>> -		\rotatebox{90}{x86}
>> -	  \end{picture}
>> -	& \begin{picture}(6,60)(0,0)
>> -		\rotatebox{90}{z~Systems}
>> -	  \end{picture}
>> +	& \cpufml{Alpha}
>> +	& \cpufml{ARMv8}
>> +	& \cpufml{ARMv7-A/R}
>> +	& \cpufml{Itanium}
>> +	& \cpufml{MIPS}
>> +	& \cpufml{\Power{}}
>> +	& \cpufml{SPARC TSO}
>> +	& \cpufml{x86}
>> +	& \cpufml{z~Systems}
>>  	\\
>>  	\cmidrule(r){1-2} \cmidrule{3-11}
>>  %		 Alpha ARMv8 ARMv7 Itanium MIPS PPC SPARC x86 z Systems
>> @@ -4070,7 +4053,7 @@ dependencies.
>>  	~ & ~ & C: & Compare-and-exchange instruction \\
>>  	~ & ~ & L: & Load-linked/store-conditional instruction \\
>>  \end{tabular}
>> -}\OneColumnHSpace{-0.7in}
>> +}\OneColumnHSpace{-0.4in}
>>  \caption{Summary of Memory Ordering}
>>  \label{tab:memorder:Summary of Memory Ordering}
>>  \end{table*}
>> @@ -4132,8 +4115,8 @@ instruction cache and pipeline.
>>  Such CPUs require special instructions be executed for self-modifying
>>  code.
>>
>> -Parenthesized CPU names indicate modes that are architecturally allowed,
>> -but rarely used in practice.
>> +%Parenthesized CPU names indicate modes that are architecturally allowed,
>> +%but rarely used in practice.
>>
>>  The common ``just say no'' approach to memory-ordering operations
>>  can be eminently reasonable where it applies,
>> -- 
>> 2.7.4
>>
> 
> 

