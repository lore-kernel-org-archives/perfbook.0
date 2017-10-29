Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ufCqo8SBMRcA8/EgxL9+UK1yWSrmbZ5Oa6zHt4XMeEQ=;
 b=QDrq1p/JgBH81cIIxG/smI4v6s1SSDuNS6Re17A6/0vvmC59TFvkmQQmE+hED7B3+a
 pmuCfDqPQZpV5roW416IjoZJvMIkALk6uy1Eqj5zPrt/9t6h5JqPwdJJhjsE0ViJuxH6
 zmDk7CoZgooZvCVLYtL6zjorrn24MZeImlqcE8WvQ7X5xcQflerHKAOyunBQe47Rt1+F
 w3gQz++5lx95i7rw47XGRxLDMqUDUdPqjj5NJIemdhr1InR/JLxUl47GcYxkB/SnzoFZ
 tkXAGIPsNB1G1hxRLkcJrXjC9e9EtOjNkxRM4u737M5bLTZXMFGzkjpXfIZTjApzsVVB
 j2TQ==
Subject: Re: Listing 9.2: actual free(3) will probably cause problem
References: <20171028092932.GG5742@HP>
 <20171028131227.GV3659@linux.vnet.ibm.com>
From: Yubin Ruan <ablacktshirt@gmail.com>
Message-ID: <1751f079-4a3f-5046-4103-9e5c672e611b@gmail.com>
Date: Sun, 29 Oct 2017 09:19:07 +0800
MIME-Version: 1.0
In-Reply-To: <20171028131227.GV3659@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

[Off list...]

On 10/28/2017 09:12 PM, Paul E. McKenney wrote:
> On Sat, Oct 28, 2017 at 05:29:34PM +0800, Yubin Ruan wrote:
>> Hi Paul,
>>
>> I would suggest the following patch for defer/route_refcnt.c (as in Listing
>> 9.2). For the change in re_free, if we actually call free(3) on `rep', we will
>> lose that piece of memory so that the READ_ONCE() at line 36 might see garbage
>> value and will probably will not call abort(3), i.e., that is implementation
>> specific behavior. And I don't see why will we have `old <=0`.
>>
>> I think I understand what that code mean but you might mean some other?
>> Hopefully I will not be too picky.
> 
> Yes, this code is buggy and fixing it is on my list.  I would be happy to
> accept a patch doing a real fix, but it is not simple.
> 
> One place to start is Anthony Williams's atomic shared pointer code.
> The idea would be to translate that from C++ to C.

Can you provide some references?

> 
> But please be aware that this is a non-trivial problem.  If you try to
> hack together a solution, it -will- have subtle bugs.  So validating
> your solution (even if you start from Anthony's approach) will be
> non-trivial.  I suggest using cbmc or something similar in addition to
> perfbook's stress tests.
> 
> So, are you up for it?  ;-)

Akira, can you provide some comments? I not sure what is wrong with my
suggestions. 

And I currently don't know use those test. I will work on it.

Yubin

>>
>> ----------------------------------------
>> diff --git a/CodeSamples/defer/route_refcnt.c b/CodeSamples/defer/route_refcnt.c
>> index 8a48faf..0d24e9d 100644
>> --- a/CodeSamples/defer/route_refcnt.c
>> +++ b/CodeSamples/defer/route_refcnt.c
>> @@ -36,7 +36,8 @@ DEFINE_SPINLOCK(routelock);
>>  static void re_free(struct route_entry *rep)
>>  {
>>  	WRITE_ONCE(rep->re_freed, 1);
>> -	free(rep);
>> +    /* Will not actually free it. Just use the `re_freed' as a flag */
>> +	/*free(rep);*/
>>  }
>>
>>  /*
>> @@ -50,7 +51,6 @@ unsigned long route_lookup(unsigned long addr)
>>  	struct route_entry **repp;
>>  	unsigned long ret;
>>
>> -retry:
>>  	repp = &route_list.re_next;
>>  	rep = NULL;
>>  	do {
>> @@ -65,8 +65,6 @@ retry:
>>  			if (READ_ONCE(rep->re_freed))
>>  				abort();
>>  			old = atomic_read(&rep->re_refcnt);
>> -			if (old <= 0)
>> -				goto retry;
>>  			new = old + 1;
>>  		} while (atomic_cmpxchg(&rep->re_refcnt, old, new) != old);
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe perfbook" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> 

