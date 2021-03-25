Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:53092 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229676AbhCYQQx (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Thu, 25 Mar 2021 12:16:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616689013;
        bh=KbjOwGeAcKRD+g8zouEeplbaF6wrxZ2ePDbhbR/WWGk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=iCH7inpT5O4T4q35HcNFxcI+SVMvCdHjrAuVwwpZc7ozAFUw9b0iFFCqXl6NDT0CH
         kMeWN7TvZqIpNFiR/mfS4sZsPoY33igqsGJSBCDeRpk8ENo1TO23vHsfvNCcZil45l
         7YEJRzAn3RXf4mEG1FaoXKyWVXM3JauRAsDKh3NLv6vXWZ/fcxtXlYWtqxhWwogzy6
         f8vzaL++ZVbplu2mVUD3h/Mi3QnRyOS+QDYP8cU0wvvSbTngPuGP0t7mQ324zRJZFg
         ++lE7M93EFxHDRhdE+Er4nWwGLGnhtHWWzXRb85LBSoulpeFVzBJlspMcEvrBED1rK
         zoQlzKVylHWTA==
Date: Thu, 25 Mar 2021 09:16:52 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 0/5] ebook reader size support
Message-ID: <20210325161652.GL2696@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20210323010153.GH77072@balbir-desktop>
 <64419413-f54f-a737-bcae-e03b8ecaf606@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64419413-f54f-a737-bcae-e03b8ecaf606@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Balbir Singh <bsingharora@gmail.com>, perfbook@vger.kernel.org

On Thu, Mar 25, 2021 at 07:49:44PM +0900, Akira Yokosawa wrote:
> Hi Balbir and Paul,
> 
> So, this is a revised patch set based on the RFC PATCH from
> Balbir.
> 
> Hearing no objection to the rename of "-er" to "-eb",
> I did the rename in Patch 1/5 of Balbir's.
> Patch 2/5 is an updated one I sent earlier, with additional 
> float-barrier macro for ebooksize build and minor tweaks.
> Note that the extra blank line at the bottom of \ebresizeverb
> is now fixed.
> Patch 3/5 is also an updated one I sent earlier.
> Patch 4/5 shrinks floats in styleguide.
> Patch 5/5 updates help text in Makefile to mention build targets
> for ebooksize.  They are marked as (WIP) for the moment.
> 
> This set can be applied to current master.

When I try "git am -s -3", I get this:

------------------------------------------------------------------------

Applying: perfbook-lt: Add macro to shrink floats for ebook
fatal: sha1 information is lacking or useless (perfbook-lt.tex).
error: could not build fake ancestor
Patch failed at 0001 perfbook-lt: Add macro to shrink floats for ebook
The copy of the patch that failed is found in: .git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

------------------------------------------------------------------------

The usual cause of this is when the series is on top of a few additional
patches in your git archive.  If this is the case, then it is possible
that you can rebase them without git complaining because git analyzes the
intervening patches.  Lacking those intervening patches in my archive,
git just complains at me.

If this is the case, could you please rebase this series onto master,
then resend?  Alternatively, resend including the intervening patches,
allowing me to do the rebase.

If there are no intervening patches in your archive, I have no idea what
is happening.  ;-)

							Thanx, Paul

>        Thanks, Akira
> 
> --
> Akira Yokosawa (4):
>   perfbook-lt: Add macros to shrink floats for ebook
>   cpu, toolsoftrade, count, rcuapi: Shrink floats for ebook reader
>   styleguide: Adjust float size and add a floatbarrier for ebook-size
>     build
>   Makefile: Add info on ebooksize build in help and help-full
> 
> Balbir Singh (1):
>   perfbook/papersize: ebook reader size support
> 
>  Makefile                           | 21 +++++++++-
>  appendix/styleguide/styleguide.tex | 12 ++++++
>  count/count.tex                    | 15 ++++++--
>  cpu/overheads.tex                  |  2 +
>  defer/rcuapi.tex                   | 12 +++++-
>  perfbook-lt.tex                    | 62 ++++++++++++++++++++++++++----
>  toolsoftrade/toolsoftrade.tex      |  2 +
>  7 files changed, 111 insertions(+), 15 deletions(-)
> 
> -- 
> 2.17.1
> 
> 
