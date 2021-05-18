Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:58944 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244333AbhERSbg (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 18 May 2021 14:31:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621362618;
        bh=2zzolxdAf0/Fu6Sy6WEzDVTdmL87H2enOBNIHGYUU0c=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=L6fso19BeEvlqQQ8920/XkdTIF5azXd3uhtlskdlNZuD9UVh546UYccoXz2BFj6pi
         YtlBIYBJRZCBb5vURi0kbV+DpYFMFDWCqWL76SQbSQk2Glu2cubOjDUwJlRhzyDlRi
         Of7yj1Ld7wr21l3FWURDVaQz/3Bd84AMq1jd2YJjaoMhOoKotUazeeXDmmp8kVCc6N
         vJmQD5liynzj0VRDGUSUBB3xcDwlB+jROYOUK9UwhXp48aebJqq6YgSTsIdMs8TGeo
         VtIcAXHFC/d0c0L5JVNP9ib4wenLFPrrysf4fEH37b6vta2vcvUIqHJFQVhTs9f1rH
         Zk0a+3hG46SHQ==
Date: Tue, 18 May 2021 11:30:17 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 0/8] Employ cleveref macros, take four
Message-ID: <20210518183017.GO4441@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <9362d274-fae3-278b-348e-88a0f30f120b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9362d274-fae3-278b-348e-88a0f30f120b@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, May 18, 2021 at 09:13:41PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> This is (hopefully) the final round of \cref{} related updates.
> 
> Patches 1/8 and 2/8 are unrelated updates in build scripts.
> Patch 1/8 adds patterns to catch font specifiers in .svg
> figures recently added/updated.
> Patch 2/8 gets rid of noindentafter.sty in our repository.
> Recent distros have this package on their own.
> 
> Patches 3/8--8/8 are \cref{} related updates.

Applied and pushed, thank you!  And I have hereby run out of excuses
for avoiding doing several updates on my todo list.  ;-)

> I'm thinking of adding a few patterns to cleverefcheck.pl
> to catch indents by white spaces.

That sounds good -- automated error-checking can be quite helpful.

> At least, "sh ./utilities/cleverefcheck.sh" should pass
> after this patch set is applied.
 
 And it does!

> Note:
> 
>     styleguide.tex is not checked by the shell script.
>     I'll update it as far as I can, but it won't be
>     warning-free due to its nature.

Understood, and it makes sense for it to be unchecked.  It would be a
bit annoying for the script to complain about "don't do it this way"
examples in that file.  ;-)

							Thanx, Paul

>         Thanks, Akira
> 
> --
> Akira Yokosawa (8):
>   fixsvgfonts: Add pattern for 'sans-serif'
>   Omit noindentafter.sty
>   defer: Employ \cref{} and its variants, take three
>   datastruct: Employ \cref{} and its variants
>   debugging: Employ \cref{} and its variants
>   formal: Employ \cref{} and its variants
>   together, advsync, memorder: Employ \cref{} and its variants
>   easy, future, appendix: Employ \cref{} and its variants
> 
>  Makefile                             |   1 -
>  ack.tex                              |  40 +--
>  advsync/advsync.tex                  |   2 +-
>  advsync/rt.tex                       |   4 +-
>  appendix/questions/after.tex         |   8 +-
>  appendix/questions/removelocking.tex |   2 +-
>  appendix/toyrcu/toyrcu.tex           |  10 +-
>  appendix/whymb/whymemorybarriers.tex |   2 +-
>  datastruct/datastruct.tex            | 348 +++++++++++++--------------
>  debugging/debugging.tex              | 140 +++++------
>  defer/rcuapi.tex                     |  90 +++----
>  defer/rcuexercises.tex               |  12 +-
>  defer/rcuintro.tex                   |   2 +-
>  defer/rcurelated.tex                 |  10 +-
>  defer/rcuusage.tex                   | 181 +++++++-------
>  defer/updates.tex                    |   4 +-
>  defer/whichtochoose.tex              |  18 +-
>  easy/easy.tex                        |   6 +-
>  formal/axiomatic.tex                 |  90 +++----
>  formal/dyntickrcu.tex                |   2 +-
>  formal/formal.tex                    |   6 +-
>  formal/sat.tex                       |   2 +-
>  formal/spinhint.tex                  | 122 +++++-----
>  formal/stateless.tex                 |   2 +-
>  future/cpu.tex                       |  10 +-
>  future/formalregress.tex             |   2 +-
>  future/htm.tex                       |   2 +-
>  future/tm.tex                        |   2 +-
>  glossary.tex                         |   2 +-
>  memorder/memorder.tex                |  24 +-
>  noindentafter.sty                    | 194 ---------------
>  summary.tex                          |   2 +-
>  together/applyrcu.tex                |   4 +-
>  together/refcnt.tex                  |   4 +-
>  utilities/fixsvgfonts-urwps.sh       |   2 +
>  utilities/fixsvgfonts.sh             |   2 +
>  36 files changed, 581 insertions(+), 773 deletions(-)
>  delete mode 100644 noindentafter.sty
> 
> -- 
> 2.17.1
> 
