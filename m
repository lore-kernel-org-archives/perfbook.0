Return-Path: <SRS0=82Xt=NK=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0sBozINMY92eJ6AaJdO7Ne7MnndeDh6DSdP1etr/VII=;
        b=ogihMqfN76gurgfujICHrdgEf7ZEeEp5uzF7GFXZh2vNXa1+X+GRDRpkYJW2OhadY5
         IRS+euvLwGYYBwwVJSphYZDE7ojFFN4+VinT4vQe8PCN4mcigdbq0mkuvD41zJ9sVOT5
         aMZz4Xu+wcKggzggl9TutR8TNxOZ12vuKvXba7cjagFounwslLlS40FtIsCbANOWbQNh
         q3hvcbRRFC9aPSKx4uBzhmchY5y8qVP2XW799dtSMctA9jr8P7TnUxHM+Lml5v55RoDD
         qIw+xH1eNk94Po1C5XjloKrQhukTYkm/eoKEf5Ax3yWX9g/UTHaAeYDivzFkBzhz9K/n
         yGRw==
MIME-Version: 1.0
References: <1629359518-3861-1-git-send-email-zhouzhouyi@gmail.com>
 <031ce7cf-750e-7a2d-f2ba-5e7b661df2c2@gmail.com> <20210819172940.GD4126399@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20210819172940.GD4126399@paulmck-ThinkPad-P17-Gen-1>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Fri, 20 Aug 2021 05:05:40 +0800
Message-ID: <CAABZP2wyNud89_Gu2NueWQSOt7oV-_cHnCnF_exL_sY_ODCx9w@mail.gmail.com>
Subject: Re: [PATCH-perfbook] Fix a little grammar mistake
Content-Type: text/plain; charset="UTF-8"
To: paulmck@kernel.org
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org, Yang Lu <luyang.co@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Thank you Paul and thank you Akira

On Fri, Aug 20, 2021 at 1:29 AM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Thu, Aug 19, 2021 at 07:54:30PM +0900, Akira Yokosawa wrote:
> > Hello Zhouyi,
> >
> > On Thu, 19 Aug 2021 15:51:58 +0800, Zhouyi Zhou wrote:
> > > Hi Paul,
> > >
> > > I think there is a little grammer mistake in answer to quick quiz 10.8,
> > > I am not so sure because my English is not so well ;-)
> > >
> > > Thanks
> > > Zhouyi
> > >
> > > Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> > > ---
> > >  datastruct/datastruct.tex | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
> > > index adb102d..68341f2 100644
> > > --- a/datastruct/datastruct.tex
> > > +++ b/datastruct/datastruct.tex
> > > @@ -963,1 +963,1 @@ not recommended for production use.
> > >     In theory, it isn't any safer, and a useful exercise would be
> > >     to run these programs on larger systems.
> > >     In practice, there are a lot more systems with more than 28~CPUs
> > > -   than there are systems with more than 448 CPUs.
> >
> > This can be parsed as follows:
> >
> >     In practice, there are a lot more X than there are Y.
> >
> > , where
> >
> >     X: systems with more than 28~CPUs
> >     Y: systems with more than 448 CPUs
> >
> > So there is no grammatical error here.
> > Three uses of "than" in a sentence might be confusing, though.
> >
> > Paul might have an idea of a less-confusing sentence.
>
> Three "than"s in one sentence is a bit excessive, now that you guys
> mention it.
>
> How about this?
>
>         In practice, there are a lot more 28-CPU systems than there are
>         448-CPU systems.
The modified version reads very smoothly for me ;-)
>
> I do not believe that the "more than"s are really adding much here.
I also think so, because when I read "28-CPU system", I immediately
imagine a bundle of systems
that have some CPUs around 28, for example 24-CPU systems, 32-CPU systems ;-)
>
> Thoughts?
>
>                                                         Thanx, Paul
>
> >         Thanks, Akira
> >
> > > +   are systems with more than 448 CPUs.
> > >     In addition, other testing has shown that RCU read-side primitives
> > >     offer consistent performance and scalability up to at least 1024 CPUs.
> > >  }\QuickQuizEnd
> > >
Cheers
Zhouyi
