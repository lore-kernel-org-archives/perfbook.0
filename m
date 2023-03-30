Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232708AbjC3PEw (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 30 Mar 2023 11:04:52 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53CE87D83
        for <perfbook@vger.kernel.org>; Thu, 30 Mar 2023 08:04:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0D39FB82623
        for <perfbook@vger.kernel.org>; Thu, 30 Mar 2023 15:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680188688;
        bh=gZB56kk4m63RK1fNw7eCneZ8J/KY47HJDHPVsduPM78=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=ifOm2xE9NuN2gDe1Ga49mmrSLabI7kkCbqaE6FKdC6xbX1OrGYXiuL8hswf/WU9eJ
         IKk5efjtI8cU5fHGcF0WjdHwyyU3IrB/QPowCsF9OBfwZDasz/bc4zxOEXRHM8L/mr
         cmebmWSdCtKjfJs2nduSxCyO8mKeiJVG5wp00YN2endPgti47PUnPp/+bBPePj6625
         jHUOnrrh6gHWhskWstMSxfFAOjds0Ywz1ZXHso+22TFWLs96jovSPwZLe//0rJZOQR
         GP4L+ZmuX+GLatWTqI/LxVTX8HQfD04hF7hn01ZtmKrhd6UO3Q3YcFtGPGDdB7j8qF
         o3FM72dYSV4LA==
Date: Thu, 30 Mar 2023 08:04:48 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v3] CodeSamples/count: add necessary partial memory
 barriers
Message-ID: <d18e92a2-e0fb-493f-9d46-8b1883a77ae6@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230328145824.632910-1-mmpgouride@gmail.com>
 <116de201-9df8-aa40-46a3-eb872bdfb9d9@gmail.com>
 <f42a15f4-9fee-477b-8516-8ace00a33f36@paulmck-laptop>
 <0F5FE95A-6A39-4229-ABB4-D13BEE688E94@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0F5FE95A-6A39-4229-ABB4-D13BEE688E94@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Alan Huang <mmpgouride@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Thu, Mar 30, 2023 at 05:59:37PM +0800, Alan Huang wrote:
> > Alan, would you like to drag the counting code kicking and screaming
> > into the 2020s?  ;-)
> 
> I’d like to!

Very good!  Again, this code was written before tools such as LKMM
existed, so you will likely find instances where I used heavier-weight
memory ordering than needed, and, as always, you also will likely find
out-and-out bugs.

Looking forward to seeing what you come up with!

							Thanx, Paul

> Thanks,
> Alan
> 
> > 2023年3月30日 上午7:18，Paul E. McKenney <paulmck@kernel.org> 写道：
> > 
> > On Wed, Mar 29, 2023 at 08:43:33AM +0900, Akira Yokosawa wrote:
> >> On Tue, 28 Mar 2023 10:58:24 -0400, Alan Huang wrote:
> >>> This patch add several necessary partial memory barriers, the first one
> >>> change READ_ONCE to smp_load_acquire to makes sure the reading from theftp[t]
> >>> happens before the reading from counterp[t]. The litmus testing below
> >>> represents the original code pattern, and the result is "Sometimes":
> >>> 
> >>> C counter_sig
> >>> 
> >>> {}
> >>> 
> >>> P0(int *theft, int *counter)
> >>> {
> >>>    int r0;
> >>>    int r1;
> >>> 
> >>>    r0 = READ_ONCE(*theft);
> >>>    r1 = READ_ONCE(*counter);
> >>> }
> >>> 
> >>> P1(int *theft, int *counter)
> >>> {
> >>>    WRITE_ONCE(*counter, 1);
> >>>    smp_mb();
> >>>    WRITE_ONCE(*theft, 1);
> >>> }
> >>> 
> >>> exists (0:r0=1 /\ 0:r1=0)
> >>> 
> >>> Second one change WRITE_ONCE to smp_store_release to make sure that setting
> >>> counterp[t] happens before the setting theftp[p] to THEFT_IDLE. Here is the
> >>> litmus testing, The result is "Sometimes":
> >>> 
> >>> C counter_sig_2
> >>> 
> >>> {
> >>>    int theft = 1;
> >>>    int counter = 1;
> >>> }
> >>> 
> >>> P0(int *theft, int *counter)
> >>> {
> >>>    WRITE_ONCE(*counter, 0);
> >>>    WRITE_ONCE(*theft, 0);
> >>> }
> >>> 
> >>> P1(int *theft, int *counter)
> >>> {
> >>>    if (READ_ONCE(*theft) == 0)
> >>>    {
> >>>        WRITE_ONCE(*counter, READ_ONCE(*counter)+1);
> >>>    }
> >>> }
> >>> 
> >>> P2(int *counter)
> >>> {
> >>>    int r0;
> >>> 
> >>>    r0 = READ_ONCE(*counter);
> >>> }
> >>> 
> >>> exists (2:r0=2)
> >>> 
> >>> Note that I also changed the reading of theft variable
> >>> to smp_load_acquire in add_count/sub_count's fast path
> >>> to make sure that reading theft happens before reading
> >>> counter.
> >>> 
> >>> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
> >> 
> >> Looks good to me.
> >> Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
> > 
> > Thank you both!
> > 
> >> Paul, there is a question for you.
> >> Please see below.
> >> 
> >>> ---
> >>> CodeSamples/count/count_lim_sig.c | 8 ++++----
> >>> 1 file changed, 4 insertions(+), 4 deletions(-)
> >>> 
> >>> diff --git a/CodeSamples/count/count_lim_sig.c b/CodeSamples/count/count_lim_sig.c
> >>> index 023d6215..59da8077 100644
> >>> --- a/CodeSamples/count/count_lim_sig.c
> >>> +++ b/CodeSamples/count/count_lim_sig.c
> >>> @@ -81,7 +81,7 @@ static void flush_local_count(void)			//\lnlbl{flush:b}
> >>> 	for_each_tid(t, tid) {				//\lnlbl{flush:loop2:b}
> >>> 		if (theftp[t] == NULL)			//\lnlbl{flush:skip:nonexist}
> >>> 			continue;			//\lnlbl{flush:next2}
> >>> -		while (READ_ONCE(*theftp[t]) != THEFT_READY) {//\lnlbl{flush:loop3:b}
> >>> +		while (smp_load_acquire(theftp[t]) != THEFT_READY) {//\lnlbl{flush:loop3:b}
> >>> 			poll(NULL, 0, 1);		//\lnlbl{flush:block}
> >>> 			if (READ_ONCE(*theftp[t]) == THEFT_REQ)//\lnlbl{flush:check:REQ}
> >>> 				pthread_kill(tid, SIGUSR1);//\lnlbl{flush:signal2}
> >>> @@ -90,7 +90,7 @@ static void flush_local_count(void)			//\lnlbl{flush:b}
> >>> 		*counterp[t] = 0;
> >>> 		globalreserve -= *countermaxp[t];
> >>> 		*countermaxp[t] = 0;			//\lnlbl{flush:thiev:e}
> >>> -		WRITE_ONCE(*theftp[t], THEFT_IDLE);	//\lnlbl{flush:IDLE}
> >>> +		smp_store_release(theftp[t], THEFT_IDLE);	//\lnlbl{flush:IDLE}
> >>> 	}						//\lnlbl{flush:loop2:e}
> >>> }							//\lnlbl{flush:e}
> >>> 
> >>> @@ -116,7 +116,7 @@ int add_count(unsigned long delta)			//\lnlbl{b}
> >>> 
> >>> 	WRITE_ONCE(counting, 1);			//\lnlbl{fast:b}
> >>> 	barrier();					//\lnlbl{barrier:1}
> >>> -	if (READ_ONCE(theft) <= THEFT_REQ &&		//\lnlbl{check:b}
> >>> +	if (smp_load_acquire(&theft) <= THEFT_REQ &&		//\lnlbl{check:b}
> >>> 	    countermax - counter >= delta) {		//\lnlbl{check:e}
> >>> 		WRITE_ONCE(counter, counter + delta);	//\lnlbl{add:f}
> >>> 		fastpath = 1;				//\lnlbl{fasttaken}
> >>> @@ -155,7 +155,7 @@ int sub_count(unsigned long delta)
> >>> 
> >>> 	WRITE_ONCE(counting, 1);
> >>> 	barrier();
> >>> -	if (READ_ONCE(theft) <= THEFT_REQ &&
> >>> +	if (smp_load_acquire(&theft) <= THEFT_REQ &&
> >>> 	    counter >= delta) {
> >>> 		WRITE_ONCE(counter, counter - delta);
> >>> 		fastpath = 1;
> >> 
> >> In add_count() and sub_count(), is the plain accesses to counter
> >> guaranteed to see the value stored in flush_local_count()?
> >> 
> >> I'm asking because counter is declared as a thread-local variable:
> >> 
> >> In this code, as each of the plain loads of counter is the first
> >> access to the variable in each function, there is not much room
> >> for compilers to exploit the plainness, I suppose.
> >> 
> >> What do you think?
> > 
> > Well, gitk thinks that the last deliberate change to this code was in
> > 2010, before READ_ONCE() and WRITE_ONCE(), let alone LKMM.  So it needs
> > careful scrutiny, along with the other counting algorithms.
> > 
> > This commit looks like a step in the right direction, so I am applying
> > it, thank you both!
> > 
> > Alan, would you like to drag the counting code kicking and screaming
> > into the 2020s?  ;-)
> > 
> > 							Thanx, Paul
> 
