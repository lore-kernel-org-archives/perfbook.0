Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc;        bh=OahLxfh446tYm4rDEGTjSBE+lC/nTAAN30u81yC+wd0=;
 b=GdMpyPjm2qYvofEm7iauhJoWdlbQ9NgsxMsInVJ65nRfm7IwXNURzcdOWZek1xucY3
 9IxEBWeUtb4NDVtbtlM0uBhBrGe7eXh/JTu0pMAUFtvI6R4N1zDumB0RCXNgRBGI0mHH
 PxJcRbV0rigGJSB8t1ZQRuoRXcYQlhlm1FPFxOJXYkafBteQ35gb3kk8QT/kbsAcomUY
 RrTXVfRWTfz/6vkAV4miEWYVwjEtFO9IeLcM06cboBBsNlNxrA1rCQlGx5T9F8rVoDLa
 Ofiwi/0M/7WyJyyE64aVZM3P6zx9iHc1Ew+xugJgLFi6QrSkTduRcFl5QLzjpVzAg8qq
 SiOQ==
MIME-Version: 1.0
In-Reply-To: <20171006191250.GH3521@linux.vnet.ibm.com>
References: 
 <CAJYFCiMix3XfQ0Z=BMUO39eNssYcVLR-Y1zHee+QT9cBsVS3KA@mail.gmail.com>
 <a6e4d3a9-74c9-17c5-5aef-fc0ec83cfb34@gmail.com>
 <CAJYFCiMCnyZnP1kCBAQfpGGd4PBkoMz5ALnkH2K2aqsmwjs+SA@mail.gmail.com>
 <20171006191250.GH3521@linux.vnet.ibm.com>
From: Yubin Ruan <ablacktshirt@gmail.com>
Date: Sat, 7 Oct 2017 15:04:50 +0800
Message-ID: 
 <CAJYFCiMni6Kz43PPKw8H2o1-Zez-Av22ub34sOOz=9sjfYSEng@mail.gmail.com>
Subject: Re: synchronize with a non-atomic flag
Content-Type: text/plain; charset="UTF-8"
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Thanks Paul and Akira,

2017-10-07 3:12 GMT+08:00 Paul E. McKenney <paulmck@linux.vnet.ibm.com>:
> On Fri, Oct 06, 2017 at 08:35:00PM +0800, Yubin Ruan wrote:
>> 2017-10-06 20:03 GMT+08:00 Akira Yokosawa <akiyks@gmail.com>:
>> > On 2017/10/06 14:52, Yubin Ruan wrote:
>
> [ . . . ]
>
>> > I/O operations in printf() might make the situation trickier.
>>
>> printf(3) is claimed to be thread-safe, so I think this issue will not
>> concern us.

so now I can pretty much confirm this.

>> > In a more realistic case where you do something meaningful in
>> > do_something() in both threads:
>> >
>> >     //process 1
>> >     while(1) {
>> >         if(READ_ONCE(flag) == 0) {
>> >             do_something();
>> >             WRITE_ONCE(flag, 1); // let another process to run
>> >         } else {
>> >             continue;
>> >         }
>> >     }
>> >
>> >     //process 2
>> >     while(1) {
>> >         if(READ_ONCE(flag) == 1) {
>> >             do_something();
>> >             WRITE_ONCE(flag, 0); // let another process to run
>> >         } else {
>> >             continue;
>> >         }
>> >     }
>
> In the Linux kernel, there is control-dependency ordering between
> the READ_ONCE(flag) and any stores in either the then-clause or
> the else-clause.  However, I see no ordering between do_something()
> and the WRITE_ONCE().

I was not aware of the "control-dependency" ordering issue in the
Linux kernel before. Is it true for all architectures?

But anyway, the ordering between READ_ONCE(flag) and any subsequent
stores are guaranteed on X86/X64, so we didn't need any memory barrier
here.

>> > and if do_something() uses some shared variables other than "flag",
>> > you need a couple of memory barriers to ensure the ordering of
>> > READ_ONCE(), do_something(), and WRITE_ONCE() something like:
>> >
>> >     //process 1
>> >     while(1) {
>> >         if(READ_ONCE(flag) == 0) {
>> >             smp_rmb();
>> >             do_something();
>> >             smp_wmb();
>> >             WRITE_ONCE(flag, 1); // let another process to run
>> >         } else {
>> >             continue;
>> >         }
>> >     }
>> >
>> >     //process 2
>> >     while(1) {
>> >         if(READ_ONCE(flag) == 1) {
>> >             smp_rmb();
>> >             do_something();
>> >             smp_wmb();
>> >             WRITE_ONCE(flag, 0); // let another process to run
>> >         } else {
>> >             continue;
>> >         }
>> >     }
>
> Here, the control dependency again orders the READ_ONCE() against later
> stores, and the smp_rmb() orders the READ_ONCE() against any later
> loads.

Understand and agree.

> The smp_wmb() orders do_something()'s writes (but not its reads!)
> against the WRITE_ONCE().

Understand and agree. But do we really need the smp_rmb() on X86/64?
As far as I know, on X86/64 stores are not reordered with other
stores...[1]

>> > In Linux kernel memory model, you can use acquire/release APIs instead:
>> >
>> >     //process 1
>> >     while(1) {
>> >         if(smp_load_acquire(&flag) == 0) {
>> >             do_something();
>> >             smp_store_release(&flag, 1); // let another process to run
>> >         } else {
>> >             continue;
>> >         }
>> >     }
>> >
>> >     //process 2
>> >     while(1) {
>> >         if(smp_load_acquire(&flag) == 1) {
>> >             do_something();
>> >             smp_store_release(&flag, 0); // let another process to run
>> >         } else {
>> >             continue;
>> >         }
>> >     }
>
> This is probably the most straightforward of the above approaches.
>
> That said, if you really want a series of things to execute in a
> particular order, why not just put them into the same process?

I will be very happy if I can. But sometimes we just have to deal with
issues concerning multiple processes...

[1]: One thing I got a little confused is that some people claim that
on x86/64 there are several guarantees[2]:
    1) Loads are not reordered with other loads.
    2) Stores are not reordered with other stores.
    3) Stores are not reordered with older loads.
(note that Loads may still be reordered with older stores to different
locations)

So, if 1) and 2) are true, why do we have "lfence" and "sfence"
instructions at all?

[2]: I found those claims here, but not so sure whether or not they
are true: https://bartoszmilewski.com/2008/11/05/who-ordered-memory-fences-on-an-x86/

