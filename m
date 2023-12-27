Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BA44403
	for <perfbook@vger.kernel.org>; Wed, 27 Dec 2023 06:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RtCBwshS"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3bba50cd318so2324655b6e.0
        for <perfbook@vger.kernel.org>; Tue, 26 Dec 2023 22:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703656805; x=1704261605; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kRV9lCgQI5LbVEB4x7upcQfyswm6I4yKvjJtOuXCf0=;
        b=RtCBwshSoQGtnRQhrDVkKqamPSqFdZYWIviMQwHxEO+0ZtbpdoqyTz9c3ZhvmdCMVi
         6ygePlPvZF7v7hsdqB4OlSnjIq/31nW5qwD0mHDeRApvi6upTjAisXlLRA2RbBkt1AWu
         qftYV/PRK/JrUU6fp8I6FVoZhTBJioCGdUUcLCP9AjyYNm/Gx8IkXiNrI0u5uEncNtHC
         xPdgqbAoUuotMln4d0WGBIFzezzlPG5mkq9pHiPibV/pZCNybbqdGA7HQF4eQbzK2y9P
         oPL/N6It/jSipzU9ZlGme6stQlkwGSzyQ+LeWhqeqJUecLwmJZ8/5tJHtLZJyQz3Bo7F
         cZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703656805; x=1704261605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8kRV9lCgQI5LbVEB4x7upcQfyswm6I4yKvjJtOuXCf0=;
        b=bZCO59y8/H1vzr7sr0+S9c8iFgQj6jQzMT618q2yRIDf38joOQn+YrEyZuWBV9MSI0
         0odjfxNidVAKDG04FPfZVko+qMs0ZbZd52BwcnwIWskc2zkp9m4RYNj+APgnxdAABcb1
         P2fvN6KbthcNI5Sf+OY0lUUz3515Z+nZogm5pjjWWtdH48d5ojuS3F7fZaSx+zxHU+Mt
         ZuEvYL1W7/s5+zA+T1KfJc9ninwNfE/zhh6G5R6pDbv5W/dSgVlvBMuJmXYH7K8EKKiA
         TU94n1njGCYh+54qT46mgNStXMwNqXGAZi8o9tJIZFo8B2vznYB3bSGEzeVgBZSJvEON
         556w==
X-Gm-Message-State: AOJu0YxxjTEDq4jx5kunRg+tHQZdvfjmqhTG9GE2uXxM4EfrXYqUec4j
	Qn37vHlXsswAt+qspSiquFAgk1vrEwxn2ItSQlVBb+qrbWHkVQ==
X-Google-Smtp-Source: AGHT+IE+uNr2Q/hN2TNkcTFcxqVkEadyBtgHS9S3lNtDuZODXEwl6+vU5YUIsCmE8S8p/B1caqb1aFh7WkJLcjHtni0=
X-Received: by 2002:a05:6808:1211:b0:3bb:9761:7f7d with SMTP id
 a17-20020a056808121100b003bb97617f7dmr8516964oil.68.1703656805015; Tue, 26
 Dec 2023 22:00:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1703645394-30331-1-git-send-email-zhouzhouyi@gmail.com> <b2d6fa0c-efe1-4c4f-af1b-3d850bc34c9f@gmail.com>
In-Reply-To: <b2d6fa0c-efe1-4c4f-af1b-3d850bc34c9f@gmail.com>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Wed, 27 Dec 2023 13:59:53 +0800
Message-ID: <CAABZP2x8Eo75rJSby8yM6D2NDZHy4BPocCM52GoZEon=i4Xt=w@mail.gmail.com>
Subject: Re: [PATCH perfbook] bib: make ref to git archive explicit
To: Akira Yokosawa <akiyks@gmail.com>, Zhouyi Zhou <zhouzhouyi@gmail.com>
Cc: paulmck@kernel.org, perfbook@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank Akira's valuable advice

On Wed, Dec 27, 2023 at 12:53=E2=80=AFPM Akira Yokosawa <akiyks@gmail.com> =
wrote:
>
> Hi Zhouyi,
>
> [Dropping YunJing Li's unreachable address]
>
> On Wed, 27 Dec 2023 10:49:54 +0800, zhouzhouyi@gmail.com wrote:
> > From: =E5=91=A8=E6=B4=B2=E4=BB=AA <8241764+zhouyizhousihai@user.noreply=
.gitee.com>
>
> No, we can't accept a patch from an author whose email address is
> unreachable (tested from my gmail account).
> Please use YunJing Li's globally accessible email address please
> if you would like to keep the credit.
I contact YunJing Li in the morning, she is being too modest to be a
patch author, because she think to improve Chinese edition is her job
;-)
>
> >
> > According to our Chinese version editor Yunjing Li's advice,
> >  make reference to perfbook's git archive explicit.
>
> Please describe what Yunjins Li's advice was.
> Honestly speaking, I don't see much point in this update.
Yunjin Li's original advice was "Can we make 'git archive' in answer
to Quick Quiz 1.3 more explicit, so that reader can easily know where
'git archive' is"
>
> >
> > Signed-off-by: Zhouyi Zhou<zhouzhouyi@gmail.com>
>
> We need a Signed-off-by: tag from the author as well ...
>
> One more minor nit below:
>
> > ---
> >  bib/syncrefs.bib | 8 ++++++++
> >  howto/howto.tex  | 2 +-
> >  legal.tex        | 5 ++---
> >  3 files changed, 11 insertions(+), 4 deletions(-)
> >
> > diff --git a/bib/syncrefs.bib b/bib/syncrefs.bib
> > index 6ee50e3b..4f347488 100644
> > --- a/bib/syncrefs.bib
> > +++ b/bib/syncrefs.bib
> > @@ -2025,3 +2025,11 @@ Parallel Server on UNIX",
> >   Month=3D"September",
> >   Note=3D"Linux Plumbers Conference \url{https://lpc.events/event/16/co=
ntributions/1226/}",
> >  }
> > +
> > +@unpublished{PaulmckPerfbookGit,
> > + author=3D"Paul E. McKenney",
> > + title=3D"Is Parallel Programming Hard, And, If So, What Can You Do Ab=
out It? Git Archive",
> > + year=3D"2023",
> > + note=3D{\url{git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/pe=
rfbook.git}},
> > + lastchecked=3D"December 27, 2023",
> > +}
> > \ No newline at end of file
>
> Need to be fixed.
OK, I will fix this
>
> > diff --git a/howto/howto.tex b/howto/howto.tex
> > index 55270cba..e7cd5f3c 100644
> > --- a/howto/howto.tex
> > +++ b/howto/howto.tex
> > @@ -226,7 +226,7 @@ Here are a few possible strategies:
> >       only a blank sheet of paper.
> >  \item        If you find the Quick Quizzes distracting but impossible
> >       to ignore, you can always clone the \LaTeX{} source for
> > -     this book from the git archive.
> > +     this book from the git archive~\cite{PaulmckPerfbookGit}.
> >       You can then run the command \co{make nq}, which will
> >       produce a \co{perfbook-nq.pdf}.
> >       This PDF contains unobtrusive boxed tags where the Quick Quizzes
> > diff --git a/legal.tex b/legal.tex
> > index f443df37..ca21ecaf 100644
> > --- a/legal.tex
> > +++ b/legal.tex
> > @@ -42,12 +42,11 @@ Source code is covered by various versions of the G=
PL\@.\footnote{
> >  Some of this code is GPLv2-only, as it derives from the Linux kernel,
> >  while other code is GPLv2-or-later.
> >  See the comment headers of the individual source files within the
> > -CodeSamples directory in the git archive\footnote{
> > -     \url{git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/perfbo=
ok.git}}
> > +CodeSamples directory in the git archive~\cite{PaulmckPerfbookGit}
>
> I think Legal pages should better be self-contained if at all possible.
> IOW, the URL should better be somewhere in the Legal pages.
>
OK, I will keep the Legal pages unchanged.
> >  for the exact licenses.
> >  If you are unsure of the license for a given code fragment,
> >  you should assume GPLv2-only.
> >
> >  Combined work {\textcopyright}~2005--\commityear\ by Paul E. McKenney.
> >  Each individual contribution is copyright by its contributor at the ti=
me
> > -of contribution, as recorded in the git archive.
> > +of contribution, as recorded in the git archive~\cite{PaulmckPerfbookG=
it}.
>
> Do we really need this?
OK, I will keep this unchanged as well.
>
>     Regards, Akira
I will prepare the new version of patch soon.

Thanks again
Regards,  Zhouyi
>
> > --
> > 2.34.1
> >
>
