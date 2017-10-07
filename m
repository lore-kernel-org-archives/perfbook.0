Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cNsqw2pYezyXsHeTy5c+Y5qfrGufhjzFroXA2J2IZCk=;
 b=V8M7kToT12CZ/KrObgAcOknTXqNPmjJEDAFxU12iT021189UpDE9U8sNqn5Dyao8x9
 rpIyMy6lbFOnEN7FLYZPv56G0qEs76sKQe6I9UHA2lxDWyoM0GEE1QC05857hQ/eF3OS
 aVzpFvhIHb9u2XKH1HGDTG4zBb6/jp+ueEsZXg+sYZZzczubK3XunlGEE9iWuu3dWPha
 kvK/eY9c0Dp4BNZhag6kyEe/UcnoO1HGfrWkmrBGfT1vHXHkpjdzuftBIca7rpj82FLr
 oY5Fq3VPvyxhm7hYNOqaKijYILIJP5XidPlv4gKcvaYSiz3vSUZyZ1npX39eDL+Nuuf1
 U0HQ==
MIME-Version: 1.0
In-Reply-To: <edfed509-278e-0a15-579c-f527acc988ec@gmail.com>
References: 
 <CAJYFCiMix3XfQ0Z=BMUO39eNssYcVLR-Y1zHee+QT9cBsVS3KA@mail.gmail.com>
 <a6e4d3a9-74c9-17c5-5aef-fc0ec83cfb34@gmail.com>
 <CAJYFCiMCnyZnP1kCBAQfpGGd4PBkoMz5ALnkH2K2aqsmwjs+SA@mail.gmail.com>
 <20171006191250.GH3521@linux.vnet.ibm.com>
 <CAJYFCiMni6Kz43PPKw8H2o1-Zez-Av22ub34sOOz=9sjfYSEng@mail.gmail.com>
 <edfed509-278e-0a15-579c-f527acc988ec@gmail.com>
From: Yubin Ruan <ablacktshirt@gmail.com>
Date: Sat, 7 Oct 2017 21:43:53 +0800
Message-ID: 
 <CAJYFCiMfy-23Wts3m80Qr10H1uL1NpykG0zM8wpK8gziBZh7hQ@mail.gmail.com>
Subject: Re: synchronize with a non-atomic flag
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

2017-10-07 19:40 GMT+08:00 Akira Yokosawa <akiyks@gmail.com>:
> On 2017/10/07 15:04:50 +0800, Yubin Ruan wrote:
>> Thanks Paul and Akira,
>>
>> 2017-10-07 3:12 GMT+08:00 Paul E. McKenney <paulmck@linux.vnet.ibm.com>:
>>> On Fri, Oct 06, 2017 at 08:35:00PM +0800, Yubin Ruan wrote:
>>>> 2017-10-06 20:03 GMT+08:00 Akira Yokosawa <akiyks@gmail.com>:
>>>>> On 2017/10/06 14:52, Yubin Ruan wrote:
>>>
>>> [ . . . ]
>>>
>>>>> I/O operations in printf() might make the situation trickier.
>>>>
>>>> printf(3) is claimed to be thread-safe, so I think this issue will not
>>>> concern us.
>>
>> so now I can pretty much confirm this.
>
> Yes. Now I recognize that POSIX.1c requires stdio functions to be MT-safe=
.
> By MT-safe, one call to printf() won't be disturbed by other racy functio=
n
> calls involving output to stdout.
>
> I was disturbed by the following description of MT-Safe in attributes(7)
> man page:
>
>     Being MT-Safe does not imply a function is atomic, nor  that  it
>     uses  any of the memory synchronization mechanisms POSIX exposes
>     to users. [...]
>
> Excerpt from a white paper at http://www.unix.org/whitepapers/reentrant.h=
tml:
>
>     The POSIX.1 and C-language functions that operate on character stream=
s
>     (represented by pointers to objects of type FILE) are required by POS=
IX.1c
>     to be implemented in such a way that reentrancy is achieved (see ISO/=
IEC
>     9945:1-1996, =C2=A78.2). This requirement has a drawback; it imposes
>     substantial performance penalties because of the synchronization that
>     must be built into the implementations of the functions for the sake =
of
>     reentrancy. [...]
>
> Yubin, thank you for giving me the chance to realize this.
>
>>
>>>>> In a more realistic case where you do something meaningful in
>>>>> do_something() in both threads:
>>>>>
>>>>>     //process 1
>>>>>     while(1) {
>>>>>         if(READ_ONCE(flag) =3D=3D 0) {
>>>>>             do_something();
>>>>>             WRITE_ONCE(flag, 1); // let another process to run
>>>>>         } else {
>>>>>             continue;
>>>>>         }
>>>>>     }
>>>>>
>>>>>     //process 2
>>>>>     while(1) {
>>>>>         if(READ_ONCE(flag) =3D=3D 1) {
>>>>>             do_something();
>>>>>             WRITE_ONCE(flag, 0); // let another process to run
>>>>>         } else {
>>>>>             continue;
>>>>>         }
>>>>>     }
>>>
>>> In the Linux kernel, there is control-dependency ordering between
>>> the READ_ONCE(flag) and any stores in either the then-clause or
>>> the else-clause.  However, I see no ordering between do_something()
>>> and the WRITE_ONCE().
>>
>> I was not aware of the "control-dependency" ordering issue in the
>> Linux kernel before. Is it true for all architectures?
>>
>> But anyway, the ordering between READ_ONCE(flag) and any subsequent
>> stores are guaranteed on X86/X64, so we didn't need any memory barrier
>> here.
>>
>>>>> and if do_something() uses some shared variables other than "flag",
>>>>> you need a couple of memory barriers to ensure the ordering of
>>>>> READ_ONCE(), do_something(), and WRITE_ONCE() something like:
>>>>>
>>>>>     //process 1
>>>>>     while(1) {
>>>>>         if(READ_ONCE(flag) =3D=3D 0) {
>>>>>             smp_rmb();
>>>>>             do_something();
>>>>>             smp_wmb();
>>>>>             WRITE_ONCE(flag, 1); // let another process to run
>>>>>         } else {
>>>>>             continue;
>>>>>         }
>>>>>     }
>>>>>
>>>>>     //process 2
>>>>>     while(1) {
>>>>>         if(READ_ONCE(flag) =3D=3D 1) {
>>>>>             smp_rmb();
>>>>>             do_something();
>>>>>             smp_wmb();
>>>>>             WRITE_ONCE(flag, 0); // let another process to run
>>>>>         } else {
>>>>>             continue;
>>>>>         }
>>>>>     }
>>>
>>> Here, the control dependency again orders the READ_ONCE() against later
>>> stores, and the smp_rmb() orders the READ_ONCE() against any later
>>> loads.
>>
>> Understand and agree.
>>
>>> The smp_wmb() orders do_something()'s writes (but not its reads!)
>>> against the WRITE_ONCE().
>>
>> Understand and agree. But do we really need the smp_rmb() on X86/64?
>> As far as I know, on X86/64 stores are not reordered with other
>> stores...[1]
>>
>>>>> In Linux kernel memory model, you can use acquire/release APIs instea=
d:
>>>>>
>>>>>     //process 1
>>>>>     while(1) {
>>>>>         if(smp_load_acquire(&flag) =3D=3D 0) {
>>>>>             do_something();
>>>>>             smp_store_release(&flag, 1); // let another process to ru=
n
>>>>>         } else {
>>>>>             continue;
>>>>>         }
>>>>>     }
>>>>>
>>>>>     //process 2
>>>>>     while(1) {
>>>>>         if(smp_load_acquire(&flag) =3D=3D 1) {
>>>>>             do_something();
>>>>>             smp_store_release(&flag, 0); // let another process to ru=
n
>>>>>         } else {
>>>>>             continue;
>>>>>         }
>>>>>     }
>>>
>>> This is probably the most straightforward of the above approaches.
>>>
>>> That said, if you really want a series of things to execute in a
>>> particular order, why not just put them into the same process?
>>
>> I will be very happy if I can. But sometimes we just have to deal with
>> issues concerning multiple processes...
>>
>> [1]: One thing I got a little confused is that some people claim that
>> on x86/64 there are several guarantees[2]:
>>     1) Loads are not reordered with other loads.
>>     2) Stores are not reordered with other stores.
>>     3) Stores are not reordered with older loads.
>> (note that Loads may still be reordered with older stores to different
>> locations)
>>
>> So, if 1) and 2) are true, why do we have "lfence" and "sfence"
>> instructions at all?
>
> Excerpt from Intel 64 and IA-32 Architectures Developer's Manual: Vol. 3A
> Section 8.2.5
>
>     [...] Despite the fact that Pentium 4, Intel Xeon, and P6 family
>     processors support processor ordering, Intel does not guarantee
>     that future processors will support this model. To make software
>     portable to future processors, it is recommended that operating syste=
ms
>     provide critical region and resource control constructs and API's
>     (application program interfaces) based on I/O, locking, and/or
>     serializing instructions be used to synchronize access to shared
>     areas of memory in multiple-processor systems. [...]
>
> So the answer seems "to make software portable to future processors".

Hmm...so currently these instructions are nops effectively?

Yubin

>
>>
>> [2]: I found those claims here, but not so sure whether or not they
>> are true: https://bartoszmilewski.com/2008/11/05/who-ordered-memory-fenc=
es-on-an-x86/
>>
>

