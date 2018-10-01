Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=L/HAgZwJ3DEfO+Oo3gwKTdE8RqCaJ2qP1k/Ee8geeXA=;
        b=FaHjy2Vrl/cGutTKIHxY0Nv7ILv5hrL8FsZxPloN11b7LDBS3DL6IaDVa4xGpU9kvs
         xdpi418W9cq5zOlPwIx3hQ5GO2LpXpgMGAPYR5KfLS0Sp5MJDbLNgsGZByNtmY0sRgyt
         WHsHyVlNjlpOb4Fsy8iz3FT6gygO8+5vaGhV4XQ4/NgN8FqLQf+RlyIDvomzsTjI760c
         Wt5wm/ZvkujMOSsrS44AqSKrDZkpf8pXuEruI53HBiVCochNfjRNkxVO64sxKBqL1pt4
         FJYwrStS49/HKSMO6nogdi64Dw1AqTnjY/2PGrOmt6n4c5lXZ+0lQI+s965tD3iSppLM
         dGUw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: Question of usage of per_thread()
References: <71206929-11cd-73bc-560e-f982c7e86cf8@gmail.com>
 <20180916150849.GW652@linux.ibm.com>
Message-ID: <c6eaaa51-2063-7fb6-d308-4152d31f30be@gmail.com>
Date: Tue, 2 Oct 2018 07:48:15 +0900
MIME-Version: 1.0
In-Reply-To: <20180916150849.GW652@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/09/17 0:08, Paul E. McKenney wrote:
> On Sun, Sep 16, 2018 at 05:37:23PM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> Every time I review code under CodeSamples/,
>> I find myself confused where to use READ_ONCE/WRITE_ONCEs.
>>
>> I'm looking at Listing 5.3 of current master.
>>
>> There are two cases which lack READ_ONCE/WRITE_ONCE to access potentially
>> shared variables, namely on line 5 (__get_thread_var(counter)++;) and
>> on line 14 (sum += per_thread(counter, t);).
>>
>> Line 5 looks like a good candidate to be optimized out when inlined.
>> But the performance result indicates "gcc -O3" keeps it inside the loop.
>>
>> Is this because the definition of __get_thread_var() contains
>> a call to smp_thread_id() and complicated enough not to be optimized
>> out?
>>
>> As for line 14, as per_thread() was derived from per_cpu() of kernel
>> API, I looked for call sites of per_cpu() in the kernel source tree.
>>
>> There are very few cases where READ_ONCE/WRITE_ONCE is used along
>> with per_cpu(). There are two READ_ONCEs with per_cpu() in
>> kernel/rcu/srcutree.c, whose author is none other than you.
>> Are those READ_ONCEs necessary?
>>
>> I don't grasp the actual definition of per_cpu() macro.
>> Definition of per_thread() macro under CodeSamples/api-pthreads/
>> does not look so complicated, but contains array indexing,
>> which might be good enough to prevent optimization in the loop.
>>
>> I'm not sure, but my gut feeling is that READ_ONCE/WRITE_ONCE
>> is necessary to access an unannotated variable. If we need
>> volatility for sure, we could modify the definition of annotating
>> macros/functions.
>>
>> Can you enlighten me?
> 
> Yes, I do need to expand on this, both in perfbook and in order to inspect
> my usage in Linux-kernel RCU.  Please see below for my current outline,
> and any and all feedback would be deeply appreciated!
> 

So, I applied your outline to accesses in Listing 5.3.
See inline comments below for my observation.

> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> 
> Plain accesses, that is, without either READ_ONCE() or WRITE_ONCE():
> o	Only accessed under lock.
> o	Only accessed by owning CPU/thread.
> o	Only modified by owning CPU/thread under lock, and otherwise
> 	accessed only either while holding lock or by owning CPU/thread.
> 
> WRITE_ONCE() for modifications, READ_ONCE() for non-owning CPUs/threads
> not holding lock:
> o	Only modified while holding lock by owning CPU/thread,
> 	could be read from anywhere by anyone.
> 
> WRITE_ONCE() for modifications, READ_ONCE() for CPUs/threads not holding
> lock:
> o	Only modified while holding lock, could be read anywhere by
> 	anyone.
> 
> WRITE_ONCE() for modifications, READ_ONCE() for non-owning
> CPUs/threads:
> o	Only modified by owning CPU/threads, could be read anywhere
> 	by anyone.

Listing 5.3's per-thread variable "counter" looks covered here.
So the write part of the increment on line 5 needs WRITE_ONCE().
Read access on line 14 also needs READ_ONCE().

Read part of the increment doesn't need READ_ONCE(), I guess.

Line 5 would look like:

    WRITE_ONCE(__get_thread_var(counter), __get_thread_var(counter) + 1);

. Considering the cost of __get_thread_var(), there should be a room
to help compilers to optimize by using a local pointer as follows:

    static __inline__ void inc_count(void)
    {
        long *p_counter = &__get_thread_var(counter);

        WRITE_ONCE(*p_counter, *p_counter + 1);
    }

. Does this look reasonable to you? Or is it better to also use
READ_ONCE()?

But if __get_thread_var() does imply volatility, we can keep the
current way of increment:

        __get_thread_var(counter)++;

Thoughts?

        Thanks, Akira

> 
> Otherwise, READ_ONCE() and WRITE_ONCE() everywhere.
> 
> But note that READ_ONCE() and WRITE_ONCE() provide absolutely no
> ordering guarantees unless:
> 
> o	There is only one variable being accesses, and all of those
> 	accesses are of the same size and alignment.
> 
> o	There is only one CPU/thread doing the accesses to all
> 	of the variables during the timeframe of interest.
> 
> o	There are other operations involved, for example, smp_mb().
> 

