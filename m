Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238024AbhLIACe (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 8 Dec 2021 19:02:34 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9695C061746
        for <perfbook@vger.kernel.org>; Wed,  8 Dec 2021 15:59:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 2D27FCE22BC
        for <perfbook@vger.kernel.org>; Wed,  8 Dec 2021 23:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639007938;
        bh=nfgonMVq+2R0sbvNM4nqc4JHQlfp+h4NrEtRzipOH2Y=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=S25izLeTZ2RwqBzzcT/MXwcwe4q31X8cZx2pUQXs4168KZrtyP/AGpQDKV3/1kOqH
         Roe7EFc8qmtnzNt5xJL7Uh8QU750gS+OJSS/Zc2uP4dq1le9pqCVEcxz93F8v66PxJ
         ZPc24q8ZTacfcYxB/4qrMKRHhLqkkMYuObE67GBta7TFQg/QCX4dDdYfLj6v28HxiX
         Zb7W8tB4JriBi+NDE8NQJghw3MJRj/Yln4SzCrTapYmnmNjTUFf6MCMmS9ucoWqoZO
         4Zttol51iJDwXqnGPfgKpanb70T56HWWJHJS5yPIDlupNIrB7AzAJy3sRuVufgKxfa
         MLkLhzDrbz4zA==
Date: Wed, 8 Dec 2021 15:58:58 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 0/4] Address potential widowing of headings
Message-ID: <20211208235858.GA641268@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <4350078f-4054-cb28-157b-305d6df087ea@gmail.com>
 <20211208195547.GY641268@paulmck-ThinkPad-P17-Gen-1>
 <fe2d7604-8263-357b-a3c7-0ff59038e67a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe2d7604-8263-357b-a3c7-0ff59038e67a@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Dec 09, 2021 at 07:20:20AM +0900, Akira Yokosawa wrote:
> On Wed, 8 Dec 2021 11:55:47 -0800, Paul E. McKenney wrote:
> > On Wed, Dec 08, 2021 at 04:37:26PM +0900, Akira Yokosawa wrote:
> >> Hi Paul,
> >>
> >> There was some confusion on my side WRT undesired page/column
> >> breaks.
> >>
> >> While testing the added checks in cleverefcheck.pl, I saw too
> >> many potential such cases flagged.  This made me do some tests
> >> to reproduce unfortunate page/column breaks.
> >>
> >> There are three such patterns I have confirmed.
> >>
> >> 1. "listing" environment (with contents of fancyvrb) next to proper
> >> LaTeX headings (\chapter, \section, \subsection, etc.)
> >>
> >> 2. Any environment (not necessarily float) next to QQA heading
> >> of "Answer:"
> >>
> >> 3. Any environment (not necessarily float) next to epigraph
> >>
> >> This means commit f106e0e6dc43 ("defer/rcuusage: Move float objects
> >> away of section titles") has no merit.  It is safe to revert it if
> >> you'd like.  I was confused by patterns 2 and 3 and thought that
> >> floating objects can cause undesired breaks. 
> >>
> >> Patches 1/4--3/4 add tests in cleverefcheck.pl that check patterns
> >> listed above respectively.
> >>
> >> Patch 4/4 fixes problematic places flagged by the updated script.
> >> Feel free to wordsmith the leading phrases I added in QQAs.
> > 
> > Queued and pushed with minor wordsmithing to parts of 4/4,
> > thank you!
> 
> So the diff below looks somewhat out of context, because the Quiz
> part of QQ A.2 is "How could there be such a large gap between
> successive consumer reads?".
> 
> ----
> @@ -175,7 +175,7 @@ seq    & \multicolumn{1}{c}{time (seconds)} & delta~  &  a &  b &  c \\
>         consumer reads?
>         See \path{timelocked.c} for full code.
>  }\QuickQuizAnswer{
> -       Here are possible scenarios:
> +       Here are a few of the errors:
>  
>         \begin{enumerate}
>         \item   The consumer might be preempted for long time periods.
> ----
> 
> Thoughts?

I changed this to "Here are a few reasons for such gaps:".  Does
that work for you?

						Thanx, Paul

>         Thanks, Akira
> 
> > 
> > 						Thanx, Paul
> > 
> >>         Thanks, Akira
> >> --
> >> Akira Yokosawa (4):
> >>   cleverefcheck.pl: Add test of listing next to heading
> >>   cleverefcheck.pl: Add test of \begin{...} at head of QQA
> >>   cleverefcheck.pl: Add test of \begin{...} next to epigraph
> >>   treewide: Address potential widowing of headings
> >>
> >>  appendix/questions/after.tex  |  4 +++
> >>  datastruct/datastruct.tex     | 14 +++++-----
> >>  defer/refcnt.tex              | 24 ++++++++---------
> >>  formal/axiomatic.tex          | 22 +++++++--------
> >>  locking/locking-existence.tex |  9 ++++---
> >>  memorder/memorder.tex         |  6 ++---
> >>  utilities/cleverefcheck.pl    | 50 +++++++++++++++++++++++++++++++++++
> >>  7 files changed, 92 insertions(+), 37 deletions(-)
> >>
> >>
> >> base-commit: f106e0e6dc436683bb119dd8992c6f173994d182
> >> -- 
> >> 2.17.1
> >>
