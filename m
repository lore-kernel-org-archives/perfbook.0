Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234412AbiFZODS (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 26 Jun 2022 10:03:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2CCD631D
        for <perfbook@vger.kernel.org>; Sun, 26 Jun 2022 07:03:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 440EF6124E
        for <perfbook@vger.kernel.org>; Sun, 26 Jun 2022 14:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656252192;
        bh=hOpFMqsPQbnDieNBlor+qCnUGI2xbOo9MxBQJJBMLJ0=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=X6IiwPw/4WguOdPHA4n63nSiqEKNIHBcBpj9FnDvp6Da5TLLsspmTf9TgzYlUXRVV
         /4WzdHc/OFE2bLcU7xLr97AntcmUL+CWcCCaq//ycdnrzTFUVzfsV7SwSR/iQGFrNS
         l3TlbloWWZp4MYtBpA5dEmeEh3L75lJtaniPwSwDQ6JZ957JY4y0L/kjMMpGSJl4YV
         xzgnfluv02Y8+7y7XX+3Sp9TgpJQNE0nhhGwv0Z7EobRWj+W+uLKur9jNRadJmCvhf
         jpKoeIH3tBrMqB7YhLgSWk3E1S/sYeif6iu/LdZkm+vAjOnHbjlTtaUsxVvdRHobpg
         xQbCbjlsPrR1g==
Date: Sun, 26 Jun 2022 07:03:12 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [perfbook] Analogy of =?utf-8?Q?Figure?=
 =?utf-8?B?IDcuMTEgTG9ja2luZyDigJxTYXcgS2VyZuKAnQ==?=
Message-ID: <20220626140312.GR1790663@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <202dbad7-37db-4d6a-f4d4-6d99180028fc@gmail.com>
 <20220624233316.GF1790663@paulmck-ThinkPad-P17-Gen-1>
 <cb266856-a20e-231c-00fb-8e4435306d55@gmail.com>
 <20220625003053.GG1790663@paulmck-ThinkPad-P17-Gen-1>
 <69a6b7d8-2ef9-7fad-2d46-42eebe49f953@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69a6b7d8-2ef9-7fad-2d46-42eebe49f953@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Jun 26, 2022 at 01:34:53PM +0900, Akira Yokosawa wrote:
> On Fri, 24 Jun 2022 17:30:53 -0700, Paul E. McKenney wrote:
> > On Sat, Jun 25, 2022 at 08:57:35AM +0900, Akira Yokosawa wrote:
> >> On Fri, 24 Jun 2022 16:33:16 -0700, Paul E. McKenney wrote:
> >>> On Sat, Jun 25, 2022 at 08:12:09AM +0900, Akira Yokosawa wrote:
> >>>> Hi Paul,
> >>>>
> >>>> I find the analogy of Figure 7.11 hard to grasp.
> >>>>
> >>>> Whether a lock is global or per-instance, the cost of locking
> >>>> (saw kerf) is observed only when a CPU/thread does the locking
> >>>> operation.
> >>>>
> >>>> In this figure, does each board represent data elements, not a
> >>>> CPU/thread?  If this is the case, what does the waste of "saw kerf"
> >>>> mean?
> >>>>
> >>>> What am I missing?
> >>>>
> >>>> (I hope I am clear enough on what I don't get...)
> >>>
> >>> It might well be that I am getting too excited about this one.  ;-)
> >>>
> >>> Maybe I need to drop it.  At the very least, I need to much more clearly
> >>> explain it.
> >>>
> >>> But...
> >>>
> >>> Each board represents one lock.  The "saw kerf" is the time lost when
> >>> releasing that lock and someone else immediately acquiring it.
> >>>
> >>> Does that help?
> >>
> >> Well then, why does the left side figure have ten boards?
> > 
> > Ten locks.  For example, the single board might correspond to a hash
> > table guarded by a single global lock.  The ten boards might correspond
> > to a hash table with ten buckets, with per-bucket locking.
> 
> Ah, I think I understand what you mean.
> 
> On the "Global" side, there is a per-resource locking mechanism
> implemented under the protection of a global lock, whereas locks
> on the "Per-Instance" side are implemented independently with
> each other.
> 
> Different boards can be acquired in parallel on both sides of the
> figure.
> 
> Am I on the same page with you now?

Exactly!

> > But it is sounding like this analogy might be more confusing than
> > enlightening.
> 
> An analogy which needs a lot of explanation might not be a good
> analogy...

Agreed.  So either I figure out a way to ramp an explanation into
it, or I drop it.

One way to ramp an explanation into it is to discuss locking overheads
using hash tables, then go from there.  Though at that point, I am
not sure how attractive the analogy would be, useful thought it has
been to me for these many years.

Thank you for reporting this problem, and I will give it some thought.

							Thanx, Paul
