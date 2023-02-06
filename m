Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbjBFRdt (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 6 Feb 2023 12:33:49 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C21A913D7A
        for <perfbook@vger.kernel.org>; Mon,  6 Feb 2023 09:33:47 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 67264B811BD
        for <perfbook@vger.kernel.org>; Mon,  6 Feb 2023 17:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675704825;
        bh=AKINCr5TfjrXhYDdrcY+C4BTRWcq5gb9BI3q5xLwXrY=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=U/lszkZZkqiEAoWFnlj+yK3uYY1zT/pg7zkACyoIJhl6SXqY6VKZD7O7Wk6CCILmD
         WtJ+wJjnJxgqFJSkYy6LzMLbb0SvcpZXkvwmAebICcqCjQyFUpv8BEh4GTpfK9FyCa
         XByUMcv0ZHOJ4rz1lJ+pIRX+UhN+tPKcm2ddoknRrl1mYo5pKJTwLkrRkYjdXz39lV
         uToPpyfSCkD6ucv1L1+VAI2FFA95Z5gHqY3f84bmsrwDEv/PG3F1xsAwIAKHgXXNHF
         Ru6CZNlNNEso7lZqYDfVkIgTMJr/uCRvQfmTSqsjplCgCLU/gB+Z7AXVW6xHWM09pZ
         qe8cXHOuD6RWA==
Date: Mon, 6 Feb 2023 09:33:44 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 5/5] debugging/debugging: s/remainder of a
 section/following sections/
Message-ID: <20230206173344.GQ2948950@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20230205182128.19044-1-sj@kernel.org>
 <20230205182128.19044-6-sj@kernel.org>
 <c6d41ba9-ca6e-cfb7-5df5-f4e7a9de058f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6d41ba9-ca6e-cfb7-5df5-f4e7a9de058f@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: SeongJae Park <sj@kernel.org>, perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>

On Mon, Feb 06, 2023 at 12:01:57PM +0900, Akira Yokosawa wrote:
> On Sun,  5 Feb 2023 10:21:28 -0800, SeongJae Park wrote:
> > From: SeongJae Park <sj38.park@gmail.com>
> > 
> > A sectence in 'Microbenchmarking' section is mentioning the remainder of
> > the section will look at ways for dealing with conflicts in measurement
> > error advices, but those are not dealt in the remainder of the section
> > but its following sections.  Fix the sentence.
> > 
> > Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> > ---
> >  debugging/debugging.tex | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/debugging/debugging.tex b/debugging/debugging.tex
> > index 53c7fb94..225a4184 100644
> > --- a/debugging/debugging.tex
> > +++ b/debugging/debugging.tex
> > @@ -2302,7 +2302,7 @@ to creep in, including:
> >  
> >  The first and fourth sources of interference provide conflicting advice,
> >  which is one sign that we are living in the real world.
> > -The remainder of this section looks at ways of resolving this conflict.
> > +The following sections look at ways of resolving this conflict.
> 
> If you interpret "The remainder of this section" as "The remainder of
> Section 11.6.4 'Hunting Heisenbugs'", there is nothing to fix.
> 
> We call all of section, subsection, and subsubsection as "Section",
> which might be confusing sometimes, but I don't have any idea what
> should be done here.

One approach would be to say something like this:

	The remainder of this section (Section 11.6.4) looks at ways of
	resolving this conflict.

I am not sure whether or not this is a good idea, but perhaps either
way it will inspire better ideas.

							Thanx, Paul

>         Thanks, Akira
> 
> >  
> >  \QuickQuiz{
> >  	But what about other sources of error, for example, due to
