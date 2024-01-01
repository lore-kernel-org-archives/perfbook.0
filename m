Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7017F9
	for <perfbook@vger.kernel.org>; Mon,  1 Jan 2024 01:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtnmIVgW"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3bbd6e3795eso2510098b6e.2
        for <perfbook@vger.kernel.org>; Sun, 31 Dec 2023 17:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704073884; x=1704678684; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRPUuD9/Z3gbNM7/3wSqnKI3ghdurJXFfjxDtU9nnW4=;
        b=UtnmIVgWeCq/CVS6R9fftwhozqJb/zeOwRj0ypW00vRyhe2ryS0jcJppjanmPqwCAY
         /2g2WoRwVC5pVUrLx/ldo+Y3uPYwnlv7gm2pHKYW5SqnQjIAZ4k3gbuNcr2AHfSifHyH
         0TmKA2ZlM42dnXgi0Csc8fF43RjPpng66OITV+DgHbHAr7GF72CFjHdNI9VH39YHNBO3
         v7MiwA8u2wOvXr/OwN45L5lrOuftvE/2rtwzvaI6MBFc6GfpeMlaDGr3iXOxVZCMnGSZ
         gKp6u8sFZ43HIZmgH0V18/casOhpnGCihbSiIX9UvFz3va7K0MiPvTCgcznXeqFancj5
         ne/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704073884; x=1704678684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rRPUuD9/Z3gbNM7/3wSqnKI3ghdurJXFfjxDtU9nnW4=;
        b=v+/FnMXOZQ69zDWH3ra5Pf0nksJjZPQQGwidrIsrbh6lyLSUgr2ygqQ76QTXCBnr1s
         BRnB3kV5BwvRIBnBK6aLNV51PJDc//sH34px43+MB7U7btU9zhbF7utsZCdXOeKnS/m/
         nSHERb1FoeRMRVonOtDv4N+q2mSYyk1YC2xS3d8+aV71gaUm/3ZfhuEdKI5RvQ4jiNf4
         /1IzHe6lsYkpq+5pjnlZ6NaPJIXym/AXBpeW5uIe+H5B2yygr5MQN5gGz5K0EGU/2wCH
         Y6Wqb+KyR4OvuTWKTX0NNSLMCQ1dCF019B4MsBmCo6N8/aVNnV0wPrQ/qCKfCZ5nEK7n
         4rmw==
X-Gm-Message-State: AOJu0Yx5MwQ1LvPdsnrdJDt8Yc6CX1CGjP3LnvFO463Bo2Ito34qLoZ9
	4ICLO1R300ayGGf+sTrXCHaI/GkbjvP8Bwp1hBA=
X-Google-Smtp-Source: AGHT+IG6PJRiT78sh0nYaPF3kibAS79jH9AsCUCHIUEb7kID0apSi8q+Gd9lPIBVYTGTbm5YqB3yCDV4V7Og1LE9F8k=
X-Received: by 2002:a05:6808:10c2:b0:3bb:d32d:702e with SMTP id
 s2-20020a05680810c200b003bbd32d702emr6477306ois.100.1704073883669; Sun, 31
 Dec 2023 17:51:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1703926769-5124-1-git-send-email-zhouzhouyi@gmail.com>
 <cfa2e0c6-f3fc-45b0-a11a-2ebb5537f8c8@paulmck-laptop> <CAABZP2wZ=eJu2ymJpD667ivFn+w1isVA+gmw9ewT4OD8T3PGZA@mail.gmail.com>
 <24c0a06b-d0e9-4c15-a0a7-9ccafecf3e79@paulmck-laptop> <17245b81-9294-47bd-8ae7-a3bd8963a5c7@gmail.com>
In-Reply-To: <17245b81-9294-47bd-8ae7-a3bd8963a5c7@gmail.com>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Mon, 1 Jan 2024 09:51:12 +0800
Message-ID: <CAABZP2yaLqZPw_b=BfP-KCdKFtD+Oi=ngbDW0jaR96zGqtR=bg@mail.gmail.com>
Subject: Re: [PATCH -perfbook] toolsoftrade: fix a typo: manpages should be
 man pages
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, Zhouyi Zhou <zhouyi.zhou@ucas.com.cn>, paulmck@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank Akira for the warm hearted reminder
On Mon, Jan 1, 2024 at 9:00=E2=80=AFAM Akira Yokosawa <akiyks@gmail.com> wr=
ote:
>
> Hi Zhouyi,
>
> On 2023/12/31 9:25, Paul E. McKenney wrote:
> > On Sun, Dec 31, 2023 at 08:11:07AM +0800, Zhouyi Zhou wrote:
> >> On Sun, Dec 31, 2023 at 7:59=E2=80=AFAM Paul E. McKenney <paulmck@kern=
el.org> wrote:
> >>>
> >>> On Sat, Dec 30, 2023 at 04:59:29PM +0800, zhouzhouyi@gmail.com wrote:
> >>>> From: Zhouyi Zhou <zhouyi.zhou@ucas.com.cn>
> >>>>
> >>>> According to [1][2], manpages should be man pages or man-pages.
> >>>>
> >>>> [1] https://en.wikipedia.org/wiki/Man_page
> >>>> [2] https://www.kernel.org/doc/man-pages/
> >>>> Signed-off-by: Zhouyi Zhou<zhouzhouyi@gmail.com>
>
> You used mismatching email addresses in From: and Signed-off-by:
> Technically, they need to match.
Yes, and I will send a new version soon.
>
> My guess is you intended the one at @ucas.com.cn for this patch.
>
> If this is the case, you need to provide a Signed-off-by: with
> the right address.
When I prepare the above patch, I am also working on a Linux project
for ucas.com.cn in parallel ;-) ;-) ;-), so my git email is
erroneously set to Zhouyi Zhou <zhouyi.zhou@ucas.com.cn>.

I intend to use zhouzhouyi@gmail.com in my perfbook related works.

Happy New Year to you, Paul, and the Perfbookers ;-)

Thanks, Zhouyi
>
>     Thanks, Akira
>
> >>>
> >>> I am happy either way, having seen it spelled both ways for some deca=
des.
> >>> But those two references are good standardization points.
> >> Thanks Paul for supporting my point of view ;-)
> >>>
> >>> And before I queue this, did this also come from our Chinese editor?
> >>> If so, should she be credited?
> >> This modification was proposed by me independently ;-)
> >
> > Very good, queued and pushed, thank you!
> >
> >
> >                                                         Thanx, Paul
> >
> >> Thanx, Zhouyi
> >>>
> >>>> ---
> >>>>  toolsoftrade/toolsoftrade.tex | 2 +-
> >>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftra=
de.tex
> >>>> index 645ee74b..097c18d6 100644
> >>>> --- a/toolsoftrade/toolsoftrade.tex
> >>>> +++ b/toolsoftrade/toolsoftrade.tex
> >>>> @@ -308,7 +308,7 @@ Parent process sees x=3D0
> >>>>       (such as \co{mmap()} and \co{shmget()}).
> >>>>       In the meantime, there are any number of textbooks that cover
> >>>>       these primitives in great detail,
> >>>> -     and the truly motivated can read manpages, existing parallel
> >>>> +     and the truly motivated can read man pages, existing parallel
> >>>>       applications using these primitives, as well as the
> >>>>       source code of the Linux-kernel implementations themselves.
> >>>>
> >>>> --
> >>>> 2.34.1
> >>>>
