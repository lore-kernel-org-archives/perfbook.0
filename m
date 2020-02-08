Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:34558 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727131AbgBHNEA (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sat, 8 Feb 2020 08:04:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581167039;
        bh=TisMqObnYjhKRdBz41ZgHlq96BMoSawJOpIFrmUCFu8=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Q5htl6HTXCeTZS8vbfPHYu9Uxjtj9g7u+7vox6+sSGNcPSJDH8V2E4FR16XpC1lfR
         IK48DDzMW0fwUyCpnShNQc8SoU3nlebUCS7kQAxIfHBBTI/H0J1ujyvWIo3p1EdN9o
         bTOKRIPZUv/aSb1U7fyzIGLPW74Ohz/3sZPsbaSo=
Date: Sat, 8 Feb 2020 05:03:58 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] SMPdesign: Fix meaningless consecutive blank pages
Message-ID: <20200208130358.GR2935@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <74a6c257-cf2a-315d-202a-a109c874e843@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74a6c257-cf2a-315d-202a-a109c874e843@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Feb 08, 2020 at 09:03:10PM +0900, Akira Yokosawa wrote:
> >From 66df1c9aaaefb2ef5ccfd0c23837b33218a24f30 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 8 Feb 2020 08:29:08 +0900
> Subject: [PATCH] SMPdesign: Fix meaningless consecutive blank pages
> 
> In the introduction of Dining Philosophers, there is two-page
> "think about it" gap before presenting an answer.
> 
> Let's see what we need for print editions.
> 
> When the question is on an odd page, the answer can be on the next page
> (the other side of the question's page).
> When the question is on an even page, the answer should be on the
> next even page to prevent it from being spotted too early.
> 
> For electronic editions, there needs to be a gap of at least one
> page regardless of the question's position.
> 
> As \cleardoublepage changes its behavior depending on whether it is
> on an odd page (one blank page) or on an even page (nothing), it
> can not cover the requirement for electronic editions.
> 
> For our purpose, the sequence of \clearpage, "((Intentional blank page)",
> and another \clearpage should suffice.
> 
> Reported-by: Paul E. McKenney <paulmck@kernel.org>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

I have queued this, thank you!

It works as desired with the current setup because the discussion and the
reveal both end up on even pages.  You can check this using the "evince"
PDF viewer by putting it into two-page mode (apologies for not saying
so earlier, but I just now remembered myself).

Wasting the single page isn't a disaster, as you say, but could the
trick shown here avoid even that?

https://tex.stackexchange.com/questions/6143/if-then-else-for-odd-page-even-page

I tried this (but leaving out the recommended \strictpagecheck, which
might mean that there could be errors when this occurs near the beginning
of a page?) and it seems to handle both cases.  Please see below for a
patchlet on top of your patch.

If this really works, could you please fold it into your patch with any
needed adjustments?  If it is broken in some way, well, I do have your
existing patch which does represent a much-appreciated improvement!

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/SMPdesign/partexercises.tex b/SMPdesign/partexercises.tex
index 4ceaefe..82de2b9 100644
--- a/SMPdesign/partexercises.tex
+++ b/SMPdesign/partexercises.tex
@@ -84,6 +84,8 @@ there will be five forks available to four philosophers.
 At least one of these four will have two forks, and will thus be able
 to eat.
 
+\clearpage  //  Comment out to see the other option.  And move it around.
+
 This general technique of numbering resources and acquiring them in
 numerical order is heavily used as a deadlock-prevention technique.
 However, it is easy to imagine a sequence of events that will result
@@ -107,8 +109,12 @@ philosophers to eat concurrently.
 Please think about ways of partitioning the Dining Philosophers Problem
 before reading further.
 
+\checkoddpage
+\ifoddpage
+\else
 \clearpage
 (Intentional blank page)
+\fi
 \clearpage
 
 \begin{figure}[tb]
