Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232280AbiK1V5K (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 28 Nov 2022 16:57:10 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4B542C64C
        for <perfbook@vger.kernel.org>; Mon, 28 Nov 2022 13:57:08 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 12338B81022
        for <perfbook@vger.kernel.org>; Mon, 28 Nov 2022 21:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669672625;
        bh=2+Trnxk072Yd7fILlxSjJWe5i2SdDJ2YpKTjVRSL6fU=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=qfzHnvU3vdETx2Jzp88/Et4HhkXHI2nJ7brsN1MGuIF9E7amzm1BzlzcTMFrwuEZU
         0894saOSRv9hXhTKhtplbWuHFJjESGxzbFPvcM1JrtXTfmFNmtMFqDeR4qh84Jcpe6
         6/20SL5X1LKJcn5syhfcOwOAPUdJ9Y7l611tFGmZDjelQEhuYsBGcc9qWH6v3rCYwE
         f7I8oNJY0cWh1VFzH43qFBj76UGuyvHHAlFDfZMDYpq99jWhG9a32Zqc8TVk6VvAPW
         6rL86Rx/iN3r1MjfGQCRoGRRN6U3HZM78NHCelrLPhU4iLe77Uhe6ozywJjziUbSLZ
         SA/naSsveJYXQ==
Date: Mon, 28 Nov 2022 13:57:05 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Some question regarding Memory barrier
Message-ID: <20221128215705.GL4001@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <CAEQx1k03GODwjR5tZB=A-UGQWij_b9BBvP0Y0F2RsUE=693JaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEQx1k03GODwjR5tZB=A-UGQWij_b9BBvP0Y0F2RsUE=693JaA@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Kirill Martynov <kirill.v.martynov@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Nov 29, 2022 at 12:27:08AM +0300, Kirill Martynov wrote:
> Hello Paul!
> First of all I want to say thank you for the amazing book "Is Parallel
> programming hard".

Glad you like it!

> Right now I'm reading your paper "Memory barriers: a hardware view for
> software hackers"
> and there is one moment that confuses me, on page 9 you wrote:
> 
> 4. CPU 0 executes b=1. It already owns this cache
> 
> line (in other words, the cache line is already in
> 
> either the “modified” or the “exclusive” state),
> 
> but there is a marked entry in the store buffer.
> 
> Therefore, rather than store the new value of “b”
> 
> in the cache line, it instead places it in the store
> 
> buffer (but in an unmarked entry).
> 
> 5. CPU 0 receives the “read” message, and transmits
> 
> the cache line containing the original value
> 
> of “b” to CPU 1. It also marks its own copy of
> 
> this cache line as “shared”.
> 
> 6. CPU 1 receives the cache line containing “b” and
> 
> installs it in its cache.
> 
> If CPU0 had cache line in M or E state, it means that content in this line
> differs from main memory. Then during the "read" message from CPU1 should
> it sync (write back) this cache line with main memory?
> Otherwise we will end up with CPU0 CPU1 having cache line in Shared state,
> and according to your previous explanations cache line in Shared state can
> be invalidated without writeback to main memory

Yes, you are right, that writeback is necessary within the confines of
strict MESI.  I am not in a position to update that paper, but this
same issue is present in Appendix C.3.3 of "Is Parallel Programming
Hard...".  I have updated it with your reported-by as shown below.

Good eyes, and thank you for letting me know!

(Adding the perfbook list on Cc.)

							Thanx, Paul

------------------------------------------------------------------------

commit 5e6242b1bd3952817b24ccd6d477cc1dadd90639
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Mon Nov 28 13:52:58 2022 -0800

    appendix/whymb: Note store to memory in SB/MB example
    
    Reported-by: Kirill Martynov <kirill.v.martynov@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index 99c68eac..ee9f96f1 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -842,7 +842,10 @@ Then the sequence of operations might be as follows:
 	so it stores the new value of ``b'' in its cache line.
 \item	CPU~0 receives the ``read'' message, and transmits the
 	cache line containing the now-updated value of ``b''
-	to CPU~1, also marking the line as ``shared'' in its own cache.
+	to CPU~1, also marking the line as ``shared'' in its own cache
+	(but only after writing back the line containing ``b'' to main
+	memory).
+	\label{seq:app:whymb:Store Buffers and Memory Barriers store}
 \item	CPU~1 receives the cache line containing ``b'' and installs
 	it in its cache.
 \item	CPU~1 can now finish executing \co{while (b == 0) continue},
@@ -874,6 +877,15 @@ Then the sequence of operations might be as follows:
 	a serious bug in the hardware.
 }\EQuickQuizEnd
 
+\EQuickQuiz{
+	In \cref{seq:app:whymb:Store Buffers and Memory Barriers store}
+	above, don't systems avoid that store to memory?
+}\EQuickQuizAnswer{
+	Yes, they do.
+	But to do so, they add states beyond the MESI quadruple that
+	this example is working within.
+}\EQuickQuizEnd
+
 \EQuickQuiz{
 	In \cref{seq:app:whymb:Store Buffers and Memory Barriers victim}
 	above, did \co{bar()} read a stale value from \co{a}, or did
