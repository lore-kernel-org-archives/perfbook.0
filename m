Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbiH2QGX (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 29 Aug 2022 12:06:23 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A80D483F0F
        for <perfbook@vger.kernel.org>; Mon, 29 Aug 2022 09:06:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D5C83B81113
        for <perfbook@vger.kernel.org>; Mon, 29 Aug 2022 16:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661789179;
        bh=AflSyJEMAiA37eELT++otzur8mOEVoRQsp7fXe/18go=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Vwf/dLHIwGZ0Q5eVaV3h3ROImalCqsHpGqVNY6UAWjfsn60DzkAgWD9/YTiAjSxoE
         4rKOZeKtfcKSYZhvn6WJiBNZud86wemxxoXvAr2agipP1Ej+2Q8uh8SmyE4xSO7Ugb
         psStq0Jk1YbE5Vg00L2i0slx+kC9w6fAkqpY9dMrR8gDHtt9PT1HykQz22hHY9S9O0
         Cr9EUiWRh9aNe4qTi0zPikhFkHp+YK1qNI19Ec6ohMBWSFmTdrvrQ7zv4VpBZQ50+l
         tVl/2uHtNjIipp1+JWjv0IFIG9EvL3tz9RUKOK/mhsob0N/utcIzkpwqfNKKnjsrxu
         oD8bk5eKo+C6A==
Date: Mon, 29 Aug 2022 09:06:19 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Upgraded temporal/spatial discussion
Message-ID: <20220829160619.GN6159@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220829135533.GA1839874@paulmck-ThinkPad-P17-Gen-1>
 <87ebb1a9-edaa-bd37-7207-61b752417ab0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ebb1a9-edaa-bd37-7207-61b752417ab0@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Aug 30, 2022 at 12:19:43AM +0900, Akira Yokosawa wrote:
> On Mon, 29 Aug 2022 06:55:33 -0700, Paul E. McKenney wrote:
> > Hello, Akira!
> > 
> > In response to your excellent feedback on my attempt to add a lumber
> > analogy to the temporal properties of locking, I have added the
> > following commits:
> > 
> > a7a722ddae4c ("SMPdesign: Work in the spacetime partitioning viewpoint")
> > cb7335f0af79 ("locking: Fold saw-kerf section into existing 7.1.4")
> > 3d14659144cd ("defer/rcuusage: Relate RCU time/space properties to other primitives")
> > 
> Thanks for letting me know.
> 
> > For completeness, the lumber analogy was attempted in these commits:
> > 
> > 16131c2c320c ("locking: Add section describing temporal properties of locks")
> > 8da652f6c958 ("locking: Add labels to saw-kerf diagram")
> > 7f5c537e8a46 ("locking: Wordsmithing")
> > 
> > If these updates look good to you, I will cut a release.
> 
> I'll try to proof-read those commits (hopefully) in a couple of days.

Very good, looking forward to hearing your thoughts!

							Thanx, Paul
