Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:34070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229896AbhHXQrZ (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 24 Aug 2021 12:47:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629823601;
        bh=AFUxEAC14RHwGy37hqY2sOmkim4371bwUan5NK4j/uc=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=hSY6dBvpVpiRXWN6TRILvqTFxeG/FvCMhtUHkihN9HMnOf4nQ9lAIw/q0wyHfe9iF
         4pfCDl72HnAhpsnEnlPpGp/oIsHHhgbTprj7Qiz+HH+602e7+By18UOeQLRcpPR9mA
         XB5dRw0t8mxXrShtn/pCjMHd3lm86XvGvxlQaLnckXrEiNqwkAWqaTPMLwGh+a8of9
         8TqwFzwMh3/Nlms2sUkestq60hnSBAQNdRpvJJJFnmRTcT2R5Pu/7rr6R5lc96fuAD
         eVx5NATXE0ItDwByY/yIkLFhbvbd4e1HrJ3tXWRu+HvkVvWIOvEkfueyJaxPwCTkMm
         mMRqaV6f2CT8w==
Date: Tue, 24 Aug 2021 09:46:41 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH-perfbook] fix a typo in QQ 10.15
Message-ID: <20210824164641.GD4156@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <1629796607-6214-1-git-send-email-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1629796607-6214-1-git-send-email-zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Cc: perfbook@vger.kernel.org, luyang.co@gmail.com

On Tue, Aug 24, 2021 at 05:16:47PM +0800, Zhouyi Zhou wrote:
> Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> ---
> Hi Paul,
> 
> When I examine the answer to QQ 10.15, I can't find the word "roughly"
> around, so I guess it should be "rough" instead ;-)
> 
> Thanks
> Zhouyi

Right you are, and thank you!  I have queued and pushed your patch with
the usual wordsmithing, so please take a look below.

							Thanx, Paul

------------------------------------------------------------------------

commit 6adb3af174ee4ccacd2d6e83025a06bf50f9aee0
Author: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date:   Tue Aug 24 17:16:47 2021 +0800

    datastruct: Fix a typo in QQ 10.15: s/roughly/rough/
    
    There is no prior "roughly" for alert readers to have noted, so this
    commit changes to that "roughly" to "rough", of which there are prior
    instances.
    
    Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index c3700332..552bd955 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -1696,7 +1696,7 @@ bottleneck.
 	the bottleneck and the larger number of buckets increases this
 	workload's memory footprint.
 
-	The alert reader will have noted the word ``roughly'' above
+	The alert reader will have noted the word ``rough'' above
 	and might be interested in a more detailed analysis.
 	Such readers are invited to run similar benchmarks, using
 	whatever performance counters or hardware-analysis tools
