Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233992AbjDYSgd (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 25 Apr 2023 14:36:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4296FC160
        for <perfbook@vger.kernel.org>; Tue, 25 Apr 2023 11:36:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B80F96299D
        for <perfbook@vger.kernel.org>; Tue, 25 Apr 2023 18:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682447787;
        bh=Gj1UKg4gQHoRU7fKZdTKshzLFB59bCcp8Nd3rtF6QJ8=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=iWnBzksoHaPH2qNANfyEOwwPNIlMMpaub+eBNrw1Sx4q3VxaMKRKDQ9l4YXVd8ycj
         2xuZ1cZg1OjqJmH0rE0FJDFfMgOpfadBM/ds+Lxrw6BXEAv1h1wb1K9mRGAZzz3tmy
         rvAZrzjX3e2IuSrUBErDkv++sWr+RE6OtrDEnxL9jeny7xZpyuc8uBYP2ScKIX56+8
         192LZkO9v6bz0mcPHRqUp8Ppu2cVW6qrFPT5xWMs/s1TOhcX+VZx5aP0ufvs4xrEli
         iAd3j3FHlg4aLVFYUU2x2EfCMRwdD5zXYpaBwexq4xtLJxKZAYOKLd9x3hRygiglue
         RPZGPXyPYjnnQ==
Date: Tue, 25 Apr 2023 11:36:26 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] CodeSamples/defer: Make hazard partition consistent with
 hazptr_thread_exit
Message-ID: <c7d8bbb9-0cad-47b8-af71-3a6489bff0a6@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230420074030.35246-1-mmpgouride@gmail.com>
 <7ea775ac-579c-4b73-8d07-b717f962bd50@paulmck-laptop>
 <28115808-37F7-4003-BD8B-E15D12DC6B70@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <28115808-37F7-4003-BD8B-E15D12DC6B70@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Alan Huang <mmpgouride@gmail.com>
Cc: akiyks@gmail.com, perfbook@vger.kernel.org

On Tue, Apr 25, 2023 at 09:32:46PM +0800, Alan Huang wrote:
> > 2023年4月25日 00:02，Paul E. McKenney <paulmck@kernel.org> 写道：
> > 
> > On Thu, Apr 20, 2023 at 07:40:30AM +0000, Alan Huang wrote:
> >> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
> >> ---
> >> CodeSamples/defer/hazptrtorture.h | 2 +-
> >> 1 file changed, 1 insertion(+), 1 deletion(-)
> >> 
> >> diff --git a/CodeSamples/defer/hazptrtorture.h b/CodeSamples/defer/hazptrtorture.h
> >> index 29761e3d..acdd532b 100644
> >> --- a/CodeSamples/defer/hazptrtorture.h
> >> +++ b/CodeSamples/defer/hazptrtorture.h
> >> @@ -99,7 +99,7 @@ void *hazptr_read_perf_test(void *arg)
> >> {
> >> 	int i;
> >> 	int me = (long)arg;
> >> -	int base = me * K;
> >> +	int base = smp_thread_id() * K;
> > 
> > Suppose specify a number of threads greater than the number of CPUs.
> > For example, on my 12-hardware-thread laptop:
> > 
> > ./route_hazptr --stresstest --nreaders 24
> > 
> > In that case, don't we want "me" rather than "smp_thread_id()"?

Never mind, I was confused.  Maybe I should have waited another
day after return before looking at this.  :-/

$ ./hazptr 24 perf
sched_setaffinity: Invalid argument
Aborted (core dumped)

But that is a pre-existing problem.  If I keep the number within the
number of hardware threads, it works fine:

$ ./hazptr 12 perf
n_reads: 576608000  n_updates: 314343  nreaders: 12  nupdaters: 1 duration: 1
ns/read: 20.8114  ns/update: 3181.24

I am not all that worried about this.  Running multiple threads per
hardware thread in a performance test isn't all that useful, after all.
And there is a robust diagnostic.  Perhaps not as helpful as one might
like, but definitely robust.  ;-)

> As Akira said, route_hazptr.c includes routetorture.h and route_hazptr.c doesn't call hp_record().
> The fix won't have any effect on route_hazptr.

Agreed, again, my post-vacation confusion, apologies!!!

							Thanx, Paul
