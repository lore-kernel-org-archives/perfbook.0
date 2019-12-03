Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:43016 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726189AbfLCBtJ (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Mon, 2 Dec 2019 20:49:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575337748;
        bh=sm3c6r9hCqz2bHTc18vsakNHpdRqIJtd6Yk2yyMmNKI=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=cD1b+iOFZcXgUP3A6i8FUVEMI8+nHBAwxlEsBxNRdg7MjZgE2Q7c0Bg3D+ouDQWmV
         1TSDPhJN0VnluLfXtEPLt0hIjcbRw4fS1uGZEQ54b+q+KQQBx4/+PPgnOA+UOWPfs4
         f9WxAHPcZrRPIBBnTJPy1m7KE9yV10VeulBlqEEg=
Date: Mon, 2 Dec 2019 17:49:08 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 0/6] Misc updates (a2ping vs Ghostscript, appendix/ack,
 Style Guide)
Message-ID: <20191203014908.GA2889@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <bd2bcae7-bfde-241f-281c-832615d1c9c0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd2bcae7-bfde-241f-281c-832615d1c9c0@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Dec 03, 2019 at 12:14:21AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> This patch set is the collection of updates I've made over the
> weekend.
> 
> Patches #1 and #2 result from a compatibility-breaking change in
> Ghostscript 9.50.  I noticed it while testing Ghostscript 9.50 on Fedora 31
> as a workaround of Ghostscript 9.27's bounding-box regression. a2ping 2.83p
> no longer works with gs 9.50.  I asked a2ping's maintainer for an update,
> and 2,84p has been released recently.
> 
> Patches #3 and #4 fix a typo and make use of \Cref{} macro in the reviewers'
> list.
> 
> Patch #5 is a response to your addition of newline-after-sentence rule.
> The rule talks about coding style in LaTeX source.  OTOH, the other
> conventions talk about the result of typesetting. So I made it an
> individual itemize list.
> 
> Patch #6 updates the way we call the new (current) snippets.

Queued and pushed, thank you!

>         Thanks, Akira
> 
> PS (Reminder to Paul):
> 
> Info on the frontpage needs updates (email address, where you work at).

Good point!  I have queued and pushed treewide updates for both my
email address and my employer.

							Thanx, Paul

> --
> Akira Yokosawa (6):
>   Makefile: Add compatibility check of Ghostscript and a2ping (9.50 vs 2.84p)
>   FAQ-BUILD: Add a workaround for Fedora's Ghostscript regression
>   appendix/ack: Fill in missing ')'
>   appendix/ack: Use \Cref{} for cross references in reviewers list.
>   styleguide: Clarify newline-after-sentence rule is for LaTeX source
>   styleguide: Treat current snippet scheme as 'the scheme'
> 
>  FAQ-BUILD.txt                      | 24 +++++++++-----------
>  Makefile                           | 23 +++++++++++++------
>  appendix/ack/ack.tex               | 36 +++++++++++++++---------------
>  appendix/styleguide/styleguide.tex | 11 ++++++---
>  4 files changed, 53 insertions(+), 41 deletions(-)
> 
> -- 
> 2.17.1
> 
