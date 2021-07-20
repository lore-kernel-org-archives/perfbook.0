Return-Path: <SRS0=ftAS=MM=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+vqPKrRsYsIEqAqz+eMUV+j4VgKp/a4FfgRSARC6ZBY=;
        b=kyCos9qheleQn8lRalPPzhCorRNIhx8OyrPnSS2De/l2dHTtrxv0MD/nzht8vpelou
         SPnYt+6ymOYpjulY0fZj3gl/9NWWoSSDCleMKOG6MFfGzHtyQiUIAaDvFS/SP9D3Wryf
         xtLLaXSONQ96neHx9l6atQWPf6hP+Ncp1jK2r+vWFWOr/KdIRekHOf5nTp70WBpYi9RR
         cZiPSIaQZKYaYaBYH1zExC0gps37+gpueuFPzC4s2DmyA47AYmj3+xC7bIcZn1/3Utyb
         bTgOfqWfnn6RJgP5VANDm92lRkdveQ43wFnkBomNQ7icOcn0+RaEYhhucK8D53z8Iao+
         LBUA==
MIME-Version: 1.0
References: <1626765445-5916-1-git-send-email-zhouzhouyi@gmail.com>
 <20210720173337.GL4397@paulmck-ThinkPad-P17-Gen-1> <CAABZP2wkXLcHtgB6FX4xvJNFQFSa1ywPRPYkR_7nmBJ49BHkZA@mail.gmail.com>
 <20210720190607.GO4397@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20210720190607.GO4397@paulmck-ThinkPad-P17-Gen-1>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Wed, 21 Jul 2021 03:23:47 +0800
Message-ID: <CAABZP2zKtroA+cPUNa-=rG7wpvVTLZ5DnV6TJeP5tAPJhasg2A@mail.gmail.com>
Subject: Re: [PATCH -perfbook] defer: remove superfluous preposition
Content-Type: text/plain; charset="UTF-8"
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Yang Lu <luyang.co@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Wed, Jul 21, 2021 at 3:06 AM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Wed, Jul 21, 2021 at 02:36:30AM +0800, Zhouyi Zhou wrote:
> > Thanks Paul for reviewing the patch
> >
> > On Wed, Jul 21, 2021 at 1:33 AM Paul E. McKenney <paulmck@kernel.org> wrote:
> > >
> > > On Tue, Jul 20, 2021 at 03:17:25PM +0800, Zhouyi Zhou wrote:
> > > > Hi, Paul
> > > >  I think preposition 'on' here is superfluous, correct me if I am wrong.
> > > > Best Wishes
> > > > Zhouyi
> > >
> > > The current text is technically grammatically correct, but as you
> > > noticed, rather awkward.  I should rework that sentence and the one
> > > following.  Huh.  Actually, I should rework that entire paragraph.
> > >
> > > How about the following?
> > >
> > >                                                         Thanx, Paul
> > >
> > > ------------------------------------------------------------------------
> > >
> > > commit 5eb7525e2f7338ea6b817c145a9b4da60e6871d1
> > > Author: Paul E. McKenney <paulmck@kernel.org>
> > > Date:   Tue Jul 20 10:31:03 2021 -0700
> > >
> > >     defer/rcufundamental: Wordsmith QQ answer about writes in RCU readers
> > >
> > >     Reported-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> > >     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > >
> > > diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
> > > index 66f9b702..054512e0 100644
> > > --- a/defer/rcufundamental.tex
> > > +++ b/defer/rcufundamental.tex
> > > @@ -330,12 +330,17 @@ greater detail in \cref{sec:memorder:RCU}.
> > >         \co{P1()}'s grace period.
> > >
> > >         It might seem strange to have RCU read-side critical sections
> > > -       containing writes, but RCU is just fine with this.
> > > -       This capability is used frequently in the Linux kernel, for
> > > -       example, acquiring a lock on or reference to a data structure.
> > > -       Acquiring either a lock or a reference results in a write
> > > -       to memory, and it is OK to do these within an RCU read-side
> > > -       critical section.
> > > +       containing writes, but this capability is not only permitted,
> > > +       but also highly useful.
> > > +       For example, the Linux kernel frequently carries out an
> > > +       RCU-protected traversal of a linked data structure and then
> > > +       acquires a reference to the destination data element.
> > > +       Because this data element must not be freed in the meantime,
> > > +       that element's reference counter must necessarily be incremented
> > > +       within the traversal's RCU read-side critical section.
> > > +       However, that increment entails a write to memory.
> > > +       Therefore, it is a very good thing that memory writes are
> > > +       permitted within RCU read-side critical sections.
> > The revised paragraph is easier for me to understand, especially why acquiring
> > a reference to a data structure entails a write ;-)
> > >
> > >         If having writes in RCU read-side critical sections still seems
> > >         strange, please review
> > The revised edition looks wonderful, thank you
>
> Glad you like it, and thank you for pointing me at the original
> awkward sentence!
You are very welcome ;-),   reading the book itself is a
self-improvement process,
To be honest,  by reading the book, I find you are the example worth
following in my career life.
>
>                                                         Thanx, Paul
Best Wishes
Zhouyi
