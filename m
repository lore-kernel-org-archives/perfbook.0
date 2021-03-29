Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:57932 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230266AbhC2PcN (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Mon, 29 Mar 2021 11:32:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617031930;
        bh=l9m26brg4yeGuE9PTClPXG8ME6Nf2W1QtyhbIAGxNX4=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=io0EEpbkuFd2J9RRRRYWCLOS2AXoo6RAIDQ0hfVMcru0YNW3w8mCRV5huNjDztdMb
         O+VFRpdriei0/W1MqAzgEs97SyMgDCv/B9EVvPo/WKYwv/Y25DcExW2KTLBcVo7MzJ
         qZWOyGZBuAoSBlxfejEtXaADz3YuRhhJ6AkXOo1C5/Y+V4VPMNK+ELO8/mIn/FFOpE
         o11yEYlHhZJpzPCH7GnWgriNmNqfXLcRepPZeUbNMq0KlmVx4OjYyK+BLtEmtyTmYs
         +ei8JP4dId5XxEXMG5bj13fmAiL634ehw3mgfND6xwRO8dLKDvOUW/iyoUAwhQqqdT
         MnP2sSoUXNyCw==
Date: Mon, 29 Mar 2021 08:32:10 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 0/5] Misc fixes and updates
Message-ID: <20210329153210.GV2696@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <d63ba139-abc7-3837-b44a-294a48a1b216@gmail.com>
 <20210328160836.GT2696@paulmck-ThinkPad-P72>
 <418b8e1f-0030-c577-afe8-b868e7e0984f@gmail.com>
 <20210329000656.GU2696@paulmck-ThinkPad-P72>
 <dcc0e180-4df3-2f9e-cff3-30afbde74275@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dcc0e180-4df3-2f9e-cff3-30afbde74275@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Mar 29, 2021 at 08:54:05PM +0900, Akira Yokosawa wrote:
> On Sun, 28 Mar 2021 17:06:56 -0700, Paul E. McKenney wrote:
> > On Mon, Mar 29, 2021 at 07:15:17AM +0900, Akira Yokosawa wrote:
> >> On , Paul E. McKenney wrote:
> >>> On Sun, Mar 28, 2021 at 05:48:14PM +0900, Akira Yokosawa wrote:
> >>>> Hi Paul,
> >>>>
> >>>> This patch set consists of fixes/updates, some of which take care
> >>>> of ebook-size build.
> >>>>
> >>>> Patch 1/5 fixes truncated index pages in ebook-size build.
> >>>> Patch 2/5 adds check of warning messages from makeindex, which are
> >>>> sometimes hard to track down after the fact.
> >>>> Patch 3/5 improves look of final pages of index.
> >>>> I'd like final pages of chapters in two-column layout to be
> >>>> balanced similarly, but have not succeeded.
> >>>> Patch 4/5 fixes the wrong use of \Clnref{} macro, which I failed to
> >>>> catch before the release of Second Edition.
> >>>> Patch 5/5 fixes an orphaned heading of Section B.2 in ebook-size
> >>>> build.
> >>>>
> >>>> To build ebook-size PDF with index pages enabled, use the sequence
> >>>> of command below:
> >>>>
> >>>>     rm perfbook-ix.tex; env PERFBOOK_PAPER=EB make ix
> >>>>
> >>>> Resulting perfbook-ix.pdf will be of ebook size.
> >>>> As was mentioned earlier, make error due to messages of
> >>>> "LaTeX Warning: Float too large for page by ..." is expected
> >>>> and can be ignored.
> >>>
> >>> Applied, thank you!
> >>>
> >>> Just out of curiosity, what must be typed to get an ebook layout with
> >>> index?  My guess of "PERFBOOK_PAPER=EB make ix" did not do the trick.
> >>> Of course, "make ix" continues to create a two-column full-size PDF
> >>> with index.
> >>
> >> At the moment, you need to manually remove perfbook-ix.tex
> >> before the rebuild, which is why I wrote:
> >>
> >>>>     rm perfbook-ix.tex; env PERFBOOK_PAPER=EB make ix
> >>
> >> above.
> >>
> >> I think this can be automated by adding some dependency in the Makefile.
> >> Will look into it later.
> > 
> > That works, thank you, and apologies for my blindness!
> > 
> > If we aren't careful, we will end up with a combinatorial explosion
> > of Makefile targets.  Worse things could happen, I guess.  ;-)
> 
> My plan was to enable indexing by default when my WIP branch is
> ready to be merged.
> 
> > 
> > Would it help reduce Makefile complexity by having the default target
> > do fancy Quick Quizzes like it does for releases and editions?
> 
> Yes, it is high time to do some refactoring of make targets.
> 
> Before changing Makefile, how does the provisional "make help-full" text
> at the bottom look to you?  Still too complex?
> 
> Its commit log would be something like:
> 
> EXP Makefile: (help text only) Refactor build targets
>     
> Main points:
>     
>     o Promote qq+ix (- highlighting) -> default "perfbook.pdf"
>     o "df" (draft) as the same as current default (no QQZ framing, no indexing)
>       for quicker build
>     o "ix" for draft check of indexing (with indexed terms/names highlighted),
>       no QQZ framing
>     o Promote "nq", "sf" "sfnq" as semi-official targets. (some might prefer
>       sans serif font for ebook)
>     o Prepare ebook specific targets "eb", "ebnq", "ebsf", "ebsfnq", "ebix",
>       and "ebdf" (independent of PERFBOOK_PAPER).
>     o Prepare 1c* variants for all the 2c targets. (there is no "1ceb*" nor
>       "eb1c*", as "eb" implies "1c".)
> 
> Not-Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

As long as "make help" is short, I am fine with "make help-full" being
long and detailed.  It does look like some of the options might be ready
to be removed, but I will trust your judgment on that.

							Thanx, Paul

>         Thanks, Akira
> 
> > 
> > 							Thanx, Paul
> > 
> >>>>         Thanks, Akira
> >>>>
> >>>> --
> >>>> Akira Yokosawa (5):
> >>>>   index: Adjust settings respecting ebook-size build
> >>>>   runlatex.sh: Catch warning from makeindex early
> >>>>   index: Enable balanced layout of last page of multi-column index
> >>>>   together: Fix usage of \clnref{} for 'lines M and N'
> >>>>   toyrcu: Move float away from section heading
> >>>>
> >>>>  appendix/toyrcu/toyrcu.tex | 10 +++++-----
> >>>>  perfbook-lt.tex            |  8 +++++---
> >>>>  together/applyrcu.tex      |  2 +-
> >>>>  utilities/runlatex.sh      |  5 +++++
> >>>>  4 files changed, 16 insertions(+), 9 deletions(-)
> >>>>
> >>>> -- 
> >>>> 2.17.1
> >>>>
> 
> ------
> $ make help-full
> Official targets (Latin Modern Typewriter for monospace font):
>   Full,              Abbr.
>   perfbook.pdf,      2c:   (default) 2-column layout
>   perfbook-1c.pdf,   1c:   1-column layout
> Note:
>   Official targets now enable indexing and Quick-Quiz framing.
> 
> Set env variable PERFBOOK_PAPER to change paper size:
>    PERFBOOK_PAPER=A4: a4paper
>    PERFBOOK_PAPER=HB: hard cover book
>    PERFBOOK_PAPER=EB: ebook reader, always 1c layout (WIP)
>    other (default):   letterpaper
> Note:
>   Modified PERFBOOK_PAPER takes effect after "make paper-clean".
> 
> Paper-size specific targets (independent of PERFBOOK_PAPER):
>   perfbook-lt.pdf,   lt:   2c layout on letterpaper
>   perfbook-hb.pdf,   hb:   2c layout for hard cover book
>   perfbook-a4.pdf,   a4:   2c layout on a4paper
>   perfbook-eb.pdf,   eb:   1c layout for ebook reader (WIP)
> 
> Semi-official targets:
>   Full,              Abbr.
>   perfbook-nq.pdf,   nq:   2c without inline Quick Quizzes (chapterwise Q&As)
>   perfbook-sf.pdf,   sf:   2c with sans serif font
>   perfbook-sfnq.pdf, sfnq: sf + nq
> 
> Targets for draft check, non-framed Quick Quizzes (quicker build)
>   perfbook-ix.pdf,   ix:   for draft check, with indexed terms highlighted
>   perfbook-df.pdf,   df:   for draft check, without indexing
> 
> Prefixed targets:
>   "1c*" such as "1cnq", "1csf", and "1cix" are for 1c-layout.
>   "ebnq", "ebsf", "ebsfnq", "ebix", and "ebdf" are for ebook-size 1c-layout,
>      independent of PERFBOOK_PAPER. (WIP)
> 
> Experimental targets:
>   perfbook-msnt.pdf, msnt: newtxtt as monospace (non-slashed 0)
>   perfbook-mstx.pdf, mstx: txtt as monospace
>   perfbook-msr.pdf,  msr:  regular thickness courier clone as monospace
>   perfbook-msn.pdf,  msn:  narrow courier clone as monospace
> 
> Historical targets:
>   perfbook-tcb.pdf,  tcb:  table caption at bottom (First Edition)
>   perfbook-msns.pdf, msns: non-scaled courier (First Edition)
>   perfbook-mss.pdf,  mss:  scaled courier (default in early 2017)
> 
> Notes:
>   - "msnt" requires "newtxtt". "mstx" is a fallback target for older TeX env.
>   - "msr" and "msn" require "nimbus15".
>   - "msn" doesn't cover bold face monospace.
>   - "sf" requires "newtxsf".
>   - All the targets except for "msn" use "Latin Modern Typewriter" font
>     for code snippets.
> ------
> 
