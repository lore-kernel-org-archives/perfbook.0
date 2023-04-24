Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231378AbjDXPob (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 24 Apr 2023 11:44:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A32EFF
        for <perfbook@vger.kernel.org>; Mon, 24 Apr 2023 08:44:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A97226125D
        for <perfbook@vger.kernel.org>; Mon, 24 Apr 2023 15:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682351069;
        bh=WEkvk3yhsa4lIN2/Hq3wEXJliwH36npAyIp9gBOV2tc=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=FKY64D13oWE68EU1SZdoLlorDILClIcZGhwBJ9tGwIYH4VybFC8sg6gUPXs2jn72E
         tNOdHCooAzEQ7vOj9Cenm1KMVYiAganXOv48VB8jbn3Rn1qwzwALzuqefmpyGtPyWJ
         bsGaJ/ZLjwsgk0pwbvSQFXZ/Z1IqFr+p7gZPv6NG18Et5ZEapHlMWlEz8y6eXhuSis
         VZ4Pxc/q/UmtQTgoVM/nW3+nLRWElktcFBBu5/UjGxedP33IQkVd15OEVv6kgD33b1
         XIHWI8jwKkUZT/VZqFCigquZsSrwEt90ITggbac0xjgcUZuDm1g/caKdGZkq2h4xG1
         TMkkAdLVR7Ttg==
Date: Mon, 24 Apr 2023 08:44:28 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v2] CodeSamples/defer: Fix hazard torture
Message-ID: <382e0a57-28c9-4da1-9474-abcdbe84d46d@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230422103421.1382-1-mmpgouride@gmail.com>
 <c5b09b36-1b3f-6d03-2dda-ad2514c71de9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5b09b36-1b3f-6d03-2dda-ad2514c71de9@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Alan Huang <mmpgouride@gmail.com>, perfbook@vger.kernel.org

On Sat, Apr 22, 2023 at 08:56:17PM +0900, Akira Yokosawa wrote:
> On Sat, 22 Apr 2023 10:34:21 +0000, Alan Huang wrote:
> > Because hp_try_record() must check for concurrent modifications,
> > we should not dereference the pointer. The arg of hazptr_read_stress_test
> > is always NULL, which is designated at time when create the thread,
> > therefore, all threads will store their hazard pointer in the same slot.
> > Also, hazptr_thread_exit will clear their own hazard pointer from
> > smp_thread_id() * K.
> > 
> > Signed-off-by: Alan Huang <mmpgouride@gmail.com>
> 
> Now I see all your points.  Thank you for your thorough review
> of the code!
> 
> As I mentioned earlier, the deref of p was introduced by commit
> a082aba85ce0 ("defer/hazptr: Checkpoint for text/code update"),
> while the uses of arg in hazptr_read_stress_test() and
> hazptr_read_perf_test() were there since the addition of this code
> by commit c672535d475a ("Convert Tom Hart's hazard-pointer
> implementation to perfbook"), that is, if I'm reading the code
> correctly.
> 
> So,
> 
> Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
> Fixes: c672535d475a ("Convert Tom Hart's hazard-pointer implementation to perfbook")
> Fixes: a082aba85ce0 ("defer/hazptr: Checkpoint for text/code update")

Now -that- is what I call an embarrassing bug!

Thank you both for tracking it down and for the fix!!!

Queued and pushed.

							Thanx, Paul

>         Thanks, Akira
> 
> > ---
> >  CodeSamples/defer/hazptr.h        | 2 +-
> >  CodeSamples/defer/hazptrtorture.h | 5 ++---
> >  2 files changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/CodeSamples/defer/hazptr.h b/CodeSamples/defer/hazptr.h
> > index 759ab53d..e061303d 100644
> > --- a/CodeSamples/defer/hazptr.h
> > +++ b/CodeSamples/defer/hazptr.h
> > @@ -87,7 +87,7 @@ static inline void *hp_record(void **p,			//\lnlbl{hr:b}
> >  	void *tmp;
> >  
> >  	do {
> > -		tmp = hp_try_record(*p, hp);
> > +		tmp = hp_try_record(p, hp);
> >  	} while (tmp == (void *)HAZPTR_POISON);
> >  	return tmp;
> >  }							//\lnlbl{hr:e}
> > diff --git a/CodeSamples/defer/hazptrtorture.h b/CodeSamples/defer/hazptrtorture.h
> > index 53efa259..acdd532b 100644
> > --- a/CodeSamples/defer/hazptrtorture.h
> > +++ b/CodeSamples/defer/hazptrtorture.h
> > @@ -99,7 +99,7 @@ void *hazptr_read_perf_test(void *arg)
> >  {
> >  	int i;
> >  	int me = (long)arg;
> > -	int base = me * K;
> > +	int base = smp_thread_id() * K;
> >  	long long n_reads_local = 0;
> >  	hazptr_head_t hh;
> >  	hazptr_head_t *hhp = &hh;
> > @@ -241,8 +241,7 @@ DEFINE_PER_THREAD(long long [HAZPTR_STRESS_PIPE_LEN + 1], hazptr_stress_count);
> >  
> >  void *hazptr_read_stress_test(void *arg)
> >  {
> > -	int me = (int)(long)arg;
> > -	int base = me * K;
> > +	int base = smp_thread_id() * K;
> >  	struct hazptr_stress *p;
> >  	int pc;
> >  
