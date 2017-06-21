Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sQ72BQzlkgKB0VTCuMqT6pa0I2JnAkzPHg7m7ZiKO8s=;
 b=SxvT0+QHY1pAcwKoaQ34Dn7JAdsvF3KOc4H6rvcG6x2BGbnSYD1gpaYNgW1KRVGivk
 E96EUmtpMeNNgw42oHTjSvqTQaki9fdJzOBp2XdtMT3EjDUE5+nr/+FvuQ+D6/wqkIIR
 bUZfEWoEGJyQDuL5+WIa86yw7js/TWPWPBi+hCazv1wYyRtgqNz2ginyl/qfoqyLT1Lj
 3pizFgzzYRjdwINGkWciAl9dEln7fSag2ZdH8Dpdlv1lkKiC8XUzfY8gfqETvYfBfGfj
 8hoRoHy0j3DjLbsFc0wFavgMp1Amtdqjg4IzzO0Q6uqDb70ZxsKnqx3YNsN75kTvFvv2
 1rsg==
Subject: Re: [PATCH 2/3] toyrcu: Trivial typo fixes (rcu_idx -> rcu_refcnt)
References: <17af992e-b78b-25c0-0b77-d18fbfd75895@gmail.com>
 <1d238a3f-1c64-e731-f344-5c4b86455bd0@gmail.com>
 <6130a59b-a467-a83f-ecf5-40a52036c745@gmail.com>
 <20170621174541.GJ3721@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <21fca4d8-6b10-7e0f-bf49-5ce8a05545ff@gmail.com>
Date: Thu, 22 Jun 2017 07:46:57 +0900
MIME-Version: 1.0
In-Reply-To: <20170621174541.GJ3721@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/06/21 10:45:41 -0700, Paul E. McKenney wrote:
> On Wed, Jun 21, 2017 at 07:55:34AM +0900, Akira Yokosawa wrote:
>> On 2017/06/20 23:28, Akira Yokosawa wrote:
>>> >From db0fd6b383b551eabecb12dfa21e42093f338b2f Mon Sep 17 00:00:00 2001
>>> From: Akira Yokosawa <akiyks@gmail.com>
>>> Date: Mon, 19 Jun 2017 23:55:31 +0900
>>> Subject: [PATCH 2/3] toyrcu: Trivial typo fixes (rcu_idx -> rcu_refcnt)
>>>
>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>> ---
>>>  appendix/toyrcu/toyrcu.tex | 12 ++++++------
>>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
>>> index 79fbe33..a7bf6ca 100644
>>> --- a/appendix/toyrcu/toyrcu.tex
>>> +++ b/appendix/toyrcu/toyrcu.tex
>>> @@ -524,10 +524,10 @@ by complementing the value of \co{rcu_idx}, as in \co{rcu_idx = !rcu_idx}.
>>>  Suppose that the old value of \co{rcu_idx} was zero, so that the new
>>>  value is one.
>>>  New readers that arrive after the complement operation will increment
>>> -\co{rcu_idx[1]}, while the old readers that previously incremented
>>> -\co{rcu_idx[0]} will decrement \co{rcu_idx[0]} when they exit their
>>> +\co{rcu_refcnt[1]}, while the old readers that previously incremented
>>> +\co{rcu_refcnt[0]} will decrement \co{rcu_refcnt[0]} when they exit their
>>>  RCU read-side critical sections.
>>> -This means that the value of \co{rcu_idx[0]} will no longer be incremented,
>>> +This means that the value of \co{rcu_refcnt[0]} will no longer be incremented,
>>>  and thus will be monotonically decreasing.\footnote{
>>>  	There is a race condition that this ``monotonically decreasing''
>>>  	statement ignores.
>>> @@ -616,11 +616,11 @@ Lines~6 and 19 acquire and release \co{rcu_gp_lock} in order to
>>>  prevent more than one concurrent instance of \co{synchronize_rcu()}.
>>>  Lines~7-8 pick up the value of \co{rcu_idx} and complement it,
>>>  respectively, so that subsequent instances of \co{rcu_read_lock()}
>>> -will use a different element of \co{rcu_idx} that did preceding
>>> +will use a different element of \co{rcu_refcnt} that did preceding
>>>  instances.
>>
>> I have a little trouble with this sentence. Do you mean:
>>
>>              ..., so that subsequent instances of \co{rcu_read_lock()}
>> will use a different element of \co{rcu_refcnt} from the one did preceding
>> instances.                                      
> 
> Just to fully illustrate:
> 
> 1.	Suppose that rcu_idx is initially zero.
> 
> 2.	Any rcu_read_lock() invocations running at this point will
> 	therefore be incrementing rcu_refcnt[0].
> 
> 3.	A synchronize_srcu() instance now complements rcu_idx, so that
> 	its new value is one.
> 
> 4.	Any rcu_read_lock() invocations from step 2 that fetched rcu_idx
> 	before step 3 completed will still increment rcu_refcnt[0].
> 
> 5.	However, any subsequent rcu_read_lock() invocations will instead
> 	increment rcu_refcnt[1].  (At least until the next invocation
> 	of synchronize_rcu().)
> 
> Does that help, or am I missing the point of your question?

Thanks. This is what I guessed you mean.

So what bothered me was the structure of the clause. I rarely see a sentence like:

    I will buy a different model of PC that did you.

I can't figure out the grammatical role of "that" here.

           Thanks, Akira

> 
> 							Thanx, Paul
> 
>> ???
>>
>>        Thanks, Akira
>>> -Lines~10-12 then wait for the prior element of \co{rcu_idx} to
>>> +Lines~10-12 then wait for the prior element of \co{rcu_refcnt} to
>>>  reach zero, with the memory barrier on line~9 ensuring that the check
>>> -of \co{rcu_idx} is not reordered to precede the complementing of
>>> +of \co{rcu_refcnt} is not reordered to precede the complementing of
>>>  \co{rcu_idx}.
>>>  Lines~13-18 repeat this process, and line~20 ensures that any
>>>  subsequent reclamation operations are not reordered to precede the
>>>
>>
> 
> 

