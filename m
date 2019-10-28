Return-Path: <SRS0=lrlX=YV=gmail.com=xiaonan830818@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jPPTioNn/icL4amNjjCr1Uxltkw+949jMJJB05Y0xTI=;
        b=j+WCMaVuEfdAadjkyXpjU9krRRMjX1cNwOrOpg+8Jp/ieiuBf+AKblYxSwm1hAPHll
         VvxJBGIETCr2amgfULf/JgXWrzNDqClXcMa83QTz2CVKnirJs7IHBHA3a6Q40cqIbls0
         6xjAMooH7/SwyUT4VlcPH0ck0yLZf5NE3TXPfb7cCBjoEOwwICZlcVPDEUhFBwbZY8nG
         Wp9rnFty91JI+OIDWdkudReSFlwMFIX0Z1B4eX9PVsXo68NpeQRtQSzY4uMj+UKijTY6
         rbMt4szcJGKZiDENqmNYlM4LyGyv1IZ8vKnacNS5UM9YHViA3Jhevpu0W4h1GDxmg1i7
         0cJw==
MIME-Version: 1.0
References: <CA+MhoaNUYKgS02EOjNGQi1+5D_Uzw4aWf2_y_gxtBF9ZU8muKA@mail.gmail.com>
 <6622b6a2-b23a-b72f-8ab8-bf38e39d2bc8@gmail.com> <20191027171103.GH4465@paulmck-ThinkPad-P72>
In-Reply-To: <20191027171103.GH4465@paulmck-ThinkPad-P72>
From: Nan Xiao <xiaonan830818@gmail.com>
Date: Mon, 28 Oct 2019 10:47:49 +0800
Message-ID: <CA+MhoaNOkgWTR7zw8ge_Zyj1h6MVAmy3=FAWQpx016D9exrBhQ@mail.gmail.com>
Subject: Re: Question about volatile usage
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: paulmck@kernel.org
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Akira & Paul,

Thanks very much for your time and explanation!

Best Regards
Nan Xiao

On Mon, Oct 28, 2019 at 1:11 AM Paul E. McKenney <paulmck@kernel.org> wrote=
:
>
> On Sun, Oct 27, 2019 at 11:45:07AM +0900, Akira Yokosawa wrote:
> > (Added explicit CC: to Paul)
> >
> > Hello!
> >
> > On Fri, 25 Oct 2019 21:32:35 +0800, Nan Xiao wrote:
> > > Hi Paul and perfbook members,
> > >
> > > Greetings from me!
> > >
> > > I have a question about 4.3.4.2 A Volatile Solution:
> > >
> > >> To summarize, the volatile keyword can prevent load tearing and stor=
e tearing in cases where the loads and stores are machine-sized and properl=
y aligned. It can also prevent load fusing, store fusing, invented loads, a=
nd invented stores. However, although it does prevent the compiler from reo=
rdering volatile accesses with each other, it does nothing to prevent the C=
PU from reordering these accesses. Furthermore, it does nothing to prevent =
either compiler or CPU from reordering non-volatile accesses with each othe=
r or with volatile accesses. Preventing these types of reordering requires =
the techniques described in the next section.
> > >
> > > Does this summary apply for both C and C++? Or C only=EF=BC=9F
> >
> > IIUC, it applies to both C and C++.
> >
> > There is an article on LWN (Linux Weekly News) based on this section at=
:
> >
> >     https://lwn.net/Articles/793253/
> >
> > The article and comments from readers there might be of your interest.
> >
> > If your main concern is application code developed on modern C/C++ comp=
ilers
> > (C11/C++11 or later), it might be a good idea to use standard language
> > features which support concurrent code rather than to use volatile/vola=
tile
> > casting.  (There can be changes in C/C++ standards in future, though.)
> >
> > Annotation of racy accesses by READ_ONCE()/WRITE_ONCE() to prevent
> > compiler optimizations can be seen as abusing of volatile from the
> > view point of compiler developers. But it survives generations of
> > compilers (with occasional regression reported as bugs in compiler
> > optimization).
>
> All good points!
>
> And one reason that volatile survives is that it absolutely must have
> certain properties in order for device drivers to work, and none of our
> modern computing infrastructure will work without device drivers.
>
>                                                         Thanx, Paul
>
> >         Thanks, Akira
> >
> > >
> > > Thanks very much in advance!
> > >
> > > Best Regards
> > > Nan Xiao
> > >
> >
