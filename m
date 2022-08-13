Return-Path: <SRS0=E7NT=YR=gmail.com=e2lahav@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=oUiE4YTcndmSU0AjZMOQQy7qhgLUG5tcnkfNhTPBOz8=;
        b=byK1FYpNncKNDpFkMKLIZhXy/dL2Usl0czigkvu+6HuNc3KsTAnEfFIdPiU2p1Tnlu
         Ba/GiBKF7FB0ItmY1ssAxn1cN2xMRbaXpQoPfnD6nL/iV6rpvo+KvV9uMHwtnC7s47ZR
         PV6Ax+r+kai/W5gGYQwjQ/sBW1uuqQSFTF5wXVZyv+FZQrOv18CikyHebzblX6qLi13e
         SelLRIowRdBxK89MxIY8u1hI9uA5Y8zpFMhJWAeE5sg6MEPjyERyl5des6OBfarHKbJY
         ZHM3EnTkIzy38nX0g+y03oa47Kuhd6eSXm+9UVKNS9EgRo2tuWCYROuzQJBlVjnmcPJ2
         /gwA==
MIME-Version: 1.0
References: <20220813114559.2082323-1-e2lahav@gmail.com> <4a072f55-a780-d69b-9a74-a5d5aba63b7a@gmail.com>
 <20220813231240.GM2125313@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20220813231240.GM2125313@paulmck-ThinkPad-P17-Gen-1>
From: Elad Lahav <e2lahav@gmail.com>
Date: Sat, 13 Aug 2022 19:23:40 -0400
Message-ID: <CAJbg=FXKFnVwoyvRw=xhjTpkzp7ScGngb8yc9VwwTY7FeYJobw@mail.gmail.com>
Subject: Re: [PATCH] count: Switch from GCC to C11 thread-local storage
Content-Type: text/plain; charset="UTF-8"
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

I believe that performance is statistically the same, but I will
double check. I assume both GCC and C11 end up using the same
underlying mechanism for thread-local storage:

https://uclibc.org/docs/tls.pdf

If not implemented, TLS falls back on pthread_[gs]et_specific(), but
again it would be the same for __thread and _Thread_local.

I was about to run all benchmarks on a cute 16-core aarch64 machine I
recently bought for testing the scalability of my latest kernel work,
but the code requires linking against urcu, and now I'm going down the
rabbit hole of building that for QNX. Does the counter code really
need this library?

--Elad

On Sat, 13 Aug 2022 at 19:12, Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Sat, Aug 13, 2022 at 07:49:27AM -0400, Elad Lahav wrote:
> > On 2022-08-13 07:45, Elad Lahav wrote:
> > > Signed-off-by: Elad Lahav <e2lahav@gmail.com>
> > > ---
> >
> > This one will probably require some back-and-forth. If we change it here, do
> > other places need to be updated? Have I now removed the explanation of GCC's
> > __thread storage class, which will impact the readability of other sections?
> > Or are you ready to take the plunge and convert all code snippets?
> >
> > For the record, I did build and test count_end.c.
>
> As long as you continue building and testing, checking the descriptions in
> text of the code snippets (in case there is a mention of __thread there),
> and verifying that the PDF still builds, as fast as you are willing to go!
>
> Are you seeing the same performance with the new as with the old on
> your hardware?  (No statistically significant difference on my laptop,
> but figured I should ask.)
>
>                                                         Thanx, Paul
