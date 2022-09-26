Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbiIZXwz (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 26 Sep 2022 19:52:55 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6485E883EC
        for <perfbook@vger.kernel.org>; Mon, 26 Sep 2022 16:52:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F3D7EB81126
        for <perfbook@vger.kernel.org>; Mon, 26 Sep 2022 23:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664236371;
        bh=H1fDRF9LbBSpspXBoV6A9UztSojs2gJdxiEp0Dqs0b4=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=otA94Yt9bOVyjEGX5m6Ha/I3KBrwwyMv4im+ase3vdb58ZFmehlLok6am1X6cNogw
         r4rwWgAkY7iYqVG12lJC6BpeXHb/ygwnm18gD1rCKZ2jUZLuJuyP38ob3xXvbKERNY
         cyboEPymbkx6EYVwvIzKpEd2ZFQ3xDfL883bPZ2DxTcWjzq2kt8YdCmc6D5ay6yBB2
         AK9Xacd5MtpaeKuTtiYHLP2isjAjp4IHHtO4/E+D1gMrU13DTkRKEkU676BBDnxSE4
         z+uFS9ASek5X2+IAmViQNthYIf7hyqY8N5hFeejLn1WVhU1juj9z7DM6ShOArWH8PD
         gdyyD+rN7CJJQ==
Date: Mon, 26 Sep 2022 16:52:51 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: And, at long last, another perfbook release
Message-ID: <20220926235251.GB4196@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220925225024.GA549132@paulmck-ThinkPad-P17-Gen-1>
 <69602cd9-49af-7842-db73-53d1f19c2914@gmail.com>
 <20220926135647.GJ4196@paulmck-ThinkPad-P17-Gen-1>
 <0393d498-03d5-816e-d99c-ee839f825f4e@gmail.com>
 <CAJbg=FXEQfoKMyGK3Cz63eQRDG-Q=TSrHuuOv-JEYdDfx6T7Xg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJbg=FXEQfoKMyGK3Cz63eQRDG-Q=TSrHuuOv-JEYdDfx6T7Xg@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, johann@jklaehn.de, sj38.park@gmail.com, maplewish117@gmail.com, zhouzhouyi@gmail.com, perfbook@vger.kernel.org

I would be happy to double your percentage, but given that it is a
percentage of zero, this might not make all that much difference.  ;-)

							Thanx, Paul

On Mon, Sep 26, 2022 at 07:24:39PM -0400, Elad Lahav wrote:
> Unless one of these options bumps me up to a higher royalty tier when
> the book becomes a best-seller, I'm fine with any of them.
> 
> --Elad
> 
> On Mon, 26 Sept 2022 at 10:31, Akira Yokosawa <akiyks@gmail.com> wrote:
> >
> > On Mon, 26 Sep 2022 06:56:47 -0700, Paul E. McKenney wrote:
> > > On Mon, Sep 26, 2022 at 09:05:52PM +0900, Akira Yokosawa wrote:
> > >> Hi Paul,
> > >>
> > >> On Sun, 25 Sep 2022 15:50:24 -0700, Paul E. McKenney wrote:
> > >>> Hello!
> > >>>
> > >>> The new v2022.09.25a release of perfbook is available, and the draft
> > >>> announcement is here:  https://paulmck.livejournal.com/68537.html
> > >>> Thank you all for your contributions to this release!
> > >>>
> > >>> Please let me know if changes are needed.
> > >>
> > >> Not on my contribution, but
> > >>
> > >>     The code samples now use C11 thread-local storage instead of the
> > >>     GCC __thread storage class, courtesy of Elad Lahav.
> > >>
> > >> IIUC, Elad touched one of many code samples, namely count_end.c.
> > >> So the conversion has just started.
> > >>
> > >> For me, Elad's contribution of adding QNX as a platform for building
> > >> code samples looks much more interesting.
> > >
> > > Both good points, thank you!
> > >
> > > I updated that paragraph as follows:
> > >
> > >       One of the code samples now use C11 thread-local storage instead
> > >       of the GCC __thread storage class, courtesy of Elad Lahav. Elad
> > >       also added support for building code samples on QNX.
> > >
> > > Does that work better?
> >
> > Works for me!
> >
> >         Thanks, Akira
> >
> > >
> > >                                                       Thanx, Paul
> > >
> > >> Just my 2 cents.
> > >>
> > >>          Thanks, Akira
> > >>
> > >>>                                           If I don't hear otherwise, I
> > >>> will post this more widely by the end of tomorrow (Monday), Pacific Time.
> > >>>
> > >>>                                                     Thanx, Paul
