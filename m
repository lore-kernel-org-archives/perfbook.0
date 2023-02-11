Return-Path: <SRS0=d1CH=6H=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w5qFt2q1dhrO2C5lziYAsciyhWOhYNEpgNpi2sFzFDo=;
        b=TveuTAMjL7tj3/tuB3Y2JlX8gtCP/CcDUCVuqvzsi3R7FdF2tDYaQw7ByN06MxlxDX
         GKufwSaZnf+qz82Dh3eg8aY7kVduXbcaMsYZRQ4Ss3DhC1yOHZ4DjQHN7CwRQllHDTj0
         qABFZY4xQ6DA50366QwDFF+VWFQ0FoG+g9zFk01ZXolTw2DbsJb16BPHtrNH+BA+W7RM
         JABbpNoeA8HChK0/Kt/GW83BnXt+pOQxgFxI2FfAVEwohSuTUavMS/hHqeZuGeDRZesx
         5uH8e+BdN3Q3vQeeQCae2rgs/X2WsAkrKit+BE1I4hJjXu37Hfl6wQu/WjMt+ThbfeD6
         AvXA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: Re: [PATCH 2/5] debugging: Use \co{} for 'git' and 'Fixes:'
Date: Sat, 11 Feb 2023 09:04:01 -0800
Message-Id: <20230211170401.8948-1-sj@kernel.org>
In-Reply-To: <e75a1d50-704f-d2fc-2e2f-3644ddcd27fd@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: SeongJae Park <sj@kernel.org>, paulmck@kernel.org, perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Akira,

On Mon, 6 Feb 2023 11:38:58 +0900 Akira Yokosawa <akiyks@gmail.com> wrote:

> On Sun,  5 Feb 2023 10:21:25 -0800, SeongJae Park wrote:
> > From: SeongJae Park <sj38.park@gmail.com>
> > 
> > In 'debugging/', 'git' is a command and 'Fixes:' is a string in command
> > output, which usually enclosed via '\co{}', but those are enclosed with
> > '\emph{}'.  Use '\co{}' instead for being more consistent.
> > 
> > Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> > ---
> >  debugging/debugging.tex | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/debugging/debugging.tex b/debugging/debugging.tex
> > index 3104bb95..3ce74469 100644
> > --- a/debugging/debugging.tex
> > +++ b/debugging/debugging.tex
> > @@ -862,8 +862,8 @@ by the author's invalid assumptions, and who might also test the code.
> >  	hackers of harboring???
> >  }\QuickQuizAnswer{
> >  	Those wishing a complete answer to this question are encouraged
> > -	to search the Linux kernel \emph{git} repository for commits
> 
> I often see "Linux kernel git repository" everywhere, and in this case,
> I suppose emphasizing "git" was the author's intention. Paul might have
> a different opinion, though.
> 
> > -	containing the string ``Fixes:''.
> > +	to search the Linux kernel \co{git} repository for commits
> > +	containing the string \co{Fixes:}.
> 
> As this is mentioned as a "string", \qco{} might be a better choice.

Thanks, I will revise so in the next spin.

> 
>         Thanks, Akra
> 
> >  	There were many thousands of them just in the year 2020, including
> >  	fixes for the following invalid assumptions:
> >  
