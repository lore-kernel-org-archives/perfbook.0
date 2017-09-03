Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3+Qy2ETzZWHnZt7dXrjcQVEN9msbRGuWKJ9hYH9x5gw=;
 b=CW3F1mwfgWpWfGe9I0QKFI2vTT4bE+klsQd26dkx/wDX+zrqlPiiNPa2pFvXuuAcHS
 lreqwypdvctOcAueE/gbk/PjEPzN65ID24v5X/SPOTk0YX82oIFzxotrA/8oqDiOhZuA
 /LQ8SM3+fc4w23LyhiIwwFwFlF9/sp8uNZLhTouvVFzmyGv+kk2HBg1FH147yRnGlXDS
 H/CHeQJweg7OQVRtm4QsOVLXL2IC0Uk7mJ8l3LBUV+4vzFDyO2lvNz8cQeRtOXL7+FIT
 7Rmk1mvJ8Lpf/ndmrCrZd9Xp8hlDUyN82Ak3pWljErXlSpjoaNKocwFWtbQpJ5+diPsz
 AsVg==
Subject: Re: Other-multicopy atomicity
References: <a5f7959b-cfe3-9bc3-3f65-7b1f9577ad99@gmail.com>
 <20170903005744.GK19872@linux.vnet.ibm.com>
 <182931cd-d656-217d-c72d-c3599ec3d32f@gmail.com>
 <20170903030618.GC15437@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <158a146b-c63c-a260-af75-493e721fb3c0@gmail.com>
Date: Sun, 3 Sep 2017 14:40:56 +0900
MIME-Version: 1.0
In-Reply-To: <20170903030618.GC15437@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/09/02 20:06:18 -0700, Paul E. McKenney wrote:
> On Sun, Sep 03, 2017 at 11:02:55AM +0900, Akira Yokosawa wrote:
>> On 2017/09/02 17:57:44 -0700, Paul E. McKenney wrote:
>>> On Sat, Sep 02, 2017 at 01:09:37PM +0900, Akira Yokosawa wrote:
>>>> Hi Paul,
>>>>
>>>> I have a comment on the term "other-multicompy atomicity".
>>>>
>>>> It took a while for me to realize that the "other-" stands for "other than self CPU".
>>>> At first, it sounded like "other type of multicompy atomicity", which looked
>>>> quite vague.
>>>>
>>>> Commit 43236beadb1 ("memorder: Expand on cumulativity and {other,} multicopy
>>>> atomicity") helped me to realize your intention. May I suggest to add a footnote
>>>> on the use of "other-"?
>>>
>>> I am trying to do a bit too much with that paragraph, aren't I?
>>>
>>> How about the patch below?
>>
>> Please see the comments below.
>>
>>>
>>>> Also, you failed to replace tabs to white spaces in listing added in the
>>>> above mentioned commit.
>>>
>>> Good eyes, fixed!  (Not yet pushed, will get there.)
>>>
>>> 							Thanx, Paul
>>>
>>> ------------------------------------------------------------------------
>>>
>>> commit 87b29716cee78c5505039ba933c2f991ed3b1dec
>>> Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>>> Date:   Sat Sep 2 17:48:39 2017 -0700
>>>
>>>     memorder: Clarify other-multicopy atomicity
>>>     
>>>     Reported-by: Akira Yokosawa <akiyks@gmail.com>
>>>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>>>
>>> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
>>> index 62544ae8ed52..90e2b5e2f294 100644
>>> --- a/memorder/memorder.tex
>>> +++ b/memorder/memorder.tex
>>> @@ -1703,32 +1703,32 @@ and other counterintuitive behavior, as discussed in the next section.
>>>  
>>>  Threads running on a \emph{multicopy atomic}~\cite{Stone:1995:SP:623262.623912}
>>>  platform are guaranteed
>>> -to agree on the order of writes, even to different variables.
>>> +to agree on the order of stores, even to different variables.
>>>  A useful mental model of such a system is the single-bus architecture
>>>  shown in
>>>  Figure~\ref{fig:memorder:Global System Bus And Multi-Copy Atomicity}.
>>> -If each write resulted in a message on the bus, and if the bus could
>>> -accommodate only one write at a time, then any pair of CPUs would
>>> -agree on the order of all writes that they observed.
>>> +If each store resulted in a message on the bus, and if the bus could
>>> +accommodate only one store at a time, then any pair of CPUs would
>>> +agree on the order of all stores that they observed.
>>>  Unfortunately, building a computer system as shown in the figure,
>>>  without store buffers or even caches, would result in glacial computation.
>>> -CPU vendors have therefore taken one of three approaches:
>>> -(1)~Provide store buffers, caches, and the rest and abandon
>>> -multicopy atomicity (weakly ordered platforms),
>>> -(2)~Provide all those hardware optimizations, and invest many transistors
>>> -into preserving multicopy atomicity (TSO platforms), or
>>> -(3)~Define a slightly weaker \emph{other-multicopy atomicity} that allows
>>> -a given CPU's stores to become visible to that CPU before they become visible
>>> -to other CPUs, but in which each of those stores becomes visible to all
>>> -the other CPUs simultaneously~\cite{ARMv8A:2017}.
>>> -Perhaps there will come a day when all platforms provide some flavor
>>> -of multi-copy atomicity, but
>>> -in the meantime, non-multicopy-atomic platforms do exist, and so software
>>> -does need to deal with them.
>>> +CPU vendors interested in providing multicopy atomicity have therefore
>>> +instead provided the slightly weaker
>>> +\emph{other-multicopy atomicity}~\cite{ARMv8A:2017},
>>
>> On the ARMv8 multicopy atomicity, I found a paper "Simplifying ARM Concurrency:
>> Multicopy-atomic Axiomatic and Operational Models for ARMv8" at
>> https://urldefense.proofpoint.com/v2/url?u=http-3A__www.cl.cam.ac.uk_-7Epes20_armv8-2Dmca_armv8-2Dmca-2Ddraft.pdf&d=DwICaQ&c=jf_iaSHvJObTbx-siA1ZOg&r=ux41CW3B5BSVxDMRNRWyLbUmPebZc70Kq4AkfdiRGMI&m=1JFkyKvDbZmHr-CRbzC5HuCgZZCSnpvTioqYoFTfMog&s=BdlEGULkAzO_ibDzx4a3IT6_-zC815dPjOwJa9qPLLo&e=  (Draft, July 12, 2017)
>> by Christopher Pulte, et.al. It is a draft, but could also be cited here.
>> As you know, "ARM ARM" is quite a large document. If you specified where to look
>> in the manual, it would be even better.
> 
> Section B2.3, which I have now included in the citation.  Please see
> below for updated patch.

Looks good!

     Thanks, Akira

> 
>>> +which excludes the CPU doing a given store from the requirement that all
>>> +CPUs agree on the order of all stores.
>>> +This means that if only a subset of CPUs are doing stores, the
>>> +other CPUs will agree on the order of stores, hence the ``other''
>>> +in ``other-multicopy atomicity''.
>>
>> Yes, now the meaning of "other-" is clear enough.
> 
> Glad it helped!
> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> commit 8223c00857dca7eef47015744b77c126d0c8626e
> Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Date:   Sat Sep 2 17:48:39 2017 -0700
> 
>     memorder: Clarify other-multicopy atomicity
>     
>     Reported-by: Akira Yokosawa <akiyks@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 62544ae8ed52..1d4256d76e7a 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -1703,32 +1703,32 @@ and other counterintuitive behavior, as discussed in the next section.
>  
>  Threads running on a \emph{multicopy atomic}~\cite{Stone:1995:SP:623262.623912}
>  platform are guaranteed
> -to agree on the order of writes, even to different variables.
> +to agree on the order of stores, even to different variables.
>  A useful mental model of such a system is the single-bus architecture
>  shown in
>  Figure~\ref{fig:memorder:Global System Bus And Multi-Copy Atomicity}.
> -If each write resulted in a message on the bus, and if the bus could
> -accommodate only one write at a time, then any pair of CPUs would
> -agree on the order of all writes that they observed.
> +If each store resulted in a message on the bus, and if the bus could
> +accommodate only one store at a time, then any pair of CPUs would
> +agree on the order of all stores that they observed.
>  Unfortunately, building a computer system as shown in the figure,
>  without store buffers or even caches, would result in glacial computation.
> -CPU vendors have therefore taken one of three approaches:
> -(1)~Provide store buffers, caches, and the rest and abandon
> -multicopy atomicity (weakly ordered platforms),
> -(2)~Provide all those hardware optimizations, and invest many transistors
> -into preserving multicopy atomicity (TSO platforms), or
> -(3)~Define a slightly weaker \emph{other-multicopy atomicity} that allows
> -a given CPU's stores to become visible to that CPU before they become visible
> -to other CPUs, but in which each of those stores becomes visible to all
> -the other CPUs simultaneously~\cite{ARMv8A:2017}.
> -Perhaps there will come a day when all platforms provide some flavor
> -of multi-copy atomicity, but
> -in the meantime, non-multicopy-atomic platforms do exist, and so software
> -does need to deal with them.
> +CPU vendors interested in providing multicopy atomicity have therefore
> +instead provided the slightly weaker
> +\emph{other-multicopy atomicity}~\cite[Section B2.3]{ARMv8A:2017},
> +which excludes the CPU doing a given store from the requirement that all
> +CPUs agree on the order of all stores.
> +This means that if only a subset of CPUs are doing stores, the
> +other CPUs will agree on the order of stores, hence the ``other''
> +in ``other-multicopy atomicity''.
> +Unlike multicopy-atomic platforms, within other-multicopy-atomic platforms,
> +the CPU doing the store is permitted to observe its
> +store early, which allows its later loads to obtain the newly stored
> +value directly from the store buffer.
> +This in turn improves performance.
>  
>  \QuickQuiz{}
>  	Can you give a specific example showing different behavior for
> -	multicopy atomic on the one hand and other multicopy atomic
> +	multicopy atomic on the one hand and other-multicopy atomic
>  	on the other?
>  \QuickQuizAnswer{
>  \begin{listing}[tbp]
> @@ -1790,6 +1790,12 @@ exists (1:r1=1 /\ 1:r2=0)
>  	which in turn allows the \co{exists} clause to trigger.
>  } \QuickQuizEnd
>  
> +
> +Perhaps there will come a day when all platforms provide some flavor
> +of multi-copy atomicity, but
> +in the meantime, non-multicopy-atomic platforms do exist, and so software
> +does need to deal with them.
> +
>  \begin{listing}[tbp]
>  { \scriptsize
>  \begin{verbbox}[\LstLineNo]
> 
> 

