Return-Path: <SRS0=ElMv=QF=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oR5SE3u48yR8FtgQdbFV167T8TYU/4GTjHTVV/Qyjcw=;
        b=TzUCZFABqAxFskVWU3rVz22hIhj1ewxNkMMWtVLnlAM8QubBeRXWoY2utPsXfOj+P+
         NHOR+ysldZmuVu5Xz7+rLblGhxe16uuE2kXcBRQYMyrIL0ii/bWQt78I85xn+wlWWqVc
         uHo9RJimc8gbTXRsvpptMlFiAlqh/bH5bBwyEblAhTWjlwtEdw+4LERBdIROWJMK4VYj
         zpbBjW0ZUEVEomRBcBxdrik4DGmCCnYGU1BI20rZNmZV9RgJuwnmBp0HbHpKyesa3Q5Z
         PW5cfAb84lWdLVsXy8QZG5QUrvDz7BRALpTMdNfrrZ9P93y6jPw8nKTeyzuIaXlkoU2C
         As+Q==
MIME-Version: 1.0
References: <20211118065830.14709-1-zhouzhouyi@gmail.com> <20211118133422.GT641268@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20211118133422.GT641268@paulmck-ThinkPad-P17-Gen-1>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Thu, 18 Nov 2021 21:54:27 +0800
Message-ID: <CAABZP2yHwECMdF2cz-i=2sj+VgqZrUYuCkLKe2201esf=FO_Qw@mail.gmail.com>
Subject: Re: [PATCH-perfbook] ordering: fix typo in QQ A.5
Content-Type: text/plain; charset="UTF-8"
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Yang Lu <luyang.co@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Thank Paul for your encouragement, and thanks for adjusting the commit log ;-)

Thanx, Zhouyi

On Thu, Nov 18, 2021 at 9:34 PM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Thu, Nov 18, 2021 at 02:58:30PM +0800, Zhouyi Zhou wrote:
> > In QQ A.5, the pronoun "that" should be preposition "than". And the
> > word "imptementations" should be "implementations".
> >
> > Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
>
> Good eyes, queued and pushed, thank you!  (It is QQ A.3 over here,
> so I adjusted the commit log.)
>
>                                                         Thanx, Paul
>
> > ---
> > Hi Paul,
> >
> > I fixes some typo in QQ A.5
> >
> > Thanks Zhouyi
> > --
> >  appendix/questions/ordering.tex | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/appendix/questions/ordering.tex b/appendix/questions/ordering.tex
> > index 298600f9..05217bc8 100644
> > --- a/appendix/questions/ordering.tex
> > +++ b/appendix/questions/ordering.tex
> > @@ -97,8 +97,8 @@ than the semantics given by the options above.
> >
> >  \QuickQuiz{
> >       But if fully ordered implementations cannot offer stronger
> > -     guarantees that the better performing and more scalable weakly
> > -     ordered imptementations, why bother with full ordering?
> > +     guarantees than the better performing and more scalable weakly
> > +     ordered implementations, why bother with full ordering?
> >  }\QuickQuizAnswer{
> >       Because strongly ordered implementations are sometimes
> >       able to provide greater consistency among sets of calls to
> > --
> > 2.25.1
> >
