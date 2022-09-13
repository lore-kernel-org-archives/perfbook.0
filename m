Return-Path: <SRS0=uzeH=ZQ=gmail.com=e2lahav@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=t8DCpCHQt7bcXUX2u2/GKVwCNo8DuM5wgvjpKyapft4=;
        b=X2mHHTBZ8H+kBJq7Y4mQC5OawOicRNu6KyqI4OGFZmlM1aoLC88w0oY5V6ftKosGJD
         aRWT39wng6JwdGFxR7qnluxOCIzBCpH6xvsJnnxbbZ+VY+8L7RQ59wTQSYW4ZISyePzK
         zItSJ/Cwh0pGBmaq1dONL/2EfpJgMAkDGZWIkkBB7WcHiRsH7oY5bQicLAPBJpvWyu7n
         T4TMqIwKM8cPQxBkTw7BOoXMtTi+hAul5OnXcANHFW3gmm0Pfow/Ixo4ruzqAbmbkd9J
         SBe7bVIU+ZkFwwlLq2utQRt5EHLZlwRfEUtvrjcse6qjc/+DQxYi27XlEcF0ZfysZ+HP
         o2aA==
MIME-Version: 1.0
References: <f7d486c3-34f4-0908-7221-41ab634378d3@gmail.com> <20220913075132.GC246308@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20220913075132.GC246308@paulmck-ThinkPad-P17-Gen-1>
From: Elad Lahav <e2lahav@gmail.com>
Date: Tue, 13 Sep 2022 06:26:36 -0400
Message-ID: <CAJbg=FXt=vuKBs2=aicaKKU31O0aO_=wV2JDm5YHACPtM7_yfg@mail.gmail.com>
Subject: Re: [PATCH] SMPdesign: Fix command characters in code snippets
Content-Type: text/plain; charset="UTF-8"
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Yes, it does. Thanks.

--Elad

On Tue, 13 Sept 2022 at 03:51, Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Tue, Sep 13, 2022 at 09:18:13AM +0900, Akira Yokosawa wrote:
> > Some of listings in Chapter 6 use the command character option of
> > "commandchars=\\\[\]".
> > This collides with "[" and "]" in the code snippets and removes
> > them in the resulting listings.
> >
> > Fix the issue by using "commandchars=\\\@\$" instead and adjusting
> > the \lnlbl commands.
> >
> > Reported-by: Elad Lahav <e2lahav@gmail.com>
> > Fixes: 2c8eae0b8c65 ("SMPdesign: Employ new scheme for inline snippets")
> > Fixes: 05d62c297542 ("SMPdesign: Apply \clnref{} scheme to Listing 6.5")
> > Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>
> This fixes it for me, so queued and pushed, and thank you both!
>
> Elad, does this fix it for you as well?
>
>                                                         Thanx, Paul
>
> > ---
> >  SMPdesign/SMPdesign.tex | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
> > index 05b86ec7271b..70936c12ce7e 100644
> > --- a/SMPdesign/SMPdesign.tex
> > +++ b/SMPdesign/SMPdesign.tex
> > @@ -134,7 +134,7 @@ careful choice of data structure, can be arbitrarily large.
> >  On the other hand, if you are not in this happy situation, read on!
> >
> >  \begin{listing}
> > -\begin{VerbatimL}[commandchars=\\\[\]]
> > +\begin{VerbatimL}[commandchars=\\\@\$]
> >  struct hash_table
> >  {
> >       long nbuckets;
> > @@ -209,7 +209,7 @@ lock before returning.
> >
> >  \begin{listing}
> >  \begin{fcvlabel}[ln:SMPdesign:Code-Locking Hash Table Search]
> > -\begin{VerbatimL}[commandchars=\\\[\]]
> > +\begin{VerbatimL}[commandchars=\\\@\$]
> >  spinlock_t hash_lock;
> >
> >  struct hash_table
> > @@ -228,17 +228,17 @@ int hash_search(struct hash_table *h, long key)
> >       struct node *cur;
> >       int retval;
> >
> > -     spin_lock(&hash_lock);                          \lnlbl[acq]
> > +     spin_lock(&hash_lock);                          \lnlbl@acq$
> >       cur = h->buckets[key % h->nbuckets];
> >       while (cur != NULL) {
> >               if (cur->key >= key) {
> >                       retval = (cur->key == key);
> > -                     spin_unlock(&hash_lock);        \lnlbl[rel1]
> > +                     spin_unlock(&hash_lock);        \lnlbl@rel1$
> >                       return retval;
> >               }
> >               cur = cur->next;
> >       }
> > -     spin_unlock(&hash_lock);                        \lnlbl[rel2]
> > +     spin_unlock(&hash_lock);                        \lnlbl@rel2$
> >       return 0;
> >  }
> >  \end{VerbatimL}
> > @@ -912,7 +912,7 @@ the POSIX implementation described in
> >  shows how the hash search might be implemented using reader-writer locking.
> >
> >  \begin{listing}
> > -\begin{VerbatimL}[commandchars=\\\[\]]
> > +\begin{VerbatimL}[commandchars=\\\@\$]
> >  rwlock_t hash_lock;
> >
> >  struct hash_table
> > @@ -972,7 +972,7 @@ and likely perform better.
> >
> >  \begin{listing}
> >  \begin{fcvlabel}[ln:SMPdesign:Hierarchical-Locking Hash Table Search]
> > -\begin{VerbatimL}[commandchars=\\\[\]]
> > +\begin{VerbatimL}[commandchars=\\\@\$]
> >  struct hash_table
> >  {
> >       long nbuckets;
> > @@ -1003,7 +1003,7 @@ int hash_search(struct hash_table *h, long key)
> >               if (cur->key >= key) {
> >                       spin_lock(&cur->node_lock);
> >                       spin_unlock(&bp->bucket_lock);
> > -                     retval = (cur->key == key);\lnlbl[retval]
> > +                     retval = (cur->key == key);\lnlbl@retval$
> >                       spin_unlock(&cur->node_lock);
> >                       return retval;
> >               }
> >
> > base-commit: 34400fe10ca37b884ee64f7bd2b93d5cccfe675d
> > --
> > 2.25.1
> >
