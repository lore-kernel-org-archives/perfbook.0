Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qfb4r5m1qZ6m3U2jQGORSK8CeiaQMzpoOuP27NJjlAM=;
        b=OPoqO2Fkt52IPmefv57oubAenUmnBZyyg+nO4LoZvCEujgJd6dqmT8V6IyoMjn/CzO
         PwqIl0R3l06M40mgKGZTNZCNBSiAOICO+zFdDV0jRi60LsiQc45u9i8jNNxeV8Hkt5k9
         H6R/BD5kuJkRXcedBflIWG+/BQpsv3dalfIJd0/NiyNJRYBg4AvaBAYGgQ8xv5AeOxhL
         S0NsXSoV0QiDYHJ0522MkFQJwys2hzmVCejKFuI2jTJVtYpqT12X8Ch9G97w65iD4tz/
         cHGqUh1b1gagtlSIiVA8er7j3cMt7sUgYEVZESxWJKW/WDgpFIT+zYhdc5MfOt9TQmGm
         A20w==
MIME-Version: 1.0
References: <daa12711-177f-6f25-09c4-841751365a8f@gmail.com> <20181210201752.GA4170@linux.ibm.com>
In-Reply-To: <20181210201752.GA4170@linux.ibm.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Tue, 11 Dec 2018 09:35:28 +0800
Message-ID: <CABoNC82Da62aT3mVZZLhTMsnA5eTEx2--Kh2WZbqZrv=YAyoiA@mail.gmail.com>
Subject: Re: Definition of cmpxchg()
Content-Type: text/plain; charset="UTF-8"
To: Paul McKenney <paulmck@linux.ibm.com>, Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Tue, Dec 11, 2018 at 4:17 AM Paul E. McKenney <paulmck@linux.ibm.com> wrote:
>
> On Tue, Dec 11, 2018 at 12:29:08AM +0900, Akira Yokosawa wrote:
> > Hi Paul and Junchang,
> >
> > This is a continuation of the discussion on the definition of
> > cmpxchg() in CodeSamples/api-pthreads/api-gcc.h.
> >
> > Current definition is as follows:
> >
> > #define cmpxchg(ptr, o, n) \
> > ({ \
> >       typeof(*ptr) _____actual = (o); \
> >       \
> >       __atomic_compare_exchange_n(ptr, (void *)&_____actual, (n), 1, \
> >                       __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST) ? (o) : (o)+1; \
> > })
> >
> > As was already pointed out by Paul, this definition has potential issue
> > when an argument with side-effect is given to "o". Also, (o)+1 can overflow.
> >
> > As a matter of fact, there is another definition of cmpxchg() in
> > CodeSamples/formal/litmus/api.h. Currently it is defined as follows:
> >
> > #define cmpxchg(x, o, n) ({ \
> >       typeof(o) __old = (o); \
> >       __atomic_compare_exchange_n((x), &__old, (n), 1, __ATOMIC_SEQ_CST, __ATOMIC_RELAXED); \
> >       __old; \
> > })
> >
> > Apparently, this definition is not good on PPC or ARM.
> >
> > Following is a simple litmus test of cmpxchg() (to be executed by litmus7):
> > --------------------------------------------
> > C C-cmpxchg
> > {
> > }
> >
> > {
> > #include "api.h"
> > }
> >
> > P0(int *x)
> > {
> >       int r1;
> >
> >       r1 = cmpxchg(x, 1, 2);
> > }
> >
> > P1(int *x)
> > {
> >       int r1;
> >
> >       r1 = cmpxchg(x, 0, 1);
> > }
> >
> > locations [1:r1]
> > exists (0:r1=1 /\ ~x=2)
> > ---------------------------------
> >
> > Testing on PPC with the current api.h yields the following:
> > ---------------------------------
> > Test C-cmpxchg Allowed
> > Histogram (4 states)
> > 2789  :>0:r1=0; 1:r1=0; x=0;
> > 50452053:>0:r1=0; 1:r1=0; x=1;
> > 36003 *>0:r1=1; 1:r1=0; x=1;
> > 49509155:>0:r1=1; 1:r1=0; x=2;
> > Ok
> >
> > Witnesses
> > Positive: 36003, Negative: 99963997
> > Condition exists (0:r1=1 /\ not (x=2)) is validated
> > Hash=3f625d680407ff822fb56f1a80834291
> > Observation C-cmpxchg Sometimes 36003 99963997
> > Time C-cmpxchg 43.37
> > ----------------------------------
> >
> > If we change the definition to suppress spurious failure in
> > __atomic_compare_exchange_n(), i.e.:
> >
> > #define cmpxchg(x, o, n) ({ \
> >       typeof(o) __old = (o); \
> >       __atomic_compare_exchange_n((x), &__old, (n), 0, __ATOMIC_SEQ_CST, __ATOMIC_RELAXED); \
> >       __old; \
> > })
> >
> > , litmus7 yields the following:
> > ----------------------------------
> > Test C-cmpxchg Allowed
> > Histogram (2 states)
> > 50766497:>0:r1=0; 1:r1=0; x=1;
> > 49233503:>0:r1=1; 1:r1=0; x=2;
> > No
> >
> > Witnesses
> > Positive: 0, Negative: 100000000
> > Condition exists (0:r1=1 /\ not (x=2)) is NOT validated
> > Hash=3f625d680407ff822fb56f1a80834291
> > Observation C-cmpxchg Never 0 100000000
> > Time C-cmpxchg 35.20
> > ----------------------------------
> >
> > This matches what herd7 says (with the 2nd pair of {} removed):
> > ----------------------------------
> > Test C-cmpxchg Allowed
> > States 2
> > 0:r1=0; 1:r1=0; x=1;
> > 0:r1=1; 1:r1=0; x=2;
> > No
> > Witnesses
> > Positive: 0 Negative: 2
> > Condition exists (0:r1=1 /\ not (x=2))
> > Observation C-cmpxchg Never 0 2
> > Time C-cmpxchg 0.01
> > Hash=1720691890ea69e35615997626680d6f
> > ----------------------------------
> >
> > Also, klitmus7 on PPC says:
> > ----------------------------------
> > Test C-cmpxchg Allowed
> > Histogram (2 states)
> > 2019624 :>0:r1=0; 1:r1=0; x=1;
> > 1980376 :>0:r1=1; 1:r1=0; x=2;
> > No
> >
> > Witnesses
> > Positive: 0, Negative: 4000000
> > Condition exists (0:r1=1 /\ not (x=2)) is NOT validated
> > Hash=1720691890ea69e35615997626680d6f
> > Observation C-cmpxchg Never 0 4000000
> > Time C-cmpxchg 0.76
> > ----------------------------------
> >
> > If we use the definition in api-gcc.h, litmus7 says:
> > ----------------------------------
> > Test C-cmpxchg Allowed
> > Histogram (3 states)
> > 11388 :>0:r1=2; 1:r1=1; x=0;
> > 50373528:>0:r1=2; 1:r1=0; x=1;
> > 49615084:>0:r1=1; 1:r1=0; x=2;
> > No
> >
> > Witnesses
> > Positive: 0, Negative: 100000000
> > Condition exists (0:r1=1 /\ not (x=2)) is NOT validated
> > Hash=3f625d680407ff822fb56f1a80834291
> > Observation C-cmpxchg Never 0 100000000
> > Time C-cmpxchg 52.06
> > ----------------------------------
> > The result is still "Never", but the statistics look quite different.
> > There is no "0:r1=0" observed!
> >
> > So, at least for litmus test, cmpxchg() should be defined as follows:
> >
> > #define cmpxchg(x, o, n) ({ \
> >       typeof(o) __old = (o); \
> >       __atomic_compare_exchange_n((x), &__old, (n), 0, __ATOMIC_SEQ_CST, __ATOMIC_RELAXED); \
> >       __old; \
> > })
> >
> > If this is the way to go, I think the definition in api-gcc.h should
> > be the same way for consistency, even if it would cause a little
> > performance degradation. Then there would be no worry about overflows.
>
> Makes sense to me!  Longer term, it would be good to characterize
> weak mode, but having things work is a very good thing.  ;-)
>
>                                                         Thanx, Paul
>

Hi Akira,

Thanks for the detailed analysis. It a very interesting topic.

For correctness, I agree with you on adopting strong variation in
__atomic_compare_exchange_n. But for long-term, the following is my
thinking, please take a look.

For the current implementation (the one in api-gcc.h), the issue of
the side-effect in argument (o) could be removed by adding one another
local variable. The following is one example (It diagrams the idea,
though I didn't test the code yet. But I can test it this night.)

#define cmpxchg(ptr, o, n) \
({ \
        typeof(*ptr) _____actual = (o); \
        typeof(*ptr) __old = _____actual; \
        __atomic_compare_exchange_n(ptr, (void *)&_____actual, (n), 1, \
                        __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST) ? __old : __old+1; \
})

The reason that I stick to enabling weak variation on PPC and ARM is
that it gives us about 10% performance improvement when we ran
count_lim_atomic on a PPC server. When I was trying to collect some
performance data of stress tests, this 10% benefit really means a lot.
For the overflow issue, maybe we can figure out some better ways.
Please let me know what do you think. :-)

Regards,
--Junchang

