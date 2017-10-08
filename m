Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=JSXJmLEZ4MtWvh5kcPIdg2u/+8FwzitLGe60SoJK7Gw=;
 b=QEwB6pORoSZwe8JUksSFQfr+xtYe24TOnOCMJdZHtP53+zDWBVMeQW/YaS+H1k8JPB
 mB5O2FouNU6RECJD2qyFyXuT1s+73Mcenly0Wu6JAavSzL2ineK6z0nv0Kg9g2woaDX3
 mI2kzs0rCEuCqXKH9lqU20Qu/ss604AoYj26UMP/KgenTXYZDUj8GBwvxgIA1oxxvPuQ
 v+MLy2hokTwioCn25ynNvHaE51ZXsx247H0KCUmM8/+P/d0SlUwFjKU1S2iAp0V2+VYm
 0QGtXRv6iv7evripy9nOtvHEE/T7oaibn0c0qSD478Cp7HYMiY1qJD/iARjrWTlMArW6
 hprg==
MIME-Version: 1.0
In-Reply-To: 
 <CAJYFCiMix3XfQ0Z=BMUO39eNssYcVLR-Y1zHee+QT9cBsVS3KA@mail.gmail.com>
References: 
 <CAJYFCiMix3XfQ0Z=BMUO39eNssYcVLR-Y1zHee+QT9cBsVS3KA@mail.gmail.com>
From: Yubin Ruan <ablacktshirt@gmail.com>
Date: Sun, 8 Oct 2017 17:12:18 +0800
Message-ID: 
 <CAJYFCiMpx4Y++K2C0yWbxKO7UqNY-MOgJWRsA6hipPWQc17wxg@mail.gmail.com>
Subject: Re: synchronize with a non-atomic flag
Content-Type: text/plain; charset="UTF-8"
To: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
List-ID: <perfbook.vger.kernel.org>

2017-10-06 13:52 GMT+08:00 Yubin Ruan <ablacktshirt@gmail.com>:
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
> got the two `printf' to printf one after one. That is because:
>
>     1) on X86/X64, load/store on 32-bits variable are atomic

Ah...this assumption is wrong at the first place. Atomic access on
4-bytes integers is guaranteed only when these integer is aligned on a
4-bytes memory address boundary...

Yubin

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

