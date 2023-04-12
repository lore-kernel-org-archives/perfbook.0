Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbjDLSub (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 12 Apr 2023 14:50:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9BF14EEC
        for <perfbook@vger.kernel.org>; Wed, 12 Apr 2023 11:50:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7DA7063548
        for <perfbook@vger.kernel.org>; Wed, 12 Apr 2023 18:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681325425;
        bh=/3uGlszJMhe6LOsvufLjJ3nKGQLpBIqkdprHpUArDVM=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=InJtSptiKV1segtY5KMdIgYjwCO7gWCWLxQuTc9+1KsoKsJlwPOETP4QNcD8EPACO
         eUX0bd595AnH3I56Y1MCb/ZQsHZdJVU7HcLTzaEXyy1dIjeXFtGrsMnZ+224vvs8WS
         5UdAqfDSTvgkTwGOpkxvZNE9cfgyBINfL1dJUtOj67FHnOGnyq2ZNbWBAiVoWkwTiZ
         HF/LBZOaD54DYP3rwm3v1cqFFOsPX3s4WBrWER6SR70EUe2gtPdFa4+Krkcx7w4dZT
         5Nde2hwd6F8Di+eIm6NUEVlNydj9xWVMnrfxZibq2kDUcMFGa50EEPPILkDJrpU63d
         YkTrdQXittAdg==
Date: Wed, 12 Apr 2023 11:50:25 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] CodeSamples/count: Remove unnecessary memory barriers
Message-ID: <730d877e-4350-4817-86e0-81bafce9f9ff@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230407175813.1334028-1-mmpgouride@gmail.com>
 <81ADBFE2-3576-48EC-A892-B49A5C265487@gmail.com>
 <e425c28d-c285-0fc6-b692-744df0bde3a8@gmail.com>
 <a1cf12cc-0f93-4958-a5f1-63827eccba48@paulmck-laptop>
 <721A2BB5-7E15-474A-B6AF-AFE8E310A616@gmail.com>
 <CAJbg=FUKnNRiu2O0wAav9dAMcKuSH5CNHZWrqCOXUiZDt5t-jw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJbg=FUKnNRiu2O0wAav9dAMcKuSH5CNHZWrqCOXUiZDt5t-jw@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: Alan Huang <mmpgouride@gmail.com>, Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Wed, Apr 12, 2023 at 07:32:45AM -0400, Elad Lahav wrote:
> I may be missing something, but why do you need memory barriers at all
> in the signal handler? At least on the systems I know both setting up
> the signal handler and restoring the context require kernel calls. On
> x86 this doesn't matter as it is strongly ordered, but on ARM the
> kernel calls provide full synchronization points.
> Are there architectures/OS combinations where that is not true?

It is quite possible that there is still more memory ordering in this
code than is absolutely required.

I would have some difficulty forcing myself to rely on implicit ordering
due to signal entry and exit, but then again, I have also some difficulty
forcing myself to rely on signals.  ;-)

But if there is some signal entry/exit guarantee in (say) POSIX, we should
be OK relying on it.

Any thoughts on interrupt handlers in kernels?

							Thanx, Paul

> --Elad
> 
> On Tue, Apr 11, 2023 at 12:43 PM Alan Huang <mmpgouride@gmail.com> wrote:
> >
> > The signal-theft counter reminds me of the signal-based user space RCU implementation, the signal hander there
> > has  two full memory barriers around it, how about mentioning that a little?
> >
> > Thanks,
> > Alan
> >
> >
> >
> > > 2023年4月11日 上午3:06，Paul E. McKenney <paulmck@kernel.org> 写道：
> > >
> > > On Sun, Apr 09, 2023 at 09:11:58AM +0900, Akira Yokosawa wrote:
> > >> Hi,
> > >>
> > >> On Sat, 8 Apr 2023 02:04:24 +0800, Alan Huang wrote:
> > >>> Hi Paul and Akira,
> > >>>
> > >>> This is the patch v3, I forgot to add a version tag…
> > >>>
> > >>> And I think it may be better to add a question in a subsequent path.
> > >>
> > >> So I'm looking at Quick Quizzes on count_lim_sig.c.
> > >> It looks to me Quick Quiz 5.50 lost its context due to the
> > >> removal of smp_mb() and the use of smp_store_release().
> > >>
> > >> A band-aide fix would be to change the quiz to:
> > >>
> > >>    In Listing 5.18's function flush_local_count_sig(), why
> > >>    are there READ_ONCE(), WRITE_ONCE(), and smp_store_release()
> > >>    wrappers around the uses of the theft per-thread variable?
> > >>
> > >> , and to adjust the line count in its Answer.
> > >>
> > >> However, smp_store_release() is by no means a simple wrapper.
> > >> So I'm wondering if it is worthwhile to keep this quiz.
> > >>
> > >> Paul, how about replacing the quiz with the new quiz asking:
> > >>
> > >>     In Listing 5.18, doesn't flush_local_count_sig() need
> > >>     a stronger memory barrier or two?
> > >>
> > >> , and picking Alan's reasoning in the answer?
> > >
> > > How about something like this?
> > >
> > >                                                       Thanx, Paul
> > >
> > > ------------------------------------------------------------------------
> > >
> > > diff --git a/count/count.tex b/count/count.tex
> > > index 2aade053..ccc2e839 100644
> > > --- a/count/count.tex
> > > +++ b/count/count.tex
> > > @@ -2441,28 +2441,11 @@ the fastpath happens before this change of \co{theft} to READY\@.
> > >
> > > \QuickQuiz{
> > >       In \cref{lst:count:Signal-Theft Limit Counter Value-Migration Functions}'s
> > > -     function \co{flush_local_count_sig()}, why are there
> > > -     \co{READ_ONCE()} and \co{WRITE_ONCE()} wrappers around
> > > -     the uses of the
> > > -     \co{theft} per-thread variable?
> > > +     doesn't \co{flush_local_count_sig()} need stronger memory barriers?
> > > }\QuickQuizAnswer{
> > > -     \begin{fcvref}[ln:count:count_lim_sig:migration:flush_sig]
> > > -     The first one (on \clnref{check:REQ}) can be argued to be unnecessary.
> > > -     The last two (\clnref{set:ACK,set:READY}) are important.
> > > -     If these are removed, the compiler would be within its rights
> > > -     to rewrite \clnrefrange{set:ACK}{set:READY} as follows:
> > > -     \end{fcvref}
> > > -
> > > -\begin{VerbatimN}[firstnumber=14]
> > > -theft = THEFT_READY;
> > > -if (counting) {
> > > -     theft = THEFT_ACK;
> > > -}
> > > -\end{VerbatimN}
> > > -
> > > -     This would be fatal, as the slowpath might see the transient
> > > -     value of \co{THEFT_READY}, and start stealing before the
> > > -     corresponding thread was ready.
> > > +     No, that \co{smp_store_release()} suffices because this code
> > > +     communicates only with \co{flush_local_count()}, and there is
> > > +     no need for store-to-load ordering.
> > > }\QuickQuizEnd
> > >
> > > \begin{fcvref}[ln:count:count_lim_sig:migration:flush]
> >
