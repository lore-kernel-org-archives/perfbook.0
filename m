Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:57404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726257AbgLCQwY (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Thu, 3 Dec 2020 11:52:24 -0500
Date: Thu, 3 Dec 2020 08:51:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607014304;
        bh=jxMKHzcG40G1Hflea+fldWiRttGEiEOEZh/U8pUzaq4=;
        h=From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=IHIzi55iwYtauWmMgLzp+lI/xUJMdiihLib5sFYpn8vF0Q2S7HObks9xuabmFa6V4
         niiqd+CO2ONC+/SipahuDNRtJbZ+aV5jnMYTtH4Kv1HcZ5De/ENs72dR/9Lg5BD+kR
         ikW7xqhg9tnl6wJdvdboSkOQbOVjhJb6Lh/p0vrV7VcAS64PnrfpfOePCFFUygHLgr
         F+/052JjyknkaH6w1yXfv514lWKFWTnkA/OY9NJcBejj+/CVpAURNXqDk3xme5njQY
         81t4ZLAzOVrb09DLlmj4Yhvg2jWUalCX8Ft2MVjxQfKX1ko2k9lODRLSIfbvS2Ng79
         SX5ug0jrIJ0lQ==
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] whymb: Fix description of compiler mischief
Message-ID: <20201203165143.GX1437@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <99ea974f-8788-c2e5-5544-e7e708ad2553@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99ea974f-8788-c2e5-5544-e7e708ad2553@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Motohiro Kanda <kanda.motohiro@gmail.com>, perfbook@vger.kernel.org

On Wed, Dec 02, 2020 at 11:50:27PM +0900, Akira Yokosawa wrote:
> >From 89ab8426f9821b6a8bf86e9d4f7eb596e0cfed73 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 2 Dec 2020 07:35:08 +0900
> Subject: [PATCH -perfbook] whymb: Fix description of compiler mischief
> 
> In this code snippet, the assertion can not fire due to different
> reasons.
> When bar() observes b == 1, the smp_mb() assures a == 1.
> When bar() observes b == 0, the while loop will loop forever and
> the assertion can't be reached.
> 
> This was pointed out by Motohiro Kanda in his Japanese translation
> of perfbook [1].
> 
> [1]: https://sites.google.com/site/kandamotohiro/perfbook-d/perfbookappendixf10
> 
> Cc: Motohiro Kanda <kanda.motohiro@gmail.com>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

I took this patch as is, but added a patch on top that (hopefully)
does a better job of explaining the situation.  Thank you both!!!

Would it also help to add a reference to the discussion of control
dependencies?  The straightforward answer given that information is
"control dependencies do not order later loads".

Motohiro, would you be OK with my mentioning your translation in the
next set of release notes for perfbook?  Either way, I much appreciate
your doing this work!

							Thanx, Paul
