Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjEBR2W (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 2 May 2023 13:28:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16D94E7A
        for <perfbook@vger.kernel.org>; Tue,  2 May 2023 10:28:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A6E7461209
        for <perfbook@vger.kernel.org>; Tue,  2 May 2023 17:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683048500;
        bh=kYHAJ4M1pCGGpwfjh9wIFusbvFmygtaMY9uDsXNwFtM=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=dyJlCmYkvVAMU+JLZ7GnA5UpiKvDPDThIiZFib3YNBHIpvsPV5qR3AnYUOO3Vub9M
         VP7R76QVbfJq80X8Da9zsw50gDRodCMlQXi/txsVNKpOWwMR0tbeWzt5nAR/NPxJen
         4+ry2XowzRb17h2C9jkHUdrDToF+/AmEL+SeYUHzSI3we+yrQwN7FzDVdJFoIaoIUH
         h0wEY+SZ+rk10mCdPN0WoWEtIcTQqfrcVxVUWTebt/rGBGfN92Gda2zN3n1Dd8MJN+
         gY7QfTW0CGoJTjAfT3G6L9fDoISbwBejfS5cnRutPDSqnoUGpWCScozSh6DszbxQDj
         ExKzRvADkXAjw==
Date: Tue, 2 May 2023 10:28:19 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Question: Are there conflicts between the paragraph and the
 figure?
Message-ID: <203d3e8b-f75b-460c-8a28-5a3b72121cff@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <6FC864F5-A6CD-4C5F-BC63-9670AB95F8F7@gmail.com>
 <6146DDCA-450B-43A1-8158-2D8766E3B86F@gmail.com>
 <3083120a-7c17-4349-9389-7ebde03676de@paulmck-laptop>
 <AE67636E-D24E-4174-AF1C-98123161823F@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AE67636E-D24E-4174-AF1C-98123161823F@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Alan Huang <mmpgouride@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, May 02, 2023 at 11:51:33PM +0800, Alan Huang wrote:
> 
> 
> > 2023年5月2日 03:02，Paul E. McKenney <paulmck@kernel.org> 写道：
> > 
> > On Mon, May 01, 2023 at 07:09:49PM +0800, Alan Huang wrote:
> >> 
> >>> 2023年5月1日 下午7:05，Alan Huang <mmpgouride@gmail.com> 写道：
> >>> 
> >>> Hi,
> >>> 
> >>> I’m reading section 9.5.4.9, in the second to the last paragraph, there is:
> >>> 
> >>> Before the first horizontal line, all readers see the leftmost myconfig structure,
> >>> and after the second horizontal line, all readers will see the rightmost structure. 
> >>> Between the two lines, that is, during the grace period, different readers might see different objects
> >>> 
> >>> I’m a little confused, in Figure 9.29, the xchg is before the first horizontal line, in my understanding, if the 
> >>> reader’s reading is before the xchg, it will read the leftmost myconfg structure.
> >> 
> >> And if reader’s reading is after the xchg, it will see the rightmost structure, and because xchg is before the first horizontal line,
> >> Readers before the first horizontal line may also see the rightmost structure.
> >> 
> >>> 
> >>> So, are there some conflicts between the paragraph and the figure?
> >>> 
> >>> Please correct me if I’m wrong.
> > 
> > Consider the point in time just before the left-hand reader's
> > rcu_read_unlock() and just after the right-hand reader's rcu_read_lock().
> > These two readers are both running at that time, and one of those readers
> > sees the old state and the other sees the new state.
> 
> The sentence that may lead to conflict is this one from the original text:
> 
> 	Before the first horizontal line, all readers see the leftmost myconfig structure.
> 
> There may be a situation where:
> 
> 	      				mcp = xchg(&curconfig, mcp);
> 	rcu_read_lock(); 
> 	mcp = …
> 	*cur_a = mcp->a; 
> -------------------------------------------------first horizontal line-------------------------------------------------
> 
> So, the reader will see the rightmost myconfig structure although it is before the first horizontal line.

Ah, I understand now, good catch and thank you!  I updated that paragraph
to the following, with your Reported-by:

	The two horizontal grey dashed lines represent the period of time
	during which different readers get different results, however,
	each reader will see one and only one of the two objects. All
	readers that end before the first horizontal line will see the
	leftmost myconfig structure, and all readers that start after the
	second horizontal line will see the rightmost structure. Between
	the two lines, that is, during the grace period, different readers
	might see different objects, but as long as each reader loads the
	curconfig pointer only once, each reader will see a consistent
	view of its myconfig structure.

Does that help?

> BTW, the original text says that black dotted arrows pointing from an older event to a newer event, 
> but there exists two black dotted arrows in the wrong direction:
> 
> 	1.The arrow pointing from synchronize_rcu() to left-hand rcu_read_lock()
> 	2.The arrow pointing right-hand rcu_read_lock() to synchronize_rcu() 
> 
> The directions of the two arrows above may need to be adjusted. I tried to modify this, but after a few hours, I still can’t figure out the svg...

The trick is to use an SVG editor.  For better or for worse, I use
inkscape.  But easy for me to change, so I did, again, with your
Reported-by.

The trick is to flip each arrow horizontally and then vertically, which
reverses the direction without having to test one's manual dexterity,
which I lack in abundance.  ;-)

							Thanx, Paul

> Thanks,
> Alan
> 
> > 
> > Does that help, or am I missing the point of your question?
> > 
> > Thanx, Paul
> 
