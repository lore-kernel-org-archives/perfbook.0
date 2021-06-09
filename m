Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:34694 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229472AbhFITZm (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Wed, 9 Jun 2021 15:25:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623266627;
        bh=lttT+s8JGfBLCel9b3OyAArk2YAdpLfnVrgswwulLHY=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Uwps4GF+Lr26Ym07iLjiN60Xm53j2gQqMi+DFAS+/5EpQTsrTFn5NLR/B7bsQf4Cd
         fG3IVIWT3NsCcBNjS5nqNnYm1jHmLG2OStGOdkrXAFx+c4G/ZXnOImz5zJjDvg78Ob
         BGlVPkq9G2RabPPT2H2fZm5S5TwN+QMoD6ViWMxEj1A+OcDiS0olGyw33B1CqXAxNY
         BfDEkX4wymQt4xMPaYCOyCDICzxV20BnKdcTdcMFJQ+Zm2Zd7Zh6ATq0gCpRNvv8/B
         CrYsI55iSt+69qOElpMg+Jheqiu7yPqQU+KffeqfTBaYv56zL4ViAlSomRXpETY5D7
         WpP6hMCuEeodA==
Date: Wed, 9 Jun 2021 12:23:47 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [GIT PULL -perfbook] Add checks with regard to punctuation marks
Message-ID: <20210609192347.GJ4397@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <70a41d88-1892-3937-3af5-d3db3657d74c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70a41d88-1892-3937-3af5-d3db3657d74c@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Jun 09, 2021 at 11:59:42AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> It took a while for me to sort out the spacing width after punctuation
> marks.

Thank you very much for doing all of this!

> Previous updates took care of mid-sentence and end-of-sentence
> periods.
> It turns out that we need to care other punctuation marks in the
> same way.  My experiment shows that "!", "?", and ":" behaves in the
> same way as ".".
> 
> For cleverefcheck to work, we need to make sure end-of-sentence
> punctuation marks be at the end of input lines, so periodcheck.pl
> now treats "!" and "?" in the same way as ".".
> 
> cleverefcheck now checks sentences starting with lower-case words
> as well as \cref{} and its variants.
> 
> It also checks indents by white spaces now.
> 
> All the offending patterns in LaTeX sources have fixed.
> 
> Finally "make" will run both periodcheck and cleverefcheck.

Very good!!!

> As for colons, I'm not sure what is your preference with regard
> to capitalization of the next words and the spacing width after
> them, so no check is done at the moment.
>  
> If you have some preference, I can update the scripts to enforce
> it.

In this case, I prefer the simple British approach to that of my
homeland, so please unconditionally capitalize after a colon.

(Instead of the American approach of doing so only if the word following
the colon begins a complete sentence, which is not something I want to
be checking manually, let alone via a script!)

>         Thanks, Akira
> --
> The following changes since commit a20cf5ebd8605d93bb35876a26907fe294278eb8:
> 
>   defer: Fix lack of rcu_register_thread() in singleton_reader() (2021-06-08 14:58:10 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/akiyks/perfbook.git tags/for-paul-2021.06.09a
> 
> for you to fetch changes up to f70493ae24172bb73ce4a0560d4c1f958baedd51:

Pulled and pushed, thank you!

							Thanx, Paul

>   styleguide: Adjust cleveref macro usage where possible (2021-06-09 11:28:50 +0900)
> 
> ----------------------------------------------------------------
> Akira Yokosawa (11):
>       cleverefcheck: Add check of sentences starting with lower-case words
>       periodcheck: Check question and exclamation marks as well
>       formal/dyntickrcu: Fix unintended paragraph break
>       memorder: Move float snippet away of QQA heading
>       treewide: Annotate punctuation marks
>       treewide: Make end-of-sentence punctuation marks be at end-of-line
>       debugging: Move period out of double quotes
>       cleverefcheck: Add check of indent by white spaces
>       treewide: Fix indents by white spaces
>       Makefile: Auto run cleverefcheck on 'make'
>       styleguide: Adjust cleveref macro usage where possible
> 
>  Makefile                             |  2 ++
>  SMPdesign/partexercises.tex          |  3 +-
>  advsync/rt.tex                       |  6 ++--
>  appendix/styleguide/styleguide.tex   | 23 +++++++-------
>  appendix/toyrcu/toyrcu.tex           |  4 +--
>  appendix/whymb/whymemorybarriers.tex |  2 +-
>  count/count.tex                      |  6 ++--
>  cpu/overheads.tex                    |  2 +-
>  datastruct/datastruct.tex            |  2 +-
>  debugging/debugging.tex              | 44 ++++++++++++++------------
>  defer/defer.tex                      |  2 +-
>  defer/rcuapi.tex                     |  4 +--
>  defer/rcurelated.tex                 |  2 +-
>  defer/rcuusage.tex                   |  2 +-
>  defer/whichtochoose.tex              |  2 +-
>  easy/easy.tex                        |  3 +-
>  formal/dyntickrcu.tex                |  2 +-
>  formal/ppcmem.tex                    |  2 +-
>  formal/spinhint.tex                  | 12 +++----
>  locking/locking.tex                  |  4 +--
>  memorder/memorder.tex                | 20 ++++++------
>  together/refcnt.tex                  |  2 +-
>  toolsoftrade/toolsoftrade.tex        |  9 +++---
>  utilities/cleverefcheck.pl           | 61 ++++++++++++++++++++++++++----------
>  utilities/cleverefcheck.sh           |  1 +
>  utilities/periodcheck.pl             | 28 ++++++++++++-----
>  26 files changed, 150 insertions(+), 100 deletions(-)
