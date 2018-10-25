Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=omDhjssk5rqclcXhkzoq6lG+MppBjaluDlcI4YagaZw=;
        b=REXA+mOfHuo415pMTBMkt2WhWkUHGHh+6w3CF+Yx+IOc/Na+BxLYy7uARZRCAgn+P2
         9WIe9J0CXsX9eVg1KHPrX2Vh0bJeBgP9x9KUhFrGz1/BUDBL9SI9SbKTH7Hz0SY9Vua/
         ha/bsM4hHAJnK7zLVNC0Vq3CgSeQolFHlxbU6nqyy2ZFVxsHlXXWEICsYUgmCOPzFxXr
         MvnpsTk76/La5G5xLh0Pyn/AKBHLd2AfazXIAktS7J6HmGIEEPz4ZV8yr7l90NxfHWiA
         X0pFp7kBpHa7Kav2tH9pk0jKEqdtjfO+dr6goDrZOP516jFHvKDyKseCotUBDN8psuxp
         NE+g==
MIME-Version: 1.0
References: <d6abdc9c-9d0e-9435-05be-85a4fe9d3347@gmail.com>
 <20181020163648.GA2674@linux.ibm.com> <CABoNC80CeE8XsQMHAO-GrSuUQ86z7Z6frm04XUWNbxWtkmKsNA@mail.gmail.com>
 <073797d5-67f7-7426-f895-8004428a84ab@gmail.com>
In-Reply-To: <073797d5-67f7-7426-f895-8004428a84ab@gmail.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Thu, 25 Oct 2018 10:11:18 +0800
Message-ID: <CABoNC828mNgvvqcUm65d+PFdBVB1Pp6FzEyXniPbxo-dUeLxpw@mail.gmail.com>
Subject: Re: [Possible BUG] count_lim_atomic.c fails on POWER8
Content-Type: text/plain; charset="UTF-8"
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Paul McKenney <paulmck@linux.ibm.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Akira,

Thanks for the mail. My understanding is that PPC uses LL/SC to
emulate CAS by using a tiny loop. Unfortunately, the LL/SC loop itself
could fail (due to, for example, context switches) even if *ptr equals
to old. In such a case, a CAS instruction in actually should return a
success. I think this is what the term "spurious fail" describes. Here
is a reference:
http://liblfds.org/mediawiki/index.php?title=Article:CAS_and_LL/SC_Implementation_Details_by_Processor_family

It seems that __atomic_compare_exchange_n() provides option "weak" for
performance. I tested these two solutions and got the following
results:

                           1      4      8     16     32    64
my patch (ns)     35    34    37    73    142  281
strong (ns)          39    39    41    79    158  313

I tested the performance of count_lim_atomic by varying the number of
updaters (./count_lim_atomic N uperf) on a 8-core PPC server. The
first row in the table is the result when my patch is used, and the
second row is the result when the 4th argument of the function is set
to false(0). It seems performance improves slightly if option "weak"
is used. However, there is no performance boost as we expected. So
your solution sounds good if safety is one major concern because
option "weak" seems risky to me :-)

Another interesting observation is that the performance of LL/SC-based
CAS instruction deteriorates dramatically when the number of working
threads exceeds the number of CPU cores.


Thanks,
--Junchang


On Thu, Oct 25, 2018 at 6:05 AM Akira Yokosawa <akiyks@gmail.com> wrote:
>
> On 2018/10/24 23:53:29 +0800, Junchang Wang wrote:
> > Hi Akira and Paul,
> >
> > I checked the code today and the implementation of cmpxchg() looks
> > very suspicious to me; Current  cmpxchg() first executes function
> > __atomic_compare_exchange_n, and then checks whether the value stored
> > in field __actual (old) has been changed to decide if the CAS
> > instruction has been successfully performed. However, I saw the *weak*
> > field is set, which, as far as I know, means
> > __atomic_compare_exchange_n could fail even if the value of *ptr is
> > equal to __actual (old). Unfortunately, current cmpxchg will treat
> > this case as a success because the value of __actual(old) does not
> > change.
>
> Thanks for looking into this!
>
> I also suspected the use of "weak" semantics of
> __atomic_compare_exchange_n(), but did not quite understand what
> "spurious fail" actually means. Your theory sounds plausible to me.
>
> I've suggested in a private email to Paul to modify the 4th argument
> to false(0) as a workaround, which would prevent such "spurious fail".
>
> Both approaches looks good to me. I'd defer to Paul on the choice.
>
>         Thanks, Akira
>
> >
> > This bug happens in both Power8 and ARMv8. It seems it affects
> > architectures that use LL/SC to emulate CAS. Following patch helps
> > solve this issue on my testbeds. Please take a look. Any thoughts?
> >
> > ---
> >  CodeSamples/api-pthreads/api-gcc.h | 8 +++-----
> >  1 file changed, 3 insertions(+), 5 deletions(-)
> >
> > diff --git a/CodeSamples/api-pthreads/api-gcc.h
> > b/CodeSamples/api-pthreads/api-gcc.h
> > index 1dd26ca..38a16c0 100644
> > --- a/CodeSamples/api-pthreads/api-gcc.h
> > +++ b/CodeSamples/api-pthreads/api-gcc.h
> > @@ -166,11 +166,9 @@ struct __xchg_dummy {
> >
> >  #define cmpxchg(ptr, o, n) \
> >  ({ \
> > -       typeof(*ptr) _____actual = (o); \
> > -       \
> > -       (void)__atomic_compare_exchange_n(ptr, (void *)&_____actual, (n), 1, \
> > -                                         __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST); \
> > -       _____actual; \
> > +       typeof(*ptr) old = (o); \
> > +       (__atomic_compare_exchange_n(ptr, (void *)&old, (n), 1,
> > __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST))? \
> > +                               (o) : (n); \
> >  })
> >
> >  static __inline__ int atomic_cmpxchg(atomic_t *v, int old, int new)
> >
>

