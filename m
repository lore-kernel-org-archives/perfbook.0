Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232161AbjD3Wvt (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 30 Apr 2023 18:51:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E5A210EF
        for <perfbook@vger.kernel.org>; Sun, 30 Apr 2023 15:51:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E92AD6156B
        for <perfbook@vger.kernel.org>; Sun, 30 Apr 2023 22:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682895106;
        bh=nwKcgfJSL7oido+n1H6aw0WrS8HZhxXim0DCQxPLy68=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=hp0FOHeEisoOvw4AkelY4VPp1/SENECoc96O/oRu9Qt9cBP+dEnbGRQ3z9xFkCP1n
         H5MzejU47bMqtrKTXNiqnpXWV09uNxxikAYzyvmvNx57YukZEkA6Szh2ayaVOYFa48
         pDGMNp9OpkMyWnU3XHtAE4R0CN59gbizaTFp7G1kJY1Gq4m3Bopjj+/GkuEnPi4jfu
         UZi8PryO20HyJxgrIACWlnerOu06fn26R0GAUJZRwmhqu6M643pteE4u/gfWw6iWtJ
         3SA+H6fb190wp3E/QHi5cqPYsfROyDrZI0VLa52Y3JmLnaB1rrruAlcgscFaEZ6w7Y
         147xWv0ShKD5Q==
Date: Sun, 30 Apr 2023 15:51:45 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 1/2] together/refcnt: Use \tco{} for code quoting
Message-ID: <05b47e29-666f-4846-8b0e-1e93387cb329@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <fc00737f-e793-4530-8074-56b3e8ba5d3c@paulmck-laptop>
 <20230430210722.6751-1-sj@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230430210722.6751-1-sj@kernel.org>
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, SeongJae Park <sj@kernel.org>, "perfbook@vger.kernel.org" <perfbook@vger.kernel.org>

On Sun, Apr 30, 2023 at 02:07:22PM -0700, SeongJae Park wrote:
> Hi Akira and Paul,
> 
> On Sat, 29 Apr 2023 20:17:25 -0700 "Paul E. McKenney" <paulmck@kernel.org> wrote:
> 
> > On Sun, Apr 30, 2023 at 12:12:24PM +0900, Akira Yokosawa wrote:
> > > On Sat, 29 Apr 2023 16:38:12 -0700, SeongJae Park wrote:
> > > > Hi Akira,
> > > > 
> > > > On Sun, 30 Apr 2023 07:20:48 +0900 Akira Yokosawa <akiyks@gmail.com> wrote:
> > > > 
> > > >> Hi,
> > > >>
> > > >> On Sat, 29 Apr 2023 10:02:25 -0700, SeongJae Park wrote:
> > > >>> From: SeongJae Park <sj38.park@gmail.com>
> > > >>>
> > > >>> Some sentences in refcnt.tex is using only quote for some code words.
> > > >>> Use \tco{} instead, as it is intended to be used for the case.
> > > >>
> > > >> \tco{} doesn't put quotes around it.
> > > >> Didn't you mean \qco{} ?
> > > > 
> > > > You're correct, I was out of my mind.  I also mistakenly used an email account
> > > > that different from what I signed patches off.  I will send a new spin
> > > > tomorrow.
> > > 
> > > Looks like Paul has already pulled and pushed this (commit 0e96cb8283ca).
> > > 
> > > Can you send a fix on top ?
> > 
> > Or I can remove that commit if that makes things easier.  When you send
> > me the patch, please just let me know if it is to replace 0e96cb8283ca
> > or to go on top of it.  Your choice!  ;-)
> 
> Sorry, I found this mail after I sent the patch.  Just for a record.  I sent
> the patch on top of it.  If you'd prefer to, please feel free to squash it into
> the old one.  I have no preference but just want to make the trivial nit fixed.

And fixed it is!  ;-)

							Thanx, Paul

> > And thank you, Akira, for checking.
> 
> Thank you all.
> 
> 
> Thanks,
> SJ
> 
> > 
> > 							Thanx, Paul
> > 
> > >         Thanks, Akira
> > > 
> > > > 
> > > > 
> > > > Thanks,
> > > > SJ
> > > > 
> > > >>
> > > >>         Thanks, Akira
> > > >>
> > > >>>
> > > >>> Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> > > >>> ---
> > > >>>  together/refcnt.tex | 8 ++++----
> > > >>>  1 file changed, 4 insertions(+), 4 deletions(-)
> > > >>>
> > > >>> diff --git a/together/refcnt.tex b/together/refcnt.tex
> > > >>> index 56caed67..4abe1c60 100644
> > > >>> --- a/together/refcnt.tex
> > > >>> +++ b/together/refcnt.tex
> > > >>> @@ -467,15 +467,15 @@ as shown below.
> > > >>>  
> > > >>>  \QuickQuiz{
> > > >>>  	Why can't the check for a zero reference count be
> > > >>> -	made in a simple ``if'' statement with an atomic
> > > >>> -	increment in its ``then'' clause?
> > > >>> +	made in a simple \tco{if} statement with an atomic
> > > >>> +	increment in its \tco{then} clause?
> > > >>>  }\QuickQuizAnswer{
> > > >>> -	Suppose that the ``if'' condition completed, finding
> > > >>> +	Suppose that the \tco{if} condition completed, finding
> > > >>>  	the reference counter value equal to one.
> > > >>>  	Suppose that a release operation executes, decrementing
> > > >>>  	the reference counter to zero and therefore starting
> > > >>>  	cleanup operations.
> > > >>> -	But now the ``then'' clause can increment the counter
> > > >>> +	But now the \tco{then} clause can increment the counter
> > > >>>  	back to a value of one, allowing the object to be
> > > >>>  	used after it has been cleaned up.
> > > >>>  
