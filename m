Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231521AbiAYS0X (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 25 Jan 2022 13:26:23 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59CC3C06173B
        for <perfbook@vger.kernel.org>; Tue, 25 Jan 2022 10:26:22 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2AB98B819FD
        for <perfbook@vger.kernel.org>; Tue, 25 Jan 2022 18:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643135179;
        bh=e/oYVHfRIcDbqP2vWZC2v2dpv+AXHJTtbsOW2bfzu2w=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=I52HYJ0GVsVb3e8aim6uyxIoBJumT6RXfdTSUAFS3TnOymgdh8CkvN8FyUNMLiyHg
         rMSSerPlyb1hCutYhVqwMEDUoDxKH/zaes4ffFNqRYJ4f/8vaotIAdSSBAVfDJDs+A
         YXLzL5SJGn0vRYWC4a9/egkOnfKfzT33Dw7J6wHno2M5P9xXpFdGk8yT1GWLRfZz1d
         RN/yeaRcvOUdiTygPYYjizj08+EmBjh5lCIVU3Ani4EWJYtGhBC4C2una0/kd0J7OW
         ygeI+m0q0+7WGK2f+UZ7xrAuCD443PQ3j4MmAZ9YrDyd0Aa6wl8pRfGttQwgJKC7c9
         TMnnW+2dyA5iA==
Date: Tue, 25 Jan 2022 10:26:19 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 0/6] index: Add several major tags
Message-ID: <20220125182619.GO4285@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <5baa07e6-7936-4d3a-d2be-75508899f8ac@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5baa07e6-7936-4d3a-d2be-75508899f8ac@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Jan 25, 2022 at 06:56:27PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> Here are another set of patches WRT indexing.
> 
> Patches 1/6 and 2/6 add indexing tags for major references to
> "NBS", "forward-progress guarantee", "livelock", "starvation",
> and "unfairness".
> 
> Patch 3/6 adds API indexing tags to historic lockless_dereference().
> Patch 4/6 fixes a typo found while preparing Patch 5/6.
> Patch 5/6 adds major and minor tags to "(anti-)heisenbug".
> Patch 6/6 reforms hierarchical indexes under "Memory consistency"
> to those under "Consistency".
> 
> Patch 5/6 needs the \IXalth{}{}{} macro as \IXh{anti-}{heisenbug}
> would put a space between the two arguments in the text.

Good fixes and updates, queued and pushed, thank you!

I suppose that one could argue that one prominent anti-Heisenberg was
none other than Albert Einstein (who was showed up by Niels Bohr).
But you are right.  I really did mean anti-heisenbug.  ;-)

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (6):
>   advsync: Add major indexing tags to 'NBS' and 'forward-progress
>     guarantee'
>   locking: Mark major references to 'livelock', 'starvation", and
>     'unfairness'
>   memorder: Add indexing tags for historic lockless_dereference()
>   debugging: Fix typo (heisenberg -> heisenbug)
>   debugging: Add indexing tags to '(anti-)heisenbug'
>   index: Reform indexing tags related to 'memory consistency'
> 
>  advsync/advsync.tex      | 8 ++++----
>  debugging/debugging.tex  | 7 ++++---
>  future/formalregress.tex | 2 +-
>  glossary.tex             | 6 +++---
>  indexsee.tex             | 7 +++++++
>  locking/locking.tex      | 8 ++++----
>  memorder/memorder.tex    | 8 ++++----
>  together/seqlock.tex     | 3 +--
>  8 files changed, 28 insertions(+), 21 deletions(-)
> 
> 
> base-commit: 641067ba70383ad751512bd02cfc7cec17647523
> -- 
> 2.17.1
> 
