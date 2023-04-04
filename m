Return-Path: <SRS0=naJo=73=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680621267;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVsu4Yxz+r/gIKBAMo5jt8w21xzN9TqeaWkDG2PsDKU=;
        b=eD8FLOmYMorXI1Xv3kIkxLC3taEfgOCHvtux1W8kAGLERzRXh/l6/83OcVyfAXlmDx
         mFwctf5yxbc8iIww75T4Vr/R0R4AJv3uKu9l55NTvh3cQiXJFHGaVbro94zorsdGCFRi
         wOxnMiMpnB6wHSK+fcQDKzlFJUirTbrGZHbU/tNj2HA1pP+FByw5GbcvxAvo/vytrl6X
         T25zflQhxI6md778W4GuuLifsBEZNX6HTGC3kllgsMpVTyPfv+tpcN2pOpPFRSd6eYpe
         FD2F7hi0lDXGVSa20gVkYnIrX4a+fFPvH4Ve6xoJSr6xVFZr0Z2vC4KGdGb7X5HIjGGi
         6Xxg==
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH] CodeSamples/count: change full memory barrier to partial
 one
From: Alan Huang <mmpgouride@gmail.com>
In-Reply-To: <c84751a3-3237-a3f3-3c60-5d1caaff19db@gmail.com>
Date: Tue, 4 Apr 2023 23:14:12 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <CB055288-6725-4518-A34A-0B75CDD1BC1E@gmail.com>
References: <20230404051921.1305092-1-mmpgouride@gmail.com>
 <c84751a3-3237-a3f3-3c60-5d1caaff19db@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, paulmck@kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Akira,

Thanks for your advice!

I=E2=80=99ll try to fix that.

Thanks,
Alan

> 2023=E5=B9=B44=E6=9C=884=E6=97=A5 =E4=B8=8B=E5=8D=887:28=EF=BC=8CAkira =
Yokosawa <akiyks@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Hi Alan,
>=20
> Thanks for your continued efforts.
> Unfortunately, I (as a LaTeX adviser) see a couple of problems.
> Please see below.
>=20
> On Tue,  4 Apr 2023 01:19:21 -0400, Alan Huang wrote:
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
>>=20
>> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
>> ---
>> CodeSamples/count/count_lim_sig.c       | 10 +++-------
>> CodeSamples/count/count_stat_eventual.c |  6 ++----
>> 2 files changed, 5 insertions(+), 11 deletions(-)
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
>=20
> Removing a line that has //\lnlbl{foo} from a code snippet will cause
> warnings of "Reference ... undefined on ...".
>=20
> I think you will see warnings that look like:
>=20
>    ----- Excerpt around remaining warning messages -----
>    [63]
>    <count/sig-theft.pdf, id=3D5442, 172.645pt x 234.8775pt>
>    File: count/sig-theft.pdf Graphic file (type pdf)
>    <use count/sig-theft.pdf>
>    Package pdftex.def Info: count/sig-theft.pdf  used on input line =
2303.
>    (pdftex.def)             Requested size: 172.64456pt x 234.87692pt.
>     [64 <./count/sig-theft.pdf>] =
(./CodeSamples/count/count_lim_sig@data.fcv)
>=20
>    LaTeX Warning: Reference =
`ln:count:count_lim_sig:migration:flush_sig:mb:1' on p
>    age 65 undefined on input line 2428.
>=20
>    [...]
>=20
> You need to update text-side references to the to-be-removed label.
> You will likely need to adjust wording in surrounding text as well.
>=20
> If you are wondering how these labels in code snippets can be
> referenced from LaTeX sources, please see Appendix D.3.1.1.
>=20
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
>=20
> Ditto.
>=20
> Can you submit a v2 including text-side updates?
>=20
> In the meantime, I'll review your code changes.
>=20
>        Thanks, Akira
>=20
>=20
>> -		WRITE_ONCE(theft, THEFT_READY);		//\lnlbl{READY}
>> +		smp_store_release(&theft, THEFT_READY);		=
//\lnlbl{READY}
>> 	}
>> 	if (fastpath)
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
>> diff --git a/CodeSamples/count/count_stat_eventual.c =
b/CodeSamples/count/count_stat_eventual.c
>> index 967644de..7157ee0e 100644
>> --- a/CodeSamples/count/count_stat_eventual.c
>> +++ b/CodeSamples/count/count_stat_eventual.c
>> @@ -51,8 +51,7 @@ void *eventual(void *arg)				=
//\lnlbl{eventual:b}
>> 		WRITE_ONCE(global_count, sum);
>> 		poll(NULL, 0, 1);
>> 		if (READ_ONCE(stopflag)) {
>> -			smp_mb();
>> -			WRITE_ONCE(stopflag, stopflag + 1);
>> +			smp_store_release(&stopflag, stopflag + 1);
>> 		}
>> 	}
>> 	return NULL;
>> @@ -73,9 +72,8 @@ void count_init(void)					=
//\lnlbl{init:b}
>> void count_cleanup(void)				=
//\lnlbl{cleanup:b}
>> {
>> 	WRITE_ONCE(stopflag, 1);
>> -	while (READ_ONCE(stopflag) < 3)
>> +	while (smp_load_acquire(&stopflag) < 3)
>> 		poll(NULL, 0, 1);
>> -	smp_mb();
>> }							=
//\lnlbl{cleanup:e}
>> //\end{snippet}

