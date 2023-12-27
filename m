Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C450A63A8
	for <perfbook@vger.kernel.org>; Wed, 27 Dec 2023 08:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/OZX93m"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6d9b51093a0so1686531b3a.0
        for <perfbook@vger.kernel.org>; Wed, 27 Dec 2023 00:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665847; x=1704270647; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SlGLVDFUYG8S4rL6L1kdp8ORQHTDr0RBqD3wIRQyYE=;
        b=Y/OZX93m0XUWP3wvgtT7/xoCPS2FdVlYuAt7IVLcVKRGTzkxCImAPevqsa+FlLED9u
         GhQfMMYiY611HWChkPwi2FDAACNmjt88ghoRlAxZtWRM3ffZzavD/o+x4TYb/83J3Ymj
         u8HG25B9m36q01uYkhHy9PTyfwCfxmCxL4NGhD8WsLff6/JTca+IYrDN0qnH16/IypLB
         oy+S40lM7GoCgxlyzFLhD5KS0Aeq7NzxOxblgI4lc3Y160d5faFtb/d7DSgWvfKiPrDc
         tYXHX99u2D2jpZADd76t32JoV8CARiHTt+93lr/lgFpNLJLIBU9rtnFSJJXiP845HpCJ
         e5hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665847; x=1704270647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2SlGLVDFUYG8S4rL6L1kdp8ORQHTDr0RBqD3wIRQyYE=;
        b=k5y+xXpzW1GyAkDlq/+MsS3BiMMreZBMaPmiBmAqfuDjvVwF4EPqbq/1rmJR9ZsGOf
         5xGFydXz+rDb1Q6FVtjSCrvI6GW4sxL6B9BHNT2x7BO+RexPdumfSenOtxpAHaaY1HWE
         1D2qQWkgqbJCuJsOs7u6WaJIoq5ydqnc6xDrbS57r88zZDL3fLVEEDb4PTE3pVRL7Yet
         VsLQ/ixF380BsRmpCHScc0TDRxX6TzA74ZP29DEL6kLNkemylrsbnGIsCrU56qRa2BP+
         Si13ji+FiaDmj7IZcEadpXfMBs5Xc6iQDwiEfgDYjQEyzc+iEW63KNFbGJ5M7JtnQ4WX
         sKUg==
X-Gm-Message-State: AOJu0YxqGWM85Waz7TL2E0r9hfA1RArv0n8Yd45WL5n8jNU4rN0q7XHI
	N6ezCnqQo+7BKiodnYeK58e8m0Gx8Ypr9ej31Tg=
X-Google-Smtp-Source: AGHT+IFnatraDMfWOBWvgMKIL59zlM8p/XV/hyojthmeokuIToedtcn7Hd28AMiIf1li/qi4adOa0ne5Qe7B1L9oSeU=
X-Received: by 2002:a05:6a00:1d1a:b0:6d9:bfef:119 with SMTP id
 a26-20020a056a001d1a00b006d9bfef0119mr4209964pfx.7.1703665846838; Wed, 27 Dec
 2023 00:30:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1703659160-11466-1-git-send-email-zhouzhouyi@gmail.com> <33039676-e5dc-4ad1-8d4a-485c9844ed64@gmail.com>
In-Reply-To: <33039676-e5dc-4ad1-8d4a-485c9844ed64@gmail.com>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Wed, 27 Dec 2023 16:30:35 +0800
Message-ID: <CAABZP2z7_v=xt2pxxf3TH4uUaTbO7EV5bvz53OYWOrOJj20ytw@mail.gmail.com>
Subject: Re: [PATCH -perfbook v3] howto: make ref to git archive explicit
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, paulmck@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 27, 2023 at 3:50=E2=80=AFPM Akira Yokosawa <akiyks@gmail.com> w=
rote:
>
> On Wed, 27 Dec 2023 14:39:20 +0800, zhouzhouyi@gmail.com wrote:
> > From: Zhouyi Zhou <zhouzhouyi@gmail.com>
> >
> > Make "git archive" in answer to Quick Quiz 1.3 more explicit, so that r=
eader can easily know where
> > "git archive" is.
> >
> > Signed-off-by: Zhouyi Zhou<zhouzhouyi@gmail.com>
> > ---
> > Hi Akira
> >
> > This is version 3 of my patch "make ref to git archive explicit".
> >
> > I fixed the problem of version 1 under your guidance.
> >
> > The idea is originally proposed by our Chinese version editor Yunjing L=
i, but
> > she was too modest to be a patch author.
>
> In that case, a Reported-by: or Suggested-by tag should work, that is
> if Yunjing Li is OK with her reachable email address exposed.
Ok, I am try to ask her for her email address.
>
> >
> > I have forget to add "Signed-off-by" in version 2 of my patch, sorry fo=
r the inconvenience that I brought.
> >
> > Thanks again
> >
> > Zhouyi
> > --
> >  bib/syncrefs.bib | 8 ++++++++
> >  howto/howto.tex  | 2 +-
> >  2 files changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/bib/syncrefs.bib b/bib/syncrefs.bib
> > index 6ee50e3b..63a7a8bc 100644
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
>
> Alternatively, you can put a footnote instead. For example:
>
>   See \cref{sec:howto:Whose Book Is This?} for instructions to do this.
>
> should also suffice.
OK, I will do it.
>
> Generally speaking, citations are suitable when you want readers
> to read the referenced document/code and the like.  In this case,
> presenting just the URL of Git repo won't give readers sufficient
> info.
>
> QQz 1.3 belongs to Section 1.2, while the instructions are in
> Section 1.5.  So putting a footnote as a (kind-of) "forward reference"
> looks more reasonable to me.
But the 'git archive' belongs to the Answer to QQz 3.1 which is in
Appendix E, do we still need "forward reference".
If the answer is yes,  will  "See \cref{sec:howto:Whose Book Is This?}
(forward reference) for instructions to do this." be good ?
>
> Can you try this alternative in v4 ?
Ok, I am very glad to try this.
>
> If you are OK with it, please use
>
>   Suggested-by: Akira Yokosawa <akiyks@gmail.com>
OK,
>
>     Thanks, Akira
Thanks, Zhouyi
>
> >       You can then run the command \co{make nq}, which will
> >       produce a \co{perfbook-nq.pdf}.
> >       This PDF contains unobtrusive boxed tags where the Quick Quizzes
>
