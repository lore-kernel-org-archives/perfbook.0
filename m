Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:55128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726385AbgG2RxH (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Wed, 29 Jul 2020 13:53:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596045186;
        bh=ihfOePfz8lRs6sfLugCGmlOu/PA6QutUuUi1p4cezd4=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=miKU/XYTkZO/MJXVATeFHM2O4VmWZfODEyO6qPrKZZuCgNIxZaguCIz8Vb6kN4l9T
         hopAObZ4eRKUlB/M1TxvCetuYnxkK34DlHo4kmB5XC7LVCRmTUhsHTdEGFXSTRZyNU
         Rek99xgGZ4jtcBMiQb3hozFU9xmhYg5FAqczXhOE=
Date: Wed, 29 Jul 2020 10:53:06 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 0/5] Chapterwise QQZ answers
Message-ID: <20200729175306.GX9247@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <abceee6f-6520-bcb5-781d-a53b0adfa5b7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abceee6f-6520-bcb5-781d-a53b0adfa5b7@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Jul 30, 2020 at 12:11:52AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> So, in the mean time, I've attempted chapterwise QQZ answers.
> This patch series is the resulting changes.
> 
> Patch #1 fixes a typo in Makefile which I noticed during this
> development.
> 
> Patch #2 is the main change enabling chapterwise QQZ answers
> in perfbook-nq.pdf.
> This patch becomes a large one, as the addition of argument
> to macros in qqz.sty requires tree-wide changes for successful
> build.  It also contains minor tweaks in howto.tex.
> 
> Patches #3--#5 are minor updates.
> Patch #5 results in a table mostly identical to Table E.5.
> I don't think these quick quizzes are redundant, though.
> 
> The resulting perfbook-nq.pdf looks fairly reasonable to me.
> Some of the question parts have room to improve so that
> they are less context-dependent.
> 
> Let me know what you think.

Very nice!!!  I have queued and pushed it.  I removed an end-of-line
space character on the last in the series, FYI.

The ability to jump back to the context makes the context-independence
less of an emergency than it might be, but if you know of some that
could use immediate help, please point them out to me.  Longer term,
it will of course be necessary to scan each quick quiz and update those
that need to be more self-contained.

For a printed book, would it make sense to put the page number of the
quick-quiz source (the location of the little box containing "QQ" and
the quick-quiz number) into each answer?  Or after each question?

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (5):
>   Makefile: Fix typo in CREFPTN
>   Enhance qqz scheme for chapterwise QQZ answers
>   perfbook-lt.tex: Tell cleveref not to capitalize 'page' in \cpageref{}
>   datastruct: Use nbsp in captions (State (a), State (b), etc.)
>   formal: Retouch Table E.4
> 
>  .gitignore                           |  2 +-
>  Makefile                             | 17 ++++++++---
>  SMPdesign/SMPdesign.tex              |  4 ++-
>  advsync/advsync.tex                  |  4 ++-
>  appendix/questions/questions.tex     |  4 ++-
>  appendix/toyrcu/toyrcu.tex           |  4 ++-
>  appendix/whymb/whymemorybarriers.tex |  4 ++-
>  count/count.tex                      |  4 ++-
>  cpu/cpu.tex                          |  4 ++-
>  datastruct/datastruct.tex            | 12 ++++----
>  debugging/debugging.tex              |  4 ++-
>  defer/defer.tex                      |  4 ++-
>  easy/easy.tex                        |  4 ++-
>  formal/axiomatic.tex                 | 26 ++++++++++-------
>  formal/formal.tex                    |  4 ++-
>  future/future.tex                    |  4 ++-
>  howto/howto.tex                      | 27 ++++++++++++++----
>  intro/intro.tex                      |  4 ++-
>  locking/locking.tex                  |  4 ++-
>  memorder/memorder.tex                |  4 ++-
>  owned/owned.tex                      |  4 ++-
>  perfbook-lt.tex                      |  5 ++++
>  qqz.sty                              | 22 +++++++++++++--
>  together/together.tex                |  4 ++-
>  toolsoftrade/toolsoftrade.tex        |  4 ++-
>  utilities/divideqqz.pl               | 42 ++++++++++++++++++++++++++++
>  26 files changed, 179 insertions(+), 46 deletions(-)
>  create mode 100755 utilities/divideqqz.pl
> 
> -- 
> 2.17.1
> 
