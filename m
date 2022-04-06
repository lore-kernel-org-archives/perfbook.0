Return-Path: <SRS0=02dP=UQ=gmail.com=haolee.swjtu@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WCJRb9O3yFyZsWZLaK6reTJBVvds841/H4xZAeLipcc=;
        b=dtwj0+/DKBoWxLB0bvXkft5EOiaaQvGljWPxZrFpg5V1MtqqoSFLuMl+KngUZ/06rl
         KLYcqCR3fkpeRhn/Cy8ICv/rweaFlY02YwHfsaUV5duv6bvdroZJ5YcH0iGzOI78DJcQ
         uVQLC3+eFDdOduUaKnmFFfELa88eQ9eaVig+pNlElZqKvjiM6Akt/YG+e/j5LRcD3z0x
         W83NiTG96KV+OnAf2Y5iu+lnvF/2e/OktJGMqHEJ4jIPZ89njCETcSokLmfY3T8kqs7G
         vKKeL5r50D3tcQq1G+bt7ZVl7QvMO81q5YOIXxMDJGFNyjcZaqdvGFPCRRgB5GJVhW6i
         0FUQ==
MIME-Version: 1.0
References: <CA+PpKPmTsMMP6n3hYEqNxav_qQcyFPmff0GwYCauyuHY7GDM3w@mail.gmail.com>
 <20220405153120.GH4285@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20220405153120.GH4285@paulmck-ThinkPad-P17-Gen-1>
From: Hao Lee <haolee.swjtu@gmail.com>
Date: Wed, 6 Apr 2022 11:05:37 +0800
Message-ID: <CA+PpKPn-Z0sydhhMXbGYN5PyaT3R7yTGMZ=KZDL939xWhfv35g@mail.gmail.com>
Subject: Re: Does perfbook need some prior knowledge?
Content-Type: text/plain; charset="UTF-8"
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Tue, Apr 5, 2022 at 11:31 PM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Tue, Apr 05, 2022 at 09:52:23PM +0800, Hao Lee wrote:
> > Hi, Paul
> >
> > I'm currently reading perfbook, but I often get stuck in some concepts
> > which are not explained. Does this book need some prior knowledge?
> > Or all these concepts are explained later and I just need to keep
> > reading patiently?
> >
> > For example, on page 67 in v2021.12.22a:
> >
> >     For example, a write memory barrier (Linux kernel smp_wmb()) would
> >     order the store, but not the load. This situation might suggest use
> >     of smp_store_release() over smp_wmb().
> >
> > Unfortunately, although I have some knowledge about Linux kernel, I'm not
> > familiar with the concepts such as store_release, smp_wmb, etc. I don't
> > know if I should keep reading this book until all these concepts are
> > explained or stop reading the book and learn some prior knowledge.
>
> Good point.  On the one hand, this book is rather advanced, but on the
> other hand, it needs to be as accessible as is reasonably possible.
>
> I do not believe that there is a good definition of these two in the
> current text.  So could you please do the following when you come
> across an undefined term or API member like this?
>
> 1.      Search within the PDF.  If there is a good definition later,
>         let us know so that we can either move the definition earlier,
>         forward-reference the definition, or make the API reference at
>         the end of the book point readers at the definition.
>
>         If you don't see an obvious definition, continue.
>
> 2.      Check the web.  If you find what looks to be a good definition,
>         tell us where it is.  Perhaps we should create a similar
>         definition in the book, or perhaps we should cite the definition
>         you found.
>
>         If you don't see an obvious definition, continue.
>
> 3.      Search within the Linux kernel source code.  (When I did
>         this, the best definition I found was the much-maligned
>         Documentation/memory-barriers.txt!)  Again, maybe we should
>         put a similar definition in the book or maybe we should
>         cite the Linux-kernel source tree.

Sure.
Actually, I have tried these steps though sometimes this knowledge is
fragmented, and I hope there is a systematic explanation in one book.
But for now, I also realize that I have to reconstruct this knowledge
by myself to make them more organized.

>
> When I did this for smp_store_release() and smp_wmb(), I didn't find
> much that was helpful.
>
> Here is how I might define them:
>
> smp_store_release(): This is a store-release operation.  This operation
>         guarantees that all memory references preceding the
>         smp_store_release() will be visible to other threads and CPUs
>         before the store carried out by the smp_store_release().
>
>         This means that smp_store_release(&a, v) is similar to the
>         plain C-language assignment statement a = v, but also provides
>         the aforementioned ordering guarantee while also preventing the
>         counterproductive compiler optimizations described in Section
>         4.3.4 ("Accessing Shared Variables").
>
> smp_wmb(): This is a write memory barrier.  This barrier guarantees
>         that memory stores preceding this barrier will be visible to
>         other threads and CPUs before any memory stores following this
>         barrier.
>
> The text would also need to reiterate that ordering the stores is of
> no use unless the other threads' and CPU's loads are also ordered.
>
> Part of this definition would likely appear in the Glossary entries
> for store release and write memory barrier.
>
> Would this help?

Indeed helpful. Thanks for the explanation.

>
> Again, this book is reasonably advanced, but it is very helpful for us to
> understand which things are tripping people up.  We cannot promise to fix
> all of them, because there is a very large number of such functions, and
> many of them are subject to change over time.  However, we -can- promise
> that we most definitely will not fix those that we do not know about.  ;-)
>
> If you are wondering why it is not obvious to me what definitions
> are needed where, please keep in mind that I have been doing parallel
> programming for more than 30 years, and that my learning process was
> highly non-traditional.  I learned much of this from the hardware itself,
> some by reading code and exercising it, and a little bit by inventing it.
>
> So I need your help to work out what a traditional learning process
> should look like.

I can understand this. This book is advanced, but I think it can also be
understood slightly easier if we make the content more like a textbook than
a technical manual. I will try my best to learn it and hope I can also
contribute something to make it easier to read for people who don't know
much about this field.

Thanks,
Hao Lee

>
>                                                         Thanx, Paul
