Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiLHAR2 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 7 Dec 2022 19:17:28 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ADA98C47F
        for <perfbook@vger.kernel.org>; Wed,  7 Dec 2022 16:17:28 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 00D2261D04
        for <perfbook@vger.kernel.org>; Thu,  8 Dec 2022 00:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670458647;
        bh=0kSCOkRIj+EUbABV6dNAewWb0GcZtb5xW+CDvX1vlOU=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=CFg2jSHQ4i8XC4PjR9h80IJQWGX3Rq04b+8LyrRq+XqKdCJlO/FXBnUXA5QExCyni
         XQ6Ldr+TB7ACyVqiddcUVGscZouCFLpXCegyifvHs4iPI1F1ub8CwTlIJHb8gpvzcC
         jmcc8cMct2xbRgxcwQMQG1XJy4Hv2muSf9LjDjaG1lpvtUJby71KLAA8w+ptU12N5C
         ejHaT/gs+DzGQ0+sL6M8xSmZKv5SmGwJpdRrXoUmObZ11+SqpRJDyEeGHEL9rCYHeW
         ZuvWi/kt4ZS5bPKdKvAGL/BPrgzavOzJ24vWkpsbSDL6Hi/vmll94KD/Qo/8uFkyni
         bx+2MBkdRewAw==
Date: Wed, 7 Dec 2022 16:17:26 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: LaTeX package lineno v5.0 doesn't work with perfbook
Message-ID: <20221208001726.GL4001@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <939b8f77-8d8d-bdc0-0a98-585b88f23481@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <939b8f77-8d8d-bdc0-0a98-585b88f23481@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "perfbook@vger.kernel.org" <perfbook@vger.kernel.org>

On Thu, Dec 08, 2022 at 08:13:11AM +0900, Akira Yokosawa wrote:
> Hi all,
> 
> After updating of lineno to v5.0 released on 2022/12/06,
> I'm observing fatal error in building perfbook.
> 
> If you are using vanilla TeX Live 2022, please stay with v4.41
> (released way back on 2005/11/02!) for the moment.

Thank you for letting us know!

							Thanx, Paul
