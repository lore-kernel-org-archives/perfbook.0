Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9DNPG7M5iomjX1yjZ1TPQt695YBrHOWE4DOJQs8DPmI=;
 b=vJHyouka/drE64XMJVy4T5/pE/4UcimgDcMjuULqHdi8qw/DNLCXBf7oGGO3H5QOCM
 4LhA3ssLoaCT1ETrXwP1843hdovEXrIDI1FjHXpmLvJwZMq+lCEQdNpf1HXhk7xyECQ5
 mYXJ4kL3dO8xorDl0v9E/uKEM8SeZpZmivdsRM/HnSw4kwrD2KcLlItWTOa9vavZC5Ud
 rXmax/7iNEICWcf5Qd8OWLQ4Y8RtSMl3t4gHrRju9oA+nc+5sY7cekPzKlOpFMkznOuF
 QZ/JEmoqasoXLAby0QLvtFMTJH71iSmHPho94t/3yoGXj68rgSEXuDP71VqgM4wJqfSP
 W84w==
Subject: Re: [PATCH 0/5] Update table layout
References: <6f0085b1-ca8e-d6f7-e613-1b1c8d119af6@gmail.com>
 <20171023022430.GJ3659@linux.vnet.ibm.com>
 <67030f8b-7adc-602b-9d45-a619be702bf7@gmail.com>
 <20171023174955.GO3659@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e21a5aaa-23a8-16a9-ad10-aa08188465b6@gmail.com>
Date: Tue, 24 Oct 2017 22:50:44 +0900
MIME-Version: 1.0
In-Reply-To: <20171023174955.GO3659@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/10/23 10:49:56 -0700, Paul E. McKenney wrote:
> On Tue, Oct 24, 2017 at 12:25:20AM +0900, Akira Yokosawa wrote:
>> On 2017/10/22 19:24:30 -0700, Paul E. McKenney wrote:
>>> On Mon, Oct 23, 2017 at 12:20:14AM +0900, Akira Yokosawa wrote:
>>>> >From d224db4bfed5d4ce0639062a920bafc6f9442e16 Mon Sep 17 00:00:00 2001
>>>> From: Akira Yokosawa <akiyks@gmail.com>
>>>> Date: Sun, 22 Oct 2017 23:55:49 +0900
>>>> Subject: [PATCH 0/5] Update table layout
>>>>
>>>> Hi Paul,
>>>>
>>>> My first idea was to add a make target for "table captions at the top".
>>>> But I changed my mind and promoted the layout as default.
>>>> Instead, I added a target "perfbook-tcb.pdf" (tcb: Table Caption Bottom),
>>>> which keeps the caption at the bottom.
>>>>
>>>> Patch #1 does the change in perfbook.tex and Makefile.
>>>>
>>>> Patches #2 and #3 are minor fixes I noticed while updating tables.
>>>>
>>>> Patch #4 updates most tables to use the new table layout experimented in
>>>> Style Guide for a while.  It contains changes to use "S" column specifier
>>>> provided by the "siunitx" package.
>>>>
>>>> Patch #5 converts a table into a figure drawn by tabular.
>>>>
>>>> There remains several tables not yet touched. They are complex and large
>>>> ones. They need extra work to use the new scheme.
>>>>
>>>> NOTE: Table 13.1 does not contain legends and does not use subscripts
>>>> as shown in Table D.5 at the moment. In the text, it looks OK to me.
>>>>
>>>> Thoughts?
>>>
>>> At a first scan, this all looks good.  There are a few remaining
>>> tables in the old format, including a couple that we discussed earlier
>>> as being quite complex.  Which should be fine, for the time being,
>>> at least.  But what are your thoughts on the remaining old-style tables?
>>
>> Tables 17.1 and 17.2 are hard ones. Alternate-row coloring scheme can not
>> be applied for them. We need to figure out how to improve them. I'm fine with
>> them to be left for the moment.
> 
> Works for me as well!
> 
>> Table 7.1 does not fit to the format because of the "Null (Not Held)" column.
>> As all the cells of the column are all blank, vertical rules actually helps
>> in this table. If you put some character/symbol to indicate compatibility,
>> it can be converted to the new format. If you have a good candidate, please
>> let me know.
> 
> Hmmm...  Is there a very light grey variant of the square that appears
> at the end of each quick quiz?  "\rule{7pt}{7pt}}", if I am not getting
> too confused.  Ah, there is.  Please see the crude experimental patch
> below.  (As in if you do choose to do something like this, please make
> a more sensible/maintainable version.)

So, I've just submitted a patch to do the format conversion.
I'm not sure "\x" is the right name to use, but one character is convenient
in this table.  In this case, coloring alternate rows is not necessary.

The following patch is to keep position of table captions consistent.

Ah, there is another reminder for you.
You need to mention the moved "advsync/rt" section in the outline of advsync
chapter, don't you?  Honestly speaking, it is not obvious at first glance
how it relates to weaker synchronization.

A good introduction should help readers.

       Thanks, Akira 

> 
>> I'm sending patches to update Tables 9.3 and C.1, and a patch to convert
>> Tables C.2, C.3, and C.4 into Listings.
>>
>> If there is any table I'm missing, feel free to tell me.
> 
> I will try them out, thank you!
> 
> 							Thanx, Paul
> ------------------------------------------------------------------------
> 
> diff --git a/locking/locking.tex b/locking/locking.tex
> index 9cb01761cafb..08de61650ae5 100644
> --- a/locking/locking.tex
> +++ b/locking/locking.tex
> @@ -1311,6 +1311,8 @@ or even milliseconds.
>  \subsection{Beyond Reader-Writer Locks}
>  \label{sec:locking:Beyond Reader-Writer Locks}
>  
> +\newcommand{\x}{\textcolor{gray!20}{\rule{7pt}{7pt}}}
> +
>  \begin{table}
>  \small
>  \centering
> @@ -1336,19 +1338,19 @@ or even milliseconds.
>  	  \end{picture}
>  	\\
>  	\hline
> -%				 NL  CR  CW  PR    PW  EX
> +%				  NL   CR   CW     PR   PW   EX
>  	\hline
> -	Null (Not Held)		& ~ & ~ & ~   & ~ & ~ & ~ \\
> +	Null (Not Held)		& \x & \x & \x   & \x & \x & \x \\
>  	\hline
> -	Concurrent Read		& ~ & ~ & ~   & ~ & ~ & X \\
> +	Concurrent Read		& \x & \x & \x   & \x & \x &  X \\
>  	\hline
> -	Concurrent Write	& ~ & ~ & ~   & X & X & X \\
> +	Concurrent Write	& \x & \x & \x   &  X &  X &  X \\
>  	\hline
> -	Protected Read		& ~ & ~ & X   & ~ & X & X \\
> +	Protected Read		& \x & \x &  X   & \x &  X &  X \\
>  	\hline
> -	Protected Write		& ~ & ~ & X   & X & X & X \\
> +	Protected Write		& \x & \x &  X   &  X &  X &  X \\
>  	\hline
> -	Exclusive		& ~ & X & X   & X & X & X \\
> +	Exclusive		& \x &  X &  X   &  X &  X &  X \\
>  \end{tabular}
>  \caption{VAX/VMS Distributed Lock Manager Policy}
>  \label{tab:locking:VAX/VMS Distributed Lock Manager Policy}
> 
> 

