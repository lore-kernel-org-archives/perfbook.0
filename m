Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357314AbiDBPiE (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 2 Apr 2022 11:38:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A46613CEC9
        for <perfbook@vger.kernel.org>; Sat,  2 Apr 2022 08:36:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5841661045
        for <perfbook@vger.kernel.org>; Sat,  2 Apr 2022 15:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648913771;
        bh=hFRb+rf/heTCUbA8Ef3S3G1ejYQvKddaMuMIVIsvN58=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=d7qCl0a+9n0q73P4sb6ofaqhybBe0Xo//P4KGmE+tm5A/2Vru3HYfrdxKg2TIrfgf
         zidF8vPZO19A2KTcGHTpPE+empeo3nyQMYWsyvHstRwd4DNEMmL7pRt8hbR9bUdx4A
         sHBcy9zTsApGVNWF7Rrv4YeRcA7lqGX8vi1DL5hBezZoAEAM1h3pmLlCtfnP2lEFIr
         LBDenZZf8/C/jOoSAZP/assSUkE/PZaXMv7eb5u2gYBuKfYdO66utMMz/cN9SbJOHa
         98rIg6keOhGGbmW2qTjQKf5BcenDfqvoXyz98i62LDnWjMFZ416iXS5063QZFCKBj0
         1wbx57x1NJ+KQ==
Date: Sat, 2 Apr 2022 08:36:11 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Question about formula (4.1)
Message-ID: <20220402153611.GJ4285@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <CA+PpKPnDa8T_VDgbc-C_TEEYjocrvRems+6aorUcbucRXV73rg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+PpKPnDa8T_VDgbc-C_TEEYjocrvRems+6aorUcbucRXV73rg@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Hao Lee <haolee.swjtu@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Apr 02, 2022 at 03:57:01PM +0800, Hao Lee wrote:
> Hello,
> 
> I'm confused about Figure 4.2 and the formula (4.1).
> 
> Anyone can clarify the confusion? Thanks.
> 
> On page 56, the book says:
> 
> 1. LN is the number of lock acquisitions by N threads.
> 
> Question: Does this mean LN = sum of all the readcounts[i] ?

Yes.

> 2. L1 is the number of lock acquisitions by a single thread
> 
> Question: which thread is L1 corresponding to? Is "a single thread"
> selected randomly?

No, L_1 corresponds to the number of acquisitions of a single thread
in a run where only that one thread was running.

And now that you mention it, the text does not make that at all clear,
so please accept my apologies for the unclarity.

Does the change below help?

The resulting text is:

	where N is the number of threads in the current run, L_N is
	the total number of lock acquisitions by all N threads in the
	current run, and L_1 is the number of lock acquisitions in a
	single-threaded run.

Where the LaTeX "_" subscript operator is used in place of real
subscripts.

						Thanx, Paul

------------------------------------------------------------------------

commit 432a94b0b7e1436a00587a0988fb678def465882
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Sat Apr 2 08:30:43 2022 -0700

    toolsoftrade: Clarify rwlock efficiency formula description
    
    Reported-by: Hao Lee <haolee.swjtu@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 833ec697..d6662f8c 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -890,9 +890,10 @@ The actual value plotted is:
 \begin{equation}
 	\frac{L_N}{N L_1}
 \end{equation}
-where $N$ is the number of threads,
-$L_N$ is the number of lock acquisitions by $N$ threads, and
-$L_1$ is the number of lock acquisitions by a single thread.
+where $N$ is the number of threads in the current run,
+$L_N$ is the total number of lock acquisitions by all $N$ threads in the
+current run, and
+$L_1$ is the number of lock acquisitions in a single-threaded run.
 Given ideal hardware and software scalability, this value will always
 be 1.0.
 
