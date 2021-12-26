Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234729AbhLZW5W (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 26 Dec 2021 17:57:22 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5058C06173E
        for <perfbook@vger.kernel.org>; Sun, 26 Dec 2021 14:57:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3E83EB80DE1
        for <perfbook@vger.kernel.org>; Sun, 26 Dec 2021 22:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640559438;
        bh=0vIFrDN0tai7Wm/R8GZexTPLfFe8PyquQk6Ix1RPmhc=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=JgXIwATR3iCzqdRjFLNLQtBn0LhuLumxhHGuJa3uA7W8cvHWcnJudQPk6wFL0K2Wi
         PBTEi9S4gya5/koqg2nlxjSJy7HUmJuwKyfT2AuevTFfF74S8XZfyock+VuP9dJGRn
         puOe/LUcGeXGH2GqaGgorDt4hLaA+DFJomFaRU9p0KuVn+M/LRbdoRRADzZtbzQejH
         /OGlLFHSAyxhF9v3MoGWlCqoHVvPiTtLy5SK7rn/wjt28YkWo0M065psGT/JMmDDFV
         2vawYvJgBlpI0Nldj2Hk3ww3j8LE3bxNs1TefN4ZuPQ9feEthBnaUh5O3vdutOpHNL
         2RCXpuDYrE27w==
Date: Sun, 26 Dec 2021 14:57:18 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Draft blog post on v2021.12.21a release of perfbook
Message-ID: <20211226225718.GU4109570@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20211224205309.GA1015523@paulmck-ThinkPad-P17-Gen-1>
 <a120d22c-50e4-c74d-8968-81744ad99c2e@gmail.com>
 <20211225080347.GS4109570@paulmck-ThinkPad-P17-Gen-1>
 <CAJbg=FX6ePhvs9Vx0fy=WQkyT8TAa-WWFprDzwDzzRrMJc3dQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJbg=FX6ePhvs9Vx0fy=WQkyT8TAa-WWFprDzwDzzRrMJc3dQg@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org, sj38.park@gmail.com, bsingharora@gmail.com, shiyn.lin@gmail.com, luyang.co@gmail.com, Zhouyi Zhou <zhouzhouyi@gmail.com>, pat.github@tullmann.org

On Sun, Dec 26, 2021 at 11:32:28AM -0500, Elad Lahav wrote:
> FYI, the ebook-sized PDF renders perfectly on my Kobo. Kudos to
> everyone who contributed to this edition.

Glad that it worked for you, and thank you for trying it out!!!

I have updated .../perfbook.html to make this point with fewer
weasel words.  ;-)

							Thanx, Paul

> --Elad
> 
> On Sat, 25 Dec 2021 at 03:03, Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > On Sat, Dec 25, 2021 at 09:40:01AM +0900, Akira Yokosawa wrote:
> > > Hi Paul,
> > >
> > > On Fri, 24 Dec 2021 12:53:09 -0800, Paul E. McKenney wrote:
> > > > Hello!
> > > >
> > > > I have drafted a blog post for the new release here:
> > > > https://paulmck.livejournal.com/66892.html
> > > >
> > > > I have also added the epub build to the landing pages:
> > > > https://mirrors.edge.kernel.org/pub/linux/kernel/people/paulmck/perfbook/perfbook.html
> > >
> > > Well, it's not epub as (ebook-size PDF) != EPUB.
> >
> > Good catch!  I changed from "epub format" to "ebook-sized PDF".
> >
> > Better?
> >
> > > Also, there remains the old remark on "horrible results" of such builds.
> > > I think there are still rooms to improve, but it looks mostly reasonable now.
> >
> > I had forgotten about that, and just now reworked it.  Thank you for
> > the reminder, and please let me know if additional adjustments would
> > be helpful.
> >
> >                                                         Thanx, Paul
> >
> > >         Thanks, Akira
> > >
> > > >
> > > > Finally, I updated the Arxiv version at https://arxiv.org/abs/1701.00854.
> > > > This is in "submitted" state, and may take a day or three to become visible.
> > > >
> > > > In the meantime, please let me know of any errors or omissions!
> > > >
> > > > I will post to my personal social media in a few days.
> > > >
> > > >                                                     Thanx, Paul
> > > >
