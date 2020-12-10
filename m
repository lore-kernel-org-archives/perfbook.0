Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:46900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726263AbgLJBaC (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Wed, 9 Dec 2020 20:30:02 -0500
Date: Wed, 9 Dec 2020 17:29:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607563761;
        bh=UKk926jko9UvTnTtTUUfICkWygpsRdFbxhiqXwQ25eg=;
        h=From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=YM8xXjfrf7vQAXKqQkC5dpLJaprJ8DpPyzK1wjU4eqWZASxH7LlY2k8gjQZrHTCNo
         0WNUQXKU7a8HJuQYSFgMmynGPcsKTABwu2QAwmmHXc7g52ivxnOU5V2kNVYkk5ZBOE
         gZ2w5dYCJwaiX3j5XD6M1j7gQGAFjZN2Ft9WX2lT/HI8lLqRVBpi9R3ObZG1bpXEfS
         hdAnsUHQ44eCfmegqdX6y3JzK27AXDepXsxWF6FqKIm33rX4w6dkvXfEKMnLOZ796e
         uG2uuFI5MR7xcT+XCsl75LGTbgzv10hHf5i898K+pU27P9ig34u57AuL4jDALXti1U
         RtZnUuLMQvqxg==
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] whymb: Fix description of compiler mischief
Message-ID: <20201210012920.GQ2657@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <99ea974f-8788-c2e5-5544-e7e708ad2553@gmail.com>
 <20201203165143.GX1437@paulmck-ThinkPad-P72>
 <CAGfuzXRSrGxkDp=R1m03K4NkxNEq9EvUV8wksdGrxiLBLV2djQ@mail.gmail.com>
 <20201208184359.GV2657@paulmck-ThinkPad-P72>
 <CAGfuzXR6-aeXeB5dzJBOXj2fSUaLE_2w_N2T-+GLdCQEWc7aNA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGfuzXR6-aeXeB5dzJBOXj2fSUaLE_2w_N2T-+GLdCQEWc7aNA@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Motohiro Kanda <kanda.motohiro@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Wed, Dec 09, 2020 at 03:17:13PM +0900, Motohiro Kanda wrote:
> Paul,
> 
> Will you change the FAQ.txt in following way?
> 
> >        Motohiro Kanda has started work on a Japanese translation:
> >        https://sites.google.com/site/kandamotohiro/perfbook
> 
> to,
> quote:
> 
> Motohiro Kanda publishes a Japanese translation of most chapters:
> 
> https://sites.google.com/view/kandamotohiro2/perfbook
> 
> This one is based on 2014 edition and contains topics including
> "Parallel Real-Time Computing", "Axiomatic Approaches" from later
> editions.
> 
> end quote
> 
> Some background:
> 
> Due to Google classic site deprecation policy, I have moved all of my
> contents from
> sites.google.com/site/kandamotohiro
> to sites.google.com/view/kandamotohiro2.
> 
> https://sites.google.com/site/kandamotohiro/perfbook will be gone on
> September 2021.
> 
> I have translated chapter 1 to 16 and appendix A to D and F. All from
> 2014 first printed edition.
> I loved "Parallel Real-Time Computing" chapter in 2015 edition and
> "Axiomatic Approaches" section in 2017 edition and added their
> translation as well.
> 
> But I do not have energy to keep up with the speed and volume of latest changes.
> So, my translation is published as-is, based on old 2014 edition.
> 
> You can change wordings of my FAQ.txt change proposal as you like.
> Thanks.

How about like this?  Please let me know of any errors or omission
so that I can fix them.

							Thanx, Paul

------------------------------------------------------------------------

commit a80871756cccbaba8678b7f762794dd56d697de9
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Wed Dec 9 17:27:37 2020 -0800

    FAQ: Update information on Motohiro Kanda's Japanese translation
    
    Reported-by: Akira Yokosawa <akiyks@gmail.com>
    Reported-by: Motohiro Kanda <kanda.motohiro@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/FAQ.txt b/FAQ.txt
index a284615..45e30c3 100644
--- a/FAQ.txt
+++ b/FAQ.txt
@@ -128,9 +128,12 @@
 
 		http://kernel.org/pub/linux/kernel/people/paulmck/perfbook/perfbook-cn.2011.10.18a.pdf
 
-		Motohiro Kanda has started work on a Japanese translation:
+		Motohiro Kanda has a Japanese translation of Chapters 1-16
+		and Appendices A-D and F based on the 2014 print edition,
+		but with the "Parallel Real-Time Computing" and "Axiomatic
+		Approaches" sections taken from later editions:
 
-		https://sites.google.com/site/kandamotohiro/perfbook
+		https://sites.google.com/view/kandamotohiro2/perfbook
 
 		SeongJae Park has started work on a Korean translation:
 
