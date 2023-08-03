Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbjHCXon (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 3 Aug 2023 19:44:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B410211E
        for <perfbook@vger.kernel.org>; Thu,  3 Aug 2023 16:44:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 06FA361EEC
        for <perfbook@vger.kernel.org>; Thu,  3 Aug 2023 23:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691106281;
        bh=vQem5uTKq+DSDxpZ9Rv7sxtH7BFfWo0UcVDsG4JIamE=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=aWE3CPa7GoDe0qW7ccJdwXPt6OGNr0sNAALOvfuQ3ERchucW6W0Be3z7RQRRFtcoR
         R0HfpgVJF13JAUaFf7Epq0OQYehMgL8Si1hbRAmTyDqWZAlVZGDxpv2LmSyskGiFu4
         nltil9fCpCZIisBhr0pnxbrubhGCQ3oO5xb2AVUOpIRUreG3+T2ilG/TtqhuX83zyP
         Y1b5k26sEl31ag/zezLqEsyLx694IOZh0X+M3ZURbV1EVRraaaVYgKXBUGGagCMgNf
         IO2pTEHmWJYsGn4glwZMXD0CvIsdyQF48Rjhk0lGNfFf4santu7q9K+fI7SGVoO47T
         iRuN/CBgaUcHA==
Date: Thu, 3 Aug 2023 16:44:40 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 1/5] bib: Use links to lore.kernel.org for LKML
 archive
Message-ID: <2fa659db-1975-47af-83fd-603665600772@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <f0451f2b-bae3-a0b1-6d71-45d434d27b0f@gmail.com>
 <204fd5d9-842a-44cd-96c1-3147c773c999@paulmck-laptop>
 <95eabeb0-0984-69b3-5d4f-61a3c45c7dfd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95eabeb0-0984-69b3-5d4f-61a3c45c7dfd@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Aug 04, 2023 at 08:01:27AM +0900, Akira Yokosawa wrote:
> On Thu, 3 Aug 2023 14:30:15 -0700, Paul E. McKenney wrote:
> > On Fri, Aug 04, 2023 at 12:08:03AM +0900, Akira Yokosawa wrote:
> >> Links to http://lkml.iu.edu/hypermail/, https://lkml.org/lkml,
> >> and https://marc.info have their own ways of indexing mail messages
> >> (not based on message-ids).
> >>
> >> It should be better to use message-id based URLs for forward
> >> compatibility.
> >>
> >> As lore.kernel.org is expected to be stable and reliable going
> >> forward, remove "lastchecked" and "[Viewed MMMM DD, YYYY]" fields
> >> along the way.
> >>
> >> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > 
> > Very nice, and a lot of work, thank you!!!  Queued and pushed.
> 
> By the way, PaulEMcKenney2011WhyIsParallelProgrammingSoHard in
> syncrefs.bib, which is next to PaulEMcKenney2011SeidnerInterview
> Patch 5/5 updated, has the same (broken) URL as
> PaulEMcKenney2011SeidnerInterview.
> 
> Google search of "Tom Dunlap" + "Why Is Parallel Programming So Hard"
> doesn't hit anything interesting.
> 
> Is it OK to remove PaulEMcKenney2011WhyIsParallelProgrammingSoHard ?
> perfbook doesn't cite this one, but in case you have other articles/
> papers which relies on this one ...

Huh.  This was an email interview, apparently involving an email
account to which I no longer have access.  I don't see any citations
to it in any papers I still have lying around, so I removed it.

Good catch, thank you!

						Thanx, Paul
