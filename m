Return-Path: <perfbook-owner@vger.kernel.org>
Received: from dfw.source.kernel.org ([139.178.84.217]:32786 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229903AbiANVlw (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 14 Jan 2022 16:41:52 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 038F961FC3
        for <perfbook@vger.kernel.org>; Fri, 14 Jan 2022 21:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642196511;
        bh=IoiJMkDdkxgx4X2d4RTfpdMWKL9wdWMQy6ZT+iOOCns=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=WYEed0jydtjhinXqbsE2ATZ1wTm+B58Ak514ZFNJInMc4T/4m9t1IxptuwQKsbw6r
         +am0mbUCWEAit2zj7fsSazDCCc0E0+PPbO/sjoTjDxrZND+prWjEnzJr5OJWNmhiGu
         qRkZa6ffxQR+BkxNoa2m2R2HoYHymDH/YY7JYoGjxj2ReSSsmcTEOZiUY3f0Wt7t3F
         bEm2TI/rqEaxyGsjESNq6fAlrnWaLtbvLRIpcw34GddHLsknRJnSdOR/ODRZGxDaKC
         v0sNOrOHsRcsICglHmTOU4q+JQk5ztabVMpui2YCFi87CnMGSrefcz11qbrHAVV5ja
         HUatOMmo6KXTw==
Date: Fri, 14 Jan 2022 13:41:51 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH RESEND -perfbook 00/10] Index and acronym updates
Message-ID: <20220114214151.GA947480@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <d61bf71a-d3ed-1561-62ee-15d4537443da@gmail.com>
 <20220106161945.GK4202@paulmck-ThinkPad-P17-Gen-1>
 <20220108050704.GA909013@paulmck-ThinkPad-P17-Gen-1>
 <21fde8e3-13d5-28d5-2666-679cae9ae9cb@gmail.com>
 <20220114134728.GT947480@paulmck-ThinkPad-P17-Gen-1>
 <fbff40a8-2d6f-3852-7fc9-ea5054c84f68@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbff40a8-2d6f-3852-7fc9-ea5054c84f68@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Jan 14, 2022 at 11:13:37PM +0900, Akira Yokosawa wrote:
> On Fri, 14 Jan 2022 05:47:28 -0800,
> Paul E. McKenney wrote:
> > On Fri, Jan 14, 2022 at 07:11:51PM +0900, Akira Yokosawa wrote:
> >> On Fri, 7 Jan 2022 21:07:04 -0800,
> >> Paul E. McKenney wrote:
> >>> On Thu, Jan 06, 2022 at 08:19:45AM -0800, Paul E. McKenney wrote:
> >>>> On Thu, Jan 06, 2022 at 04:29:25PM +0900, Akira Yokosawa wrote:
> >>>>> Hi Paul,
> >>>>>
> >>>>> This is another round of *never-ending* indexing updates.
> >>>>
> >>>> Maintaining indexes is non-trivial, no two ways about it!
> >>>>
> >>>> So special thanks for this series!
> >>>>
> >>>> At some point, for the index entries with lots of references, it may
> >>>> be necesary to flag the most important references.  I sometimes see
> >>>> such entries italicized or marked with "ff", though I freely confess
> >>>> that I have no idea what the rationale for "ff" might be.
> >>>
> >>> And I did find this.  The "ff" stands for "folios following", where
> >>> "folio" is used in the sense of "page".  So "368 ff" means "page 368
> >>> and some number of subsequent pages."
> >>>
> >>> I have spent most of my life fooled into thinking that "ff" indicated
> >>> the most significant page for a given index item.  But there is some
> >>> connection, at least assuming that a longer discussion of a given term
> >>> is a more significant discussion of that term.  ;-)
> >>
> >> So, prompted by your comment, I'm experimenting change of page number
> >> styles referenced in index.
> >>
> >> You can see a WIP tree at:
> >>
> >> --------
> >> The following changes since commit 6eca56ccde0839f4ea81c5f02ddbe4c7c97e225f:
> >>
> >>   Fix a typo in Bibliography (2022-01-12 09:48:13 -0800)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://github.com/akiyks/perfbook.git tags/WIP-index-page-style-2022.01.14
> >>
> >> for you to fetch changes up to cc9e388aee6cd72ed757fa0ec193b8e35f2bbaff:
> >>
> >>   index: Retouch prenote layout (2022-01-14 17:41:30 +0900)
> >>
> >> ----------------------------------------------------------------
> >> Akira Yokosawa (6):
> >>       Initial indexformat support
> >>       locking, defer: POC of bold face page number in index
> >>       defer: POC of hierarchical index with modifier part's case preserved
> >>       index: Add prenotes of legends in Index pages
> >>       index, glossary: Add underline for pages in Glossary
> >>       index: Retouch prenote layout
> >>
> >>  defer/rcu.tex                  |   2 +-
> >>  defer/rcufundamental.tex       |   2 +-
> >>  defer/rcuintro.tex             |   2 +-
> >>  glossary.tex                   | 176 ++++++++++++++++++++---------------------
> >>  glsdict.tex                    |  10 ++-
> >>  locking/locking.tex            |   4 +-
> >>  perfbook-lt.tex                |  67 +++++++++++++++-
> >>  utilities/adjustindexformat.pl |  20 +++++
> >>  utilities/runlatex.sh          |   2 +
> >>  9 files changed, 189 insertions(+), 96 deletions(-)
> >>  create mode 100755 utilities/adjustindexformat.pl
> >> --------
> >>
> >> This is not yet ready for pull.  I need to expand change logs
> >> at least.
> >>
> >> If we were using plain \index{} macro for tagging terms, you could
> >> say:
> >>
> >>     \index{some word|textit}
> >>
> >> to italicize its page number.
> >> However, \IX{some word|textit} does not work.
> >>
> >> So I need to define a number of macros:
> >>
> >>   \IXB{}, \IXBh{}{}, ... -> Bold, for that "ff" case
> >>   \IXG{}, \IXGh{}{}. ... -> Underline, for definitions in Glossary
> >>
> >> , and to use one of them where you want to emphasize.
> >>
> >> The "B" in \IXB came from "Bold", but actual style of emphasis can
> >> be changed easily by redefining the \BF{} command.
> >> \IXF{} might be a better name.  (Macro names embedded in .tex
> >> files need to be stable.)
> > 
> > I will play with this later today, Pacific Time, but in the meantime I
> > just wanted to say that having the most significant page number in an
> > index list be bold works just fine.  If we have bold, there is no need
> > for italics!
> 
> OK!   ;-)
> 
> In case you encounter build errors while switching between
> WIP- and master branches, "make clean" should help you.

I cheated and just cloned your repository separately.  ;-)

> Intermediate index-related files generated on a different branch
> might be incompatible.

So underlined is the glossary and bold is a primary reference.

Looks quite reasonable to me, thank you!

One other option for the glossary is to just give the page-number
range in the note at the beginning of the glossary.  However, the
underlining does seem more convenient for the reader.

Should that note be shortened?

	*Bold*: Major reference.
	_Underline_: Definition.

Given that there are examples of both on the first page, there should
not be too much confusion.  (Famous last words...)

							Thanx, Paul

>         Thanks, Akira
> 
> > 
> > 							Thanx, Paul
> > 
> >> Furthermore, I have not figured out the way to make those
> >> macros generate proper-format index entries in .idx file.
> >> This is mostly because I'm not good at low-level TeX programming.
> >>
> >> So I added adjustindexformat.pl so that it can be amended before
> >> fed into "makeindex".
> >>
> >> I'd like you to have a look at the changes and resulting looks of
> >> Index pages.
> >>
> >> Any feedback is welcome!
> >>
> >>         Thanks, Akira
> >>
> >>>
> >>> 							Thanx, Paul
> >>>
