Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:55582 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725865AbgC1JjH (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sat, 28 Mar 2020 05:39:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585388347;
        bh=jH43uehjszmuhm2JdI0W2VNEPZVHMr0VBMztoWSHdAk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=We5ytKX8BPWqpJxAdoe7zKeJIsJk5aPhKW8kN6T6sau4zsdjWZ0+PkPhuo8QzWtM7
         cYQ/5qBL9HFqqZPBOxs/RJ5bfX7L+Eghl/ZlyglcsBUMUqYpkwXnYbtOrO7jJIMBHw
         dFOQTBkc67otW0ZyX4KmZXPLzfkEWp+nuL86btkU=
Date: Sat, 28 Mar 2020 02:39:07 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 0/4] Misc updates and fixes including 'make help'
 improvement
Message-ID: <20200328093907.GA19865@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <58f67d0a-cd08-387c-bd69-5c53c8049c4a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58f67d0a-cd08-387c-bd69-5c53c8049c4a@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Mar 27, 2020 at 08:20:20PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> This is a set of misc patches.
> 
> Patch 1/4 adds an entry in FAQ-BUILD on an issue of Fedora 31.
> 
> Patch 2/4 fixes the paper size issue in -hb build using the
> "geometry" package.  At least we now know how to add a custom paper
> size without modifying book.cls.
> The tweaks of margins look somewhat ad hoc, and they are the result
> of a few tries and errors on my side.
> 
> Patch 3/4 is a trivial typo fix.
> 
> Patch 4/4 is the update of "make help" you suggested yesterday.

Looks good, thank you!  Queued and pushed.

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (4):
>   FAQ-BUILD: Add entry on recent breakage in texlive update on F31
>   Fix paper size of -hb build
>   toolsoftrade: Fix trivial typo (api-pthreads.h)
>   Makefile: Show only official targets in 'make help'
> 
>  FAQ-BUILD.txt                 | 16 +++++++++++++++-
>  Makefile                      | 24 +++++++++++++++---------
>  perfbook.tex                  | 12 +++++++++---
>  pfbook.cls                    |  9 ++-------
>  toolsoftrade/toolsoftrade.tex |  2 +-
>  5 files changed, 42 insertions(+), 21 deletions(-)
> 
> -- 
> 2.17.1
> 
