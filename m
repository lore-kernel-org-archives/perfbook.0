Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:34818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726251AbfLXXTc (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 24 Dec 2019 18:19:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577229572;
        bh=lpacaukK+3RL28BDhJR1IG8wXzcE1AOLxBzSWONmoZA=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=t7Ju1fHd6WM2osB+duqYjzFiC0y3l04uBylh5Cqx+saz7DG106V7yCmx+MMaAXrKo
         AG9B+njXDJtYmjjvlxMljHA+/IL7bxoZvCltVxz7sT1i2k3WDC1BAfKLlpxTjQ6151
         X85dSlMB0hHdjeDd2TAZ0EEf2QSvp+l3gqK4CaxQ=
Date: Tue, 24 Dec 2019 15:19:31 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v2] utilities/autodate: Restore compatibility with bash
Message-ID: <20191224231931.GK13449@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <f9c54c72-db80-f29e-76c5-2d36c02c183a@gmail.com>
 <b9691f42-5edb-d57f-3a11-d6ce7a7b930e@gmail.com>
 <20191224172432.GI13449@paulmck-ThinkPad-P72>
 <863f2ca9-5c1b-d4f9-ceca-94f92cdb7e74@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <863f2ca9-5c1b-d4f9-ceca-94f92cdb7e74@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Dec 25, 2019 at 07:04:46AM +0900, Akira Yokosawa wrote:
> On Tue, 24 Dec 2019 09:24:32 -0800, Paul E. McKenney wrote:
> > On Mon, Dec 23, 2019 at 08:55:08PM +0900, Akira Yokosawa wrote:
> >> >From 43bf4cc57125d756ccd14b629692c4ecdb5c36dc Mon Sep 17 00:00:00 2001
> >> From: Akira Yokosawa <akiyks@gmail.com>
> >> Date: Mon, 23 Dec 2019 20:52:46 +0900
> >> Subject: [PATCH v2] utilities/autodate: Restore compatibility with bash
> >>
> >> Also improve uses of single quotes (without escaping) and
> >> double quotes (with escaping) in the script.
> >>
> >> Fixes: 650f763c31e8 ("utilities/autodate: Mark released versions")
> >> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> >> ---
> >> Changes in v2:
> >>
> >>     o Modified title
> >>     o Tested with both "dash" and "bash" as /bin/sh
> >>
> >>         Thanks, Akira
> > 
> > It does work here, queued and pushed, thank you!
> > 
> > In other non-urgent news, arxiv does not like "@" in filenames (see below
> > for its complaints).  It -looks- like it is possible to make these instead
> > be "=" by changing the 's/:/@/g ;' instances in utilities/gen_snippet_d.pl
> > to 's/:/=/g ;', and then changing the pathnames containing "@" in the
> > various .tex files to "=".  
> 
> I'm not sure if targets in Makefile can contain "=".
> Another approach would be to do the renames and substitutions on-the-fly
> in toarxiv.sh.  Thoughts?

Good point, I will try on-the-fly substitutions.  Thank you, and best of
everything to you and yours over the holidays and the New Year!

							Thanx, Paul

>         Thanks, Akira
> 
> >                             But I figured I should check with you before
> > breaking something.  (If it was urgent, I would try it anyway, but I have
> > no problem waiting a few weeks before posting to Arxiv.  Hence my asking
> > non-urgently.)
> > 
> > 							Thanx, Paul
> > 
> > ------------------------------------------------------------------------
> > 
> > We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
> > Attempting to rename lockhdeq@pop_push.fcv to lockhdeq_pop_push.fcv.
> > We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
> > Attempting to rename lockhdeq@struct_pdeq.fcv to lockhdeq_struct_pdeq.fcv.
> [...]
