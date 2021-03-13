Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:57176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233671AbhCMQsL (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sat, 13 Mar 2021 11:48:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615654091;
        bh=9ceyX40j0c42ffIoRge3xvgg9zkeOczMV01Y+zFfWwQ=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=KKCPAhP/ssoL3SDO8mIwNd1jZUjjYI/GIVkZE41sQedmn0oy16fH7Z311YVAGlJ4B
         UVodXisqE5XSlWpPABtEjh1EwyE5ti0GEnNlKkekuWrKzkl6I9Or+y0Uaz/dWXeOew
         jMXF2J6XMj5BPCT4RgCT6eT6XmS78aKLyITaDTRojJCBF5EgKWqi2kD5VA3Ug2kTZg
         IDzsBfjGNSs3d1DVKWuNdwWW3z4nNzz+UfTZYw6Dn0IPXZlrNTkoKHLepS5ju9wElR
         mA+8w3TLxkkLlN1thY1mBnexhCzD3P1BBabcV3VeIYtJy+fOye4hsnq1jufFfm7uQh
         I9orN946uTeyQ==
Date: Sat, 13 Mar 2021 08:48:10 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] summary: Misc. fixes/tweaks
Message-ID: <20210313164810.GK2696@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <3433dd91-c602-528f-7297-ed04609df447@gmail.com>
 <0ecabafc-a09d-48fb-fc75-c71f64725727@gmail.com>
 <20210313053826.GJ2696@paulmck-ThinkPad-P72>
 <3fa5a137-9b9d-cff3-a0cc-37306146ca49@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fa5a137-9b9d-cff3-a0cc-37306146ca49@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Mar 14, 2021 at 12:32:14AM +0900, Akira Yokosawa wrote:
> On Fri, 12 Mar 2021 21:38:26 -0800, Paul E. McKenney wrote:
> > On Sat, Mar 13, 2021 at 12:35:50PM +0900, Akira Yokosawa wrote:
> [...]
> > 
> > I queued and pushed your fixes above, thank you!
> > 
> > And I will be doing another rc this weekend in order to give us both
> > some time for proofreading.  I intend to revisit the changes that I
> > made, and I of course welcome any and all additional bug reports and
> > fixes.
> 
> There can be conflicts, but you are good at resolving them.
> Expect a couple of patches soon.

Very good, looking forward to them!

> >> A much natural option would be to add a couple of paragraphs in front
> >> of the figure so that at least a few sentences make the following
> >> page in 1c builds.
> > 
> > Your concern is the large quantities of vertical whitespace on page
> > 569 of perfbook-1c.pdf?
> 
> Well, they don't look that ugly.  There are much wider gaps elsewhere
> near section epigraphs.
> 
> My main concern is the "H" option, which is considered as a last resort.
> It will likely bite you when you add/remove some text around it.

Ah, I see.  Otherwise the figure ends up on a page by itself.

> >                          I could imagine expanding on the changes
> > in tooling from 2003 to 2006 that Linus alluded to.  I could also
> > imagine filling in on my attempts to get the book going from late
> > 2004 to 2006.
> 
> That would eliminate the adhoc code for 1c layouts.
> Float objects near the end of a document/chapter are sometimes
> quite tricky.

For this edition, it will be safer for me to do "make -1c" after each
change to summary.tex to check that figure than to work out how to expand
that section while still having it read well.  But I added comments
to remind myself of this for the third edition.

							Thanx, Paul

>         Thanks, Akira
> > 
> > Or am I missing your point?
> > 
> > 							Thanx, Paul
> > 
> >>         Thanks, Akira
> >>
> >>>  
> >>>  And this book is also for everyone else who would like to add low-level
> >>>  concurrency to their skillset.
> >>>
