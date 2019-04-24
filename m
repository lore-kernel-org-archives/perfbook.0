Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J1jIS8ZKDbXiY1BfnCuwLFUKg7JHHumqqWPSHsi4usA=;
        b=RM/M9qfnkKfTxmplatVW0pEqrUOvBXnpvf/8jeu3hlygx2UNn85+q8mEIUEHPMpWbT
         PIJ/GPymnkQ1o9rz3iQeP+hFRJPX2CFQ78+xJyBsDlXD2kQvyhbuCBCyiEq670rxnpDw
         DyDseVKVkUsOEGeJebdZVF+w8QA43i2tfDmKcFfxgqH5Dk9OOIkYhliq/SrzbEjUuX6j
         Ep1tu4inM+nYWucA72hudq6qVITOiNusENm8dCuIAFZ1xnhdr6v3H7GmMwEnVHv4uKxp
         2MX/X2HJ3wtVO6W6WkSpDHNUI810R1yQnpNMCWm70682vi5LMOQC6eNJfkmx3wgQLF/K
         ciAQ==
MIME-Version: 1.0
References: <1556027825-21106-1-git-send-email-junchangwang@gmail.com>
 <1556027825-21106-2-git-send-email-junchangwang@gmail.com> <a99cc114-312b-2c28-9fdd-3106fe8bc9da@gmail.com>
In-Reply-To: <a99cc114-312b-2c28-9fdd-3106fe8bc9da@gmail.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Wed, 24 Apr 2019 10:28:24 +0800
Message-ID: <CABoNC83FD6UBGeKMT12DLbGH84=gpU26tnCaJO-AxhA9+HqGCA@mail.gmail.com>
Subject: Re: [PATCH 1/4] rcu: Use READ_ONCE() and WRITE_ONCE() for shared
 variable rcu_reader_gp
Content-Type: text/plain; charset="UTF-8"
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Paul McKenney <paulmck@linux.ibm.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Tue, Apr 23, 2019 at 11:33 PM Akira Yokosawa <akiyks@gmail.com> wrote:
>
> Hi Junchang,
>
> On Tue, 23 Apr 2019 21:57:02 +0800, Junchang Wang wrote:
> > Replace the plain accesses and the use of ACCESS_ONCE() with
> > READ_ONCE()/WRITE_ONCE(). And then update the tex file accordingly.
> >
> > Signed-off-by: Junchang Wang <junchangwang@gmail.com>
> > ---
> >  CodeSamples/defer/rcu.c    | 5 +++--
> >  CodeSamples/defer/rcu.h    | 5 +++--
> >  appendix/toyrcu/toyrcu.tex | 8 ++++----
> >  3 files changed, 10 insertions(+), 8 deletions(-)
> >
> > diff --git a/CodeSamples/defer/rcu.c b/CodeSamples/defer/rcu.c
> > index 4b868cc..e4fddbc 100644
> > --- a/CodeSamples/defer/rcu.c
> > +++ b/CodeSamples/defer/rcu.c
> > @@ -35,7 +35,7 @@ void synchronize_rcu(void)
> >
> >       /* Advance to a new grace-period number, enforce ordering. */
> >
> > -     rcu_gp_ctr += 2;
> > +     WRITE_ONCE(rcu_gp_ctr, READ_ONCE(rcu_gp_ctr) + 2);
>
> This is inside of critical section protecting update of rcu_gp_ctr, and
> READ_ONCE() is not necessary. On the other hand, WRITE_ONCE() is necessary
> because other CPUs/threads can do racy read accesses.
>
> >       smp_mb();
> >
> >       /*
> > @@ -45,7 +45,8 @@ void synchronize_rcu(void)
> >
> >       for_each_thread(t) {
> >               while ((per_thread(rcu_reader_gp, t) & 0x1) &&
> > -                    ((per_thread(rcu_reader_gp, t) - rcu_gp_ctr) < 0)) {
> > +                    ((per_thread(rcu_reader_gp, t) -
> > +                      READ_ONCE(rcu_gp_ctr)) < 0)) {
>
> This READ_ONCE() is not necessary, neither.
>
> Please refer to Section 4.3.4.4 "Avoiding Data Races" for where to use
> READ/WRITE_ONCE(). You might want to self review 2/4 and 3/4 of this patch
> set.

Hi Akira,

Thanks a lot for pointing me to that! I will read that chapter and
submit a new patch set for your review soon.
I would like to add you to the Reviewed-by. Would that be OK for you?

>
> >                       /*@@@ poll(NULL, 0, 10); */
> >                       barrier();
> >               }
> > diff --git a/CodeSamples/defer/rcu.h b/CodeSamples/defer/rcu.h
> > index f493f8b..534709e 100644
> > --- a/CodeSamples/defer/rcu.h
> > +++ b/CodeSamples/defer/rcu.h
> > @@ -41,7 +41,8 @@ static inline void rcu_read_lock(void)
> >        * periodic per-thread processing.)
> >        */
> >
> > -     __get_thread_var(rcu_reader_gp) = rcu_gp_ctr + 1;
> > +     __get_thread_var(rcu_reader_gp) =
> > +             READ_ONCE(rcu_gp_ctr) + 1;
> >       smp_mb();
> >  }
> >
> > @@ -55,7 +56,7 @@ static inline void rcu_read_unlock(void)
> >        */
> >
> >       smp_mb();
> > -     __get_thread_var(rcu_reader_gp) = rcu_gp_ctr;
> > +     __get_thread_var(rcu_reader_gp) = READ_ONCE(rcu_gp_ctr);
> >  }
> >
> >  extern void synchronize_rcu(void);
> > diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
> > index c0a45a8..d9a7055 100644
> > --- a/appendix/toyrcu/toyrcu.tex
> > +++ b/appendix/toyrcu/toyrcu.tex
>
> Or you can extract the snippet by using \begin{snippet} meta commands.
> That is a preferred way if there is code under CodeSamples/.
> Examples of the scheme can be found in (not yet up-to-date) Style Guide
> (D.3.1.1).
>

Thanks for the comment; this is the right approach.
Then, I am planning to submit two patch sets: the first is to correct
the code, and the second is to use the new snippet scheme.
Does that sound good?

Thanks,
--Junchang


> That said, you are not obliged to do so. Conversion to the new scheme is
> on my to-do list anyway.
>
>         Thanks, Akira
>
> > @@ -1223,7 +1223,7 @@ thread-local accesses to one, as is done in the next section.
> >   1 static void rcu_read_lock(void)
> >   2 {
> >   3   __get_thread_var(rcu_reader_gp) =
> > - 4     ACCESS_ONCE(rcu_gp_ctr) + 1;
> > + 4     READ_ONCE(rcu_gp_ctr) + 1;
> >   5   smp_mb();
> >   6 }
> >   7
> > @@ -1231,7 +1231,7 @@ thread-local accesses to one, as is done in the next section.
> >   9 {
> >  10   smp_mb();
> >  11   __get_thread_var(rcu_reader_gp) =
> > -12     ACCESS_ONCE(rcu_gp_ctr);
> > +12     READ_ONCE(rcu_gp_ctr);
> >  13 }
> >  14
> >  15 void synchronize_rcu(void)
> > @@ -1240,12 +1240,12 @@ thread-local accesses to one, as is done in the next section.
> >  18
> >  19   smp_mb();
> >  20   spin_lock(&rcu_gp_lock);
> > -21   ACCESS_ONCE(rcu_gp_ctr) += 2;
> > +21   WRITE_ONCE(rcu_gp_ctr, READ_ONCE(rcu_gp_ctr) + 2);
> >  22   smp_mb();
> >  23   for_each_thread(t) {
> >  24     while ((per_thread(rcu_reader_gp, t) & 0x1) &&
> >  25             ((per_thread(rcu_reader_gp, t) -
> > -26               ACCESS_ONCE(rcu_gp_ctr)) < 0)) {
> > +26               READ_ONCE(rcu_gp_ctr)) < 0)) {
> >  27       poll(NULL, 0, 10);
> >  28     }
> >  29   }
> >
>

