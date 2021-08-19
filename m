Return-Path: <SRS0=82Xt=NK=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LEiElxKSgsOlXXexhrLJUoPCql0v8zpNFhHKVHYmWlQ=;
        b=ZnZVntfmEHMnDbRtNQbKKT2+H3pPjamp19cW5QohUt4nmv2IWo8JPf6Ez1Xv+Mh5fh
         AHvclYvuQKfR5807s1Vg2jt/vih9gNCL4rHLjKJyJx5hqnvx0DoK9N5RKi+UVYTQr2fe
         XSgsTjEWk1IxDv1afgd24F9OGvet8g34DwKf9+NaSRk3ftpzlMyiZipn8no81392HFLX
         6tZTD4KIdwSOoQPckLqM7l27n0w/Q0ggYQhsehUgwIZTisiXCWwKcu1o2PzsnBEF2JgJ
         VPAt3CnvXpXCXs0ilTM3sLbN5pWWfYbktLqMMw2o6xEDvkuA8xQUpE0OrG4R+kDQcMOi
         xWfw==
MIME-Version: 1.0
References: <1629359518-3861-1-git-send-email-zhouzhouyi@gmail.com> <031ce7cf-750e-7a2d-f2ba-5e7b661df2c2@gmail.com>
In-Reply-To: <031ce7cf-750e-7a2d-f2ba-5e7b661df2c2@gmail.com>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Thu, 19 Aug 2021 19:39:44 +0800
Message-ID: <CAABZP2y+opYdyfDVsh6C3_U8btKhRu0cT4rUPQm4Xt0XBYwoWQ@mail.gmail.com>
Subject: Re: [PATCH-perfbook] Fix a little grammar mistake
Content-Type: text/plain; charset="UTF-8"
To: Akira Yokosawa <akiyks@gmail.com>
Cc: paulmck@kernel.org, perfbook@vger.kernel.org, Yang Lu <luyang.co@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Thanks Akira for reviewing the patch for me ;-)

On Thu, Aug 19, 2021 at 6:54 PM Akira Yokosawa <akiyks@gmail.com> wrote:
>
> Hello Zhouyi,
>
> On Thu, 19 Aug 2021 15:51:58 +0800, Zhouyi Zhou wrote:
> > Hi Paul,
> >
> > I think there is a little grammer mistake in answer to quick quiz 10.8,
> > I am not so sure because my English is not so well ;-)
> >
> > Thanks
> > Zhouyi
> >
> > Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> > ---
> >  datastruct/datastruct.tex | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
> > index adb102d..68341f2 100644
> > --- a/datastruct/datastruct.tex
> > +++ b/datastruct/datastruct.tex
> > @@ -963,1 +963,1 @@ not recommended for production use.
> >       In theory, it isn't any safer, and a useful exercise would be
> >       to run these programs on larger systems.
> >       In practice, there are a lot more systems with more than 28~CPUs
> > -     than there are systems with more than 448 CPUs.
>
> This can be parsed as follows:
>
>     In practice, there are a lot more X than there are Y.
>
> , where
>
>     X: systems with more than 28~CPUs
>     Y: systems with more than 448 CPUs
>
I learned a lot from your analysis, thanks again.

> So there is no grammatical error here.
> Three uses of "than" in a sentence might be confusing, though.
>
> Paul might have an idea of a less-confusing sentence.
>
>         Thanks, Akira
>
> > +     are systems with more than 448 CPUs.
> >       In addition, other testing has shown that RCU read-side primitives
> >       offer consistent performance and scalability up to at least 1024 CPUs.
> >  }\QuickQuizEnd
> >
Thanks
Zhouyi
