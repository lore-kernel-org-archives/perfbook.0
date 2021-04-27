Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:51532 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235382AbhD0Wx0 (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 27 Apr 2021 18:53:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619563962;
        bh=bwwXqdgNpkI9czGFKKUJax78EndiowlWuyEbK/aZetM=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=SSuCrlnVWkogyJfEpUc4lLuRB1XVeoUP7R1WQF8U+4Xrb3X1CgfRoDWUrRDgOVPrC
         RzCnqdxDtM2wbCFOPBGtUTKw+ta4U0OTKla0jDb0moqdsdCAgILqAWSYPVn1KJbl9i
         gH1gj2zh2X7PMYaytDVtNKMnvJVXSbD9QDdy3qPyKJf6rQu6X5/F83N0QhK6f8Rjp6
         xlNRwnGznW/YRRVb/7tukoDKPC8Nleh0oKyRnD5wz6NrLySPS7BIuwKeNx5RbJeXDq
         8hhukoYuQ2/NYkn5zHKi4IYtgeaZbRBJwJkT05PPzS1yxwqB4xciaMNoDJsCMoBj/U
         gN4YiG7YrnONg==
Date: Tue, 27 Apr 2021 15:52:42 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook v2 0/9] Add script to check period spacing
Message-ID: <20210427225242.GK975577@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <71cd07ce-5753-4007-8fab-3654956e5a92@gmail.com>
 <20210427155126.GI975577@paulmck-ThinkPad-P17-Gen-1>
 <c81eb726-4cff-e57a-5508-ae438d75b1f4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c81eb726-4cff-e57a-5508-ae438d75b1f4@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Apr 28, 2021 at 07:32:25AM +0900, Akira Yokosawa wrote:
> On Tue, 27 Apr 2021 08:51:26 -0700, Paul E. McKenney wrote:
> > On Wed, Apr 28, 2021 at 12:18:56AM +0900, Akira Yokosawa wrote:
> >> Hi Paul,
> >>
> >> This patch set adds a set of scripts to check proper annotation
> >> of periods to distinguish single and double spacing.
> >>
> >> Patch 1/9 adds a couple of annotations in-development version of
> >> the script had caught.
> >> Patches 2/9--5/9 add and improve the set of scripts.
> >> They are kept separate patches to show the history.
> >> Patches 6/9--9/9 are fixes in LaTeX sources to satisfy the script.
> >> There are quite a few sentences which end in the middle of
> >> input lines.
> >>
> >> After Patch 9/9 is applied, "make periodcheck" will be clean.
> >>
> >> I'm not saying the perl script is complete.
> >> There can still be false negatives I'm not aware of.
> >> False positives can happen when you add new contents.
> >
> > Queued and pushed, thank you!
> >
> > Would it make sense at some point to have "make periodcheck" happen
> > automatically during a normal build to catch addition of issues with
> > new content?
> >
> > 							Thanx, Paul
> 
> Like this?
> Note that positive periodcheck doesn't cause a make error.
> It can be promoted to a real error later when we feel confident of
> the script.
> 
> "make 2c" (or any explicit target) doesn't run the script.

This does work!

But I feel compelled to expose the ancient nature of my Makefile
knowledge and ask why not this single change?

all: $(targ) periodcheck

							Thanx, Paul

>         Thanks, Akira
> 
> --------8<--------------------------
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 28 Apr 2021 07:26:05 +0900
> Subject: [PATCH] Auto run periodcheck on 'make'
> 
> Run periodcheck on "make" and "make all".
> Now they are the same as "make periodcheck".
> "make periodcheck" builds your default target before the check.
> 
> Suggested-by: Paul E. McKenney <paulmck@kernel.org>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index ea264dc5..792fa285 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -194,7 +194,7 @@ BASE_DEPENDS := perfbook.tex $(foreach v,tcb 1c msns mss mstx msr msn msnt sf nq
>  .PHONY: help-experimental help-prefixed
>  .PHONY: paper-clean periodcheck
>  
> -all: $(targ)
> +all: periodcheck
>  
>  ifeq ($(MAKECMDGOALS),clean)
>  else ifeq ($(MAKECMDGOALS),distclean)
> @@ -611,7 +611,7 @@ ls-unused:
>  neatfreak: distclean
>  	find . -name '*.pdf' | xargs rm -f
>  
> -periodcheck:
> +periodcheck: $(targ)
>  	utilities/periodcheck.sh
>  
>  .SECONDEXPANSION:
> -- 
> 2.17.1
> 
> 
> 
