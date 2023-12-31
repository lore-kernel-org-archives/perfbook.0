Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D1D623
	for <perfbook@vger.kernel.org>; Sun, 31 Dec 2023 00:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLDCaU3b"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6d9f94b9186so2730228b3a.0
        for <perfbook@vger.kernel.org>; Sat, 30 Dec 2023 16:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703981478; x=1704586278; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=25TzpCuGzhI5040LrAL4Zp04U6LVwVQVH0TMym4puMs=;
        b=FLDCaU3bw8NyAeyP4cnOXw3x5qP+fAh14emOHCqQ7S2w8sl0NbgzEnVRAWbzGvRMrk
         Pjb/C2ukdNwuaWKzaJlfRe1Xmc7JJzcjeTa9eeLG/acjA0+eElfUBJNokfSL3Ue+SCne
         zWbMLPaXlRIMnOyvlTsdZrBuI0FXh8djuEdITEcjEC2upfnFv1ue7htsyEr10uK3fd12
         DYthvtboOwGFCOl/a+mQdqNn9ZvCuzZFqgnzvn+nIVh80IceFWQ2Kzbtug19mIJ57Crs
         ecPD/P6tamLD9JSjfV1TZTNwQxZLwCckqMcqEkHNMTvqnHR/C+jGurjd24U0NRTAeeBQ
         sFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703981478; x=1704586278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=25TzpCuGzhI5040LrAL4Zp04U6LVwVQVH0TMym4puMs=;
        b=kNqqe9rmBcp9M6e6lbR0IFxEWlfTrU0rvKjrBwBJttyh1o6YeqbJzuddF3SaX99koZ
         Geg1xgWBOJVVjv+xMPs4VjebS+FkZ5kRDcq4kgiWeTWat8hPvU26NIwOwSODhNGnBHCr
         5pWm/Mrhq4lTjEUKkYszc7Yhu5uVZ+3rdSfIaPKtA2wjP855WpxgOmcy90fBtZXpBCh7
         5Q8g8h8THnlz1YaKlPrXjE1edGmDjzRAMoTjwGR1B3OHAXkoG0OsLPikgruWoynhQPvX
         gJp0IwkPgIndKkd+bL9dXe5sjx8qAZp6yWVOuvPsrqBmMeJGVAUzLupljjpluyDjcEzd
         Ttzw==
X-Gm-Message-State: AOJu0YxPjIgEceWAxHNNdMCd1RtC/lPudMY//9DkOl3FruYPUE5uJWm6
	NC0cGwpqi2awJcaqHhQs5CSGwpjmSWLfeCHcH0ZAPoiHR6yCMw==
X-Google-Smtp-Source: AGHT+IHhkyqh1UyjXuQuf+G7j6JplxsADdcDY9mKUFnJP4/bIANzmWphO5VgnZ/fIzwKWLqmPOMeXIPmRdVFK5LbXFw=
X-Received: by 2002:a05:6a00:8d8a:b0:6d9:c1d6:c5a0 with SMTP id
 im10-20020a056a008d8a00b006d9c1d6c5a0mr11567471pfb.53.1703981478111; Sat, 30
 Dec 2023 16:11:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1703926769-5124-1-git-send-email-zhouzhouyi@gmail.com> <cfa2e0c6-f3fc-45b0-a11a-2ebb5537f8c8@paulmck-laptop>
In-Reply-To: <cfa2e0c6-f3fc-45b0-a11a-2ebb5537f8c8@paulmck-laptop>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Sun, 31 Dec 2023 08:11:07 +0800
Message-ID: <CAABZP2wZ=eJu2ymJpD667ivFn+w1isVA+gmw9ewT4OD8T3PGZA@mail.gmail.com>
Subject: Re: [PATCH -perfbook] toolsoftrade: fix a typo: manpages should be
 man pages
To: paulmck@kernel.org
Cc: akiyks@gmail.com, perfbook@vger.kernel.org, 
	Zhouyi Zhou <zhouyi.zhou@ucas.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 31, 2023 at 7:59=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Sat, Dec 30, 2023 at 04:59:29PM +0800, zhouzhouyi@gmail.com wrote:
> > From: Zhouyi Zhou <zhouyi.zhou@ucas.com.cn>
> >
> > According to [1][2], manpages should be man pages or man-pages.
> >
> > [1] https://en.wikipedia.org/wiki/Man_page
> > [2] https://www.kernel.org/doc/man-pages/
> > Signed-off-by: Zhouyi Zhou<zhouzhouyi@gmail.com>
>
> I am happy either way, having seen it spelled both ways for some decades.
> But those two references are good standardization points.
Thanks Paul for supporting my point of view ;-)
>
> And before I queue this, did this also come from our Chinese editor?
> If so, should she be credited?
This modification was proposed by me independently ;-)
>
>                                                         Thanx, Paul
Thanx, Zhouyi
>
> > ---
> >  toolsoftrade/toolsoftrade.tex | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.=
tex
> > index 645ee74b..097c18d6 100644
> > --- a/toolsoftrade/toolsoftrade.tex
> > +++ b/toolsoftrade/toolsoftrade.tex
> > @@ -308,7 +308,7 @@ Parent process sees x=3D0
> >       (such as \co{mmap()} and \co{shmget()}).
> >       In the meantime, there are any number of textbooks that cover
> >       these primitives in great detail,
> > -     and the truly motivated can read manpages, existing parallel
> > +     and the truly motivated can read man pages, existing parallel
> >       applications using these primitives, as well as the
> >       source code of the Linux-kernel implementations themselves.
> >
> > --
> > 2.34.1
> >
