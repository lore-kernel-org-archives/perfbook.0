Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbiHPXzK (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 16 Aug 2022 19:55:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B727F857FF
        for <perfbook@vger.kernel.org>; Tue, 16 Aug 2022 16:55:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 50CFF612B9
        for <perfbook@vger.kernel.org>; Tue, 16 Aug 2022 23:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660694108;
        bh=ci9ZJGAlBcyJStOJi9AAK2XFW/o8AfTGMYbXp5g12wI=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Snka6Jf2h+iYu4Hlg31omdsZjAv7nDsn1Gm1/P8Or/A3O20zlf8wmkGoX63hSm+TE
         iVSgD7/Z6MOmQTsqSz+UIAXgghZhwGG51nrmszo/F4DuxXgNkJI7HTcbt9gczAHkxl
         K9NpKyldfouIM1QHgLa+uX8z0o7B56yBnKE8PoLZmTCUYrTNUqCbDX4U5XjDxg3lVx
         Dv6aBPvjk7NCJ9xqmwjpOqWXVM/oEnIK+K2j47n4sxChIwYlV37RVDMpl2A/PrwLSW
         mDEB0h8HcudnR/NBu5HaxYyGu20szztMuymhGwPU3IuzBlfluv+fgiy0WQ4LpVzRUz
         zM4PtOcCbCxWg==
Date: Tue, 16 Aug 2022 16:55:08 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] count: Switch from GCC to C11 thread-local storage
Message-ID: <20220816235508.GH2125313@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220813114559.2082323-1-e2lahav@gmail.com>
 <4a072f55-a780-d69b-9a74-a5d5aba63b7a@gmail.com>
 <20220813231240.GM2125313@paulmck-ThinkPad-P17-Gen-1>
 <CAJbg=FXKFnVwoyvRw=xhjTpkzp7ScGngb8yc9VwwTY7FeYJobw@mail.gmail.com>
 <20220813232901.GP2125313@paulmck-ThinkPad-P17-Gen-1>
 <b6e578f6-7399-1d0f-a76c-9f3e19ed32c4@gmail.com>
 <20220815035913.GT2125313@paulmck-ThinkPad-P17-Gen-1>
 <CAJbg=FVA9g45uA21XL1O1hir0CfuDucaeCvF_uV2iFL8=kOoCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJbg=FVA9g45uA21XL1O1hir0CfuDucaeCvF_uV2iFL8=kOoCA@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org

I am not all that worried about it, mostly curious.

get_timestamp() isn't used all that heavily, and it seems plausible that
a 40-nanosecond timestamp would work in rcu_ts.[ch].

Fun times, though!

							Thanx, Paul

On Tue, Aug 16, 2022 at 07:43:57PM -0400, Elad Lahav wrote:
> I also ran the count_end test on Linux/aarch64 on the same board, and
> got the same results as on QNX. No surprise there, but the discrepancy
> with the x86_64 results on Linux made me want to double-check that the
> QNX build is not doing something stupid. I guess that what it shows is
> that, Apple's M1 chip notwithstanding, ARM still hasn't closed the gap
> when it comes to raw performance. You can always claim that we are
> comparing apples and oranges here, but I noticed the same trend on
> many different boards.
> 
> --Elad
> 
> On Sun, 14 Aug 2022 at 23:59, Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > On Sun, Aug 14, 2022 at 06:11:44AM -0400, Elad Lahav wrote:
> > > On 2022-08-13 19:29, Paul E. McKenney wrote:
> > > > On Sat, Aug 13, 2022 at 07:23:40PM -0400, Elad Lahav wrote:
> > > > > I believe that performance is statistically the same, but I will
> > > > > double check. I assume both GCC and C11 end up using the same
> > > > > underlying mechanism for thread-local storage:
> > > > >
> > > > > https://uclibc.org/docs/tls.pdf
> > > > >
> > > > > If not implemented, TLS falls back on pthread_[gs]et_specific(), but
> > > > > again it would be the same for __thread and _Thread_local.
> > > >
> > > > Sounds likely to me, but I have been surprised before.
> > >
> > > Results:
> > >
> > > Linux/x86-64, i7-8550U, GCC TLS
> > >
> > > elahav@lamia:~/src/other/perfbook/CodeSamples/count$ ./count_end
> > > n_reads: 408000  n_updates: 689366000  nreaders: 1  nupdaters: 1 duration:
> > > 240
> > > ns/read: 588.235  ns/update: 0.348146
> > > elahav@lamia:~/src/other/perfbook/CodeSamples/count$ ./count_end
> > > n_reads: 443000  n_updates: 762876000  nreaders: 1  nupdaters: 1 duration:
> > > 240
> > > ns/read: 541.761  ns/update: 0.314599
> > > elahav@lamia:~/src/other/perfbook/CodeSamples/count$ ./count_end
> > > n_reads: 395000  n_updates: 666718000  nreaders: 1  nupdaters: 1 duration:
> > > 240
> > > ns/read: 607.595  ns/update: 0.359972
> > >
> > > Linux/x86-64, i7-8550U, C11 TLS
> > >
> > > elahav@lamia:~/src/other/perfbook/CodeSamples/count$ ./count_end
> > > n_reads: 410000  n_updates: 684880000  nreaders: 1  nupdaters: 1 duration:
> > > 240
> > > ns/read: 585.366  ns/update: 0.350426
> > > elahav@lamia:~/src/other/perfbook/CodeSamples/count$ ./count_end
> > > n_reads: 411000  n_updates: 698148000  nreaders: 1  nupdaters: 1 duration:
> > > 240
> > > ns/read: 583.942  ns/update: 0.343767
> > > elahav@lamia:~/src/other/perfbook/CodeSamples/count$ ./count_end
> > > n_reads: 409000  n_updates: 704072000  nreaders: 1  nupdaters: 1 duration:
> > > 240
> > > ns/read: 586.797  ns/update: 0.340874
> > >
> > > QNX/aarch64, NXP LX2160A, GCC TLS (emulated)
> > >
> > > elahav@honeycomb:~/src/CodeSamples/count$ ./count_end
> > > n_reads: 221000  n_updates: 67876000  nreaders: 1  nupdaters: 1 duration:
> > > 240
> > > ns/read: 1085.97  ns/update: 3.53586
> > > elahav@honeycomb:~/src/CodeSamples/count$ ./count_end
> > > n_reads: 227000  n_updates: 67901000  nreaders: 1  nupdaters: 1 duration:
> > > 240
> > > ns/read: 1057.27  ns/update: 3.53456
> > > elahav@honeycomb:~/src/CodeSamples/count$ ./count_end
> > > n_reads: 211000  n_updates: 65043000  nreaders: 1  nupdaters: 1 duration:
> > > 240
> > > ns/read: 1137.44  ns/update: 3.68987
> > >
> > > QNX/aarch64, NXP LX2160A, C11 TLS (emulated)
> > >
> > > elahav@honeycomb:~/src/CodeSamples/count$ ./count_end
> > > n_reads: 217000  n_updates: 67814000  nreaders: 1  nupdaters: 1 duration:
> > > 240
> > > ns/read: 1105.99  ns/update: 3.53909
> > > elahav@honeycomb:~/src/CodeSamples/count$ ./count_end
> > > n_reads: 223000  n_updates: 67860000  nreaders: 1  nupdaters: 1 duration:
> > > 240
> > > ns/read: 1076.23  ns/update: 3.53669
> > > elahav@honeycomb:~/src/CodeSamples/count$ ./count_end
> > > n_reads: 218000  n_updates: 68116000  nreaders: 1  nupdaters: 1 duration:
> > > 240
> > > ns/read: 1100.92  ns/update: 3.5234
> > >
> > > Looking at the disassembly for the QNX binary I realized that it is still
> > > using the emulated TLS option (i.e., the compiler generates a shim layer
> > > that uses pthread_[gs]et_specific()). I will need to rebuild the compiler
> > > with native TLS support and retest, though I doubt it will have a
> > > significant impact.
> >
> > That would explain the lack of statistical significance.  If there is
> > a change, I would hope that the new style is faster.
> >
> > > In any case, both the native and the emulated TLS options show the same
> > > results with the GCC and C11 versions.
> >
> > Sounds good, and thank you for checking!
> >
> >                                                         Thanx, Paul
