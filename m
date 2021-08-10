Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:34554 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231465AbhHJS4a (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 10 Aug 2021 14:56:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628621768;
        bh=U4SVHQ3oYU1upZntaRjCVG3wAlMzRqSkT/BDFVZpCwg=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=pkcFtFZvfxR6EyUO6utFNaedlMkGGpWaB1zbGx8wjlfKgjEW2TDJxw1fX4MnUDRmx
         N9Hw70wPX5E1YsqNQ3nniQw0qvEvf2FAg9beip4jiU1kQNT22hceU33E/i4N/Mo6Va
         votItbUPyWyyrvysIMOEB42Zafqy41TEqvvWzr5ng5yzBY4bv6nqlcN59RXTlrdWw8
         MYR2rHNdFxfliysXNiV+JWgzPGtBm6OZPj6LbZrtm3UptrCwn7RJ0BDrKvqYMwPDh2
         atopKN6aEoaNvKm0AtwT0XZ3HB6Y6MiL9/MeFvsHVULcR3iHT/GcS4Qzlg6rIgMW79
         LJXjgPAAWs2Dw==
Date: Tue, 10 Aug 2021 11:56:07 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 0/7] Break and capitalize after colon, take three
Message-ID: <20210810185607.GK4126399@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <ba83888b-a10e-4a9e-d55d-e6e2ca5cacb9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba83888b-a10e-4a9e-d55d-e6e2ca5cacb9@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Aug 10, 2021 at 01:33:44PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> Here are colon related changes though Chapter 17.
> They don't alter appearance except for capitalization and minor
> changes in Patch 3/7 mentioned below.
> 
> In Patch 2/7, "dynticks" behind a colon is enclosed by plain {}.
> In Patch 3/7, messages from pan are enclosed by \co{}.
> In Patch 6/7, "ppc64" behind a colon is enclosed by plain {}.
> These are to escape checks by to-be-updated scripts.
> 
> The other patches are (hopefully) trivial.

Queued and pushed, thank you!

> My hope is to complete similar changes in Appendices soon.

Looking forward to it!

> FWIW, I have been working on the improvement of appearance of CJK
> translations in kerneldoc (pdfdocs) recently [1], hence my low activity
> in perfbook.
> 
> [1]: [PATCH v4 0/9] docs: pdfdocs: Improve font choice in CJK translations
>     https://lore.kernel.org/linux-doc/39d0fb0f-b248-bca4-2dac-df69e8d697b1@gmail.com/#t

Nice!!!

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (7):
>   debugging: Break and capitalize after colon
>   formal: Break and capitalize after colon
>   formal: Use \co{} for pan messages containing colon
>   together: Break and capitalize after colon
>   advsync: Break and capitalize after colon
>   memorder: Break and capitalize after colon
>   easy, future: Break and capitalize after colon
> 
>  advsync/advsync.tex      |  31 +++++++-----
>  advsync/rt.tex           |  72 +++++++++++++++------------
>  debugging/debugging.tex  |  92 +++++++++++++++++++----------------
>  easy/easy.tex            |   6 +--
>  formal/axiomatic.tex     |   3 +-
>  formal/dyntickrcu.tex    |  17 ++++---
>  formal/formal.tex        |   7 ++-
>  formal/ppcmem.tex        |   4 +-
>  formal/spinhint.tex      |  44 ++++++++++-------
>  future/cpu.tex           |   5 +-
>  future/formalregress.tex |  24 +++++----
>  future/htm.tex           |   8 +--
>  future/tm.tex            |  30 +++++++-----
>  memorder/memorder.tex    | 102 +++++++++++++++++++++++----------------
>  together/applyrcu.tex    |   6 +--
>  together/count.tex       |  10 ++--
>  together/refcnt.tex      |   2 +-
>  17 files changed, 269 insertions(+), 194 deletions(-)
> 
> -- 
> 2.17.1
> 
