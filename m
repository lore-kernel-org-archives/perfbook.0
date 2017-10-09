Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QjTFBSKrMb6O73axbB2ppLwQp+izJU8xqAFJLpCQTbM=;
 b=F6hm0jSqexreB9C2spYrnSpOqckzJ06dJddPDpRUkas59WADbFh15LBWQnpomgZp0d
 XXCj3+V+IKc5d9keRiUxbyX5/F2VMLen/1R+zdJ389O2QNuCMqhseTfLHsNcBsEfLnzb
 9Bqiodgul/b3VslpT+hCOOcd5Z/YRXb7Hltt29/A/lGufPwGl55C9DYK21l1KZFuUI1O
 imIXDPZiVeSafxorktkHhYCam4FoMQBrIXDG1VpwxEDhmyIVEUeaBt4SeOERGgLauNMP
 GmMxVVIc/Mq1cEK3pR89l6DcRqMjWbNKjKsEI86rzSn8UYqjI1JMWjMkgI8EBiwmvlQh
 NOlQ==
Date: Mon, 9 Oct 2017 16:40:11 +0800
From: Yubin Ruan <ablacktshirt@gmail.com>
Subject: Re: synchronize with a non-atomic flag
Message-ID: <20171009084009.GA5758@HP>
References: 
 <CAJYFCiMix3XfQ0Z=BMUO39eNssYcVLR-Y1zHee+QT9cBsVS3KA@mail.gmail.com>
 <CAJYFCiMpx4Y++K2C0yWbxKO7UqNY-MOgJWRsA6hipPWQc17wxg@mail.gmail.com>
 <20171008160738.GZ3521@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171008160738.GZ3521@linux.vnet.ibm.com>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sun, Oct 08, 2017 at 09:07:38AM -0700, Paul E. McKenney wrote:
> On Sun, Oct 08, 2017 at 05:12:18PM +0800, Yubin Ruan wrote:
> > 2017-10-06 13:52 GMT+08:00 Yubin Ruan <ablacktshirt@gmail.com>:
> > > Hi,
> > > I saw lots of discussions on the web about possible race when doing
> > > synchronization between multiple threads/processes with lock or atomic
> > > operations[1][2]. From my point of view most them are over-worrying.
> > > But I want to point out some particular issue here to see whether
> > > anyone have anything to say.
> > >
> > > Imagine two processes communicate using only a uint32_t variable in
> > > shared memory, like this:
> > >
> > >     // uint32_t variable in shared memory
> > >     uint32_t flag = 0;
> > >
> > >     //process 1
> > >     while(1) {
> > >         if(READ_ONCE(flag) == 0) {
> > >             do_something();
> > >             WRITE_ONCE(flag, 1); // let another process to run
> > >         } else {
> > >             continue;
> > >         }
> > >     }
> > >
> > >     //process 2
> > >     while(1) {
> > >         if(READ_ONCE(flag) == 1) {
> > >             printf("process 2 running...\n");
> > >             WRITE_ONCE(flag, 0); // let another process to run
> > >         } else {
> > >             continue;
> > >         }
> > >     }
> > >
> > > On X86 or X64, I expect this code to run correctly, that is, I will
> > > got the two `printf' to printf one after one. That is because:
> > >
> > >     1) on X86/X64, load/store on 32-bits variable are atomic
> > 
> > Ah...this assumption is wrong at the first place. Atomic access on
> > 4-bytes integers is guaranteed only when these integer is aligned on a
> > 4-bytes memory address boundary...
> 
> Indeed, accesses crossing cachelines normally won't guarantee you
> much of anything other than painful debugging sessions.  ;-) 

I see similar interfaces in the Linux kernel source[1]:

	#define atomic_set(v, i)	((v)->counter = (i))
	#define atomic_read(v)	((v)->counter)

which set and read 'atomically' from a atomic variable, and by `atomic', they
simply mean:

    The setting is atomic in that the return values of the atomic operations by
    all threads are guaranteed to be correct reflecting either the value that
    has been set with this operation or set with another operation.

    The read is atomic in that the return value is guaranteed to be one of the
    values initialized or modified with the interface operations if a proper
    implicit or explicit memory barrier is used after possible runtime
    initialization by any other thread and the value is modified only with the
    interface operations.
(but still, the compare-and-swap operations still involve lock)

Are those operations atomic because the `atomic_t' is defined as a struct

	typedef struct { int counter; } atomic_t;

and therefore proper alignment and atomic attribute is guaranteed by the
compiler and the CPU? If I do something like this:

    atomic_t v = ATOMIC_INIT(0); // globally visible

    atomic_set(&v, 1); //process 1

    atomic_set(&v, 2); //process 2

    int i = atomic_read(&v); // process 3

will process 3 see any intermediate value between 1 and 2?

Yubin

[1]: Documentation/core-api/atomic_ops.rst

