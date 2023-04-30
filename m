Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230253AbjD3DR2 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 29 Apr 2023 23:17:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D18E1B7
        for <perfbook@vger.kernel.org>; Sat, 29 Apr 2023 20:17:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A2F2960F1D
        for <perfbook@vger.kernel.org>; Sun, 30 Apr 2023 03:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682824646;
        bh=z/b1XFbSpe8uwXNYgS5PzlbIH/eCX2/HnM2jFHpE2QI=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=bzXKwOSul4GvcH0VCbSmnRtplU5w9MWnbBtD8KOAL/112kh7uaZYTbIwDhWo+QmnM
         LVjwwv2O/KkytPC6EfyDBhQKHwOvbDRqrWmltrQLWPVNf9gfLQucsG1/nIjV+3HdhC
         q2uXeY/gUbFoNNtSiF4Fnaiy3eGp71qo7qdFX+bab2nwYici/HFT75sELl+TKfcJRh
         PBafDAO5vTMKYB5Z7KE2THecQws1qPSbXWNSZj1kDQAP/6ZUBex9efImvGUyXipZ5L
         xKJus6iC8rVdsRvETTqIsOlWghYaBX/Hy6tR/e2fh+4o4UF3cBcKI5L1/fdwZBPXqE
         aaz/i2P4XYPDg==
Date: Sat, 29 Apr 2023 20:17:25 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 1/2] together/refcnt: Use \tco{} for code quoting
Message-ID: <fc00737f-e793-4530-8074-56b3e8ba5d3c@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230429233812.18478-1-sj@kernel.org>
 <29852e1a-fd80-1525-fbe2-b8578c0259f8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29852e1a-fd80-1525-fbe2-b8578c0259f8@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: SeongJae Park <sj38.park@gmail.com>, SeongJae Park <sj@kernel.org>, "perfbook@vger.kernel.org" <perfbook@vger.kernel.org>

On Sun, Apr 30, 2023 at 12:12:24PM +0900, Akira Yokosawa wrote:
> On Sat, 29 Apr 2023 16:38:12 -0700, SeongJae Park wrote:
> > Hi Akira,
> > 
> > On Sun, 30 Apr 2023 07:20:48 +0900 Akira Yokosawa <akiyks@gmail.com> wrote:
> > 
> >> Hi,
> >>
> >> On Sat, 29 Apr 2023 10:02:25 -0700, SeongJae Park wrote:
> >>> From: SeongJae Park <sj38.park@gmail.com>
> >>>
> >>> Some sentences in refcnt.tex is using only quote for some code words.
> >>> Use \tco{} instead, as it is intended to be used for the case.
> >>
> >> \tco{} doesn't put quotes around it.
> >> Didn't you mean \qco{} ?
> > 
> > You're correct, I was out of my mind.  I also mistakenly used an email account
> > that different from what I signed patches off.  I will send a new spin
> > tomorrow.
> 
> Looks like Paul has already pulled and pushed this (commit 0e96cb8283ca).
> 
> Can you send a fix on top ?

Or I can remove that commit if that makes things easier.  When you send
me the patch, please just let me know if it is to replace 0e96cb8283ca
or to go on top of it.  Your choice!  ;-)

And thank you, Akira, for checking.

							Thanx, Paul

>         Thanks, Akira
> 
> > 
> > 
> > Thanks,
> > SJ
> > 
> >>
> >>         Thanks, Akira
> >>
> >>>
> >>> Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> >>> ---
> >>>  together/refcnt.tex | 8 ++++----
> >>>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/together/refcnt.tex b/together/refcnt.tex
> >>> index 56caed67..4abe1c60 100644
> >>> --- a/together/refcnt.tex
> >>> +++ b/together/refcnt.tex
> >>> @@ -467,15 +467,15 @@ as shown below.
> >>>  
> >>>  \QuickQuiz{
> >>>  	Why can't the check for a zero reference count be
> >>> -	made in a simple ``if'' statement with an atomic
> >>> -	increment in its ``then'' clause?
> >>> +	made in a simple \tco{if} statement with an atomic
> >>> +	increment in its \tco{then} clause?
> >>>  }\QuickQuizAnswer{
> >>> -	Suppose that the ``if'' condition completed, finding
> >>> +	Suppose that the \tco{if} condition completed, finding
> >>>  	the reference counter value equal to one.
> >>>  	Suppose that a release operation executes, decrementing
> >>>  	the reference counter to zero and therefore starting
> >>>  	cleanup operations.
> >>> -	But now the ``then'' clause can increment the counter
> >>> +	But now the \tco{then} clause can increment the counter
> >>>  	back to a value of one, allowing the object to be
> >>>  	used after it has been cleaned up.
> >>>  
