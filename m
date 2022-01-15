Return-Path: <SRS0=fdso=R7=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1uyJqYwJa0QDWBkUmCcgbgFgtHNvP16Wx8jEdKHf0jM=;
        b=bHUvQV+AE6tbqMYYN3tt5dQL2xhsQiL/mg0EbIqiXgBT1XEQGzm58X1MeF7gyXfYXS
         9KAEri/b/80QKLHSQs/dm/RX5o24NSwYsXiGVHiOIVIh/e1m/mwB/d0uWdeo6Vh+v20g
         4nOyr8CrLQy4BIaUMKMYMLOI8b9tMmpnfHeXXDZPjilAaBZVSHkW/6sH3p/c6ok3Bnw6
         GhlxS2c1y6NWBOIjuTeqnxOurbEikl9eF6wbtZIpdhcKiSsrLL9FzCq7T75hTOppakMQ
         lFelGtaEwDNPeXii44QQ/DP5jvEnFy4LxfNHaBwtpk9P/TPfCxX0mkrzWjTRfBbNGaTh
         qavQ==
MIME-Version: 1.0
References: <20220113034336.64794-1-zhouzhouyi@gmail.com> <20220114185829.GX947480@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20220114185829.GX947480@paulmck-ThinkPad-P17-Gen-1>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Sat, 15 Jan 2022 08:05:13 +0800
Message-ID: <CAABZP2xWgm8c8VveFd=9EOEESF3Z5=VFi_8WBqZzKUCehen-KA@mail.gmail.com>
Subject: Re: [PATCH-perfbook v2] RFC: bibliography: make a reference item better
Content-Type: text/plain; charset="UTF-8"
To: paulmck@kernel.org
Cc: Akira Yokosawa <akiyks@gmail.com>, Yang Lu <luyang.co@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Thank Paul for reviewing and improving the patch for me.

I went through the log and your email line by line several times and
learned a lot.
I am very pleased to be a little part of modern science and technology ;-)

Thanks
Zhouyi

On Sat, Jan 15, 2022 at 2:58 AM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Thu, Jan 13, 2022 at 11:43:36AM +0800, Zhouyi Zhou wrote:
> > I can't find "Trinity: A system call fuzzer" in Proceedings of the 13th
> > Ottawa Linux Symposium, with link below
> > https://www.kernel.org/doc/mirror/ols2011.pdf
> >
> > While I do find the author's presentation in youtube, with link below
> > https://www.youtube.com/watch?v=o_2jwfsPh0Y
> >
> > According to above observations, I try to make the reference item better
> >
> > Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> > ---
> > Hi Paul and Akira
> >
> > I can't find "Trinity: A system call fuzzer" in Proceedings of the 13th
> > Ottawa Linux Symposium, with link below
> > https://www.kernel.org/doc/mirror/ols2011.pdf
> >
> > While I can find the author's presentation in youtube, with link below
> > https://www.youtube.com/watch?v=o_2jwfsPh0Y
> >
> > According to above observations, I try to make the reference item better
>
> Good catch, thank you!
>
> I had to hand-apply this, possibly due to some other recent changes.
> Also maybe because I failed to give "git am" the "-3" argument.
>
> Hear is what I came up with, could you please check it?
>
> I left out the URL of the PDF because as you say it does not contain
> a Trinity paper, and also the YouTube URL because it has very noisy
> audio.
>
>                                                         Thanx, Paul
>
> ------------------------------------------------------------------------
>
> commit bf4794df366d2cf87c2e9cf177f5169081138a23
> Author: Zhouyi Zhou <zhouzhouyi@gmail.com>
> Date:   Fri Jan 14 10:51:56 2022 -0800
>
>     bib/swtools: Fix DaveJones2011Trinity bibliography entry
>
>     It appears that Dave Jones did not write a paper for OLS'2011,
>     confining himself to a presentation.  This commit updates the
>     bibliography entry accordingly.
>
>     Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
>
> diff --git a/bib/swtools.bib b/bib/swtools.bib
> index 5bd7e197..31ce0025 100644
> --- a/bib/swtools.bib
> +++ b/bib/swtools.bib
> @@ -517,10 +517,9 @@ Architectural Support for Programming Languages and Operating Systems
>  @Conference{DaveJones2011Trinity,
>   author = "Dave Jones",
>   title = "Trinity: A system call fuzzer",
> - booktitle = {Proceedings of the 13\textsuperscript{th} Ottawa Linux Symposium},
> + booktitle = {13\textsuperscript{th} Ottawa Linux Symposium},
>   month = {June},
>   year = {2011},
> - pages = {???--???},
>   address = {Ottawa, Canada},
>   note={Project repository: \url{https://github.com/kernelslacker/trinity}},
>  }
