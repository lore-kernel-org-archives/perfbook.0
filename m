Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:39710 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229522AbhEHXVS (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sat, 8 May 2021 19:21:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620516016;
        bh=H889S8ze7R1EirbB0K/i4dCEhT3indNPNqqrVyFbpjk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=g9Z0VoaijEMMbCOyPaLoxR9BZInsbfnvvrlvkgQf+IbpLCDbxnbmsaCH24XRp535a
         RrJKYMFmqVhUq/iPXrdCG1oehueSRn85OteYdO/A64p0vDwmsxEx5Kmq94n32E2aWN
         UAYkX4LqibNYvmentGfKPRi1pZGhp+pUI1EpLPtbq6SrAxW0DgMaxQ5w0q9eN15VCo
         Lmq3Zdmv2mWEqoPG/9ooVkjZDxFhCHI1JbEYBVVig5p95wTgj4CKz1ivqfn56+pu5s
         szKaO4N7FdJ6wEh3d/D7Q3kU8AgbmMXKhP39VKnVcD0usW8RL+w38R/1sa4epwD1zY
         4q/xqWFaCOdXQ==
Date: Sat, 8 May 2021 16:20:16 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 0/4] Employ cleveref macros, take two
Message-ID: <20210508232016.GC975577@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <d66be1a7-9ef3-bf69-de15-2a684894bc12@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d66be1a7-9ef3-bf69-de15-2a684894bc12@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, May 08, 2021 at 04:05:35PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> This patch set is to satisfy cleverefcheck up to Chapter 7.
> 
> Note that Patch 4/4 customizes the reference name of equations so that
> \cref{eq:...} expands to "Eq.~m.n" and \Cref{eq:...} expands to
> "Equation~m.n".
> 
> You can see the expansions to "Eq.~m.n" in the Answers to Quick
> Quizzes 5.17 and 6.20.

Queued and pushed, thank you!

(And I really did push it this time...)

							Thanx, Paul

> Thanks, Akira
> 
> --
> Akira Yokosawa (4):
>   count: Employ \cref{} and its variants
>   SMPdesign: Employ \cref{} and its variants
>   locking: Employ \cref{} and its variants
>   perfbook-lt: Customize reference style of equation
> 
>  SMPdesign/SMPdesign.tex       | 138 ++++----
>  SMPdesign/beyond.tex          | 121 ++++---
>  SMPdesign/criteria.tex        |  10 +-
>  SMPdesign/partexercises.tex   | 134 ++++----
>  count/count.tex               | 586 +++++++++++++++++-----------------
>  locking/locking-existence.tex |  22 +-
>  locking/locking.tex           | 268 ++++++++--------
>  perfbook-lt.tex               |   2 +
>  8 files changed, 639 insertions(+), 642 deletions(-)
> 
> -- 
> 2.17.1
> 
