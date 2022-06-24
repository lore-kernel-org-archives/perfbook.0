Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbiFXXdU (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 24 Jun 2022 19:33:20 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 038A939B8E
        for <perfbook@vger.kernel.org>; Fri, 24 Jun 2022 16:33:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AD510B82D01
        for <perfbook@vger.kernel.org>; Fri, 24 Jun 2022 23:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656113597;
        bh=h9gFRGjSsvUYp7sM8vtIEWs3gspZILno2pfG/6DqPj0=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=nASNaqshW5O0e0roKx4vzmxLpMClbnY9DiK4E2b65uir5i7IKlpts8iIQkOa00JaX
         ua1hXfwzJR0ANcem85ci2xRVMuJ0UxXfBX0FEHRMuEAQkLKSDqxASBturixP5X3kL0
         ir24R1P7n2PV79jz39ZU/SXZ/6uN0Wrsv9jzrBZMQVmnt1x8jEaDAdDmMNk2fYkcy0
         K02gLwjQzqo01mYLL483YOko53gn1d0D50pZQBqYVnn961Ejy35cPgcl1z9wsHAFQI
         fp5z3j2QsSOjfMs2bIZd6r4LoBDeF9F0BdGCbSgJ8VFsnl8IAH4KzvU6dsdpAyxCcg
         bgLiCzyHavHnw==
Date: Fri, 24 Jun 2022 16:33:16 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [perfbook] Analogy of =?utf-8?Q?Figure?=
 =?utf-8?B?IDcuMTEgTG9ja2luZyDigJxTYXcgS2VyZuKAnQ==?=
Message-ID: <20220624233316.GF1790663@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <202dbad7-37db-4d6a-f4d4-6d99180028fc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202dbad7-37db-4d6a-f4d4-6d99180028fc@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Jun 25, 2022 at 08:12:09AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> I find the analogy of Figure 7.11 hard to grasp.
> 
> Whether a lock is global or per-instance, the cost of locking
> (saw kerf) is observed only when a CPU/thread does the locking
> operation.
> 
> In this figure, does each board represent data elements, not a
> CPU/thread?  If this is the case, what does the waste of "saw kerf"
> mean?
> 
> What am I missing?
> 
> (I hope I am clear enough on what I don't get...)

It might well be that I am getting too excited about this one.  ;-)

Maybe I need to drop it.  At the very least, I need to much more clearly
explain it.

But...

Each board represents one lock.  The "saw kerf" is the time lost when
releasing that lock and someone else immediately acquiring it.

Does that help?

							Thanx, Paul
