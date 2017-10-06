Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ytIUS25hR5VkxQIrguph8Qn+wLpAeUfrs/PVmSmtbtc=;
 b=E+rUI+YArgWBCUtEXBVSX0ohpvMHwJZHebQu/b7A8EXzP9YhUEaBNttx7BR+xMzMRp
 wvzzuawsH5cvqroHRUh+oSKJBxbBayjrMFSMcU1V+vh4Ya1OSRajFFEx72z1RLYvgxkP
 d7BYEYY2kSDZTBKz91DKGp6BpQyV23Zy0xLzk3IRem/wVXaRQHqt4K7dlOlMDI6+5JvA
 OxgW8w2Ezs5vwNI7MXt7wpRAdpb8/CGvb5tNf5xcE5CHlS18i571ZeioZaIGbfwx/ppx
 2KPyFMYvu50ZmykpysPv7Xui2C6swS8jgoV090ZUq94BzvyHDfF5UxumAEA+bo0/7jN/
 GTMQ==
Subject: Re: synchronize with a non-atomic flag
References: 
 <CAJYFCiMix3XfQ0Z=BMUO39eNssYcVLR-Y1zHee+QT9cBsVS3KA@mail.gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a6e4d3a9-74c9-17c5-5aef-fc0ec83cfb34@gmail.com>
Date: Fri, 6 Oct 2017 21:03:44 +0900
MIME-Version: 1.0
In-Reply-To: 
 <CAJYFCiMix3XfQ0Z=BMUO39eNssYcVLR-Y1zHee+QT9cBsVS3KA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Yubin,

On 2017/10/06 14:52, Yubin Ruan wrote:
> Hi,
> I saw lots of discussions on the web about possible race when doing
> synchronization between multiple threads/processes with lock or atomic
> operations[1][2]. From my point of view most them are over-worrying.
> But I want to point out some particular issue here to see whether
> anyone have anything to say.
> 
> Imagine two processes communicate using only a uint32_t variable in
> shared memory, like this:
> 
>     // uint32_t variable in shared memory
>     uint32_t flag = 0;
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
>             printf("process 2 running...\n");
>             WRITE_ONCE(flag, 0); // let another process to run
>         } else {
>             continue;
>         }
>     }
> 
> On X86 or X64, I expect this code to run correctly, that is, I will
> got the two `printf' to printf one after one.

Well, I see only one printf() above.
Do you mean:

    //process 1
    while(1) {
        if(READ_ONCE(flag) == 0) {
            printf("process 1 running...\n");
            WRITE_ONCE(flag, 1); // let another process to run
        } else {
            continue;
        }
    }

    //process 2
    while(1) {
        if(READ_ONCE(flag) == 1) {
            printf("process 2 running...\n");
            WRITE_ONCE(flag, 0); // let another process to run
        } else {
            continue;
        }
    }

?

Then printf()s can be a problem.
It partially negates your claim 3).
Without using memory barrier, there is no guarantee that the results of
WRITE_ONCE() are visible to the other thread after the printf()'s
memory accesses complete. I/O operations in printf() might make the situation
trickier.

In a more realistic case where you do something meaningful in
do_something() in both threads:

    //process 1
    while(1) {
        if(READ_ONCE(flag) == 0) {
            do_something();
            WRITE_ONCE(flag, 1); // let another process to run
        } else {
            continue;
        }
    }

    //process 2
    while(1) {
        if(READ_ONCE(flag) == 1) {
            do_something();
            WRITE_ONCE(flag, 0); // let another process to run
        } else {
            continue;
        }
    }

and if do_something() uses some shared variables other than "flag",
you need a couple of memory barriers to ensure the ordering of
READ_ONCE(), do_something(), and WRITE_ONCE() something like:

    //process 1
    while(1) {
        if(READ_ONCE(flag) == 0) {
	    smp_rmb();
            do_something();
	    smp_wmb();
            WRITE_ONCE(flag, 1); // let another process to run
        } else {
            continue;
        }
    }

    //process 2
    while(1) {
        if(READ_ONCE(flag) == 1) {
	    smp_rmb();
            do_something();
	    smp_wmb();
            WRITE_ONCE(flag, 0); // let another process to run
        } else {
            continue;
        }
    }

In Linux kernel memory model, you can use acquire/release APIs instead:

    //process 1
    while(1) {
        if(smp_load_acquire(&flag) == 0) {
            do_something();
            smp_store_release(&flag, 1); // let another process to run
        } else {
            continue;
        }
    }

    //process 2
    while(1) {
        if(smp_load_acquire(&flag) == 1) {
            do_something();
            smp_store_release(&flag, 0); // let another process to run
        } else {
            continue;
        }
    }

The intention of the code is easier to see when you use well-defined APIs.
Just my two cents.

              Thanks, Akira

>                                                That is because:
> 
>     1) on X86/X64, load/store on 32-bits variable are atomic
>     2) I use READ_ONCE/WRITE_ONCE to prevent possibly harmful compiler
> optimization on `flag'.
>     3) I use only one variable to communicate between two processes,
> so there is no need for any kind of barrier.
> 
> Does anyone have any objection at that?
> 
> I know using a lock or atomic operation will save me a lot of
> argument, but I think those things are unnecessary at this
> circumstance, and it matter where performance matter, so I am picky
> here...
> 
> Yubin
> 
> [1]: https://software.intel.com/en-us/blogs/2013/01/06/benign-data-races-what-could-possibly-go-wrong
> [2]: https://www.usenix.org/conference/osdi10/ad-hoc-synchronization-considered-harmful
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

