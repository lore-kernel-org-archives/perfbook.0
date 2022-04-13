Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbiDMDLf (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 12 Apr 2022 23:11:35 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 839B3B1
        for <perfbook@vger.kernel.org>; Tue, 12 Apr 2022 20:09:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2D83AB82075
        for <perfbook@vger.kernel.org>; Wed, 13 Apr 2022 03:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649819351;
        bh=tMnMgmrQIy0qzAw49BhFx5EzPkGzG8JwAGDZmuD9q6s=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=mvekdX2se1lV9e6XC8/ev+fnOtxZq8OTRXjuVG89RLDY6QwJ5oUamAZ3BuVtctHxB
         VviYJM3i8ahF8d44J6IU7dJ0QjDtm2QJ2wk/arKCEuRP9HC4oXtXfa9QKX7cGT04Qq
         CUeS+qNwBgkTZkNQUMT+sSi2Qj5NzgXQ81se9nwOqb0va2PsUvExLMughzT0yJkAv2
         Rot+xRooYExKQCB6pugSs9zIkvBO2a2M6V2I502F5aRkeamgFjjcyZMue9eNRo57Dc
         eJrYsSYBUKPiMmJ5sJfyk7zYTVMWh6fDqwNgvDREB+Q1bH0njFd4/Y1na/UFJFriXu
         yJqzPqcRm524g==
Date: Tue, 12 Apr 2022 20:09:11 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: A question about MESI in appendix C.2 Transition (h)
Message-ID: <20220413030911.GI4285@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220412025559.GA3597@haolee.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412025559.GA3597@haolee.io>
List-ID: <perfbook.vger.kernel.org>
To: Hao Lee <haolee.swjtu@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Apr 12, 2022 at 02:55:59AM +0000, Hao Lee wrote:
> Hello,
> 
> I have a question about the MESI protocol in appendix C.2.
> 
> As said in C.2.1, the cache line in the shared state is up-to-date. And,
> C.2.2 says implicitly a writeback message is used to writeback a dirty
> cache line.
> 
> Then in C.2.3 Transition (h) Shared->Exculsive, it says:
> 
> 	Alternatively, all other CPUs eject this cache line from their
> 	caches via "writeback" messages (presumably to make room for
> 	other cache lines), so that this CPU is the last CPU caching it.
> 
> As some CPUs share this cache line, it must be clean. I think other CPUs
> only need to discard the corresponding cache line in their cache without
> any additional operation when receiving a invalidate message. Why do
> they need to send a "writeback" message?

Right you are!  I was failing to push my mind all the way back to
pure MESI.  Cache-coherence protocols in real use are more complex,
and do allow several CPUs to share a cacheline that is read-only,
but for which memory has not yet been updated.

But for this book, MESI is complex enough!  ;-)

How does the patch shown below look?

							Thanx, Paul

------------------------------------------------------------------------

commit 81c728e6bb06ffa59282f550616c498c8d9f7169
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Tue Apr 12 20:06:31 2022 -0700

    appendix/whymb: Make Transition (h) do strict MESI
    
    The text claimed that CPUs could share a cacheline that was dirty.
    This is commonly true in real computer systems, but not for the textbook
    strict-MESI protocol.  So this commit pulls Transition (h) back to
    strict MESI.
    
    Reported-by: Hao Lee <haolee.swjtu@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index b49d5fe8..8d58483f 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -494,11 +494,9 @@ The transition arcs in this figure are as follows:
 	This CPU realizes that it will soon need to write to some data
 	item in this cache line, and thus transmits an ``invalidate'' message.
 	The CPU cannot complete the transition until it receives a full
-	set of ``invalidate acknowledge'' responses.
-	Alternatively, all other CPUs eject this cache line from
-	their caches via ``writeback'' messages (presumably to make room
-	for other cache lines),
-	so that this CPU is the last CPU caching it.
+	set of ``invalidate acknowledge'' responses, indicating that
+	no other CPU has this cacheline in its cache.
+	In other words, this CPU is the only CPU caching it.
 \item	[Transition (i):]
 	Some other CPU does an atomic read-modify-write operation on
 	a data item in a cache line held only in this CPU's cache,
