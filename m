Return-Path: <SRS0=7klt=YU=gmail.com=e2lahav@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=GdbdbhoqW60/M9Xw9pA2vKlH7HspjegSuxSuPKvXlN8=;
        b=UTl1R6VAy1OcjuaWKl1qkVQktQjpgb4XFg8SNLca6LihTLOx7rHKmQ+EMEJqyL3m/w
         NGQibzHXTynxGslhvRiLu7hL758sND5YDE5kFhyZwTLp7un/O1bATC620qGPvDLKitte
         ucgNQY+jHfOlpuOAEBFRZv+8p4rOxr+ZSGcsQ1jkqycSLZY/47Xtr1LByyLJHgknQya+
         vniGduuM2BzC7T05JYL922JP6K834zDiTD1tFrCnt6UahnL+UKS9hL/+Vx284a5KVY4/
         il8NP8CsX2majyHIYpsfTQzgfajPG6xhMY/IUj40sGCMPnP+MITccJ3zS4FoBf4rg1jm
         REHg==
MIME-Version: 1.0
References: <20220813114559.2082323-1-e2lahav@gmail.com> <4a072f55-a780-d69b-9a74-a5d5aba63b7a@gmail.com>
 <20220813231240.GM2125313@paulmck-ThinkPad-P17-Gen-1> <CAJbg=FXKFnVwoyvRw=xhjTpkzp7ScGngb8yc9VwwTY7FeYJobw@mail.gmail.com>
 <20220813232901.GP2125313@paulmck-ThinkPad-P17-Gen-1> <b6e578f6-7399-1d0f-a76c-9f3e19ed32c4@gmail.com>
 <20220815035913.GT2125313@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20220815035913.GT2125313@paulmck-ThinkPad-P17-Gen-1>
From: Elad Lahav <e2lahav@gmail.com>
Date: Tue, 16 Aug 2022 19:43:57 -0400
Message-ID: <CAJbg=FVA9g45uA21XL1O1hir0CfuDucaeCvF_uV2iFL8=kOoCA@mail.gmail.com>
Subject: Re: [PATCH] count: Switch from GCC to C11 thread-local storage
Content-Type: text/plain; charset="UTF-8"
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

I also ran the count_end test on Linux/aarch64 on the same board, and
got the same results as on QNX. No surprise there, but the discrepancy
with the x86_64 results on Linux made me want to double-check that the
QNX build is not doing something stupid. I guess that what it shows is
that, Apple's M1 chip notwithstanding, ARM still hasn't closed the gap
when it comes to raw performance. You can always claim that we are
comparing apples and oranges here, but I noticed the same trend on
many different boards.

--Elad

On Sun, 14 Aug 2022 at 23:59, Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Sun, Aug 14, 2022 at 06:11:44AM -0400, Elad Lahav wrote:
> > On 2022-08-13 19:29, Paul E. McKenney wrote:
> > > On Sat, Aug 13, 2022 at 07:23:40PM -0400, Elad Lahav wrote:
> > > > I believe that performance is statistically the same, but I will
> > > > double check. I assume both GCC and C11 end up using the same
> > > > underlying mechanism for thread-local storage:
> > > >
> > > > https://uclibc.org/docs/tls.pdf
> > > >
> > > > If not implemented, TLS falls back on pthread_[gs]et_specific(), but
> > > > again it would be the same for __thread and _Thread_local.
> > >
> > > Sounds likely to me, but I have been surprised before.
> >
> > Results:
> >
> > Linux/x86-64, i7-8550U, GCC TLS
> >
> > elahav@lamia:~/src/other/perfbook/CodeSamples/count$ ./count_end
> > n_reads: 408000  n_updates: 689366000  nreaders: 1  nupdaters: 1 duration:
> > 240
> > ns/read: 588.235  ns/update: 0.348146
> > elahav@lamia:~/src/other/perfbook/CodeSamples/count$ ./count_end
> > n_reads: 443000  n_updates: 762876000  nreaders: 1  nupdaters: 1 duration:
> > 240
> > ns/read: 541.761  ns/update: 0.314599
> > elahav@lamia:~/src/other/perfbook/CodeSamples/count$ ./count_end
> > n_reads: 395000  n_updates: 666718000  nreaders: 1  nupdaters: 1 duration:
> > 240
> > ns/read: 607.595  ns/update: 0.359972
> >
> > Linux/x86-64, i7-8550U, C11 TLS
> >
> > elahav@lamia:~/src/other/perfbook/CodeSamples/count$ ./count_end
> > n_reads: 410000  n_updates: 684880000  nreaders: 1  nupdaters: 1 duration:
> > 240
> > ns/read: 585.366  ns/update: 0.350426
> > elahav@lamia:~/src/other/perfbook/CodeSamples/count$ ./count_end
> > n_reads: 411000  n_updates: 698148000  nreaders: 1  nupdaters: 1 duration:
> > 240
> > ns/read: 583.942  ns/update: 0.343767
> > elahav@lamia:~/src/other/perfbook/CodeSamples/count$ ./count_end
> > n_reads: 409000  n_updates: 704072000  nreaders: 1  nupdaters: 1 duration:
> > 240
> > ns/read: 586.797  ns/update: 0.340874
> >
> > QNX/aarch64, NXP LX2160A, GCC TLS (emulated)
> >
> > elahav@honeycomb:~/src/CodeSamples/count$ ./count_end
> > n_reads: 221000  n_updates: 67876000  nreaders: 1  nupdaters: 1 duration:
> > 240
> > ns/read: 1085.97  ns/update: 3.53586
> > elahav@honeycomb:~/src/CodeSamples/count$ ./count_end
> > n_reads: 227000  n_updates: 67901000  nreaders: 1  nupdaters: 1 duration:
> > 240
> > ns/read: 1057.27  ns/update: 3.53456
> > elahav@honeycomb:~/src/CodeSamples/count$ ./count_end
> > n_reads: 211000  n_updates: 65043000  nreaders: 1  nupdaters: 1 duration:
> > 240
> > ns/read: 1137.44  ns/update: 3.68987
> >
> > QNX/aarch64, NXP LX2160A, C11 TLS (emulated)
> >
> > elahav@honeycomb:~/src/CodeSamples/count$ ./count_end
> > n_reads: 217000  n_updates: 67814000  nreaders: 1  nupdaters: 1 duration:
> > 240
> > ns/read: 1105.99  ns/update: 3.53909
> > elahav@honeycomb:~/src/CodeSamples/count$ ./count_end
> > n_reads: 223000  n_updates: 67860000  nreaders: 1  nupdaters: 1 duration:
> > 240
> > ns/read: 1076.23  ns/update: 3.53669
> > elahav@honeycomb:~/src/CodeSamples/count$ ./count_end
> > n_reads: 218000  n_updates: 68116000  nreaders: 1  nupdaters: 1 duration:
> > 240
> > ns/read: 1100.92  ns/update: 3.5234
> >
> > Looking at the disassembly for the QNX binary I realized that it is still
> > using the emulated TLS option (i.e., the compiler generates a shim layer
> > that uses pthread_[gs]et_specific()). I will need to rebuild the compiler
> > with native TLS support and retest, though I doubt it will have a
> > significant impact.
>
> That would explain the lack of statistical significance.  If there is
> a change, I would hope that the new style is faster.
>
> > In any case, both the native and the emulated TLS options show the same
> > results with the GCC and C11 versions.
>
> Sounds good, and thank you for checking!
>
>                                                         Thanx, Paul
