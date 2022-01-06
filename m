Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241052AbiAFQTr (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 6 Jan 2022 11:19:47 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 301FCC061245
        for <perfbook@vger.kernel.org>; Thu,  6 Jan 2022 08:19:47 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8802361ADE
        for <perfbook@vger.kernel.org>; Thu,  6 Jan 2022 16:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641485985;
        bh=8x8r/pZdf0JgHFX5U3YZxua8Y2Mr1h706zbGvv6nUbw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=SnqTWzTEtSFExOotn5qnRldCBt9w74v05cjAILbaygR7TbKTQnbk7RqfRhxVTJZqb
         S/RmOBpDYJQIUOPCp8uaZb93sTuf0LkYEFCLI9unJ7az54ie7zCGcL33Z35IBeiVlw
         /xoe4f2XlxJ/e36rQUwuHIAEqAaXLyzs4F+5Y/bI8OTEHDSsi6EzZwJEcPFP0COL9S
         pE77hete9zkkUrbQe9NErhzFAWmJzdg5hxuG0KUBjAwYP1dKbv0g1WdpCMTKsXJRjz
         5d7SYs81z06sMqINJLvR2aQxGY0a9s0kT5TdbpxS3cum3W2BFgPHFh79uSBP2orPaZ
         OOw/ADKt6/FSA==
Date: Thu, 6 Jan 2022 08:19:45 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH RESEND -perfbook 00/10] Index and acronym updates
Message-ID: <20220106161945.GK4202@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <d61bf71a-d3ed-1561-62ee-15d4537443da@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d61bf71a-d3ed-1561-62ee-15d4537443da@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Jan 06, 2022 at 04:29:25PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> This is another round of *never-ending* indexing updates.

Maintaining indexes is non-trivial, no two ways about it!

So special thanks for this series!

At some point, for the index entries with lots of references, it may
be necesary to flag the most important references.  I sometimes see
such entries italicized or marked with "ff", though I freely confess
that I have no idea what the rationale for "ff" might be.

We are probably not yet to the point where this matters, though.

> Patches 1/10--3/10 add indexing tags to terms recently added in Glossary.
> Patch 4/10 adds API indexing tags in rcuapi.
> Patch 5/10 fixes a typo found while working on Patch 4/10.
> 
> Patch 6/10 adds indexing tags for userspace-RCU APIs in datastruct.
> Those APIs are also used in code snippets of other chapters, but are
> seldom mentioned from the text in later chapters/sections.
> 
> Patches 7/10 and 8/10 add API indexing tags in count and locking.
> Patch 9/10 defines acronym of QSBR and adds tags for QSBR and EBR.
> 
> Patch 10/10 defines acronym of RAII and adds its tags.  The "WIP" in
> the title indicates changes in the appearance of first-time form from
> quoted string to emphasized modifier form.  Please keep it with the change
> log amended if the new appearance looks good/acceptable to you.

I kept 10/10, removing the "WIP" on the second try.  ;-)

Queued and pushed, and again, thank you!

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (10):
>   index: Add tags for 'reference count'
>   index: Add tags for 'existence guarantee'
>   index: Add tags for 'type-safe memory'
>   defer/rcuapi: Add index tags for RCU APIs
>   defer/rcuapi: Fix typo 'get_nulls_values()'
>   datastruct: Add index tags for userspace-RCU APIs
>   count: Add index tags to APIs
>   locking: Add index tags to APIs
>   treewide: Add acronym tags for QSBR and EBR
>   WIP locking: Add acronym tag for RAII
> 
>  SMPdesign/SMPdesign.tex       |   4 +-
>  appendix/toyrcu/toyrcu.tex    |   3 +-
>  count/count.tex               |  16 ++---
>  datastruct/datastruct.tex     |  14 ++--
>  defer/rcuapi.tex              | 120 +++++++++++++++++-----------------
>  defer/rcuintro.tex            |   3 +-
>  defer/rcurelated.tex          |   4 +-
>  defer/rcuusage.tex            |  11 ++--
>  defer/refcnt.tex              |   3 +-
>  defer/whichtochoose.tex       |   9 ++-
>  future/tm.tex                 |   3 +-
>  glsdict.tex                   |   2 +
>  locking/locking-existence.tex |   2 +-
>  locking/locking.tex           |  20 +++---
>  memorder/memorder.tex         |   2 +-
>  together/applyrcu.tex         |   2 +-
>  together/refcnt.tex           |   8 ++-
>  toolsoftrade/toolsoftrade.tex |   4 +-
>  18 files changed, 118 insertions(+), 112 deletions(-)
> 
> 
> base-commit: 3cc2d7eede268930304b35fdce6121e18b2ceef6
> -- 
> 2.17.1
> 
