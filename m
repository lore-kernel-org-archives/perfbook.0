Return-Path: <SRS0=ZHTt=AQ=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682429587; x=1685021587;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kTcHOZXCV1D6YAGYuuEZEMZVMHwxOCLm2r8B0q9yCM=;
        b=fSA5qEO7n4YRUNDK1xtLDuPzP5jMYMWGIOd2JLNogehAK30XH8nPtgHDWVEW4WbUXU
         zs6Hwl0Ny/3B+0o7hRNcHgLkIujT5U87lEL7QxSq9E+CXSeX8/R4okXpV6zOcTgFwbEO
         M++StZadrPHG5FNMOwF0B6q26KrnrBdG5e58814wtlovAVuYcN79PNv5nY2YPCQ74bXr
         TKkiVSGCw9N4JFzea4GzBK31itmUzUiJJvR2fTOxL7Gkn8o//fApLqtUvxH17zb2xcMz
         uOy36If/+uMhkMplY+wNR7hUjgfFQ9xKGdLIZ2YgHoX2uKCbWsSDbtCUeIcfIQ2lBtMq
         RIaQ==
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH] CodeSamples/defer: Make hazard partition consistent with
 hazptr_thread_exit
From: Alan Huang <mmpgouride@gmail.com>
In-Reply-To: <7ea775ac-579c-4b73-8d07-b717f962bd50@paulmck-laptop>
Date: Tue, 25 Apr 2023 21:32:46 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <28115808-37F7-4003-BD8B-E15D12DC6B70@gmail.com>
References: <20230420074030.35246-1-mmpgouride@gmail.com>
 <7ea775ac-579c-4b73-8d07-b717f962bd50@paulmck-laptop>
To: paulmck@kernel.org, akiyks@gmail.com
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

> 2023=E5=B9=B44=E6=9C=8825=E6=97=A5 00:02=EF=BC=8CPaul E. McKenney =
<paulmck@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Thu, Apr 20, 2023 at 07:40:30AM +0000, Alan Huang wrote:
>> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
>> ---
>> CodeSamples/defer/hazptrtorture.h | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/CodeSamples/defer/hazptrtorture.h =
b/CodeSamples/defer/hazptrtorture.h
>> index 29761e3d..acdd532b 100644
>> --- a/CodeSamples/defer/hazptrtorture.h
>> +++ b/CodeSamples/defer/hazptrtorture.h
>> @@ -99,7 +99,7 @@ void *hazptr_read_perf_test(void *arg)
>> {
>> 	int i;
>> 	int me =3D (long)arg;
>> -	int base =3D me * K;
>> +	int base =3D smp_thread_id() * K;
>=20
> Suppose specify a number of threads greater than the number of CPUs.
> For example, on my 12-hardware-thread laptop:
>=20
> ./route_hazptr --stresstest --nreaders 24
>=20
> In that case, don't we want "me" rather than "smp_thread_id()"?

As Akira said, route_hazptr.c includes routetorture.h and route_hazptr.c =
doesn't call hp_record().
The fix won't have any effect on route_hazptr.

Thanks,
Alan

>=20
> 							Thanx, Paul
>=20
>> 	long long n_reads_local =3D 0;
>> 	hazptr_head_t hh;
>> 	hazptr_head_t *hhp =3D &hh;
>> --=20
>> 2.34.1
>>=20

