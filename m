Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc;        bh=pNHiZefDFDsLeEjuxXw9R7kFWYTawR6L7fCbx/n9LRk=;
 b=UVc7fqBrUIBifJCJLOqiq+yk6zvpGwF2me+SW9Re/0lFiVvIW/5SGl2lZPTIWwjA3K
 cu2BQOfFmaY3EP/lJcku5CF0cpA4KvnfkRNP3tTQ91/5AH9IdvRU5gGdV8p6nYpca13C
 FiGcYT8Bo5ZIXuq3Q0Syb6T96gY9LRKUBE6i6PKq0SLYm8zhyg0LRt3ue+/T3DJg24qX
 g0wnfmsv6tSmU2H2P5WoHDcVuwQcLleMryEwftP+JdD4sQWvWdXrcDqzlQ8YZSEZjw2p
 B/1qtyAShV+BQ1Plk894IHSjzNN/9E3xeluw9XPIvribWUWDXt1Q8wlj/B+RevN4aW9M
 9AMg==
MIME-Version: 1.0
In-Reply-To: <a6e4d3a9-74c9-17c5-5aef-fc0ec83cfb34@gmail.com>
References: 
 <CAJYFCiMix3XfQ0Z=BMUO39eNssYcVLR-Y1zHee+QT9cBsVS3KA@mail.gmail.com>
 <a6e4d3a9-74c9-17c5-5aef-fc0ec83cfb34@gmail.com>
From: Yubin Ruan <ablacktshirt@gmail.com>
Date: Fri, 6 Oct 2017 20:35:00 +0800
Message-ID: 
 <CAJYFCiMCnyZnP1kCBAQfpGGd4PBkoMz5ALnkH2K2aqsmwjs+SA@mail.gmail.com>
Subject: Re: synchronize with a non-atomic flag
Content-Type: text/plain; charset="UTF-8"
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
List-ID: <perfbook.vger.kernel.org>

2017-10-06 20:03 GMT+08:00 Akira Yokosawa <akiyks@gmail.com>:
> Hi Yubin,
>
> On 2017/10/06 14:52, Yubin Ruan wrote:
>> Hi,
>> I saw lots of discussions on the web about possible race when doing
>> synchronization between multiple threads/processes with lock or atomic
>> operations[1][2]. From my point of view most them are over-worrying.
>> But I want to point out some particular issue here to see whether
>> anyone have anything to say.
>>
>> Imagine two processes communicate using only a uint32_t variable in
>> shared memory, like this:
>>
>>     // uint32_t variable in shared memory
>>     uint32_t flag = 0;
>>
>>     //process 1
>>     while(1) {
>>         if(READ_ONCE(flag) == 0) {
>>             do_something();
>>             WRITE_ONCE(flag, 1); // let another process to run
>>         } else {
>>             continue;
>>         }
>>     }
>>
>>     //process 2
>>     while(1) {
>>         if(READ_ONCE(flag) == 1) {
>>             printf("process 2 running...\n");
>>             WRITE_ONCE(flag, 0); // let another process to run
>>         } else {
>>             continue;
>>         }
>>     }
>>
>> On X86 or X64, I expect this code to run correctly, that is, I will
>> got the two `printf' to printf one after one.
>
> Well, I see only one printf() above.
> Do you mean:

yes. sorry about the typo.

>     //process 1
>     while(1) {
>         if(READ_ONCE(flag) == 0) {
>             printf("process 1 running...\n");
>             WRITE_ONCE(flag, 1); // let another process to run
>         } else {
>             continue;
>         }
>     }
>
>     //process 2
>     while(1) {
>         if(READ_ONCE(flag) == 1) {
>             printf("process 2 running...\n");
>             WRITE_ONCE(flag, 0); // let another process to run
>         } else {
>             continue;
>         }
>     }
>
> ?
>
> Then printf()s can be a problem.
> It partially negates your claim 3).
> Without using memory barrier, there is no guarantee that the results of
> WRITE_ONCE() are visible to the other thread after the printf()'s
> memory accesses complete.

But, on X86/X64, where we have cache coherence, the result of
WRITE_ONCE() should be visible to other thread (maybe not immediately,
but eventually it will be visible).

> I/O operations in printf() might make the situation trickier.

printf(3) is claimed to be thread-safe, so I think this issue will not
concern us.

> In a more realistic case where you do something meaningful in
> do_something() in both threads:
>
>     //process 1
>     while(1) {
>         if(READ_ONCE(flag) == 0) {
>             do_something();
>             WRITE_ONCE(flag, 1); // let another process to run
>         } else {
>             continue;
>         }
>     }
>
>     //process 2
>     while(1) {
>         if(READ_ONCE(flag) == 1) {
>             do_something();
>             WRITE_ONCE(flag, 0); // let another process to run
>         } else {
>             continue;
>         }
>     }
>
> and if do_something() uses some shared variables other than "flag",
> you need a couple of memory barriers to ensure the ordering of
> READ_ONCE(), do_something(), and WRITE_ONCE() something like:
>
>     //process 1
>     while(1) {
>         if(READ_ONCE(flag) == 0) {
>             smp_rmb();
>             do_something();
>             smp_wmb();
>             WRITE_ONCE(flag, 1); // let another process to run
>         } else {
>             continue;
>         }
>     }
>
>     //process 2
>     while(1) {
>         if(READ_ONCE(flag) == 1) {
>             smp_rmb();
>             do_something();
>             smp_wmb();
>             WRITE_ONCE(flag, 0); // let another process to run
>         } else {
>             continue;
>         }
>     }
>
> In Linux kernel memory model, you can use acquire/release APIs instead:
>
>     //process 1
>     while(1) {
>         if(smp_load_acquire(&flag) == 0) {
>             do_something();
>             smp_store_release(&flag, 1); // let another process to run
>         } else {
>             continue;
>         }
>     }
>
>     //process 2
>     while(1) {
>         if(smp_load_acquire(&flag) == 1) {
>             do_something();
>             smp_store_release(&flag, 0); // let another process to run
>         } else {
>             continue;
>         }
>     }

Yes it could be tricky when `do_something()' really do something that
involved other shared variable.

Yubin

> The intention of the code is easier to see when you use well-defined APIs.
> Just my two cents.
>
>               Thanks, Akira
>
>>                                                That is because:
>>
>>     1) on X86/X64, load/store on 32-bits variable are atomic
>>     2) I use READ_ONCE/WRITE_ONCE to prevent possibly harmful compiler
>> optimization on `flag'.
>>     3) I use only one variable to communicate between two processes,
>> so there is no need for any kind of barrier.
>>
>> Does anyone have any objection at that?
>>
>> I know using a lock or atomic operation will save me a lot of
>> argument, but I think those things are unnecessary at this
>> circumstance, and it matter where performance matter, so I am picky
>> here...
>>
>> Yubin
>>
>> [1]: https://software.intel.com/en-us/blogs/2013/01/06/benign-data-races-what-could-possibly-go-wrong
>> [2]: https://www.usenix.org/conference/osdi10/ad-hoc-synchronization-considered-harmful
>> --
>> To unsubscribe from this list: send the line "unsubscribe perfbook" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>

