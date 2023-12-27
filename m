Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF8044369
	for <perfbook@vger.kernel.org>; Wed, 27 Dec 2023 10:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BkyYuVte"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6d9a7233133so672999b3a.0
        for <perfbook@vger.kernel.org>; Wed, 27 Dec 2023 02:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703674429; x=1704279229; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50RKIIgWV3g7eMG/+TYKL3T+qJPlZKGldhpiBHG1OhE=;
        b=BkyYuVtejo5qKGStpS/Xz7mCwEkfG5FMvK0pwhrx19Vo1oo0HGj8WstfLekZ9m/KMr
         OVqI06Gm/EhIhuRQlo5l7KjreoGaC9zJzH4XKmDEZ2lsqyJHFQ3rpW+6kL0r1IavKG3D
         2o+JIWEMvdtUeWBD2FsNtJ9XXZT6Pt85VNrBkYjjMfGTz4tERtzwCw4uVu0u5v3wZNIH
         olfr7dUjl0RJw2AIHzyDid1gMK+jXsmIP04k6GpeB1cwSZN7Of3Za72suAgA6aGN6rV5
         0U7vGGdNNBpiAN7Brk5rjCeeL6X//aUcaMPpEqpo0it5ec5xsrYKxIAJ22A1uA2eGeGb
         HXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703674429; x=1704279229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=50RKIIgWV3g7eMG/+TYKL3T+qJPlZKGldhpiBHG1OhE=;
        b=l0CUPWrKRX+voYYbZ60bRQAflzupB4jlXVsv6XTWJJe3ig0W+Ww2MO/M1hXTPMKatU
         inLxJyypXYyc+KJxAFRbnuXzkBQSI9Oa8Yf5etxcooQduMKh/6of+mqrV0qXH1c9sNLn
         B2uqsEko3uN4idi5hmZ+77MPQuwqX7etcXM6cHReTfTqDWoy3gTsMfA+A7MQDbPAW/JO
         s9544/boG5ZMokGvMxMMkOI3lxR8LNlRyxFyfWIyJIcrmJp/oerdqbRyXfT5iumMrzL0
         V1pY2+6OAWon7mNUR1xTzR7mH4Jxi4NeU1+F3dCmTMLEqgc2j002ZIKqxbpC5+DqLrXo
         6cyw==
X-Gm-Message-State: AOJu0YzmORSA2Lydpi4+5ThB4z/9pk/8SxXOvhpjp4op8Dq0J8+qWTUD
	RZApivYSUhlRQoFwaKDtZu84O3tSxrOzNkDJ8d1dbPMkEeZVYA==
X-Google-Smtp-Source: AGHT+IFMXIkYwS2C/c3xT67YnOfUP5U47M+Gtmg5YSoae1sbz+gEzVzS54/cjBoHKcCQo3dH5BL+pAxskgezo6pTG88=
X-Received: by 2002:a05:6a00:1b48:b0:6d9:abaf:8a97 with SMTP id
 o8-20020a056a001b4800b006d9abaf8a97mr1849428pfv.55.1703674428539; Wed, 27 Dec
 2023 02:53:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1703669665-21764-1-git-send-email-zhouzhouyi@gmail.com> <59dc36ad-16f3-4424-b698-0a1678c3a48e@gmail.com>
In-Reply-To: <59dc36ad-16f3-4424-b698-0a1678c3a48e@gmail.com>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Wed, 27 Dec 2023 18:53:37 +0800
Message-ID: <CAABZP2y3uUT+6hqy=+Na=KzO2xCe0+jVqv2MEzu20uRCZTCZhw@mail.gmail.com>
Subject: Re: [PATCH -perfbook v4] howto: make ref to git archive explicit
To: Akira Yokosawa <akiyks@gmail.com>
Cc: paulmck@kernel.org, perfbook@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 27, 2023 at 6:34=E2=80=AFPM Akira Yokosawa <akiyks@gmail.com> w=
rote:
>
> On Wed, 27 Dec 2023 17:34:25 +0800, zhouzhouyi@gmail.com wrote:
> > From: Zhouyi Zhou <zhouzhouyi@gmail.com>
> >
> > Make "git archive" in answer to Quick Quiz 1.3 more explicit, so that r=
eader can easily know where
> > "git archive" is.
>
> Now that this patch adds just a footnote mentioning Section 1.5,
> commit log can use some adjustments.
>
> How about:
>
>     Make "git archive" in answer to Quick Quiz 1.3 more explicit by
>     adding a footnote, so that a first-time reader, who have never
>     read Section 1.5, can easily know how to clone the Git repo and
>     build PDFs.
>
The revised version makes the commit log more clear and elegant! I
will submit the 5th version.
Thank you for your beautiful work=EF=BC=81
> That said, I'm beginning to wonder how many of first-time readers
> would bother trying -nq builds without having got annoyed by those
> lots of QQz's in perfbook. ;-)
Haha, that's a good point! It's indeed a challenge for first-timers to
dive into nq builds, especially with the complexities
in installing a latex environment and various fonts in Linux desktop
;-) It's quite a learning curve, and it's rewarding in the end.
>
> >
> > Suggested-by: Akira Yokosawa <akiyks@gmail.com>
> > Signed-off-by: Zhouyi Zhou<zhouzhouyi@gmail.com>
>
> Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
>
>     Thanks, Akira
Thanks, Zhouyi
>
> > ---
> > Hi Akira
> >
> > Thank you for your valuable suggestions and guidances, I learned a lot
> > during this process ;-)
> >
> > And I invoke make -j 20 in my ubuntu 22.04, everything works great!
> >
> > Our editor Yunjing Li is still too modest to provide her email, sorry.
> >
> > Thanks for your patient and hard work.
> >
> > Thanks
> > Zhouyi
> > --
> >  howto/howto.tex | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/howto/howto.tex b/howto/howto.tex
> > index 55270cba..8d678644 100644
> > --- a/howto/howto.tex
> > +++ b/howto/howto.tex
> > @@ -226,7 +226,9 @@ Here are a few possible strategies:
> >       only a blank sheet of paper.
> >  \item        If you find the Quick Quizzes distracting but impossible
> >       to ignore, you can always clone the \LaTeX{} source for
> > -     this book from the git archive.
> > +     this book from the git archive.\footnote{
> > +             See \cref{sec:howto:Whose Book Is This?}
> > +             for instructions to do this.}
> >       You can then run the command \co{make nq}, which will
> >       produce a \co{perfbook-nq.pdf}.
> >       This PDF contains unobtrusive boxed tags where the Quick Quizzes
