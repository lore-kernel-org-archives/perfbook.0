Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:42704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231270AbhFRWzm (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Fri, 18 Jun 2021 18:55:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624056812;
        bh=Ckt7OXWtIBrwEyhOgYk3Ih1D8h4uptuuCgXrbl2kCfk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=UvTQNuurqb2TwiA7SfNCVe2ZCZMbr8r/jAapt9N2PDF0ir3JFqdcF02KS0x0PmCVt
         +vcDaO6ki9IzIF/Y4IR1Mayxe3v9ccSrNfMrWVfyMtangi3EnJbkyJ2i6lyIOlYcxj
         ywGDk2IKreexgzhygPfKBm5pjmxOGfxjTr05u58ilxc6KjWnazcHOIqNzDU9RZOaNX
         vj1Gn/+7aUXnZ2Kxs1aPq/QD2F1KwR5gpiUjT0OOez7Ql7h4DqnrpI2F08EBYo4D0m
         4AURUvxw+Upjjy2I5GT6njVE9pCuruCEl3kzjC/ucMGM2BJDFJjnf6k86pDVnREn2N
         s7ZgaEfNKdWTQ==
Date: Fri, 18 Jun 2021 15:53:31 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] cpu: add conj 'than' to a defective sentence
Message-ID: <20210618225331.GL4397@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <1623989869-17490-1-git-send-email-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1623989869-17490-1-git-send-email-zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Cc: 340442286@qq.com, perfbook@vger.kernel.org, luyang.co@gmail.com

On Fri, Jun 18, 2021 at 12:17:49PM +0800, Zhouyi Zhou wrote:
> Hi Paul,
> 
> I guess '... represents a reasonably large system with no fewer
> 448 hardware threads' is a defective sentence, it needs a conj: 'than'.
> 
> Sorry for bothering you if I am wrong, because my English is not quite
> good :-)
> 
> Thanks
> Zhouyi
> 
> Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com> 

You are quite right, and thank you for spotting this and for sending the
patch!  I wordsmithed the commit log, in part to avoid the age-old debate
as to whether a given use of "than" is a conjunction or a preposition.
You probably had it right, but why take the chance?  ;-)

							Thanx, Paul

------------------------------------------------------------------------

commit 8fc0705251d3409591edfaf62a4373ffcec5794e
Author: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date:   Fri Jun 18 12:17:49 2021 +0800

    cpu: Add 'than' to a defective sentence
    
    The sentence '... represents a reasonably large system with no fewer
    448 hardware threads' is missing a "than".  This commit adds it.
    
    Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/cpu/overheads.tex b/cpu/overheads.tex
index 4aeae6cd..28462d49 100644
--- a/cpu/overheads.tex
+++ b/cpu/overheads.tex
@@ -354,7 +354,7 @@ thousand clock cycles.
 	\cref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
 	on
 	\cpageref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
-	represents a reasonably large system with no fewer 448~hardware
+	represents a reasonably large system with no fewer than 448~hardware
 	threads.
 	Smaller systems often achieve better latency, as may be seen in
 	\cref{tab:cpu:Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System},
