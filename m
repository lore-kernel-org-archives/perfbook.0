Return-Path: <e2lahav@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oRUvmnWQJXXmTH+yWunM58RLBSZXW3Bg6u7ilBL78QM=;
        b=BDpyiKtYQ1eR5wYV63D6C7jBrCtVuJECkteZ4XwutTfEwTmnnMCZ8p2wrgl58LyPSC
         mwcxOv/7Uq7yLCBHPw8jY+xM84q3icadRt8zDkJJXK64Qo0rqkk6qORHmUCjzWutQgtK
         w0W7AUV4ikbdm3UkeFA1FrE69UAw70bYHG8tmgqHfDKSXeGDeRFqekiDj6mTxNixAXca
         7rsUc1t/SS1feggd56Sl5Q7K0UIA89/LJ3oMoImvGzPLgkAiQu4Yl3I8Te4GvEjlfbFH
         yRQgDzIkozg3QmEwklqMKUh/nPQ6654FoWR6ASRZK2JWggYErpfFS7HIWDjDDX4K4MhD
         7gcQ==
MIME-Version: 1.0
References: <CAJbg=FWZhjXARBNou6XZ55fdvRsgABR19p8pytYB+SrKFtwWxQ@mail.gmail.com>
 <20190427174534.GS3923@linux.ibm.com> <CAJbg=FXhWBMgHenuaBya5iCLbbxZh1US73WBHewcXEQQdb-T-A@mail.gmail.com>
 <20190428061105.GF3923@linux.ibm.com>
In-Reply-To: <20190428061105.GF3923@linux.ibm.com>
From: Elad Lahav <e2lahav@gmail.com>
Date: Mon, 29 Apr 2019 06:51:24 -0400
Message-ID: <CAJbg=FVYYjHWpQTcYhBvHE=v8iHYou-bfN9v7NB52+5+4t3CbQ@mail.gmail.com>
Subject: Re: Cost of atomic operations on new hardware
Content-Type: text/plain; charset="UTF-8"
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

Looks good, but the point I was trying to make is a bit more explicit:
with better optimizations for the "normal" stream of execution come an
increase in the relative cost for the "abnormal" cases. We can
therefore expect (at least in the short term) that the penalty for
atomic operations, cache misses, memory barriers and exceptions will
keep rising.
Working on a microkernel-based OS with 2018/2019 hardware has made
this woefully clear.

--Elad

On Sun, 28 Apr 2019 at 02:11, Paul E. McKenney <paulmck@linux.ibm.com> wrote:
>
> On Sat, Apr 27, 2019 at 04:24:36PM -0400, Elad Lahav wrote:
> > Hi Paul,
> >
> > Here's a quick-n-dirty experiment I have just tried.
> > The following code performs some integer arithmetic. The inc_by_one()
> > function can be toggled between a simple increment instruction and an
> > atomic version:
> >
> > #include <stdio.h>
> > #include <stdlib.h>
> > #include <time.h>
> >
> > static inline void
> > inc_by_one(int * const p)
> > {
> > #ifdef USE_ATOMIC
> >     __sync_fetch_and_add(p, 1);
> > #else
> >     (*p)++;
> > #endif
> > }
> >
> > static int
> > do_calc(int x)
> > {
> >     x <<= 2;
> >     x /= 17;
> >     inc_by_one(&x);
> >     x *= 5;
> >     x -= 31;
> >     x >>= 1;
> >     return x;
> > }
> >
> > int
> > main(int argc, char **argv)
> > {
> >     int x = rand();
> >
> >     struct timespec ts_start;
> >     clock_gettime(CLOCK_MONOTONIC, &ts_start);
> >
> >     for (int i = 0; i < 10000000; i++) {
> >         x = do_calc(x);
> >     }
> >
> >     struct timespec ts_end;
> >     clock_gettime(CLOCK_MONOTONIC, &ts_end);
> >
> >     printf("x=%d\n", x);
> >
> >     time_t const start_ms = ts_start.tv_sec * 1000 + ts_start.tv_nsec / 1000000;
> >     time_t const end_ms = ts_end.tv_sec * 1000 + ts_end.tv_nsec / 1000000;
> >
> >     printf("Calculation took %ldms\n", end_ms - start_ms);
> >     return 0;
> > }
> >
> > (The use of rand() at the beginning is just to ensure the compiler
> > doesn't figure out the result, so I didn't bother seeding the PRNG).
> > I compiled both versions for the aarch64 architecture. Disassembling
> > the code shows that it indeed performs the calculations as expected.
> >
> > Non-atomic version:
> > ...
> >   44:    531e7661     lsl    w1, w19, #2
> >   48:    71000442     subs    w2, w2, #0x1
> >   4c:    9b237c20     smull    x0, w1, w3
> >   50:    9363fc00     asr    x0, x0, #35
> >   54:    4b817c00     sub    w0, w0, w1, asr #31
> >   58:    11000400     add    w0, w0, #0x1
> >   5c:    0b000800     add    w0, w0, w0, lsl #2
> >   60:    51007c01     sub    w1, w0, #0x1f
> >   64:    13017c33     asr    w19, w1, #1
> > ...
> >
> > Atomic version:
> > ...
> >   48:    531e7660     lsl    w0, w19, #2
> >   4c:    9b247c01     smull    x1, w0, w4
> >   50:    9363fc21     asr    x1, x1, #35
> >   54:    4b807c20     sub    w0, w1, w0, asr #31
> >   58:    b90027a0     str    w0, [x29,#36]
> >   5c:    885f7c60     ldxr    w0, [x3]
> >   60:    11000400     add    w0, w0, #0x1
> >   64:    8801fc60     stlxr    w1, w0, [x3]
> >   68:    35ffffa1     cbnz    w1, 5c <main+0x5c>
> >   6c:    d5033bbf     dmb    ish
> >   70:    b94027a0     ldr    w0, [x29,#36]
> >   74:    71000442     subs    w2, w2, #0x1
> >   78:    0b000800     add    w0, w0, w0, lsl #2
> >   7c:    51007c00     sub    w0, w0, #0x1f
> >   80:    13017c13     asr    w19, w0, #1
> > ...
> >
> > I then ran the program on a dual-cluster machine, once on the older
> > and simpler A53 core and once on the newer A72 core.
> >
> > Non-atomic version:
> > # on -C 0 /tmp/atomic_cost
> > x=-28
> > Calculation took 116ms
> > # on -C 4 /tmp/atomic_cost
> > x=-28
> > Calculation took 75ms
> >
> > Atomic version:
> > # on -C 0 /tmp/atomic_cost
> > x=-28
> > Calculation took 283ms
> >
> > # on -C 4 /tmp/atomic_cost
> > x=-28
> > Calculation took 364ms
> >
> > I was actually expecting the results to only be worse on the A72 core
> > in the relative sense (i.e., higher penalty but still faster). The
> > fact that the test took longer to complete on the A72 core shows that
> > the situation is even worse than I had expected, which may be due to
> > the barrier.
>
> Interesting, and thank you very much for running this test!
>
> It looks like the compiler did some optimization, given that there is
> only the one dmb in the loop.  So the relative performance of atomics
> and normal instructions will be varying across CPU families as well
> as over time.  Which should not be a surprise.  But comparing and
> contrasting CPU families at that level of detail could result in all
> sorts of interesting issues that I would prefer to avoid.  ;-)
>
> It might be possible to make some sort of general comparison.  But how
> about the following, which simply notes the possibility of hardware
> optimizations?
>
>         In contrast, when executing a non-atomic operation, the
>         CPU can load values from cachelines as they appear and
>         place the results in the store buffer, without the need to
>         wait for cacheline ownership. Although there are a number of
>         hardware optimizations that can sometimes hide cache latencies,
>         the resulting effect on performance is all too often as
>         depicted in Figure 3.5.
>
> I have a prototype commit to this effect, with your Reported-by.
> Thank you again for testing this!
>
>                                                         Thanx, Paul
>
> > --Elad
> >
> > On Sat, 27 Apr 2019 at 13:45, Paul E. McKenney <paulmck@linux.ibm.com> wrote:
> > >
> > > On Fri, Apr 26, 2019 at 07:06:10AM -0400, Elad Lahav wrote:
> > > > Hello,
> > > >
> > > > Section 3.1.3 contains the following statement:
> > > >
> > > > "Fortunately, CPU designers have focused heavily on atomic operations,
> > > > so that as of early 2014 they have greatly reduced their overhead."
> > > >
> > > > My experience with very recent hardware is that the *relative* cost of
> > > > atomic operations has actually increased significantly. It seems that
> > > > hardware designers, in their attempt to optimize performance for
> > > > certain workloads, have produced hardware in which the "anomalous"
> > > > conditions (atomic operations, cache misses, barriers, exceptions)
> > > > incur much higher penalties than in the past. I assume that this is
> > > > primarily the result of more intensive speculation and prediction.
> > >
> > > Some of the early 2000s systems had -really- atomic operations, but I
> > > have not kept close track since 2014.
> > >
> > > How would you suggest that this be measured?  Do you have access to
> > > a range of hardweare that would permit us to include something more
> > > definite and measurable?
> > >
> > >                                                         Thanx, Paul
> > >
> >
>

