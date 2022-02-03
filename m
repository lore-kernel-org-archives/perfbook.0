Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238196AbiBCXeB (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 3 Feb 2022 18:34:01 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DF61C061714
        for <perfbook@vger.kernel.org>; Thu,  3 Feb 2022 15:34:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BB90A618B0
        for <perfbook@vger.kernel.org>; Thu,  3 Feb 2022 23:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643931240;
        bh=VK87boxqr3YNEfi+jOi3VVZ32mYwrTaePJ7e4YU+Bk0=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=LOb9qi+nHGTW1Uh6cCIs5aRDG8luQAcVcqdFGTcW6kkQx+EVcNbJeFFTbgOPIXkAp
         hseOy66qwHdxmBGVTiUqiV/ghID540gjs+DlRaqugXQeQwZ+0e9MLOz4GUGjs4IXk9
         tSQmymgM+bxRry59UQ2b80tXzXIQgMZ8OJ+smIHrVveX7FtJW/XIbwFStSkehWuY0k
         YKyLYhV1OWtQy9lXFI+g3jGiaXbbedrcMH1YMznrTO9J34L5exviuzEMuKt1HaiNBe
         plvR4O0QC+aH/gW4BXl/8SJML29yTJfw0NS+iO8EnlxbP+1qHazrF8JL+XrLYp3Xia
         kH91rJdGao4Dw==
Date: Thu, 3 Feb 2022 15:34:00 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH-perfbook 4/4] glossary: Use more common definition of RAII
Message-ID: <20220203233400.GU4285@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220201200751.23589-1-johann@jklaehn.de>
 <20220201200751.23589-4-johann@jklaehn.de>
 <20220201203832.GG4285@paulmck-ThinkPad-P17-Gen-1>
 <87o83qi66p.fsf@jklaehn.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87o83qi66p.fsf@jklaehn.de>
List-ID: <perfbook.vger.kernel.org>
To: Johann =?iso-8859-1?Q?Kl=E4hn?= <johann@jklaehn.de>
Cc: perfbook@vger.kernel.org

On Tue, Feb 01, 2022 at 11:16:14PM +0100, Johann Klähn wrote:
> 
> On Tue, Feb 01, 2022 at 12:38 -0800, Paul E. McKenney wrote:
> > I do see older uses of "allocation" rather than "acquisition".
> > Perhaps it changed once RAII locking entered the picture.
> 
> Yes, perhaps because it's as good an explanation for the “A” if one is
> only concerned with memory management?  Apparently the phrase “resource
> acquisition is initialization” (though not the acronym) was proposed as
> early as ~1990: https://www.stroustrup.com/except89.pdf.  Either way,
> “acquisition” seems to have taken over in popularity by now. :-)

I really could not tell you where I first came across RAII.  I did my
one and only professional C++ work in 1990, so about that time.  But I
was not yet much involved in concurrency at that point.  ;-)

> > I took all but the hazptr change.  I am not necessarily opposed to that
> > one, but I did want to check whether you had built and tested it.
> 
> Oh, I forgot to --annotate the patch.  Let me paste my notes here:
> 
> To test the change I added the following assert:
> | assert((hp & 0x1UL) == 0);
> | plist[psize++] = (hazptr_head_t *)hp;
> 
> And then I ran the different modes of hazptr and route_hazptr (although
> only on my ‘spare time reading’ machine, which has a Intel Pentium 4415Y
> with 2 cores/4 threads):
> |./hazptr {2,3} {stress,perf,uperf,rperf}
> |./route_hazptr {--stresstest,--smoketest,--perftest}
> 
> The assertion did not fail.
> 
> However, /also before applying the patch/,
> • to build route_hazptr I had to work around several “multiple
>   definition” linker errors (e.g., for HP in hazptr.h), and
> • the “stress” mode of hazptr printed several fields of the form
>   “2:15”, even though hazptrtorture.h points out that this should
>   only happen for buggy implementations.
> 
> (I can have a closer look at some point.)

I have not gotten to it in the past few days, so please do feel free!

							Thanx, Paul
