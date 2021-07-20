Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:38116 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230497AbhGTSZa (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 20 Jul 2021 14:25:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626807968;
        bh=CVpCaOJMGHutp1rwEzH60oNVNkz0fo0ZzG9G2j/eZf4=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=p7Q+TcZJiofwnjOrdu1Pp5n7nfHihPu06GXvX7nu7jcBy03AVjXWz0KNnwZwRF8uF
         mya/4YDqk/s5sb0gPl+7izB+b5FCr7ncXzEHGvVTV5a4ekUTTMn2he63qorFtgBNsr
         CFM2Gkfxn5q+WlJBENZJfr7L458p8LVC4QwH+8RH4svKQ2OELk5uxpVHlFGkWtfOMY
         CKwwQZ8cLj9WuLo3pu8nuxt4fB7/f+U2pVYROd2HinfwGb2UoHxzrD9evTdT4muW6d
         MkwmghZ1Z8xki8TpsjU5mgDC9awl8rDSg2zpTCnrK/nOVIZPLlQYF+mx6bzRKeHZtf
         SnYiCpJFNOuGg==
Date: Tue, 20 Jul 2021 12:06:07 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] defer: remove superfluous preposition
Message-ID: <20210720190607.GO4397@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <1626765445-5916-1-git-send-email-zhouzhouyi@gmail.com>
 <20210720173337.GL4397@paulmck-ThinkPad-P17-Gen-1>
 <CAABZP2wkXLcHtgB6FX4xvJNFQFSa1ywPRPYkR_7nmBJ49BHkZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAABZP2wkXLcHtgB6FX4xvJNFQFSa1ywPRPYkR_7nmBJ49BHkZA@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Cc: perfbook@vger.kernel.org, Yang Lu <luyang.co@gmail.com>

On Wed, Jul 21, 2021 at 02:36:30AM +0800, Zhouyi Zhou wrote:
> Thanks Paul for reviewing the patch
> 
> On Wed, Jul 21, 2021 at 1:33 AM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > On Tue, Jul 20, 2021 at 03:17:25PM +0800, Zhouyi Zhou wrote:
> > > Hi, Paul
> > >  I think preposition 'on' here is superfluous, correct me if I am wrong.
> > > Best Wishes
> > > Zhouyi
> >
> > The current text is technically grammatically correct, but as you
> > noticed, rather awkward.  I should rework that sentence and the one
> > following.  Huh.  Actually, I should rework that entire paragraph.
> >
> > How about the following?
> >
> >                                                         Thanx, Paul
> >
> > ------------------------------------------------------------------------
> >
> > commit 5eb7525e2f7338ea6b817c145a9b4da60e6871d1
> > Author: Paul E. McKenney <paulmck@kernel.org>
> > Date:   Tue Jul 20 10:31:03 2021 -0700
> >
> >     defer/rcufundamental: Wordsmith QQ answer about writes in RCU readers
> >
> >     Reported-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> >     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> >
> > diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
> > index 66f9b702..054512e0 100644
> > --- a/defer/rcufundamental.tex
> > +++ b/defer/rcufundamental.tex
> > @@ -330,12 +330,17 @@ greater detail in \cref{sec:memorder:RCU}.
> >         \co{P1()}'s grace period.
> >
> >         It might seem strange to have RCU read-side critical sections
> > -       containing writes, but RCU is just fine with this.
> > -       This capability is used frequently in the Linux kernel, for
> > -       example, acquiring a lock on or reference to a data structure.
> > -       Acquiring either a lock or a reference results in a write
> > -       to memory, and it is OK to do these within an RCU read-side
> > -       critical section.
> > +       containing writes, but this capability is not only permitted,
> > +       but also highly useful.
> > +       For example, the Linux kernel frequently carries out an
> > +       RCU-protected traversal of a linked data structure and then
> > +       acquires a reference to the destination data element.
> > +       Because this data element must not be freed in the meantime,
> > +       that element's reference counter must necessarily be incremented
> > +       within the traversal's RCU read-side critical section.
> > +       However, that increment entails a write to memory.
> > +       Therefore, it is a very good thing that memory writes are
> > +       permitted within RCU read-side critical sections.
> The revised paragraph is easier for me to understand, especially why acquiring
> a reference to a data structure entails a write ;-)
> >
> >         If having writes in RCU read-side critical sections still seems
> >         strange, please review
> The revised edition looks wonderful, thank you

Glad you like it, and thank you for pointing me at the original
awkward sentence!

							Thanx, Paul
