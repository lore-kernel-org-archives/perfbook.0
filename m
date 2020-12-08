Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:42926 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730339AbgLHUe0 (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 8 Dec 2020 15:34:26 -0500
Date: Tue, 8 Dec 2020 10:43:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607453039;
        bh=Tf1sj71/ZxyN4y3WT5Dtu42mbO/d2ag7iViIOUm6HwQ=;
        h=From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=t0CnqmQuu2ndkwI1LW+ybkiXmxri8Pfwj7YENYbTpO5nIFdW9SXsANmVI3BYNFVyM
         tnaFGyA+MxkWOxNvX4MDWg/9i32Mf+TbZ3CRHT3klKewxE1+G8I2plT4Pb6vQAGZP5
         /vWDvXdTE35MEF6gy/TCBIbw7afp4H/yV6LVuSbI93pXpId4yraLbXsN6MrRD/ImWg
         DlhCWy7IoI6HuPmBQKD6h1yqn+heyzJ43iQknFSZnPLlduLvBuTREzUT1rvzXeNxDn
         QXMGuEUNvHrR0a74BIj2dHoigZnwvBk1KY9JJp9J6r7dYFtUIOqzFb0E1lJ08vt9pX
         6RwyfEeo9JFLw==
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] whymb: Fix description of compiler mischief
Message-ID: <20201208184359.GV2657@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <99ea974f-8788-c2e5-5544-e7e708ad2553@gmail.com>
 <20201203165143.GX1437@paulmck-ThinkPad-P72>
 <CAGfuzXRSrGxkDp=R1m03K4NkxNEq9EvUV8wksdGrxiLBLV2djQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGfuzXRSrGxkDp=R1m03K4NkxNEq9EvUV8wksdGrxiLBLV2djQ@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Motohiro Kanda <kanda.motohiro@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Sat, Dec 05, 2020 at 12:16:57PM +0900, Motohiro Kanda wrote:
> > Motohiro, would you be OK with my mentioning your translation in the
> Sure, my honor!

Very good!

We have you in the FAQ, but it just says that you have started.

What should I change that to?  "N chapters done"?  "Done through
Chapter/Appendix X"?  "Completed"?  Something else?

							Thanx, Paul
