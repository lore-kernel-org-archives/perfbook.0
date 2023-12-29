Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA16D14F63
	for <perfbook@vger.kernel.org>; Fri, 29 Dec 2023 23:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="faP95vaQ"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6da47688fd9so335689b3a.0
        for <perfbook@vger.kernel.org>; Fri, 29 Dec 2023 15:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703891767; x=1704496567; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wKrm9upm3IO6trLtonGa3WTXA/r6fvMY62QplhIoyk=;
        b=faP95vaQ/8a1xZASaAR35W4vvluTolLY3M+CTXsMW1OCYV/DLu0eA0RvPDCf5PEZga
         06HONbp2T89jXuQGXZY2kI2BDduG3YfwzUZBKHzkOPlc4B+gAag/nHLhohJ75PufLEim
         sbNSX9g3dii4GzNESd9Ip64sERBpwNbqTq6kLknFt6ALJHplrpfh0B1+w+BGTykZpd1Y
         xRaemUSsgy6V13n6oND7IsNljv6JyR2YpNac+lXOxNL3VC5xCeZTH+MCEfNrd9svKFna
         NvW8J3TEUKcfVBskzypE4g6/TBrhhuqG2biLopp4UFqU7A/nBQviq7TB1xoVJGF1PQZ8
         hvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703891767; x=1704496567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0wKrm9upm3IO6trLtonGa3WTXA/r6fvMY62QplhIoyk=;
        b=HLcetCT++4xgbdUXAa5UU1FU2BXms8jOn/18dq81g1CWglM/Hv4WXxrIotKcsOjIVI
         iBsF1hBoSUjaQv4/z7hOQyrGfA9NugfL/v9r2ETSMouJx4ohUQ/jKfiKNGtIlXp1McRP
         QfbJs5gU4htk6NvvHjAPEivv8RmVW2c7oWmBeUttl4kyGQATXaie4YMQ5ZhWV4ePsLzz
         9ihTHfl3P4xQd3AVSJYzQX1Kj0FlceJ+o75AOy7zSkSkSkfLMj4gWvGpkcoJnFtpPrAc
         HQ9SfjIEMoJ/NAB5NVHiHIjUIBqaiQ4+zO+kqK4VH0KReNr4b4J8kZWM5AN5ogNz2D+C
         ureQ==
X-Gm-Message-State: AOJu0Yw0EaAETt7pNgJ033qRDPXcplph5GY8DqHoPJFD6muudjm8GnYv
	4tpTFdSC8F+i17Zz+IByueRSghN/eoJVmuf5tgSeCFyr
X-Google-Smtp-Source: AGHT+IGtIpgz+iFyXhsLs5ZUFi/bt/CRcFia6u0asTPqXhd6lEa5Gcu/b6NiY1TWsGa9eqfIkr2Wdlz5Ux5EPdwWltw=
X-Received: by 2002:a05:6a00:88f:b0:6da:5886:843a with SMTP id
 q15-20020a056a00088f00b006da5886843amr438800pfj.64.1703891766894; Fri, 29 Dec
 2023 15:16:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1703735700-611-1-git-send-email-zhouzhouyi@gmail.com> <1b63ce71-8fad-4f43-9ccf-f857f6604c1e@paulmck-laptop>
In-Reply-To: <1b63ce71-8fad-4f43-9ccf-f857f6604c1e@paulmck-laptop>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Sat, 30 Dec 2023 07:15:56 +0800
Message-ID: <CAABZP2zMfHzY1wBEXTk4Q_ZtoMt8EU1_mCBE-y1FcJcqbfS_TQ@mail.gmail.com>
Subject: Re: [PATCH -perfbook] cpu: make Quick Quiz 3.6 more explicit
To: paulmck@kernel.org
Cc: akiyks@gmail.com, perfbook@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 30, 2023 at 7:09=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Thu, Dec 28, 2023 at 11:55:00AM +0800, zhouzhouyi@gmail.com wrote:
> > From: Zhouyi Zhou <zhouzhouyi@gmail.com>
> >
> > Rewrite Quick Quiz 3.6 for clarity and explicitness, so that the
> > firsttime reader know that another choice is CPU 0 sharing a core
> > with CPU 1.
> >
> > Signed-off-by: Zhouyi Zhou<zhouzhouyi@gmail.com>
> > ---
> > hi Paul and Akira
> >
> > This minor fix is also reported by our Chinese version editor
> > Yunjing Li.
>
> I have pulled this in, thanks to both you and the editor!  Would it be
> appropriate to have the editor's reported-by?  (I trust your judgment
> on this.  I am only asking, not in any way suggesting a change.)
I think I should have the editor's report-by, but she is too modest to
offer her email-address,
because she thinks this is her job.

Could we add reported-by without an email address ? ;-)

Thanx, Zhouyi
>
>                                                         Thanx, Paul
>
> > Thanks
> > Zhouyi
> > --
> >  cpu/overheads.tex | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/cpu/overheads.tex b/cpu/overheads.tex
> > index 1ee9c52f..a2ec2998 100644
> > --- a/cpu/overheads.tex
> > +++ b/cpu/overheads.tex
> > @@ -262,7 +262,8 @@ CAS and lock, respectively.
> >  \QuickQuiz{
> >       \Cref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socke=
t System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
> >       shows CPU~0 sharing a core with CPU~224.
> > -     Shouldn't that instead be CPU~1???
> > +     However, isn't it more logical for CPU 0
> > +     to share a core with CPU 1 instead of CPU 224???
> >  }\QuickQuizAnswer{
> >       It is easy to be sympathetic to this view, but the file
> >       \path{/sys/devices/system/cpu/cpu0/cache/index0/shared_cpu_list}
> > --
> > 2.34.1
> >
