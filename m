Return-Path: <SRS0=f179=2M=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=67YV2MGGdS1aP0DbkU2bA5T6ejm9ZnEKmaoyd1909ok=;
        b=P+luecMMSbjeqNEDYf3ICdGlFK3+Is5lnF/5+0Ci8DDY9eCe6BuqXpLtF803KvHC32
         m0hHP2T/Ng8o49OJWNPtS398P/OO1mdH2lmiVAfM2iW5ezyuxYGFlBC6yLbZZuKuSX8w
         csKAdNG2a89b/51xKSCnFFCMx4nLOFrIqRkEanUK8EbP1F1tnVYkb6Vye+LfA7IsYi6F
         GZi9GC0QiXM0L9WpUVv2ANzdq2zXB96Pjp18JVM0x2d0RUKFcfESdlgCLuDaXxl9OOrK
         88jHMAZ/uiG8peoFl1d/CW8HzoI9gsy4w9vGqCkTKblk7jdMMULGrUphSNo7dP/BsFHt
         8TiQ==
Message-ID: <fb96c7ce-2374-aa32-263e-e67fafc1ab9a@gmail.com>
Date: Tue, 11 Oct 2022 18:21:16 +0900
MIME-Version: 1.0
Subject: Re: [PATCH] memorder.tex: the exists clause in Listing 15.35 should
 never be satisfied.
References: <CANJ3EgF5G-rK+VVTigRkDp97=UtAh3TcVWr0tcpZv2NF_0n-Hw@mail.gmail.com>
 <4f53aff4-6bf5-f4e0-6511-00cc040496e5@gmail.com>
 <20221011085825.GE4221@paulmck-ThinkPad-P17-Gen-1>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20221011085825.GE4221@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Patrick Yingxi Pan <pyxchina92929@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Tue, 11 Oct 2022 01:58:25 -0700, Paul E. McKenney wrote:
> On Tue, Oct 11, 2022 at 05:37:55PM +0900, Akira Yokosawa wrote:
>> [+CC: Paul]
>>
>> Hi,
>>
>> On Tue, 11 Oct 2022 11:17:25 +0800, Patrick Yingxi Pan wrote:
>>> Hello!
>>>
>>> According to the context and my understanding of locking primitives, I
>>> suppose the 'exists' clause in the litmus test shouldn't be satisfied.
>>
>> I agree with you in that section 15.4.2.2 is described as if the
>> result were "Never".
>>
>> However, if you run herd7 on the litmus test, you'll get:
>>
>> ------------------------------------------------
>> Test Lock-outside-across Allowed
>> States 4
>> 0:r1=0; 1:r1=0;
>> 0:r1=0; 1:r1=1;
>> 0:r1=1; 1:r1=0;
>> 0:r1=1; 1:r1=1;
>> Ok
>> Witnesses
>> Positive: 2 Negative: 12
>> Condition exists (0:r1=0 /\ 1:r1=0)
>> Observation Lock-outside-across Sometimes 2 12   <--
>> Time Lock-outside-across 0.02
>> Hash=06337358bba3d1ed44db8ea81cf1d236
>> ------------------------------------------------
>>
>> That said, I'm not in the position of deciding LKMM is right or not.
> 
> Thank you for checking, Akira!
> 
> This is the following litmus test?
> 
> CodeSamples/formal/herd/C-Lock-outside-across.litmus

Yes, it is.

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>>> Signed-off-by: Patrick Pan <pyxchina92929@gmail.com>
>>> ---
>>>  memorder/memorder.tex | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
>>> index a0a87d0a..9c1846d0 100644
>>> --- a/memorder/memorder.tex
>>> +++ b/memorder/memorder.tex
>>> @@ -3452,7 +3452,7 @@ following subsequent critical sections?
>>>  This question can be answered for the Linux kernel by referring to
>>>  \cref{lst:memorder:Accesses Outside of Critical Sections}
>>>  (\path{C-Lock-outside-across.litmus}).
>>> -Running this litmus test yields the \co{Sometimes} result,
>>> +Running this litmus test yields the \co{Never} result,
>>>  which means that accesses in code leading up to a prior critical section
>>>  is also visible to the current CPU or thread holding that same lock.
>>>  Similarly, code that is placed after a subsequent critical section
>>>
>>> base-commit: 7f12a9358e220f3d0c3a0880d01bc283113d7a5b
>>> --
