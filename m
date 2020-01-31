Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:45420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726102AbgAaVMX (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Fri, 31 Jan 2020 16:12:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580505142;
        bh=/iCfkCej4D4LFxMZ0U2vFyequfEDgUPOiNozVwYidBE=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=LsEV7yiCA4v1OJrKEMjbBkv6+3EU38srxn5hftd3VamiNHgvU8TVIkSurELXnxKtT
         sivXAvhy+K0cbMFiVG6xA21CBv8Jc9ATD/z3lQURPtVNLMShGzcEKzps41dXyQ1yND
         XiBwui0Afim9aTm3+CxU23cIR+gQp1ACdcB+z9X0=
Date: Fri, 31 Jan 2020 13:12:22 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 0/6] howto: Reduce width of Listings 2.1 and 2.2
Message-ID: <20200131211222.GW2935@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <c3c7fcbc-6ff9-2e9d-3703-81cbd5773b9d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3c7fcbc-6ff9-2e9d-3703-81cbd5773b9d@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Jan 31, 2020 at 07:27:42AM +0900, Akira Yokosawa wrote:
> >From dc553b44983b30584d0f1003a729885b8b7290f2 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Thu, 30 Jan 2020 21:13:04 +0900
> Subject: [PATCH 0/6] howto: Reduce width of Listings 2.1 and 2.2
> 
> Hi Paul,
> 
> This patch set has quite a large diff stats despite the
> small changes in the resulting PDF.
> What I am trying here is to enable (semi-) automatic line breaks
> in code snippets.
> The "fvextra" package enhances the capability of fancyvrb.
> By specifying "breaklines" and "breakafter" options to the
> VerbatimL environment, snippets with a long line can be typeset
> as a plain "listing" environment.
> I see that Listings 2.1 and 2.2 do not deserve the full width
> of the page and tried to apply the fvextra approach.
> 
> However, there were unfortunate name collisions of custom
> environments.
> "fvextra" requires the "lineno" package, where "linelabel"
> and "lineref" are used as global variables.
> 
> So I need to rename the environments to "fcvlabel" and "fcvref".
> Patch 1/6 does those renames, hence the large diff stats.
> 
> Patch 2/6 adds checks to detect now erroneous uses of "linelabel"
> and "lineref".
> Without this change, as they are defined as LaTeX variables by
> "lineno", such uses wouldn't be caught by LaTeX as errors, but
> would end up in undefined references.
> The remaining warnings in the log file would be far from pin-point.
> 
> Patch 3/6 actually modifies Listings 2.1 and 2.2. At this point,
> the symbol representing carriagereturn in Listing 2.1 doesn't
> look good enough to me.
> Patch 5/6 takes care of the symbol. It also adds comments to mention
> the "-jN" option of "make".
> 
> Patch 4/6 updates FAQ-BUILD.txt.
> 
> Patch 6/6 is an independent change to loosen the required version
> of "epigraph". It turned out that the combination of the up-to-date
> "epigraph" and the "nowidow" packages doesn't work properly on
> TeX Live 2015/Debian (Ubuntu Xenial). On a more recent TeX Live
> installation where the combination works, a suggestion to upgrade
> "epigraph" will be output after the build completes.
> 
> As this patch set touches Makefile, please test carefully before
> pushing out.
> Especially, I'd like you to test Patch 2/6 and see if the error
> message, displayed when you use "linelabel" or "lineref" in place of
> "fcvlabel" or "fcvref", looks OK to you.

The following error messages looks eminently clear to me:

'linelabel' used as environment in SMPdesign/.SMPdesign.tex.swp SMPdesign/SMPdesign.tex.
Use 'fcvlabel' instead.
'lineref' used as environment in SMPdesign/.SMPdesign.tex.swp SMPdesign/SMPdesign.tex.
Use 'fcvref' instead.

And the text following:

--
SMPdesign/SMPdesign.tex-1021-\subsubsection{Allocation Function}
SMPdesign/SMPdesign.tex-1022-
SMPdesign/SMPdesign.tex:1023:\begin{lineref}[ln:SMPdesign:smpalloc:alloc]
SMPdesign/SMPdesign.tex-1024-The allocation function \co{memblock_alloc()} may be seen in
SMPdesign/SMPdesign.tex-1025-Listing~\ref{lst:SMPdesign:Allocator-Cache Allocator Function}.
------

Is even more helpful!  Very good, thank you!

And I love it that the "git clone" command can still be trivially
copy-and-pasted from howto/howto.tex.

Queued and pushed, again thank you!!!

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (6):
>   Rename environments 'linelabel' and 'lineref'
>   Makefile: Check 'linelabel' and 'lineref' used as environment
>   howto: Reduce width of Listings 2.1 and 2.2
>   FAQ-BUILD: Add 'fvextra' to the list of packages in item 10
>   howto: Tweak carriagereturn symbol at fvextra's auto line break
>   Remove required version of 'epigraph'
> 
>  FAQ-BUILD.txt                                |  30 ++-
>  Makefile                                     |  47 ++++
>  SMPdesign/SMPdesign.tex                      |  12 +-
>  SMPdesign/beyond.tex                         |  44 ++--
>  SMPdesign/partexercises.tex                  |  32 +--
>  advsync/advsync.tex                          |   8 +-
>  advsync/rt.tex                               |  40 ++--
>  appendix/questions/after.tex                 |   4 +-
>  appendix/styleguide/samplecodesnippetfcv.tex |   4 +-
>  appendix/styleguide/styleguide.tex           |  52 ++--
>  appendix/toyrcu/toyrcu.tex                   | 128 +++++-----
>  appendix/whymb/whymemorybarriers.tex         |  16 +-
>  count/count.tex                              | 200 ++++++++--------
>  datastruct/datastruct.tex                    |  80 +++----
>  debugging/debugging.tex                      |  12 +-
>  defer/defer.tex                              |  16 +-
>  defer/hazptr.tex                             |  20 +-
>  defer/rcuapi.tex                             |   8 +-
>  defer/rcufundamental.tex                     |   4 +-
>  defer/rcuintro.tex                           |   4 +-
>  defer/rcuusage.tex                           |  52 ++--
>  defer/refcnt.tex                             |  20 +-
>  defer/seqlock.tex                            |  40 ++--
>  formal/axiomatic.tex                         |  40 ++--
>  formal/dyntickrcu.tex                        | 148 ++++++------
>  formal/ppcmem.tex                            |  24 +-
>  formal/spinhint.tex                          |  44 ++--
>  future/formalregress.tex                     |   4 +-
>  future/htm.tex                               |  28 +--
>  howto/howto.tex                              |  57 ++---
>  locking/locking-existence.tex                |  20 +-
>  locking/locking.tex                          |  76 +++---
>  memorder/memorder.tex                        | 240 +++++++++----------
>  owned/owned.tex                              |  12 +-
>  perfbook.tex                                 |   9 +-
>  together/applyrcu.tex                        |  32 +--
>  together/refcnt.tex                          |  32 +--
>  toolsoftrade/toolsoftrade.tex                | 184 +++++++-------
>  utilities/checkfcv.pl                        |   8 +-
>  utilities/fcvextract.pl                      |  10 +-
>  40 files changed, 956 insertions(+), 885 deletions(-)
> 
> -- 
> 2.17.1
> 
