Return-Path: <perfbook-owner@vger.kernel.org>
Received: from ams.source.kernel.org ([145.40.68.75]:42936 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237032AbiANS6c (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 14 Jan 2022 13:58:32 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4F0B0B82A09
        for <perfbook@vger.kernel.org>; Fri, 14 Jan 2022 18:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642186710;
        bh=yc6qAGea5wWQedSqQ1tU1VUHxdS+R4I9WOjI2Mpgyi4=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=KQwtBHKGHt0bgfrdPIYIKLj1t34R+Syv3lU9J9TfUWT4Psn/K7VivwR5cuQuVs3XI
         Wtt6gD6jrKWLEQSaH9z550C58CoCrhMMjZo86JRG0NDRoFLnz44i+nrUBKVvR+1tVx
         diYL6z+cFyTVxPhXZVvB6OTcSZAZH1c8rSmrS7oAPvue13pQ73GStwigNfkBsPCkHA
         t1TjXaQ/hYfvVLsVX3PCcMr1dXfTIj4R5pXoyhc3TjDTrepBaptZrhWNR4M5tTHnPp
         m3d+S0Bynht/oRfVCmKCj9EJ2UCsRe4pRkJPr9pvgXuuzNc+uuMGsBATJBfcjAVmiu
         tkIAdxJXCoPtQ==
Date: Fri, 14 Jan 2022 10:58:29 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH-perfbook v2] RFC: bibliography: make a reference item
 better
Message-ID: <20220114185829.GX947480@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220113034336.64794-1-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220113034336.64794-1-zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Cc: akiyks@gmail.com, luyang.co@gmail.com, perfbook@vger.kernel.org

On Thu, Jan 13, 2022 at 11:43:36AM +0800, Zhouyi Zhou wrote:
> I can't find "Trinity: A system call fuzzer" in Proceedings of the 13th
> Ottawa Linux Symposium, with link below
> https://www.kernel.org/doc/mirror/ols2011.pdf
> 
> While I do find the author's presentation in youtube, with link below
> https://www.youtube.com/watch?v=o_2jwfsPh0Y
> 
> According to above observations, I try to make the reference item better
> 
> Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> ---
> Hi Paul and Akira
> 
> I can't find "Trinity: A system call fuzzer" in Proceedings of the 13th
> Ottawa Linux Symposium, with link below
> https://www.kernel.org/doc/mirror/ols2011.pdf
> 
> While I can find the author's presentation in youtube, with link below
> https://www.youtube.com/watch?v=o_2jwfsPh0Y
> 
> According to above observations, I try to make the reference item better

Good catch, thank you!

I had to hand-apply this, possibly due to some other recent changes.
Also maybe because I failed to give "git am" the "-3" argument.

Hear is what I came up with, could you please check it?

I left out the URL of the PDF because as you say it does not contain
a Trinity paper, and also the YouTube URL because it has very noisy
audio.

							Thanx, Paul

------------------------------------------------------------------------

commit bf4794df366d2cf87c2e9cf177f5169081138a23
Author: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date:   Fri Jan 14 10:51:56 2022 -0800

    bib/swtools: Fix DaveJones2011Trinity bibliography entry
    
    It appears that Dave Jones did not write a paper for OLS'2011,
    confining himself to a presentation.  This commit updates the
    bibliography entry accordingly.
    
    Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/bib/swtools.bib b/bib/swtools.bib
index 5bd7e197..31ce0025 100644
--- a/bib/swtools.bib
+++ b/bib/swtools.bib
@@ -517,10 +517,9 @@ Architectural Support for Programming Languages and Operating Systems
 @Conference{DaveJones2011Trinity,
  author = "Dave Jones",
  title = "Trinity: A system call fuzzer",
- booktitle = {Proceedings of the 13\textsuperscript{th} Ottawa Linux Symposium},
+ booktitle = {13\textsuperscript{th} Ottawa Linux Symposium},
  month = {June},
  year = {2011},
- pages = {???--???},
  address = {Ottawa, Canada},
  note={Project repository: \url{https://github.com/kernelslacker/trinity}},
 }
