Return-Path: <SRS0=B+67=6E=gmail.com=leobras.c@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q9pIUW9167v1ucWWQw/8I7d/Lm9v6qj26ZVgpRpeWqE=;
        b=Svh5PMOjqujDcOtsGEDZuqK5iaVzk5TyXZdHfjzFUTLekZGH84T13NbMA8xSjrPc28
         vtC7ZH1xxHPzMpOHGr2phUe5VqrKUYcCKbyj+Zy6ef84D/2zkbFmiSYeIcuAevZBWLhA
         ycQyStRJRehVJNkwZzC2Q7KKXJSutPIHOrGpY5uea4IFz0SBnZK2U1Wxpp2AarxsjojF
         fhEgXfHVgjI+Sd00nQHnYpQ2OL7jDuk4jfoJT07V9ygjFZpI/dVBVBBqhFPeZYCvQ5E+
         jdTLA82IQX9ZhHXl45lGTqaR/gHqBbCcQd8E243ppj1o4bKRYc42JrGUBKNJv7Dhu+Bl
         Yb+w==
Message-ID: <aa9a88f35a329b2ddc43def8ff790b6928c0e40a.camel@gmail.com>
Subject: Re: Question about Table E.1
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Date: Wed, 08 Feb 2023 02:33:33 -0300
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
>=20
> Strange, but whatever the reason, true!  ;-)

Yeah, even more strange is that in this case Blind CAS was actually slower =
than
CAS. Anyway, your suggestion on overlapping accesses make sense.

I want to suggest a change, but it's easier to discuss this over a patch.

>=20
> 							Thanx, Paul

Thank you!
Leo
