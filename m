Return-Path: <SRS0=zcTk=RF=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mgvD71Rys8uE0Gof8CYewktA/jMEYmJ3CI4xBLNNAUI=;
        b=OJ/qtGIKEjpt5lWxQaZ1ihnQAezWE3AUOEGUweXSiDw/GnzSzNxgGbYbwWbsWk7n2/
         vGe7dYjuLq0kLNGpdLYAn+kVnyPXjgUUlEi2acxLOjmfBi1o49JDUmAZYKBV6sAa5IqI
         diw8M1/g3kGkZ2INY55CZkNwqKmMTHRMcJbX9BZOA2gg3vtfzNUkgHANTwl5tFbNmIeN
         qw7hZ5KdLQUdVx3ivG0NPeYO0XqU5b14SDoI122fN/lTF0A9IYZEr5oS4nnjAatc7TpX
         at5Zzpkp16wQertm/XicEgqDeE9o6BkERYDDgzKNKINiATV//ntOhVbKjc2tbChKSIzw
         FfGQ==
MIME-Version: 1.0
References: <e2fcb255-aeba-7d72-a160-5573c5e2455e@gmail.com> <20211220174304.GY641268@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20211220174304.GY641268@paulmck-ThinkPad-P17-Gen-1>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Tue, 21 Dec 2021 06:42:04 +0800
Message-ID: <CAABZP2ywHmXGTmbh0ytBwvv0Cz76O0Xdm3w8rh9=7KCv_PgURw@mail.gmail.com>
Subject: Re: A few terms I'd like to see in perfbook's Glossary
Content-Type: text/plain; charset="UTF-8"
To: paulmck@kernel.org
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Thanks Paul and Akira

great improvement to perfbook's glossary!

A question below ;-)

On Tue, Dec 21, 2021 at 4:15 AM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Mon, Dec 20, 2021 at 06:55:36PM +0900, Akira Yokosawa wrote:
> > Hi Paul,
> >
> > While reading through Section 9.5.4, I noticed a few terms
> > I'd like to see in perfbook's Glossary.
> >
> >  - Reference Counter/Counting
> >  - Existence Guarantee
> >  - Type-safe Memory
> >
> > "Reference counter" is already mentioned in a couple of existing
> > items in the glossary.
> >
> > "Existing guarantee" might be obvious enough and not worthy
> > to be in the glossary.
> >
> > Thoughts?
> >
> > There were only a few minor nits in the section.
> > Will post a patch taking care of them.
>
> Thank you for looking it over!  Please see below for a proposed patch
> to the glossary.  Oh, and thank you for the checking utilities, very
> nice to get explicit messages rather than subtlely broken formatting!!!
>
> utilities/punctcheck.sh
> ./glossary.tex:547:     Type-safe memory\cite{Cheriton96a} is provided by a
> utilities/cleverefcheck.sh
>
>                                                         Thanx, Paul
>
> ------------------------------------------------------------------------
>
> commit a8f5948a1b8921941bf4039e278aa7929f64c322
> Author: Paul E. McKenney <paulmck@kernel.org>
> Date:   Mon Dec 20 09:41:55 2021 -0800
>
>     glossary: Add reference count, existence guarantee, and TSM
>
>     Where "TSM" is type-safe memory.
>
>     Reported-by: Akira Yokosawa <akiyks@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
>
> diff --git a/glossary.tex b/glossary.tex
> index be10f703..31c09232 100644
> --- a/glossary.tex
> +++ b/glossary.tex
> @@ -199,6 +199,14 @@
>         increase the overall cost of the computation, resulting in
>         linear speedups as threads are added (assuming sufficient
>         CPUs are available).
> +\item[\IX{Existence Guarantee}:]
> +       An existence guarantee is provided by a synchronization mechanism
> +       that prevents a given dynamically allocated object from being
> +       freed for the duration of that guarantee.
> +       For example, RCU provides existence guarantees for the duration
> +       of RCU read-side critical sections.
> +       A similar but strictly weaker guarantee is provided by
> +       type-safe memory.
here type-safe memory is called 'weaker'

>  \item[\IXh{Exclusive}{Lock}:]
>         An exclusive lock is a mutual-exclusion mechanism that
>         permits only one thread at a time into the
> @@ -469,6 +477,11 @@
>         A situation in which getting the correct result is not sufficient,
>         but where this result must also be obtained within a given amount
>         of time.
> +\item[\IX{Reference Count}:]
> +       A counter that tracks the number of users of a given object or
> +       entity.
> +       Reference counters provide existence guarantees and are sometimes
> +       used to implement garbage collectors.
>  \item[\IX{Scalability}:]
>         A measure of how effectively a given system is able to utilize
>         additional resources.
> @@ -531,6 +544,17 @@
>         A synchronization mechanism that gathers groups of memory
>         accesses so as to execute them atomically from the viewpoint
>         of transactions on other CPUs or threads.
> +\item[\IX{Type-Safe Memory}:]
> +       Type-safe memory~\cite{Cheriton96a} is provided by a
> +       synchronization mechanism that prevents a given dynamically
> +       allocated object from changing to an incompatible type.
> +       Note that the object might well be freed and then reallocated, but
> +       the reallocated object is guaranteed to be of a compatible type.
> +       Within the Linux kernel, type-safe memory is provided within
> +       RCU read-side critical sections for memory allocated from slabs
> +       marked with the \co{SLAB_TYPESAFE_BY_RCU} flag.
> +       The strictly stronger existence guarantee also prevents freeing
> +       of the protected object.
but why do we use "stronger" here (should not it be "weaker"?)

>  \item[\IX{Unteachable}:]
>         A topic, concept, method, or mechanism that the teacher does
>         not understand well is therefore uncomfortable teaching.
Many thanks
Zhouyi
