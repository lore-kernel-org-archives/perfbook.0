Return-Path: <SRS0=ejJd=75=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680798568;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dsOMMDA0QrRpyKUt3pNPmDe45Ix3Ast0/dnEnXgJt8=;
        b=QT45p7mWyV5XhAFejuzgUJjSqS6IyViBAE2ouwde+OmSehBtkpV5gp4T/Y6rwK4lEH
         4WHgJw6SboNQQSu6k60XeAR7PmAsBDiTUZZ8mdC6f3KyPcVuAII4lP9AmMM6nIh97OiX
         jDhSLBsqA9uJdqIute3iJdXUTKLAKueW+fFuNPW2O31cLplE+ZPmCwSN0IN5ee3CzKgE
         sF61tfgAq2icUv7q0W6zBBGrAmeifyZfaTWSKaI4FBej1QT7d35+u65UdTZt6WQ4u9fu
         V5XF5o225OAT9mNzYZNht2l0vO7vzjc+8phowGmozWxrX3SuLF0mgpfZdxHleVeU6XD6
         qqwQ==
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v2] CodeSamples/count: change full memory barrier to
 partial one
From: Alan Huang <mmpgouride@gmail.com>
In-Reply-To: <653947fc-3846-32a5-4386-35abd39b792b@gmail.com>
Date: Fri, 7 Apr 2023 00:29:21 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <974D932F-4061-4189-B29B-B7A1C1E6868D@gmail.com>
References: <20230404164753.1317498-1-mmpgouride@gmail.com>
 <653947fc-3846-32a5-4386-35abd39b792b@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: paulmck@kernel.org, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Akira,

> Do you have a good reasoning why the pair of smp_mb()s can be safely
> replaced with the single smp_store_release() ?

When the signal handler is running, there is only one thread waiting on =
the while loop in flush_local_count,
which means we only need to synchronize with that thread, and that =
thread only cares the THEFT_READY status,
we just need to make sure after that thread seeing theft equals =
THEFT_READY, it can also see the changes to counter.

And because the signal handler is running on the interrupted thread, we =
don=E2=80=99t need any memory barrier.

Please correct me if I'm wrong.

Thanks,
Alan

> 2023=E5=B9=B44=E6=9C=886=E6=97=A5 =E4=B8=8B=E5=8D=8810:33=EF=BC=8CAkira =
Yokosawa <akiyks@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Tue,  4 Apr 2023 12:47:53 -0400, Alan Huang wrote:
>> The original memory barriers in count_stat_eventual.c ensure
>> writing to global_count happens before writing to stopflag and
>> reading from stopflag happens before later reading from global_count.
>>=20
>> Thus, smp_load_acquire and smp_store_release will suffice.
>>=20
>> In count_lim_sig.c, there is only one ordering required, that is
>> writing to counter happens before setting theft to THEFT_READY in
>> add_count/sub_count's fast path. Therefore, partial memory barrier
>> will suffice.
>=20
> Hi Alan,
>=20
> My comment on count_lim_sig.c here.  See below
>=20
>>=20
>> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
>> ---
>> CodeSamples/count/count_lim_sig.c       | 10 +++-------
>> CodeSamples/count/count_stat_eventual.c |  6 ++----
>> count/count.tex                         |  9 ++++-----
>> 3 files changed, 9 insertions(+), 16 deletions(-)
>>=20
>> diff --git a/CodeSamples/count/count_lim_sig.c =
b/CodeSamples/count/count_lim_sig.c
>> index 59da8077..c2f61197 100644
>> --- a/CodeSamples/count/count_lim_sig.c
>> +++ b/CodeSamples/count/count_lim_sig.c
>> @@ -56,12 +56,10 @@ static void flush_local_count_sig(int unused)	=
//\lnlbl{flush_sig:b}
>> {
>> 	if (READ_ONCE(theft) !=3D THEFT_REQ)	=
//\lnlbl{flush_sig:check:REQ}
>> 		return;				=
//\lnlbl{flush_sig:return:n}
>> -	smp_mb();				//\lnlbl{flush_sig:mb:1}
>> 	WRITE_ONCE(theft, THEFT_ACK);		=
//\lnlbl{flush_sig:set:ACK}
>> 	if (!counting) {			=
//\lnlbl{flush_sig:check:fast}
>> -		WRITE_ONCE(theft, THEFT_READY);	=
//\lnlbl{flush_sig:set:READY}
>> +		smp_store_release(&theft, THEFT_READY);	=
//\lnlbl{flush_sig:set:READY}
>> 	}
>> -	smp_mb();
>> }						//\lnlbl{flush_sig:e}
>=20
> You see, this a signal handler.
> It can interrupt anywhere in normal threads.
>=20
> That is why you see a lot of barrier() calls in updater functions.
>=20
> This code has no assumption on memory barriers around signal handlers.
>=20
> So, I'd rather keep smp_mb()s in this function.
>=20
> Do you have a good reasoning why the pair of smp_mb()s can be safely
> replaced with the single smp_store_release() ?
>=20
>>=20
>> static void flush_local_count(void)			=
//\lnlbl{flush:b}
>> @@ -125,8 +123,7 @@ int add_count(unsigned long delta)			=
//\lnlbl{b}
>> 	WRITE_ONCE(counting, 0);			=
//\lnlbl{clearcnt}
>> 	barrier();					=
//\lnlbl{barrier:3}
>> 	if (READ_ONCE(theft) =3D=3D THEFT_ACK) {		=
//\lnlbl{check:ACK}
>> -		smp_mb();				//\lnlbl{mb}
>> -		WRITE_ONCE(theft, THEFT_READY);		//\lnlbl{READY}
>> +		smp_store_release(&theft, THEFT_READY);		=
//\lnlbl{READY}
>> 	}>  	if (fastpath)
>> 		return 1;				=
//\lnlbl{return:fs}
>> @@ -164,8 +161,7 @@ int sub_count(unsigned long delta)
>> 	WRITE_ONCE(counting, 0);
>> 	barrier();
>> 	if (READ_ONCE(theft) =3D=3D THEFT_ACK) {
>> -		smp_mb();
>> -		WRITE_ONCE(theft, THEFT_READY);
>> +		smp_store_release(&theft, THEFT_READY);
>> 	}
>> 	if (fastpath)
>> 		return 1;
>=20
> These changes in updater functions look good to me.
> I'm stopping here.  Let's reach a consensus on code changes first.
>=20
>        Thanks, Akira
>=20
> [...]
>=20

