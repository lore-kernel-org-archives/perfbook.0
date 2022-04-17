Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234636AbiDQRre (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 17 Apr 2022 13:47:34 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9D5CB43
        for <perfbook@vger.kernel.org>; Sun, 17 Apr 2022 10:44:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8B01CB80B2A
        for <perfbook@vger.kernel.org>; Sun, 17 Apr 2022 17:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650217495;
        bh=XQoKkEyXVAjiQAKp0E7GGpK9pmT80eSzfZMHsKz1uQk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=EVMjuG5YScVTFd+hU6FNPR/EpVcK7p19HyLscIk9DRs7p1qAsCHRshOwMas6SYO8t
         kK46ukhqQNI4WyaA5IDhBS+GWFEKCr/k3vSW7lvxfltSArCiIKY+ZMUohkyRmvRRBP
         x8gpuXBeVRVbRp3lqqHyDQdc22w+E1hwuPgqTN2RTZ4NK8KU9vmNdhJv+BcXaDQKsN
         OibuhPNjoZfTa2WppqR9KrFzO5SECHhK5JOv0N6SP0loPwRDpbh3tLu5+33SsTJ8nj
         l1SsZp/gmjGqWcg6NKsswaG2/VbLR2hZhMIGajkYIh8KM36jbuTv4oz7e7kYPUNTAn
         ct+Ww6ZrMByaw==
Date: Sun, 17 Apr 2022 10:44:54 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: The answer of Quiz C.8 is not quite reasonable
Message-ID: <20220417174454.GR4285@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220414174225.GA29861@haolee.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220414174225.GA29861@haolee.io>
List-ID: <perfbook.vger.kernel.org>
To: Hao Lee <haolee.swjtu@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Apr 14, 2022 at 05:42:25PM +0000, Hao Lee wrote:
> Hi,
> 
> At the beginning of C.3.3 we have supposed the cache line containing "a"
> resides _only_ in _CPU1’s_ cache. I think this is why _CPU0_ has to send
> a "_read_ invalidate message" to _retrieve_ the cache line and invalid
> CPU1's cache line.
> 
> However, the answer says the reason is the cache line in question
> contains more than just the variable a. I can't understand the logical
> relationship between this answer and the question. Am I missing
> something here? Thanks.

I added the commit shown below.  Does that help?

							Thanx, Paul

------------------------------------------------------------------------

commit 36fe14d5ebe406e331a5d89533fe3187d2019898
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Sun Apr 17 10:41:33 2022 -0700

    appendix/whymb: Clarify QQ C.8
    
    More clearly note the presence of data other than the variable a.
    
    Reported-by: Hao Lee <haolee.swjtu@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index 8f607e35..43f1307b 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -821,9 +821,14 @@ Then the sequence of operations might be as follows:
 	In \cref{seq:app:whymb:Store Buffers and Memory Barriers} above,
 	why does CPU~0 need to issue a ``read invalidate''
 	rather than a simple ``invalidate''?
+	After all, \co{foo()} will overwrite \co{a} in any case, so why
+	should it care about the old value of \co{a}?
 }\QuickQuizAnswer{
-	Because the cache line in question contains more than just the
+	Because the cache line in question contains more data than just the
 	variable \co{a}.
+	Issuing ``invalidate'' instead of the needed ``read invalidate''
+	would cause that other data to be lost, which would constitute
+	a serious bug in the hardware.
 }\QuickQuizEnd
 
 The hardware designers cannot help directly here, since the CPUs have
