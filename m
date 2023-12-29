Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F1814F63
	for <perfbook@vger.kernel.org>; Fri, 29 Dec 2023 23:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5/dqDaq"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-203ae9903a6so3941397fac.0
        for <perfbook@vger.kernel.org>; Fri, 29 Dec 2023 15:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703894221; x=1704499021; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSnPHA/ouaktKnJ1Wdmt4hwQ0LWLUUcm9b9OADg7waE=;
        b=j5/dqDaq/fWNENS0Nnaphjt4bE4ZN0kBYGMBCa1Ob9E9ybLdlKYsXgGhCFTeBiACcD
         98L9FfJ51eSQai6bzZ+TzlHcoZH9sCFI6ov7fU2AiNKORXxEqNFV96LrZrUHe7Weimbn
         O8/lLVseu3UwiP9j73KmWpVhaOF84y3ZpYrFOPAztKRX1/UWLHZJT/NfipzVfbNHXAln
         kMGIQ9mWG98oyex28oqubj17bkZAkgzG+bgKhstU9/UDQ4gBh6ilnGOrgx59o+YFubDW
         NNhcN2bPek5YIb/J5qo20dNfZFm4P7JUNtjn06R7WWJZjcSnPIV8aA2Qj+qcfvxilUzx
         /1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703894221; x=1704499021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iSnPHA/ouaktKnJ1Wdmt4hwQ0LWLUUcm9b9OADg7waE=;
        b=TyzeYdxB7IjYQT8fhhj8QvhR750jQP9rOToJ+iAwbkTmoiavt86a5FKxHe/mlwK01D
         P8bzHYUNOtOwj2skuYyWjhMOZYHiYskt+RwNTNOOTlQn7nns1Di5ewF9rLsJ5KcejHN+
         rjlkZNWp6LjcepBzs6LCa8KPsDvnp8p+Tl97YovQo6CGlxz20FxQpGaJ/B6xfYonZGZC
         caH4TYLq7/pWyg0ZAc4U0zzHN5nRieTGxipI4RFdEWMg0ZkBhJ72oQqYxPqruv8EfWBo
         cntb7zBbKWWM8SVsDG2kPNFg5shzKQ214Z3EfKGAgihsSy9UBXWaTu+s9Q9bIVrc0r/f
         MGxA==
X-Gm-Message-State: AOJu0Ywbe2rGyd0Y4+PPvg60qP38IxA+TYDbFnqQc6TVO2lqOHQpvtnG
	YCQYlHiNxBbwTpWka0kSaRdIWBKL3A/6PlXpg2WpdQBh
X-Google-Smtp-Source: AGHT+IGRS7SH6ETmA4NBz1bzmnHi2ViTIBAdZ8GbxX6avGiUD7mLvifAF3/IA0LCfRMdOOa+gSOKR8muhbPq3b/iE74=
X-Received: by 2002:a05:6870:3308:b0:203:6d48:cf9f with SMTP id
 x8-20020a056870330800b002036d48cf9fmr10209823oae.79.1703894221187; Fri, 29
 Dec 2023 15:57:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1703735700-611-1-git-send-email-zhouzhouyi@gmail.com>
 <1b63ce71-8fad-4f43-9ccf-f857f6604c1e@paulmck-laptop> <CAABZP2zMfHzY1wBEXTk4Q_ZtoMt8EU1_mCBE-y1FcJcqbfS_TQ@mail.gmail.com>
 <6bbba502-bb0b-42fa-a77a-f86cee8f93c3@paulmck-laptop>
In-Reply-To: <6bbba502-bb0b-42fa-a77a-f86cee8f93c3@paulmck-laptop>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Sat, 30 Dec 2023 07:56:50 +0800
Message-ID: <CAABZP2wzPWy07CHeRS+aL9HZ6Hc8SMJOOvetaGzeDtTnRe7KPg@mail.gmail.com>
Subject: Re: [PATCH -perfbook] cpu: make Quick Quiz 3.6 more explicit
To: paulmck@kernel.org
Cc: akiyks@gmail.com, perfbook@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 30, 2023 at 7:22=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Sat, Dec 30, 2023 at 07:15:56AM +0800, Zhouyi Zhou wrote:
> > On Sat, Dec 30, 2023 at 7:09=E2=80=AFAM Paul E. McKenney <paulmck@kerne=
l.org> wrote:
> > >
> > > On Thu, Dec 28, 2023 at 11:55:00AM +0800, zhouzhouyi@gmail.com wrote:
> > > > From: Zhouyi Zhou <zhouzhouyi@gmail.com>
> > > >
> > > > Rewrite Quick Quiz 3.6 for clarity and explicitness, so that the
> > > > firsttime reader know that another choice is CPU 0 sharing a core
> > > > with CPU 1.
> > > >
> > > > Signed-off-by: Zhouyi Zhou<zhouzhouyi@gmail.com>
> > > > ---
> > > > hi Paul and Akira
> > > >
> > > > This minor fix is also reported by our Chinese version editor
> > > > Yunjing Li.
> > >
> > > I have pulled this in, thanks to both you and the editor!  Would it b=
e
> > > appropriate to have the editor's reported-by?  (I trust your judgment
> > > on this.  I am only asking, not in any way suggesting a change.)
> > I think I should have the editor's report-by, but she is too modest to
> > offer her email-address,
> > because she thinks this is her job.
> >
> > Could we add reported-by without an email address ? ;-)
>
> We could just add a line saying something like:
>
>         This change was identified by XXX YYYYY in the course of
>         translating the book to Chinese.
>
> Or something similar.  What would our editor like best?
>
> For another option, I do sometimes do "Reported-by: LWN user xxxx"
> or similar.
Thank Paul for your wonderful suggestion!
I guess our editor will like the first option best ;-)
I will send a new version of patch soon.

Thanks, Paul
>
>                                                         Thanx, Paul
>
> > Thanx, Zhouyi
> > >
> > >                                                         Thanx, Paul
> > >
> > > > Thanks
> > > > Zhouyi
> > > > --
> > > >  cpu/overheads.tex | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/cpu/overheads.tex b/cpu/overheads.tex
> > > > index 1ee9c52f..a2ec2998 100644
> > > > --- a/cpu/overheads.tex
> > > > +++ b/cpu/overheads.tex
> > > > @@ -262,7 +262,8 @@ CAS and lock, respectively.
> > > >  \QuickQuiz{
> > > >       \Cref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-S=
ocket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
> > > >       shows CPU~0 sharing a core with CPU~224.
> > > > -     Shouldn't that instead be CPU~1???
> > > > +     However, isn't it more logical for CPU 0
> > > > +     to share a core with CPU 1 instead of CPU 224???
> > > >  }\QuickQuizAnswer{
> > > >       It is easy to be sympathetic to this view, but the file
> > > >       \path{/sys/devices/system/cpu/cpu0/cache/index0/shared_cpu_li=
st}
> > > > --
> > > > 2.34.1
> > > >
> >
