Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE532BB08
	for <perfbook@vger.kernel.org>; Mon, 15 Jan 2024 11:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m6sQomOt"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d480c6342dso66249995ad.2
        for <perfbook@vger.kernel.org>; Mon, 15 Jan 2024 03:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705318285; x=1705923085; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQkqp8MBVFzHBhntT3+LBZb8UHV6O/GapYhVdoR9/og=;
        b=m6sQomOtGC/zwf6uZHs4hRNcwRxH2BPGjMmd4B6GwORJAcd2yvancYU4duzyS/oDN7
         2DNoKR1Ta1coEXJdotYMAAF4s20R0SRpevsMCN28NTCIY/1vSvCgFce3EGPE03uLuzJX
         B1sVM1Eyrckw1GsVjPZeIgMCs7yrrDs56ZkcYa0fS6qQZKbAtkt2HhK5oAHisPeVTIgW
         io9TJOnmH0RS+DKV4cjijQ5TX5krLtFVbNxuZ2f6zodvba3HJcrQc4RPtHgOfsH0mnmh
         a6300waiAD6r+jo96X1TahGWJAdO2iL9R3mbpiGinmfOqNV7PrmvfN8dlz1horKlU0bd
         TDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705318285; x=1705923085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQkqp8MBVFzHBhntT3+LBZb8UHV6O/GapYhVdoR9/og=;
        b=Ej+OfhZpyNAe9JfnE8plmou94LL66eZ0jSege39KF5r9dO+TnayP4vfplRRalBQ8fs
         9xa0atfHz0EWSpYdzPNDXxunT6/FWpREdkXYAn29jSoGaijAeSdrgbkpK5e5ywmvx1Pk
         DOfgTDxq1tFNV6lfKVK1W6y37AmYgpK5N/hgYkcj1U4vWCAiqOOPnUEJwy3klSvvMKKF
         rNvycdtbp5b1EX8Svx71kYOc0WSu0Z4u57ah00jM1AuS6Gawr9FKJT8qOjXd8Kc9bN+s
         5JwbN8Xy5SJx1OUC++OBTzRXXvrVRJpZOkL71TATtPP/l7Xsp9QL1+uKQAr7RQJ1hT4I
         rP5g==
X-Gm-Message-State: AOJu0Yw9SywrA2/iRffpHZeplpRAow1WU3X3KVAlCjZb7wR4bsz9vP4O
	Go/JEaEJ0xzFhcusm+hZrUcfeVEEOG+h9SPlui4=
X-Google-Smtp-Source: AGHT+IFuhmNx4Vcsjc0pp/RPx7/2jEpCXn6W4vx9g54NXB0QqzmUv+10gKeh4ZYs+ZuQIgyAHBYC+vuUQPQFUZGnP/k=
X-Received: by 2002:a17:90a:fd87:b0:28c:ca39:9aa0 with SMTP id
 cx7-20020a17090afd8700b0028cca399aa0mr3115176pjb.20.1705318284730; Mon, 15
 Jan 2024 03:31:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAABZP2z38Yg+J6veQQxO12rUMroPQM7ZOz=Bg6GTYn5G9r85Qw@mail.gmail.com>
 <e609d522-5652-4622-8e4b-f17c840055d3@gmail.com>
In-Reply-To: <e609d522-5652-4622-8e4b-f17c840055d3@gmail.com>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Mon, 15 Jan 2024 19:31:13 +0800
Message-ID: <CAABZP2zCpcUayo2e1SEyZOXXu=6_25FOUs0rZN-eMreiV_0WrA@mail.gmail.com>
Subject: Re: There is a line missing in the diagram Figure 10.18 and Figure E.7
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank Akira's guidance

On Mon, Jan 15, 2024 at 7:18=E2=80=AFPM Akira Yokosawa <akiyks@gmail.com> w=
rote:
>
> Hi Zhouyi,
>
> On 2024/01/15 15:20, Zhouyi Zhou wrote:
> > Hi Paul and Akira,
> >
> > Our Chinese version editor Yunjing Li points out that there is a line
> > missing in Figure E.7, there should be 7, but Figure E.7 has only 6.
> >
> > Similarly, I found there should be 6 lines in Figure 10.18, but
> > actually it has only 5.
>
> There is a footnote on the uppermost three traces of Figure 10.18,
> which reads:
>
>     You see only two traces? The dashed one is composed of two
>     traces that differ only slightly, hence the irregular-looking
>     dash pattern.
>
> It was added by commit 27dc9fbe7605 ("datastruct: Expand on the
> dash type of traces in Figure 10.19").
> Wouldn't it explain your observation?
Yes, the commit explains why FIgure 10.19 has 6 traces while Figure
E.7 has 7 traces. I will reflect the information to the editor and add
a footnote to Chapter 10.

Thanks, Zhouyi
>
>         Thanks, Akira
>
> >
> > Although I am very glad to fix the above possible bugs, fixing them is
> > beyond my capability.
> >
> > Thanks, Zhouyi
> > Reported-by: Yunjing Li
> > Reported-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
