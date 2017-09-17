Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r9fssmTK4Dg1Jfk/MZ+eXmweLOTsDMk3kEWP+1k/DsA=;
 b=WaFmk/ngjT1GPMPJbGBHaOPbg4wawVwzjSFycHhJEHZpX0c87IlAQNaiZb6y0Xmzvn
 x9J7XKa+l156buRq7YU4sG8zSKfF+L5aFNb9yJyVDNLNqY3ZQTFKZ5tOwEqC/GtSocP8
 i14kkZZI19ng/RB38bxfaHD5vAGZmyus7iIGeJSvm5Fq00BE35ui7lmKKTtzs2QvUKN+
 OSmjzyNaYzEfaZrPQSu1vCO/iz+RA5YU+mnQAvpy1IjWC4ybqFaiJ0rK+E/5O0GUfBv8
 CDCNFwjaR7itcG7+Kg40+zofOtEFCbs7bvv/dK0rgfHg/Tk4/k+ABnYGJEQ/Isc08ZOI
 XmIQ==
Subject: Re: Is WRITE_ONCE() enough to prevent invention of stores?
References: <9307038d-60f1-0c93-55a1-f3c9be35605c@gmail.com>
 <20170917010730.GY3521@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e802cd64-22d9-7ef4-a2b8-95d4779d6c3d@gmail.com>
Date: Sun, 17 Sep 2017 20:04:21 +0900
MIME-Version: 1.0
In-Reply-To: <20170917010730.GY3521@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/09/16 18:07:30 -0700, Paul E. McKenney wrote:
> On Sat, Sep 16, 2017 at 08:01:45PM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> I'm a bit disturbed by the description in Section 14.3.1 "Memory-Reference
>> Restrictions" quoted below:
>>
>>> Oddly enough, the compiler is within its rights to use a variable
>>> as temporary storage just before a store to that variable, thus
>>> inventing stores to that variable.
>>> Fortunately, most compilers avoid this sort of thing, at least outside
>>> of stack variables.
>>> Nevertheless, using WRITE_ONCE() (or declaring the variable
>>> volatile) should prevent this sort of thing.
>>> But take care: If you have a translation unit that uses that variable,
>>> and never makes a volatile access to it, the compiler has no way of
>>> knowing that it needs to be careful.
>>
>> I'm wondering if using WRITE_ONCE() in a translation unit is really
>> enough to prevent invention of stores.
>>
>> Accessing via a volatile-cast pointer guarantees the access is not
>> optimized out (and hopefully the referenced value is respected).
>>
>> But I suspect that it has any effect in preventing invention of extra
>> loads/stores.
>>
>> Isn't declaring the variable volatile necessary for the guarantee?
>>
>> In practice, as is described in the above quote: "Fortunately, most
>> compilers avoid this sort of thing, at least outside of stack variables",
>> we can assume non-volatile shared variables are not spilled out to
>> the variables themselves as far as GCC/LLVM is concerned.
>> But this is compiler dependent, I suppose.
> 
> I suspect that it will turn out to be impossible for the compiler to
> actually invent these stores in the general case.  For example, it might
> be that there is some lock held or other synchronization mechanism unknown
> to the compiler that prevents this behavior.  But I haven't fully worked
> this out yet.

You mean the invented stores wouldn't be visible from other threads anyway?
In a meaningful parallel code, that can be the case.

> 
> But I do know that if you just do plain stores, the compiler is fully
> within its rights to invent stores preceding any given plain store.

So, the rules to use WRITE_ONCE() is something like the following?

---
1) Declare the variable without volatile.
2) READ_ONCE() and plain loads can be mixed. A plain load will see
   a value at least newer than or equal to the one obtained at the
   program-order most recent READ_ONCE().
3) WRITE_ONCE() should not be mixed with plain stores when invention
   of stores is to be avoided.

Invention of stores is the opposite of fusing stores.
Suppose you don't want to update progress in the while loop:

	while (!am_done()) {
	  do_something(p);
	  tmp++;
	}
	progress = tmp;

The compiler might transform this to

	while (!am_done()) {
	  do_something(p);
	  progress++;
	}

if it wants to avoid allocation of a register/stack to tmp for whatever
reason. WRITE_ONCE() prevents the unintended accesses of progress:

	while (!am_done()) {
	  do_something(p);
	  tmp++;
	}
	WRITE_ONCE(progress, tmp);

---
Adding this example in the text might be too verbose.
Would a Quick Quiz be reasonable?

        Thanks, Akira

> 
> 							Thanx, Paul
> 
> 

