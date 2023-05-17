Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbjEQToz (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 17 May 2023 15:44:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98A6930D1
        for <perfbook@vger.kernel.org>; Wed, 17 May 2023 12:44:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3620D645A3
        for <perfbook@vger.kernel.org>; Wed, 17 May 2023 19:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684352693;
        bh=cWgUcFGje1/yZY0oPFcTMbWMGPzxCngAsvlfzTRfuyA=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=O4qBCkmABsKcdXSWgZrYyHKYAlw2zYQHHncWRxKVHSaegBBt9G+iPrjBk4Jl8/Qf8
         BMzlqGXnNpO9osB5UYZL7KddMmcC++DqSyzBoHg0Ne5OHi5TerfYHr54ODxoh1NxhV
         llVztsd2/qoebft9B8BKB5uBav1FlaKTkWaXurLnB0MotDWbUB6iaHum5qmfP1Ivbx
         8rKWQ6Hbf99T5maxK+GnvMDV3BlIJwvVYO3dg+v0wUpghYTlHHn9F77d9FpBhSbZBV
         MctSLLo/p1xAWw6IGnkLd9jLZ2QF2sD6Yhx4oqEQWvVZ+fmyGT+iu6Yo09MpCUJJOb
         kSIw8Hsq6MM1Q==
Date: Wed, 17 May 2023 12:44:53 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] formal/spinhint: Clarify the proof
Message-ID: <0f5691e9-e6ce-4905-a170-fa286c8e7307@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230514145123.37079-1-mmpgouride@gmail.com>
 <8c07d99a-cc0b-c277-4a09-d7072c70911d@gmail.com>
 <B595FC9D-9EC6-401B-8181-D75C64E427CC@gmail.com>
 <27a4aeaf-5eb4-fb15-4951-0fb200d4edd9@gmail.com>
 <99837CAE-E2E2-4BF5-940A-98DFFFF6E9E6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <99837CAE-E2E2-4BF5-940A-98DFFFF6E9E6@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Alan Huang <mmpgouride@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Thu, May 18, 2023 at 01:02:21AM +0800, Alan Huang wrote:
> Hi Akira,
> 
> > 2023年5月17日 下午10:55，Akira Yokosawa <akiyks@gmail.com> 写道：
> > 
> > Hi Alan,
> > 
> > On Tue, 16 May 2023 18:15:31 +0800, Alan Huang wrote:
> >> Hi Akira,
> >> 
> >>> 2023年5月16日 下午6:07，Akira Yokosawa <akiyks@gmail.com> 写道：
> >>> 
> >>> Hi Alan,
> >>> 
> >>> On Sun, 14 May 2023 14:51:23 +0000, Alan Huang wrote:
> >>>> The third step and the fourth step seem to have no causal relationship between them.
> >>> 
> >>> Why do you expect causal relationship between the two?
> >>> 
> >>>> Therefore, this patch explains under what circumstances both counters will be at least 1.
> >>>> 
> >>>> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
> >>>> ---
> >>>> formal/spinhint.tex | 5 +++--
> >>>> 1 file changed, 3 insertions(+), 2 deletions(-)
> >>>> 
> >>>> diff --git a/formal/spinhint.tex b/formal/spinhint.tex
> >>>> index 16764aef..dd2e88cc 100644
> >>>> --- a/formal/spinhint.tex
> >>>> +++ b/formal/spinhint.tex
> >>>> @@ -1103,8 +1103,9 @@ follows:
> >>>> 	execution.
> >>>> \item	The counter corresponding to this reader will have been
> >>>> 	at least 1 during this time interval.
> >>>> -\item	The \co{synchronize_qrcu()} code forces at least one
> >>>> -	of the counters to be at least 1 at all times.
> >>>> +\item	If the counter corresponding to this reader is 1, then
> >>>> +	the other counter is at least 1 because of the completion of
> >>>> +	counter flip.
> >>>> \item	Therefore, at any given point in time, either one of the
> >>>> 	counters will be at least 2, or both of the counters will
> >>>> 	be at least one.
> >>> 
> >>> "Therefore" on item 4 looks to me assumes all of items 1, 2, and 3.
> >> 
> >> Yeah, that’s right. My commit message is misleading.
> >> 
> >> This patch makes item 3 more specific.
> > 
> > I might be too nit-picky, but you are changing the simple statement
> > of observation:
> > 
> >    The synchronize_qrcu() code forces at least one of the counters
> >    to be at least 1 at all times.
> > 
> > to a complex sentence of:
> > 
> >    If the counter corresponding to this reader is 1, then
> >    the other counter is at least 1 because of the completion of
> >    counter flip.
> > 
> > Your wording describes something different from the original one,
> > doesn't it? 
> > 
> > Can you elaborate what you find hard to follow in this _informal_
> > proof?
> 
> Item 4 says:
> 
> 	Therefore, at any given point in time, either one of the
> 	counters will be at least 2, or both of the counters will
> 	be at least one.
> 
> “at least 2” is obvious, but it took me some time to figure this out:
> 
> 	 "or both of the counters will be at least one”
> 
> The original item 3 is not very helpful to me.
> 
> But others may prefer the original one :)

I will take a closer look before the end of the weekend.  Sorry to be
slow, but a Linux-kernel RCU issue has me by the ankle.

							Thanx, Paul
