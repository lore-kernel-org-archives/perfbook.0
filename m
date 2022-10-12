Return-Path: <SRS0=gFZX=2N=gmail.com=pyxchina92929@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ngfR3YfbnpNHbJk0+nFnfet2JrauNMzhEq6aw8d2K9M=;
        b=GpadhmD5wyR9ccaye0K+/FVf/RIo3UJ7MPjPafxwHDmEiKTDphG0leh87Xwgj+DNSf
         O5GOeN10lfxBH6h+fnDKyLIWAfIq4yxbjJzphh4oTJxRzKP7ypmLi2FRepuiQH5MCw1T
         HGmzGNVyY4xHhy4ce2/6BJhQANsxsdhqMKvjHFXTYXF1EDe99of4NASR9Lnkj+Gbqz9o
         Btm7DuuCTAj7aq8nKiExix0WZsgSU3o5TxhVGThmlHEkGHdO9nyV8b4SAcy1lObNgg2s
         0b6CoEwj8L2IEC+W9ITdQmgjk3M5VCUPqtEjXo6IqqmS7WSx6D69Lr1SyKNBDhri8ZhR
         kj/Q==
MIME-Version: 1.0
References: <CANJ3EgF8SzbAy8Wd7JANT20DCMtC7U3Z6Pzix3z9zJ-A3hYn+Q@mail.gmail.com>
 <20221011090208.GF4221@paulmck-ThinkPad-P17-Gen-1> <599125ce-4fd9-b8dc-8628-197f90513c77@gmail.com>
 <20221012073015.GR4221@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20221012073015.GR4221@paulmck-ThinkPad-P17-Gen-1>
From: Patrick Yingxi Pan <pyxchina92929@gmail.com>
Date: Wed, 12 Oct 2022 16:02:43 +0800
Message-ID: <CANJ3EgE2Kb1qwQk6qK1tT5K6Oka7se_JyFkMzE_FSWeurJfBRg@mail.gmail.com>
Subject: Re: [PATCH] memorder.tex: correct the transformed code by compiler.
Content-Type: text/plain; charset="UTF-8"
To: paulmck@kernel.org
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Thank you Paul and Akira!

Hmm, it seems that I successfully witnessed a force push onto an open
repository. ;-p

                         Thanx, Patrick

On Wed, Oct 12, 2022 at 3:30 PM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Wed, Oct 12, 2022 at 12:19:04PM +0900, Akira Yokosawa wrote:
> > On Tue, 11 Oct 2022 02:02:08 -0700, Paul E. McKenney wrote:
> > > On Tue, Oct 11, 2022 at 11:20:49AM +0800, Patrick Yingxi Pan wrote:
> > >> Hello!
> > >>
> > >> I have added the missing READ_ONCE(). Please take a look. Thanks.
> > >>
> > >> Signed-off-by: Patrick Pan <pyxchina92929@gmail.com>
> > >
> > > Queued and pushed, thank you!
> >
> > Paul, somehow Patrick's S-o-b tag is lost in the amended changelog of
> > commit 520ad603b0f3 ("memorder: Correct the transformed Listing 15.30
> > code").
> >
> > I don't think it is mandatory in perfbook, but if you can, please fix
> > up.
>
> Gah!  Thank you for catching this, fixed.
>
>                                                         Thanx, Paul
>
> > >> ---
> > >>  memorder/memorder.tex | 2 +-
> > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> > >> index a0a87d0a..50ff2882 100644
> > >> --- a/memorder/memorder.tex
> > >> +++ b/memorder/memorder.tex
> > >> @@ -2869,7 +2869,7 @@ An equals comparison on \clnref{equ} might lead
> > >> the compiler to (incorrectly)
> > >>  conclude that both pointers are equivalent, when in fact they carry
> > >>  different dependencies.
> > >>  This means that the compiler might well transform \clnref{pc} to instead
> > >> -be \co{r2 = q->c}, which might well cause the value 44 to be loaded
> > >> +be \co{r2 = READ_ONCE(q->c)}, which might well cause the value 44 to be loaded
> > >>  instead of the expected value 144.
> > >>  \end{fcvref}
> > >>
> > >>
> > >> base-commit: 7f12a9358e220f3d0c3a0880d01bc283113d7a5b
> > >> --
