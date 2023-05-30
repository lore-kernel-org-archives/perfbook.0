Return-Path: <SRS0=hS86=BT=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685458981; x=1688050981;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZfAcJ95lG1tVw4RS0UNTry0slaJt9xujeNMHU5JQEw=;
        b=hXDMdyk9ipVnK4joVv5IrVvRbl2ulldUzRTBwoCtmJGE6Ne2AfbJDS1nKBxVhMwW4h
         zpC8+v3lCj6SYgCpYOmJtAPtnsPgHUU2vPI6rSh0aup4U7CGgMgVwMBpxs+1I/Fa+fsk
         lR3Fy+ke2pUe2Spvz6x3PZShG4ElohyUgObJYx61WZ+cIkFhBWeYwjVN8Y07+Cs7+Vxt
         REQQ+SqHdmuPPFDgC3pbX9MsnUs40Sqv0s/HJjF/SWnPtitQYYfrFuANdM7zOBJNtDNN
         kmsjLEAj1cypt7T3GvU8Q4rfPin56pWbHdBRzcje50MpvPUqNHnGkMZZRDnwnwHdiLAn
         /3AQ==
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: Question: In what circumstances would the enqueuer fail?
From: Alan Huang <mmpgouride@gmail.com>
In-Reply-To: <451e4440-b315-451b-a0ec-e211b219b724@paulmck-laptop>
Date: Tue, 30 May 2023 23:02:45 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <8F0AE999-C5FC-4AD2-B11D-5E9986AB1440@gmail.com>
References: <BC1D7582-8D92-411D-8E61-68252413A1BA@gmail.com>
 <451e4440-b315-451b-a0ec-e211b219b724@paulmck-laptop>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>


> 2023=E5=B9=B45=E6=9C=8830=E6=97=A5 08:36=EF=BC=8CPaul E. McKenney =
<paulmck@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Tue, May 30, 2023 at 12:48:33AM +0800, Alan Huang wrote:
>> Hi,
>>=20
>> I=E2=80=99m reading 14.2.1.3 Half-NBS Queue, there is one sentence =
says:
>>=20
>> The enqueuer might have failed between lines 9 and 10 of the listing, =
so that the element in question is only partially enqueued.
>>=20
>> My question is: In what circumstances would the enqueuer fail between =
lines 9 and 10 ?
>=20
> The following circumstances would do it:
>=20
> o Someone kills the thread at that point.
>=20
> o The CPU that the thread is running on takes an interrupt,
> but there is an infinite-loop bug in the interrupt handler,
> so that the thread's execution is never resumed.
>=20
> o The CPU that the thread is running on fail-stops, again
> preventing that thread from resuming.  (This is rare, but
> does occasionally happen, especially on old or thermally
> abused hardware.)
>=20
> So nothing normal, if that is what you are asking.  ;-)

Yeah, nothing normal. I often neglect to consider these exceptional =
cases.

Thank you for the explanation!

Thanks,
Alan

>=20
> Thanx, Paul

