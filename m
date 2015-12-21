Return-Path: <colin.pitrat@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-type;        bh=jbtEcsH5rbyG12WQIlGFN9sc3Jrfi2Qg5qkAlmBE0Nw=;
 b=jYgzcRisbxDnzoEsh/JGS3A/7su/VMY8F3asV6grsI/GgomTg2KwVPOs8K/4Ptd457
 gSMX93VtTDe38xeVRy2ONIkl8SxXhbCfnSiIOmxDDgFxm75OFPlshnpmMHOC5jU1OpOa
 KHZS71Cbjvm2Kot6WpCI08rAXQvuRvcZcnR9zA10WHW0BfkVCv0fRDl/TJqoGR1FKJaS
 WlU6Kb+HHW8LB6Ej8vFstAgI6XEq/6vS1XeZDhiEf40WsnSSWRGkQe148/sp/hgJXI/o
 EuIHxNFO/pN7zJIdofO/CV94tb18g2Q1LnXzhWJekw2V2qvL3bGYBjj36fbl3Zy26e4v
 l98A==
MIME-Version: 1.0
In-Reply-To: <20151218180346.GQ4054@linux.vnet.ibm.com>
References: 
 <CABy3NjQQF+Kr+9MYmWVHY=b-d=NdOjTpiHMaKhuZzBECyDzOCA@mail.gmail.com>
 <20151218180346.GQ4054@linux.vnet.ibm.com>
From: Colin Pitrat <colin.pitrat@gmail.com>
Date: Mon, 21 Dec 2015 16:18:56 +0100
Message-ID: 
 <CABy3NjQsQqO12v3H76ejk6-3iaBK5fjkXOUsaLuexPzM1himSw@mail.gmail.com>
Subject: Re: Approximate structure-allocation limit problem improvement
Content-Type: text/plain; charset=UTF-8
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

In fact, my point is exactly that we don't want to compare against
zero, we're just doing it to not underflow our counters ! That's why
in the code of the "Approximate structure-allocation limit problem",
sub_count handles 0 in a way that is symmetrical to the way add_count
handles the allocation limit that we want to enforce.

The issue is that it raise the following question: what to do when
both the thread counter (_ counter _) and the globalized counter (_
global_count _) are too small to substract delta ? It necessarly means
that some other thread counter is non-zero and the sum of all counters
is greater than delta, as we know a structure of size delta is still
allocated.

This issue is highlighted in the book in paragraph 5.3.3 Simple Limit
Counter discussion, with the sentence "Similarly, sub_ count() can
fail even when the aggregate value of the counter is nowhere near
zero."

For example, just after program starts (all counters are 0): thread A
allocates a structure of size 10. Counter of thread A is 10, global
counter and counter of thread B are both 0. The structure ownership is
passed to thread B that wants to deallocate it. But sub_count finds
that thread B counter is 0 so it takes the slow path, checking global
counter that is also 0. It therefore fails. What should the program do
in this case ? Keep the structure and try to deallocate it later ?

My proposition is to add a global "deallocated_size". In the slow path
of sub_count, if delta cannot be substracted then it is added to
deallocated_size and sub_count always succeeds. On the next
globalize_count, deallocated_size will be reduced as much as possible.

Are my explanation clearer (sorry if not !) ? Am I missing a flow with
this proposal ?

Regards,
Colin

2015-12-18 19:03 GMT+01:00 Paul E. McKenney <paulmck@linux.vnet.ibm.com>:
> On Wed, Dec 16, 2015 at 02:21:45PM +0100, Colin Pitrat wrote:
>> Hello,
>>
>> in chapter 5 (Counting), in the paragraph concerning "Approximate
>> structure-allocation limit problem", it is said:
>>
>> "Similarly, sub_count() can fail even when the aggregate value of the
>> counter is nowhere near zero. In many cases, this is unacceptable."
>>
>> In the case of the Quick Quiz 5.3 question, it's true that it's quite
>> a problem if it means freeing the structure fails because the counter
>> cannot be updated ! And freeing it without updating the counter means
>> the counter shifts from reality.
>>
>> However, the very existence of the structure is a guarantee that the
>> real (total) counter value cannot be 0 or less than delta, so couldn't
>> we imagine to always succeed the sub_count operation by keeping a
>> global negative offset ? In the slow path, after globalize_count, if
>> the global count is lower than delta then we set it to 0 and we
>> increment the negative offset by what remains.
>>
>> On the next slow path operation during a add_count, this negative
>> offset can be removed (or reduced) by reducing the local counter of
>> the thread by the same value.
>>
>> This improvement over the proposed solution make it an acceptable
>> answer for the quick quiz 5.3 whereas it isn't without.
>>
>> What do you think ?
>> Should I spend a bit of time writing a paragraph and a code sample about it ?
>
> I must confess that I have read this message a few times, and still don't
> understand what you are getting at.  Part of my trouble is that I am
> not sure why you are comparing against zero -- the structure-allocation
> problem only needs to compare against the limit.  But you might mean
> zero after offset, or you might be talking about some related problem.
>
> So perhaps a paragraph and sample code would help me understand the
> problem you are looking at and your example solution.
>
>                                                         Thanx, Paul
>

