Return-Path: <SRS0=ElMv=QF=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LEpA9W/tyit5y0yd1zMcIg7+hcRlhSTL9umkal8iIwo=;
        b=bxSRL8JwySQUCUsGVHHQczOfa4Jj+R5FLqJhhT5ff7kK+1Qeo7aFxPW9/O67J+Dk2n
         QcFXJ62U/JIJo7vZMWx63qIU3LwgXFwxYjEfbH0w3n/nJ5fxFsQjQEFEEGx9m2h9KjWt
         ejvC+8zSa7UcGSprP76e/QnpcT9CRuiELh5/Y1jxuRu1gah6o7I62jUlaTlBHKW9tQLw
         yUu25agSXYAdGT7elOWtbnoHb/N7GP+L1F4MZWGBthV+S8LFIo1FajiiuowYx1FTRy+a
         qICkC/3w5mBOt8lmvdCKq3Qhp+2PNWrvq6+d2sDhREe3cXNHB5jFSQEnRdJre8BH5nsd
         w9yg==
MIME-Version: 1.0
References: <20211118065830.14709-1-zhouzhouyi@gmail.com> <20211118133422.GT641268@paulmck-ThinkPad-P17-Gen-1>
 <CAABZP2yHwECMdF2cz-i=2sj+VgqZrUYuCkLKe2201esf=FO_Qw@mail.gmail.com>
 <20211118151137.GV641268@paulmck-ThinkPad-P17-Gen-1> <CAABZP2yLpL97WWkeGx1x_95HVi6mx-DW9HtNdBMm0kihpt63og@mail.gmail.com>
 <20211118164847.GW641268@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20211118164847.GW641268@paulmck-ThinkPad-P17-Gen-1>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Fri, 19 Nov 2021 00:53:19 +0800
Message-ID: <CAABZP2yjWoF8-91DfHfkNZJz2yzb110tkghaLk=dr73sQCxM-w@mail.gmail.com>
Subject: Re: [PATCH-perfbook] ordering: fix typo in QQ A.5
Content-Type: text/plain; charset="UTF-8"
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Yang Lu <luyang.co@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Thank you for motivating me and filling me with courage and confidence ;-)

Thanx, Zhouyi

On Fri, Nov 19, 2021 at 12:48 AM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Fri, Nov 19, 2021 at 12:37:06AM +0800, Zhouyi Zhou wrote:
> > On Thu, Nov 18, 2021 at 11:11 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> > >
> > > On Thu, Nov 18, 2021 at 09:54:27PM +0800, Zhouyi Zhou wrote:
> > > > Thank Paul for your encouragement, and thanks for adjusting the commit log ;-)
> > >
> > > Of course, if you are adding quick quizzes that would be of interest to
> > > the general audience, please feel free to send them along.
> > Thanks for your trust and encouragement. I will be very glad and honoured to add
> > quick quizzes for your review in the future ;-)
> >
> > >
> > > Or maybe we removed some quick quizzes recently, who knows?  ;-)
> > After comparing the
> > https://mirrors.edge.kernel.org/pub/linux/kernel/people/paulmck/perfbook/perfbook-e2.pdf
> > and the most recent version build from
> > https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/perfbook.git,
> > I found
> > QQ A.3 (old version) -> QQ A.4 (recent version)
> > QQ A.4 (old version) -> QQ A.5 (recent version)
> > QQ A.5 (old version) -> QQ A.3 (recent version)
> >
> > I am very sorry not to invoke a make before submit the patch (because
> > of my laziness).
> > I promise that I will build the pdf before submitting any patch from now on.
>
> No worries.  It was good practice for me, given that I also maintain a
> small part of the Linux kernel and we all know that people are working
> to insert flaws.  Most of them inadvertently, but you cannot be too
> careful.  ;-)
>
> But yes, it is good to check your patch against the current state.
>
>                                                         Thanx, Paul
>
> > Thanks again
> > Zhouyi
> > >
> > > > Thanx, Zhouyi
> > > >
> > > > On Thu, Nov 18, 2021 at 9:34 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> > > > >
> > > > > On Thu, Nov 18, 2021 at 02:58:30PM +0800, Zhouyi Zhou wrote:
> > > > > > In QQ A.5, the pronoun "that" should be preposition "than". And the
> > > > > > word "imptementations" should be "implementations".
> > > > > >
> > > > > > Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> > > > >
> > > > > Good eyes, queued and pushed, thank you!  (It is QQ A.3 over here,
> > > > > so I adjusted the commit log.)
> > > > >
> > > > >                                                         Thanx, Paul
> > > > >
> > > > > > ---
> > > > > > Hi Paul,
> > > > > >
> > > > > > I fixes some typo in QQ A.5
> > > > > >
> > > > > > Thanks Zhouyi
> > > > > > --
> > > > > >  appendix/questions/ordering.tex | 4 ++--
> > > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/appendix/questions/ordering.tex b/appendix/questions/ordering.tex
> > > > > > index 298600f9..05217bc8 100644
> > > > > > --- a/appendix/questions/ordering.tex
> > > > > > +++ b/appendix/questions/ordering.tex
> > > > > > @@ -97,8 +97,8 @@ than the semantics given by the options above.
> > > > > >
> > > > > >  \QuickQuiz{
> > > > > >       But if fully ordered implementations cannot offer stronger
> > > > > > -     guarantees that the better performing and more scalable weakly
> > > > > > -     ordered imptementations, why bother with full ordering?
> > > > > > +     guarantees than the better performing and more scalable weakly
> > > > > > +     ordered implementations, why bother with full ordering?
> > > > > >  }\QuickQuizAnswer{
> > > > > >       Because strongly ordered implementations are sometimes
> > > > > >       able to provide greater consistency among sets of calls to
> > > > > > --
> > > > > > 2.25.1
> > > > > >
