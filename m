Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbiFYAaz (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 24 Jun 2022 20:30:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 805D26DB17
        for <perfbook@vger.kernel.org>; Fri, 24 Jun 2022 17:30:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1EAB361B7D
        for <perfbook@vger.kernel.org>; Sat, 25 Jun 2022 00:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656117053;
        bh=8r3orUzxk4Hu5/HaWmFFGhynb94IlpvySd6Wk7+8j58=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=OWsWs0T9rustqKGNkhTtpZDqdA9Fx0emN/B3FAfsy3OYpO1jfnqYnkyuUaf0Ub1aI
         g0KWH+dAwmB9JbZr7HlL6axxSjunZBTAlnOUGOwPTdQZaWw0A95xkHywwjp2iGZjTe
         JqehXOfW+chjAm9v7K7KAPuzvWckQS84wSEhToNxzI1HKgdsElWZPdmZrwK6tUBEmI
         pXl2ZoVOgEYfoV4BrhndmhuV5RXLikIX8DGCYiId2pBpbtwM4ovG7MeB6YU7ysnA62
         a3xblV/Rm2ywdZ0IJTKRAOmj0iPf1/wskN3rqxDDjHHFsF3LsjuEIbGCBY6Le7mNmr
         T6Ai6exIbUvJg==
Date: Fri, 24 Jun 2022 17:30:53 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [perfbook] Analogy of =?utf-8?Q?Figure?=
 =?utf-8?B?IDcuMTEgTG9ja2luZyDigJxTYXcgS2VyZuKAnQ==?=
Message-ID: <20220625003053.GG1790663@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <202dbad7-37db-4d6a-f4d4-6d99180028fc@gmail.com>
 <20220624233316.GF1790663@paulmck-ThinkPad-P17-Gen-1>
 <cb266856-a20e-231c-00fb-8e4435306d55@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb266856-a20e-231c-00fb-8e4435306d55@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Jun 25, 2022 at 08:57:35AM +0900, Akira Yokosawa wrote:
> On Fri, 24 Jun 2022 16:33:16 -0700, Paul E. McKenney wrote:
> > On Sat, Jun 25, 2022 at 08:12:09AM +0900, Akira Yokosawa wrote:
> >> Hi Paul,
> >>
> >> I find the analogy of Figure 7.11 hard to grasp.
> >>
> >> Whether a lock is global or per-instance, the cost of locking
> >> (saw kerf) is observed only when a CPU/thread does the locking
> >> operation.
> >>
> >> In this figure, does each board represent data elements, not a
> >> CPU/thread?  If this is the case, what does the waste of "saw kerf"
> >> mean?
> >>
> >> What am I missing?
> >>
> >> (I hope I am clear enough on what I don't get...)
> > 
> > It might well be that I am getting too excited about this one.  ;-)
> > 
> > Maybe I need to drop it.  At the very least, I need to much more clearly
> > explain it.
> > 
> > But...
> > 
> > Each board represents one lock.  The "saw kerf" is the time lost when
> > releasing that lock and someone else immediately acquiring it.
> > 
> > Does that help?
> 
> Well then, why does the left side figure have ten boards?

Ten locks.  For example, the single board might correspond to a hash
table guarded by a single global lock.  The ten boards might correspond
to a hash table with ten buckets, with per-bucket locking.

But it is sounding like this analogy might be more confusing than
enlightening.

							Thanx, Paul
