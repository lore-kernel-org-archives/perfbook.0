Return-Path: <SRS0=B+67=6E=gmail.com=leobras.c@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s4xpsolYILhK/8f0cB+ASJ3QVWi6kA/2c9zlg0Mgkwc=;
        b=mWmPM94RJ1jW3DTy7IG8jbM0Ngx+aAYEtYaGdDfngxzBnJ++ijG4lrh8opwXURyjIX
         lkEtINeyXYioQru7EupABOaNydtSf63kNpGGtIuI39uybexGj1zzkTzSM2FyG8IDfvdF
         gKbkYQQgPubXRCRdgpartPNwuGJtBCakJG7fmjTlvoMDGfHyFiNqt9wdTTvJnnriymyI
         mBWYscrxPSMZtTt/0OQt9rus4jEoeiR0p/e4u9StWnqdcySTVhsLDIblejqIzQmwe2xI
         F4oRr66fwWJBkPsL8C0f1fIAw45d2u8Wm8Lnm14QqtQi2b0xbcePmI+Le/RlHxKHtVBn
         aPkw==
Message-ID: <40000f10bef0d6e76e0ebaea9637858ac6757316.camel@gmail.com>
Subject: Re: Question about Table E.1
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Date: Wed, 08 Feb 2023 02:50:03 -0300
In-Reply-To: <20230208034102.GG2948950@paulmck-ThinkPad-P17-Gen-1>
References: <fba1fe891b65449475c1e4e9abee2d3337c1567c.camel@gmail.com>
	 <20230208034102.GG2948950@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Tue, 2023-02-07 at 19:41 -0800, Paul E. McKenney wrote:
> On Wed, Feb 08, 2023 at 12:07:20AM -0300, Leonardo Br=C3=A1s wrote:
> > Hello Paul,
> >=20
> > I have been reading the book, until I stumbled on Quick Quiz 3.7,
> > Table E.1: Performance of Synchronization Mechanisms
> > on 16-CPU 2.8 GHz Intel X5550 (Nehalem) System
> >=20
> > <Copying from source, since the PDF is a little tricky>
> >=20
> > The first part looks like:
> >=20
> >         Clock period            &           0.4 &           1.0 \\
> >         Same-CPU CAS            &          12.2 &          33.8 \\
> >         Same-CPU lock           &          25.6 &          71.2 \\
> >         Blind CAS               &          12.9 &          35.8 \\
> >         CAS                     &           7.0 &          19.4 \\
> > =20
> > In this case, what would be the last lines "Blind CAS" and "CAS" referr=
ing to ?=20
> >=20
> > (For a second I thought it could be "In-Core Blind CAS" and "In-Core CA=
S" like
> > in Table 3.1, but that would not make sense: This "CAS" is faster than =
the
> > previous "Same-CPU CAS". )
>=20
> I was surprised myself, but those measurements are quite real.  My best
> guess is that the two threads in the core are able to overlap their
> accesses, while the single CPU must do everything sequentially.

IMHO This phrase would look great as a footnote for this page, clearing any
question like mine. What do you think about it?

>=20
> Strange, but whatever the reason, true!  ;-)
>=20
> 							Thanx, Paul

