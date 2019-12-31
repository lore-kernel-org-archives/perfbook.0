Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:54206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727762AbfLaAG2 (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Mon, 30 Dec 2019 19:06:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577750788;
        bh=AnFn4SLbGZ3uhaT1VCf8MPm7dh8G6+5HoKZ5l03TpSY=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=YxQGW3EYgBYvZ1CIA9CCFLs8T9SU3YpgKo8NKsn3ksqOw6P/uJDZY8g7G1USF0Lpu
         iUVHtgbz/8NIbjc37t8j+Nk6IC98PvWEd4bRTpgTPMc/iHI3eJd75msJ3qfTnNsr8i
         IlSh9qhAFGxdcnXgd8YmQLIO1bGLf0rk8UbP576M=
Date: Mon, 30 Dec 2019 16:06:27 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 0/3] Improve autodate.sh
Message-ID: <20191231000627.GS13449@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <861d7415-b129-5d98-b28c-1988bc2359a4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <861d7415-b129-5d98-b28c-1988bc2359a4@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Dec 29, 2019 at 07:21:42PM +0900, Akira Yokosawa wrote:
> This patch set was inspired by your change log of commit 686915e83f79
> ("utilities/autodate: Convert current tag to release/edition text")
> saying:
> 
>     This should really use a canned library to convert numerals to
>     English-text ordinals, but none of the ones I found worked as advertised.
> 
> My guess is the ones you found are assuming bash and don't work with
> dash. You know, dash doesn't handle arrays.

It was instead that my versions of python didn't know about the
advertised library, possibly because I didn't know to tell them.

> Patch #1 is my answer and delegates the handling of ordinals to
> a LaTeX package "fmtcount".

But I like your approach better in any case, thank you!!!  ;-)

> Patch #2 is a minor update so that a repository with untracked files
> is treated as clean.

My use case for wanting the current behavior is when I add a file,
add references to it, but forget to do "git add".  The "(m)" is
a hint that I forgot something.

But what is the countervailing use case?  Maybe there is a way to
solve both problems.

> Patch #3 expands the use of tag info and displays it on every page
> at the bottom-right corner.

Nice!

I took #1 and #3, and pushed another patch that includes the most
recent tag for non-release builds.  Let's talk about #2 -- perhaps
I should take it as is, but that would require some other warning.

Thoughts?

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (3):
>   utilities/autodate: Use 'fmtcount' package for ordinals
>   utilities/autodate: Ignore untracked files in 'git status'
>   utilities/autodate: Put commit-id in footer by 'draftwatermark'
> 
>  FAQ-BUILD.txt         |  6 ++++--
>  perfbook.tex          |  9 +++++++++
>  utilities/autodate.sh | 35 ++++++++++++-----------------------
>  3 files changed, 25 insertions(+), 25 deletions(-)
> 
> -- 
> 2.17.1
> 
