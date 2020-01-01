Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:44564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727036AbgAADGN (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 31 Dec 2019 22:06:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577847971;
        bh=1KrdUsMDg3oecPBCaD55HlNDI/fV/yVYXc5ENwpVnHg=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=2cIrZegOkajuIRcFUU276Vv8waaV67PHqwG+OQAXDdJic6mDBPTVvmwXw3QbSDZkM
         KWw33d7PSa0QiyhJ/0T6a2eaXyGBnJJCUtDvPPUgPfjLqnsuJjI3JWASuoFLqeZvLW
         Rv6g4OTWolsjY8tqqla0mkGqDSi40htpMCtYYEHY=
Date: Tue, 31 Dec 2019 19:06:11 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 0/3] Improve autodate.sh
Message-ID: <20200101030611.GX13449@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <861d7415-b129-5d98-b28c-1988bc2359a4@gmail.com>
 <20191231000627.GS13449@paulmck-ThinkPad-P72>
 <21f02b44-a925-f082-4cf9-af2a42786050@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21f02b44-a925-f082-4cf9-af2a42786050@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Jan 01, 2020 at 08:36:24AM +0900, Akira Yokosawa wrote:
> On Mon, 30 Dec 2019 16:06:27 -0800, Paul E. McKenney wrote:
> > On Sun, Dec 29, 2019 at 07:21:42PM +0900, Akira Yokosawa wrote:
> >> This patch set was inspired by your change log of commit 686915e83f79
> >> ("utilities/autodate: Convert current tag to release/edition text")
> >> saying:
> >>
> >>     This should really use a canned library to convert numerals to
> >>     English-text ordinals, but none of the ones I found worked as advertised.
> >>
> >> My guess is the ones you found are assuming bash and don't work with
> >> dash. You know, dash doesn't handle arrays.
> > 
> > It was instead that my versions of python didn't know about the
> > advertised library, possibly because I didn't know to tell them.
> 
> Hm, installing python (or python3 nowadays?) packages can be tricky.
> (system/user install, installing by pip/pip3 or apt ...)

Ah, as the old saying goes, I have much to learn!

> >> Patch #1 is my answer and delegates the handling of ordinals to
> >> a LaTeX package "fmtcount".
> > 
> > But I like your approach better in any case, thank you!!!  ;-)
> > 
> >> Patch #2 is a minor update so that a repository with untracked files
> >> is treated as clean.
> > 
> > My use case for wanting the current behavior is when I add a file,
> > add references to it, but forget to do "git add".  The "(m)" is
> > a hint that I forgot something.
> 
> Ah, current behavior does help such a situation!
> 
> > But what is the countervailing use case? 
> 
> Not much of a use case, but for example, random experimental outputs
> under CodeSamples/ not covered by .gitignore will generate the "(m)",
> which looks irrelevant.

I like your suggestion below of creating directories for experiemental
not-to-be-committed results using .gitignore, and would of course welcome
a patch.

> But my view point was of receiving side of your updates.
> Now I know you've relied on the current behavior and changing it
> should be regarded as a regression.

OK, we should be good as-is, then.

> >                                           Maybe there is a way to
> > solve both problems.
> 
> Let's keep the current behavior.

Sounds good!

> >> Patch #3 expands the use of tag info and displays it on every page
> >> at the bottom-right corner.
> > 
> > Nice!
> > 
> > I took #1 and #3, and pushed another patch that includes the most
> > recent tag for non-release builds.
> 
> I thought full $description in non-release builds could be too long
> for the footer area, but the position of the watermark in the preamble
> specifies the center, and it looks reasonable. Thank you!

Very good!  And thank you for coming up with the footer trick, could
save some confusion.

> >                                           Let's talk about #2 -- perhaps
> > I should take it as is, but that would require some other warning.
> > 
> > Thoughts?
> 
> As mentioned above, I'm OK with keeping the current behavior.
> Adding some namespaces to .gitignore might be a better approach,
> but it is not urgent at all.

As noted earlier, this sounds good to me!  One approach would be to
add the experimental directory and a README within it, with the README
describing the purpose.  Then a .gitignore in that same directory could
ignore all but the README.  But maybe you have a better idea.

							Thanx, Paul

>         Thanks, Akira
> 
> > 
> > 							Thanx, Paul
> > 
> >>         Thanks, Akira
> >> --
> >> Akira Yokosawa (3):
> >>   utilities/autodate: Use 'fmtcount' package for ordinals
> >>   utilities/autodate: Ignore untracked files in 'git status'
> >>   utilities/autodate: Put commit-id in footer by 'draftwatermark'
> >>
> >>  FAQ-BUILD.txt         |  6 ++++--
> >>  perfbook.tex          |  9 +++++++++
> >>  utilities/autodate.sh | 35 ++++++++++++-----------------------
> >>  3 files changed, 25 insertions(+), 25 deletions(-)
> >>
> >> -- 
> >> 2.17.1
> >>
> 
