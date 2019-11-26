Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:44900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725972AbfKZQaY (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 26 Nov 2019 11:30:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574785823;
        bh=9ez7063yabJ7t27BTqWGu5HWwtWiivY1u9H4tOA9C7g=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=XuoE3ldqiVGK4WcXfppok+UCL/4EfSOLRMJC5Ht+IwFlCclCvxuCs+4asAnDM2nj6
         gpU2RQqCJu4vNr2pmy5UsEA37YxIn0E3t8vWFow5P5mgz9azKnzqZ8hxMCK38XS/vB
         3Z5ekSOl146ZU0Z0+2pJF/vYaE6+iaUIKnWbIZ84=
Date: Tue, 26 Nov 2019 08:30:23 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [perfbook GIT PULL] Use \clnrefragne to reference range of lines
Message-ID: <20191126163023.GR2889@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <9e1089f7-0b30-bd84-3ef3-5fc454a923bf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e1089f7-0b30-bd84-3ef3-5fc454a923bf@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Nov 24, 2019 at 04:21:48PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> This pull request consists of changes to use \clnrefrange to reference
> range of lines in snippets. The motivation is to use endashes (--)
> consistently (as much as possible) for ranges of numbers throughout perfbook.
> 
> NOTE: What character to use in \crefrange and \clnrefrange is specified
>       in perfbook.tex using a couple of macro definitions.
>       E.g.: "\newcommand{\crefrangeconjunction}{--}" and
>       "\newcommand{\clnrefrange}[2]{lines~\lnref{#1}--\lnref{#2}}"
> 
> The final (15th) commit uses \crefrange for ranges of figure numbers.
> 
> After these changes, there remain only a couple of tens of dashes (-)
> which represent ranges of numbers in the LaTeX sources of perfbook.
> 
> Other possible changes to use \cref{} and its variants do not affect
> the resulting PDF in most cases. Such changes are error prone as are evident
> in fixes by commits 7b327fa2fe97 ("miscellaneous: Fix numerous typos") and
> a35705b57c70 ("advsync/rt: Fix usage of \clnref{}"). 
> So they are not included in this request. Such changes can wait until
> there is some other change nearby.

Pulled and pushed, thank you!

							Thanx, Paul

>         Thanks, Akira
> --
> The following changes since commit cfc525d6386e17dbe7ec6e5e658678139e60ee2b:
> 
>   Typo fixes: "and and" and light-weight->lightweight (2019-11-23 11:23:01 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/akiyks/perfbook.git tags/for-paul-2019.11.24b
> 
> for you to fetch changes up to 38eec3194c9aac87a63568ef42f1e626408bb5dd:
> 
>   Use \crefrange{}{} for range of figures (2019-11-24 13:44:41 +0900)
> 
> ----------------------------------------------------------------
> Akira Yokosawa (15):
>       toolsoftrade: Use \clnrefrange{}{} for range of lines in snippets
>       toolsoftrade: Add cross reference to lines in snippets
>       count: Use \clnrefrange{}{} for range of lines in snippets
>       SMPdesign: Use \clnrefrange{}{} for ranges of lines in snippets
>       SMPdesign: Add cross references to lines in snippets
>       locking: Use \clnrefrange{}{} to reference range of lines in snippets
>       defer: Use \clnrefrange{}{} to refernece range of lines in snippets
>       defer/rcufundamental: Add cross refernece to line in snippet
>       datastruct: Use \clnrefrange{}{} to refernece range of lines in snippets
>       debugging: Use \clnrefrange{}{} to refernece range of lines in snippets
>       formal: Use \clnrefrange{}{} to refernece range of lines in snippets
>       together: Fix singular/plural verb form
>       advsync/rt: Fix usage of \clnref{}
>       Add cross references to lines in snippets of count_lim and count_stat_eventual
>       Use \crefrange{}{} for range of figures
> 
>  CodeSamples/count/count_stat_eventual.c |   4 +-
>  CodeSamples/toolsoftrade/rwlockscale.c  |   2 +-
>  SMPdesign/SMPdesign.tex                 |  10 +--
>  SMPdesign/beyond.tex                    |  27 ++++---
>  SMPdesign/partexercises.tex             |  18 ++---
>  advsync/rt.tex                          |   4 +-
>  count/count.tex                         | 135 ++++++++++++++++----------------
>  datastruct/datastruct.tex               |  67 ++++++++--------
>  debugging/debugging.tex                 |  14 ++--
>  defer/defer.tex                         |   8 +-
>  defer/hazptr.tex                        |  18 ++---
>  defer/rcufundamental.tex                |  11 ++-
>  defer/rcuintro.tex                      |   2 +-
>  defer/rcuusage.tex                      |   8 +-
>  defer/refcnt.tex                        |   8 +-
>  defer/seqlock.tex                       |  12 +--
>  formal/axiomatic.tex                    |  20 ++---
>  formal/dyntickrcu.tex                   |   2 +-
>  formal/spinhint.tex                     |  60 +++++++-------
>  locking/locking-existence.tex           |   2 +-
>  locking/locking.tex                     |  16 ++--
>  owned/owned.tex                         |  16 ++--
>  together/applyrcu.tex                   |   2 +-
>  toolsoftrade/toolsoftrade.tex           |  66 +++++++++-------
>  24 files changed, 279 insertions(+), 253 deletions(-)
