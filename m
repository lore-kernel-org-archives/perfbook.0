Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0D2J/4Y1mfy1SYq8x/DKQiVztOFruNSCw7B3Eb+AWBY=;
        b=lyMkPJVDSCjkEacF6D/TcNIayjXcSn7nSfKLXl8cqfoZId0ueXXYaNVLlgqXI3ry8b
         4kW142ZRZy8+99GEm7kFmUvCZXqGn0EXjdmTSl5yRl2+0Ey6p7gNZjaKGNbsqIMXs/eg
         GTLr9IN/8lbwekRNn4YCo5eB8yZqvrXLyFXHDUu10nJNMSRtKP66fbO7WeMYMhi5ynCq
         dM2Z1dysHe2gO1JlUN3BZJcR7VBONDKw5UtSCyJny2imJ5GlXeYj7a4uO7t/b5/wMqZp
         q9kJXIyCZduvM2z8exgmw347zDNxXIMcCM1s9rcbc2+cfD9mp3VnyUxNz7Rk8Tf8dyRR
         Rokg==
MIME-Version: 1.0
References: <1541854198-4649-1-git-send-email-junchangwang@gmail.com> <5497b7b6-b5cd-aae0-034f-02f6a7262737@gmail.com>
In-Reply-To: <5497b7b6-b5cd-aae0-034f-02f6a7262737@gmail.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Mon, 12 Nov 2018 10:35:38 +0800
Message-ID: <CABoNC82Dx1hLdd-kMWgxJjqOcng79gODpAYhvY7RzC5PaDjdwg@mail.gmail.com>
Subject: Re: [PATCH] tooloftrade: add missing subject of sentence
Content-Type: text/plain; charset="UTF-8"
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Paul McKenney <paulmck@linux.ibm.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Sun, Nov 11, 2018 at 7:55 AM Akira Yokosawa <akiyks@gmail.com> wrote:
>
> On 2018/11/10 20:49:58 +0800, Junchang Wang wrote:
> > Signed-off-by: Junchang Wang <junchangwang@gmail.com>
> > ---
> > Hi Paul,
> >
> > This is the only patch for Chapter Tools of Trade. Please take a look.
> >
> >
> > Thanks,
> > --Junchang
> >
> > --
> >  toolsoftrade/toolsoftrade.tex | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> > index 0844b4c..b4bc46a 100644
> > --- a/toolsoftrade/toolsoftrade.tex
> > +++ b/toolsoftrade/toolsoftrade.tex
> > @@ -2043,8 +2043,8 @@ machine-sized and properly aligned.
> >  It can also prevent load fusing, store fusing, invented loads, and
> >  invented stores.
> >  However, although it does prevent the compiler from reordering \co{volatile}
> > -accesses with each other, does nothing to prevent the CPU from reordering
> > -these accesses.
> > +accesses with each other, \co{volatile} keyword does nothing to prevent the
> > +CPU from reordering these accesses.
>
> In this context, I think
>
> +accesses with each other, it does nothing to prevent the CPU from reordering
>  these accesses.
>
> should be good enough.

Hi Akira,

After reading the whole paragraph a few times, I realized you are
right :-). Thanks a lot!

--Junchang

>
>         Thanks, Akira
>
> >  Furthermore, it does nothing to prevent either compiler or CPU from
> >  reordering non-\co{volatile} accesses with each other or with
> >  \co{volatile} accesses.
> >
>

