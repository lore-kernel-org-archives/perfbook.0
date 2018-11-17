Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T5ztlnmVSB9Hvui7wogTPytA8TrxBNAGht8WTXMQy/0=;
        b=JJOU57voGq4IGRa9TcvdC+pIsTXIfXQ/zEr+mTL5QogSt8pgKPyWgyrIEfxKECSRKK
         ESbScIMp04xM8kjinQwLU+B9MKILg3ZesIwyOa5mriyD0KrthZRLFOWnzZyRfvb0mGw4
         tW/zaJC+aKlrO4cnEjZRlt+6Z+TKcEGybG92tdyBeL79i/oj7iD6pwoCnuozaupQoKWA
         /fs+JOl8mjabhKQEPJr0VnrR8WpAe0+xkFxr7p9AVwEaRg1g74t2tKVqPTOabjmEhVia
         Hssk6uIQ8UjqAsgfkpXm2u5VIqHKrWa1l6fb3JJf3d3TjZv8O2r6W2Ye12ygDbaJ8Kzv
         yCoA==
MIME-Version: 1.0
References: <1542356397-14343-1-git-send-email-junchangwang@gmail.com>
 <3cbec794-0a95-2248-adcf-bb35564881ad@gmail.com> <20181116201308.GB4170@linux.ibm.com>
In-Reply-To: <20181116201308.GB4170@linux.ibm.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Sat, 17 Nov 2018 16:26:13 +0800
Message-ID: <CABoNC81fKrmiFwKF92UH0Sy9Z5uuxc3SwDTBYaHpjFhn7NcBSA@mail.gmail.com>
Subject: Re: [PATCH] SMPdesign: fix typos
Content-Type: text/plain; charset="UTF-8"
To: Paul McKenney <paulmck@linux.ibm.com>, Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Sat, Nov 17, 2018 at 5:46 AM Paul E. McKenney <paulmck@linux.ibm.com> wrote:
>
> On Sat, Nov 17, 2018 at 12:01:11AM +0900, Akira Yokosawa wrote:
> > (Cc: Paul's latest address)
> > Hi Junchang,
> >
> > On 2018/11/16 16:19:57 +0800, Junchang Wang wrote:
> > > Signed-off-by: Junchang Wang <junchangwang@gmail.com>
> > > ---
> > > Hi list,
> > >
> > > There are a few typos in Section Partitioning. Please take a look.
> > >
> > > Thanks,
> > > --Junchang
> > >
> > > --
> > >  SMPdesign/SMPdesign.tex | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
> > > index 7b4f6eb..562c057 100644
> > > --- a/SMPdesign/SMPdesign.tex
> > > +++ b/SMPdesign/SMPdesign.tex
> > > @@ -936,7 +936,7 @@ We could simply assign each CPU one gigabyte of memory, and allow
> > >  each CPU to access its own private chunk of memory, without the
> > >  need for locking and its complexities and overheads.
> > >  Unfortunately, this simple scheme breaks down if an algorithm happens
> > > -to have CPU~0 allocate all of the memory and CPU~1 the free it, as
> > > +to have CPU~0 allocate all of the memory and CPU~1 free it, as
> >
> > I guess Paul's intention was:
> >
> > +to have CPU~0 allocate all of the memory and CPU~1 then free it, as
> >
> > ???
>
> You are right, that was my intention, but there significant room for
> improvement.  Please see below for an updated version of Junchang's
> patch.  Thoughts?
>

Hi Paul and Akira,

The new patch looks good to me. Thanks a lot for the help.


Thanks,
--Junchang

> > >  would happen in a simple producer-consumer workload.
> > >
> > >  The other extreme, code locking, suffers from excessive lock contention
> > > @@ -1017,7 +1017,7 @@ smaller than the number of non-\co{NULL} pointers.
> > >  The allocation function \co{memblock_alloc()} may be seen in
> > >  Listing~\ref{lst:SMPdesign:Allocator-Cache Allocator Function}.
> > >  Line~\lnref{pick} picks up the current thread's per-thread pool,
> > > -and line~8 check to see if it is empty.
> > > +and line~\lnref{chk:empty} checks to see if it is empty.
> >
> > Nice catch!
>
> Indeed, thank you both!!!
>
> >         Thanks, Akira
> >
> > >
> > >  If so, lines~\lnref{ack}-\lnref{rel} attempt to refill it
> > >  from the global pool
>
> ------------------------------------------------------------------------
>
> commit 81c18b03d1aa2d3edc1dc28867e1f84413eb31e3
> Author: Junchang Wang <junchangwang@gmail.com>
> Date:   Fri Nov 16 16:19:57 2018 +0800
>
>     SMPdesign: Fix typos
>
>     Signed-off-by: Junchang Wang <junchangwang@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@linux.ibm.com>
>     [ paulmck: Rework to clarify original wording. ]
>
> diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
> index 7b4f6eb2ba71..fe8f445851e3 100644
> --- a/SMPdesign/SMPdesign.tex
> +++ b/SMPdesign/SMPdesign.tex
> @@ -932,12 +932,11 @@ data ownership to this problem---simply carve up memory so that
>  each CPU owns its share.
>  For example, suppose that a system with two CPUs has two gigabytes
>  of memory (such as the one that I am typing on right now).
> -We could simply assign each CPU one gigabyte of memory, and allow
> -each CPU to access its own private chunk of memory, without the
> -need for locking and its complexities and overheads.
> -Unfortunately, this simple scheme breaks down if an algorithm happens
> -to have CPU~0 allocate all of the memory and CPU~1 the free it, as
> -would happen in a simple producer-consumer workload.
> +We could simply assign each CPU one gigabyte of memory, and allow each
> +CPU to allocate from its own gigabyte, without the need for locking and
> +its complexities and overheads.
> +Unfortunately, this scheme fails when CPU~0 only allocates memory and
> +CPU~1 only frees it, as happens in simple producer-consumer workloads.
>
>  The other extreme, code locking, suffers from excessive lock contention
>  and overhead~\cite{McKenney93}.
> @@ -1017,7 +1016,7 @@ smaller than the number of non-\co{NULL} pointers.
>  The allocation function \co{memblock_alloc()} may be seen in
>  Listing~\ref{lst:SMPdesign:Allocator-Cache Allocator Function}.
>  Line~\lnref{pick} picks up the current thread's per-thread pool,
> -and line~8 check to see if it is empty.
> +and line~\lnref{chk:empty} checks to see if it is empty.
>
>  If so, lines~\lnref{ack}-\lnref{rel} attempt to refill it
>  from the global pool
>

