Return-Path: <SRS0=ALPs=JB=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oDEaO6FSvWxoCb1slGGFcOYAsT8puMEQwO8h2ylv9j8=;
        b=lbhIUubpf7tTseWP7A4xdHwRtnlza9B8gQ9rZcVcgkdg/QLBGadjnWC6atuBQrQeeB
         bA1A+UcZzmrno9vth9w21wO2ke5JVK/eVKPlXDHX+JbeOLGphE86AZJ88b4IlgABJsGG
         Q0BZaoRtXSG/bmn9HNxKH1iyeiWUbB5oPxUAKwUEsOXrh4WTOmTnDRccUXdlzS5Jgjz6
         7ol/fkDaFon8FuIAAqNfWaMinbg9HdkBDfWFb3BPy66328AWph6WQ461toksTxJMFq7m
         TjqQFf1dfcU5Lv56fkukDndIg72pb8h8SyAAVpi+uFyykF1YbYdO0RUXzBS5Nufo9gnu
         Scew==
MIME-Version: 1.0
References: <20210404100503.20978-1-sj38.park@gmail.com> <20210404100503.20978-2-sj38.park@gmail.com>
 <37416a08-7a16-7547-03bc-b00018b5bec7@gmail.com>
In-Reply-To: <37416a08-7a16-7547-03bc-b00018b5bec7@gmail.com>
From: SeongJae Park <sj38.park@gmail.com>
Date: Sun, 4 Apr 2021 13:11:49 +0200
Message-ID: <CAEjAshoDfPFEH-sXGEHFbQJ=oTz31=URVHuH2oHuykBoj8E_7A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] howto: Use '\cref' and '\Cref' instead of 'Chapter~\ref'
Content-Type: text/plain; charset="UTF-8"
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Sun, Apr 4, 2021 at 12:47 PM Akira Yokosawa <akiyks@gmail.com> wrote:
>
> Hi SeongJae,
>
> On Sun, 4 Apr 2021 12:05:00 +0200, SeongJae Park wrote:
> > This commit replaces 'Chapter~\ref' with '\cref' and '\Cref'.
> >
> > Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> > ---
> >  howto/howto.tex | 38 +++++++++++++++++++-------------------
> >  1 file changed, 19 insertions(+), 19 deletions(-)
>
> While we are here, could you please also replace "Appendix~\ref"
> and "Listing~\ref" with \cref/\Cref?
>
> I think those "clever" macros should work as you would expect.

Ok, I will send v3 soon.


Thanks,
SeongJae Park
[...]
