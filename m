Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:45566 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726353AbfLYNNF (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Wed, 25 Dec 2019 08:13:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577279584;
        bh=vyUp3s/TCa3JiAFFva5ex+uEXyE2YCM6K9vQf5e1M94=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=zvefb5DxZiy4WM9MGKJRld3T8OgKHBFGj4KmjWRpQFfMxOlQPUu07RMBYU6a8SE7e
         jxZMY3Sx+zdHlzjEO8PnM8g3S4+b+m4Q5vQySwubyDiGZjmkWKiU+lE2yCheyaKVyA
         MrqTPY90cMWhjAltriCKHthhI/mu4kKIuxDWFxdE=
Date: Wed, 25 Dec 2019 05:13:02 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v2] utilities/autodate: Restore compatibility with bash
Message-ID: <20191225131302.GN13449@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <f9c54c72-db80-f29e-76c5-2d36c02c183a@gmail.com>
 <b9691f42-5edb-d57f-3a11-d6ce7a7b930e@gmail.com>
 <20191224172432.GI13449@paulmck-ThinkPad-P72>
 <863f2ca9-5c1b-d4f9-ceca-94f92cdb7e74@gmail.com>
 <20191224231931.GK13449@paulmck-ThinkPad-P72>
 <20191225031820.GA15431@paulmck-ThinkPad-P72>
 <741a5587-1075-284d-827b-b1d03bff5568@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <741a5587-1075-284d-827b-b1d03bff5568@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Dec 25, 2019 at 08:29:39PM +0900, Akira Yokosawa wrote:
> On Tue, 24 Dec 2019 19:18:20 -0800, Paul E. McKenney wrote:
> > On Tue, Dec 24, 2019 at 03:19:31PM -0800, Paul E. McKenney wrote:
> >> On Wed, Dec 25, 2019 at 07:04:46AM +0900, Akira Yokosawa wrote:
> >>> On Tue, 24 Dec 2019 09:24:32 -0800, Paul E. McKenney wrote:
> >>>> On Mon, Dec 23, 2019 at 08:55:08PM +0900, Akira Yokosawa wrote:
> >>>>> >From 43bf4cc57125d756ccd14b629692c4ecdb5c36dc Mon Sep 17 00:00:00 2001
> >>>>> From: Akira Yokosawa <akiyks@gmail.com>
> >>>>> Date: Mon, 23 Dec 2019 20:52:46 +0900
> >>>>> Subject: [PATCH v2] utilities/autodate: Restore compatibility with bash
> >>>>>
> >>>>> Also improve uses of single quotes (without escaping) and
> >>>>> double quotes (with escaping) in the script.
> >>>>>
> >>>>> Fixes: 650f763c31e8 ("utilities/autodate: Mark released versions")
> >>>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> >>>>> ---
> >>>>> Changes in v2:
> >>>>>
> >>>>>     o Modified title
> >>>>>     o Tested with both "dash" and "bash" as /bin/sh
> >>>>>
> >>>>>         Thanks, Akira
> >>>>
> >>>> It does work here, queued and pushed, thank you!
> >>>>
> >>>> In other non-urgent news, arxiv does not like "@" in filenames (see below
> >>>> for its complaints).  It -looks- like it is possible to make these instead
> >>>> be "=" by changing the 's/:/@/g ;' instances in utilities/gen_snippet_d.pl
> >>>> to 's/:/=/g ;', and then changing the pathnames containing "@" in the
> >>>> various .tex files to "=".  
> >>>
> >>> I'm not sure if targets in Makefile can contain "=".
> >>> Another approach would be to do the renames and substitutions on-the-fly
> >>> in toarxiv.sh.  Thoughts?
> >>
> >> Good point, I will try on-the-fly substitutions.  Thank you, and best of
> >> everything to you and yours over the holidays and the New Year!
> 
> Thank you!  And let me wish you all the best!
> 
> > And that worked, thank you!  I have committed the changes with your
> > Suggested-by.  And Arxiv is crunching away on it as well.  ;-)
> 
> Good to know!
> 
> Just wanted to make sure, does the uploaded autodate.tex have a proper
> "Release" line?  I think it should because there has been no change in
> its dependency since the tag "v2019.12.22a". But you might have touched
> something by accident during the update of toarxiv.sh.

Heh!  Yes, Makefile doesn't yet depend on all of the scripts, so that the
changes since the release tag don't affect it.  Except that I had added
(and since removed) another tag for test purposes.  So I hand-edited the
autodate.tex that the autodate.tex script produced for Arxiv, which is
shown below.  Admittedly crude, but expedient.  And next time, it should
Just Work.

But it seems reasonably likely that further changes to toarxiv.sh will
be needed, so it might actually be bad to add this script to the list
of dependencies, strangely enough!  ;-)

							Thanx, Paul

------------------------------------------------------------------------

\date{December 24, 2019 \\ Release 2019.12.22a }
\newcommand{\commityear}{2019}
