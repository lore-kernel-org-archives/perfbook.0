Return-Path: <perfbook-owner@vger.kernel.org>
Received: from ams.source.kernel.org ([145.40.68.75]:39376 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244173AbiAFVPn (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 6 Jan 2022 16:15:43 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 59AA9B8175C
        for <perfbook@vger.kernel.org>; Thu,  6 Jan 2022 21:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641503741;
        bh=ZMEivpZ2F2PgH5jHQJ0dAkLsJ6oYE/NVFhr1See1cAg=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=pthEK3H+KWOv5BoHgZI5/aNQRxi2mD2K7DP7DL6CnbZtZaQJaoSCy2EvqVTSV+UOI
         MCv13Ly3IaXx0YlTlWo8aj3BJpX06oVvPXqDo6003XxVdigc8aOXCLsTfhX93qeExx
         ZCDJs6uhlDOSvFdNNtoJO28cGkNW7NWn3i42dCCjC8LI5LzjQ/8xb+bImy6qPn3xmK
         2Pmx2hxIgDDh+OraPdgWWA3Ooe98mvKT0YFksgyLbih0AXyrMQuIOoQ5EMyAYCGgM5
         CNmbcF5GvBUlf/izcA/86kvTRpQe6DMAPpFigVqUnqzPq9W30WfZifqIK+yt5hinuU
         8LTediK6+cmbA==
Date: Thu, 6 Jan 2022 13:15:40 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Section 9.5: Nobody expects the Spanish Acquisition!
Message-ID: <20220106211540.GA1550084@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <CAJbg=FUHcqEXE+MgXif0n=e09xYFoGFfmhjvY1=pnC6QCCRh2w@mail.gmail.com>
 <20211223022957.GM4109570@paulmck-ThinkPad-P17-Gen-1>
 <b2c80a98-ed14-7e0d-c309-3f3ea029018a@gmail.com>
 <CAJbg=FXxhA1d23EzAG2TfnyxVVd58khApBerH4vdU99FYwepuQ@mail.gmail.com>
 <50fb6c6c-cc9b-691e-b08b-233fd1a02001@gmail.com>
 <CAJbg=FUXcd4MLS0QxHV9rG=WwjEzsCo0Q2WuLUJC1-meygCu=g@mail.gmail.com>
 <20220104000506.GD4202@paulmck-ThinkPad-P17-Gen-1>
 <ae38a23a-a5ac-055f-3039-c10e46160e13@gmail.com>
 <CAJbg=FULL3obUqKPKK=BD4o9Wr-WbcFH9GoAAFQ7Vh7EfqphtQ@mail.gmail.com>
 <20220105020414.GI4202@paulmck-ThinkPad-P17-Gen-1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220105020414.GI4202@paulmck-ThinkPad-P17-Gen-1>
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Tue, Jan 04, 2022 at 06:04:14PM -0800, Paul E. McKenney wrote:
> On Tue, Jan 04, 2022 at 06:47:42AM -0500, Elad Lahav wrote:

[ . . . ]

> > > Your response makes me think that I need to explain better what I am
> > > trying to do here. Reading section 9.5 it is not always clear to me what
> > > constitutes a description of RCU and what a description of "RCU in the
> > > Linux kernel". I decided to try and come up with a more abstract
> > > description using the code I attached. It may be just a straw man, but
> > > at least it gives us something to point at while discussing (which I
> > > guess is a redundant definition of a "straw man"...).
> 
> Hmmm...  Maybe I should add a section following 9.5.1.1 ("Minimal
> Insertion and Deletion") describing the core API:
> 
> 	rcu_read_lock(): Start an RCU read-side critical section.
> 	rcu_read_unlock(): End an RCU read-side critical section.
> 	rcu_dereference(): Safely load an RCU-protected pointer.
> 	synchronize_rcu(): Wait for all pre-existing RCU read-side
> 		critical sections to complete.
> 	call_rcu(): Invoke the specified function with the specified
> 		rcu_head pointer argument after all pre-existing
> 		RCU read-side critical sections complete.
> 	rcu_assign_pointer(): Safely update an RCU-protected pointer.
> 	rcu_dereference_protected(): Safely load an RCU-protected
> 		pointer within an update.  (Just debugging, as you
> 		can safely do a C-language load.  So I will probably
> 		omit this one.)
> 
> Does that help?

Hearing no objections, I added this section and propagated these APIs
into the following sections.  I hope that is helpful.

							Thanx, Paul
