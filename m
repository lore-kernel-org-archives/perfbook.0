Return-Path: <SRS0=ym4r=Z5=gmail.com=e2lahav@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=0w/Bd03EdG/Mpc/dqC9PUaKiN9Ba2lfL8MgJgnfPVQQ=;
        b=jtagrfrmmvIqH0Ck1PdSHhbP87VWXj3jb8UM2CHwq1RhLNKbIC3ZYhbAa4tiJY7Rw0
         4BP35rnHcP/43RR5X+AWe3eFJ0R6zqyw8vin8l+gAujAeuepqnjGGUN8gaRInCQp2POS
         icX3oI3hzqgis9JITlmsLY4+aDWyhCdyoa6tu8s6BIj18/IaIRmu3eJJeZlzyci/jj6a
         6/Iyke2Olkya3HBsZNRFf9uJt99rjiosUsGD4crKLhOBURFQgtrr4VvSor/lA2pU4GKQ
         tWCECUVgYBhHxYiIBx5/qfUZTTnvRZnnRrtFZ27AMBZRsoI4+t65DVXGFOnQBwteHgfB
         LowQ==
MIME-Version: 1.0
References: <20220925225024.GA549132@paulmck-ThinkPad-P17-Gen-1>
 <69602cd9-49af-7842-db73-53d1f19c2914@gmail.com> <20220926135647.GJ4196@paulmck-ThinkPad-P17-Gen-1>
 <0393d498-03d5-816e-d99c-ee839f825f4e@gmail.com>
In-Reply-To: <0393d498-03d5-816e-d99c-ee839f825f4e@gmail.com>
From: Elad Lahav <e2lahav@gmail.com>
Date: Mon, 26 Sep 2022 19:24:39 -0400
Message-ID: <CAJbg=FXEQfoKMyGK3Cz63eQRDG-Q=TSrHuuOv-JEYdDfx6T7Xg@mail.gmail.com>
Subject: Re: And, at long last, another perfbook release
Content-Type: text/plain; charset="UTF-8"
To: Akira Yokosawa <akiyks@gmail.com>
Cc: paulmck@kernel.org, johann@jklaehn.de, sj38.park@gmail.com, maplewish117@gmail.com, zhouzhouyi@gmail.com, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Unless one of these options bumps me up to a higher royalty tier when
the book becomes a best-seller, I'm fine with any of them.

--Elad

On Mon, 26 Sept 2022 at 10:31, Akira Yokosawa <akiyks@gmail.com> wrote:
>
> On Mon, 26 Sep 2022 06:56:47 -0700, Paul E. McKenney wrote:
> > On Mon, Sep 26, 2022 at 09:05:52PM +0900, Akira Yokosawa wrote:
> >> Hi Paul,
> >>
> >> On Sun, 25 Sep 2022 15:50:24 -0700, Paul E. McKenney wrote:
> >>> Hello!
> >>>
> >>> The new v2022.09.25a release of perfbook is available, and the draft
> >>> announcement is here:  https://paulmck.livejournal.com/68537.html
> >>> Thank you all for your contributions to this release!
> >>>
> >>> Please let me know if changes are needed.
> >>
> >> Not on my contribution, but
> >>
> >>     The code samples now use C11 thread-local storage instead of the
> >>     GCC __thread storage class, courtesy of Elad Lahav.
> >>
> >> IIUC, Elad touched one of many code samples, namely count_end.c.
> >> So the conversion has just started.
> >>
> >> For me, Elad's contribution of adding QNX as a platform for building
> >> code samples looks much more interesting.
> >
> > Both good points, thank you!
> >
> > I updated that paragraph as follows:
> >
> >       One of the code samples now use C11 thread-local storage instead
> >       of the GCC __thread storage class, courtesy of Elad Lahav. Elad
> >       also added support for building code samples on QNX.
> >
> > Does that work better?
>
> Works for me!
>
>         Thanks, Akira
>
> >
> >                                                       Thanx, Paul
> >
> >> Just my 2 cents.
> >>
> >>          Thanks, Akira
> >>
> >>>                                           If I don't hear otherwise, I
> >>> will post this more widely by the end of tomorrow (Monday), Pacific Time.
> >>>
> >>>                                                     Thanx, Paul
