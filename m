Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=o6ccMIoqCOkez6foZApFyCGhMT3ZtVYWsXjaj3A/R5k=;
        b=cjhDo8ScrGbeuOsP0tuWCrMrdX1dMayXjidRzwWgsuQMDJ0KaG4+dUP56wDWBBv78+
         hyp3niqqDwFQbkdKsJ09pD4UFCcGHqcKBjL14/bESsWK/YsgJMi8i7ZjqXHNnAopexcJ
         PLx51gEpLtERYrqkJI0p0H0pMCBEue/96q5HXEAGjQCHMnRPhJuIXX+XyKBjCY5Kgwzj
         WdlGCrz6FtxFYbVhbZNJh7SuHfk0C8E55fkdAuTbkY5Ew0+CRxANMu/fumBX0yXbj3oa
         Kk4FD/FmBaO/yJJ3gZUcemXv2Z+vXZbZNvbYOHwt3L/nLEq9LV+AhUJ+Hdm9o6EQHZKy
         qevA==
Subject: Re: [Possible BUG] count_lim_atomic.c fails on POWER8
References: <20181020163648.GA2674@linux.ibm.com>
 <CABoNC80CeE8XsQMHAO-GrSuUQ86z7Z6frm04XUWNbxWtkmKsNA@mail.gmail.com>
 <073797d5-67f7-7426-f895-8004428a84ab@gmail.com>
 <CABoNC828mNgvvqcUm65d+PFdBVB1Pp6FzEyXniPbxo-dUeLxpw@mail.gmail.com>
 <20181025094516.GO4170@linux.ibm.com>
 <CABoNC81fnRn3H3wB+Zx7WG7QPw7qLa13pVcUzxQ-zdX3vtaxuA@mail.gmail.com>
 <444c8f09-b9b3-9564-2418-a7c93198f2e7@gmail.com>
 <ca3f5f62-be71-7cd0-c251-1c544a8170ca@gmail.com>
 <CABoNC80D9bO6bXi5YfOAA6dJzUEwObHKuYihS5P0-9DdOaK0GQ@mail.gmail.com>
 <5c2c8a25-cc15-d262-34fc-ae5eb1f5d6f6@gmail.com>
 <20181028001723.GJ4170@linux.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a1bc44c8-1796-42f3-6055-a08fcd77a481@gmail.com>
Date: Sun, 28 Oct 2018 23:24:41 +0900
MIME-Version: 1.0
In-Reply-To: <20181028001723.GJ4170@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: Junchang Wang <junchangwang@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/10/27 17:17:23 -0700, Paul E. McKenney wrote:
> On Sat, Oct 27, 2018 at 11:56:54PM +0900, Akira Yokosawa wrote:
>> On 2018/10/26 08:58:30 +0800, Junchang Wang wrote:
>> [...]
>>>
>>> BTW, I found I'm not good in writing C macro (e.g., cmpxchg). Do you
>>> know some specification/document on writing C macro functions in
>>> Linux?
>>
>> Although I'm not qualified as a kernel developer,
>> Linux kernel's "coding style" has a section on this. See:
>>
>> https://www.kernel.org/doc/html/latest/process/coding-style.html#macros-enums-and-rtl
>>
>> In that regard, macros I added in commit b2acf6239a95
>> ("count: Tweak counttorture.h to avoid segfault") do not meet
>> the style guide in a couple of ways:
>>
>>     1) Inline functions are preferable to macros resembling functions
>>     2) Macros with multiple statements should be enclosed in a do - while block
>>     3) ...
>>
>> Any idea for improving them is more than welcome!
> 
> Let's see...
> 
> #define cmpxchg(ptr, o, n) \
> ({ \
> 	typeof(*ptr) _____actual = (o); \
> 	\
> 	__atomic_compare_exchange_n(ptr, (void *)&_____actual, (n), 1, \
> 			__ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST) ? (o) : (o)+1; \
> })

Oh, my concern was macros I added in counttorture.h to support
#ifndef KEEP_GCC_THREAD_LOCAL.

But those macros are used solely in the header file, so the current
definition might be good enough.

OTH, macros defined in api-gcc.h should be made as robust as possible.
Hence your review of cmpxchg() is quite instructive to me.

> 
> We cannot do #1 because cmpxchg() is type-generic, and thus cannot be
> implemented as a C function.  (C++ could use templates, but we are not
> writing C++ here.)
> 
> We cannot do #2 because cmpxchg() must return a value.
> 

These reasoning might not be obvious to those who are new to
C preprocessor programming. Current style guide of kernel doesn't
look good enough, partly because of its intended audiences.

> Indentation is not perfect, but given the long names really cannot be
> improved all that much, if at all.
> 
> However, we do have a problem, namely the multiple uses of "o", which
> would be very bad if "o" was an expression with side-effects.

I didn't notice this point.

> 
> How about the following?
> 
> #define cmpxchg(ptr, o, n) \
> ({ \
> 	typeof(*ptr) _____old = (o); \
> 	typeof(*ptr) _____actual = _____old; \
> 	\
> 	__atomic_compare_exchange_n(ptr, (void *)&_____actual, (n), 1, \
> 			__ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST)
> 			? _____old : _____old + 1; \
> })
> 
> This still might have problems with signed integer overflow, but I am
> inclined to ignore that for the moment.

Behavior of overflow of signed integer is undefined in C standard, right?

>                                         Because paying attention to it
> results in something like this:
> 
> #define cmpxchg(ptr, o, n) \
> ({ \
> 	typeof(*ptr) _____old = (o); \
> 	typeof(*ptr) _____actual = _____old; \
> 	\
> 	__atomic_compare_exchange_n(ptr, (void *)&_____actual, (n), 1, \
> 			__ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST) \
> 			? _____old \
> 			: _____old > 0 ? _____old - 1; : _____old + 1; \
> })
> 
> Thoughts?  Most especially, any better ideas?

Let me think this over.

BTW, the purpose of using the name "_____old" and the like may not
be obvious either.
If we use "old" instead, naming collision can happen if "old" is given
as an argument to this macro in its call sites. Am I guessing right?

        Thanks, Akira

> 
> 							Thanx, Paul
> 

