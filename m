Return-Path: <SRS0=0xZM=77=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680933925;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVb5PTsw88waSLYSl5/Zg9Xx3yTLiM1fcS5tG92Di44=;
        b=CxzFSKIaaVNAMeBo6jCwSln9FFp/v6blmMDu79zueVmiexGR0imh9DovszikXP+5m6
         BwzsAHsQy+psfyEQ4Af2109P1RiRTtCbh5g2Yx4hAx/YME2WeYUrBxac+VVg8TwaxzNK
         hWn1vfl0Kw9mPPhyi5dW7qn+hAX+fsQHNhMaf6TTKZHUdiOffpm7Ukv9Mu5KrAjNemOY
         Mugp9WQ6jfZWcG6YAeKlVWDpCYdDDztA8Cq4JiWl2/Ezl8zKzjj1gx7tmJgXMoQkIcUy
         F2NFiAq+Eji11jzPFMezk94VFViAJVmvIirGNtCIybcTBzQoNbjKYb/0uwue3xUKeh5S
         lRYA==
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH] CodeSamples/count: Remove unnecessary memory barriers
From: Alan Huang <mmpgouride@gmail.com>
In-Reply-To: <71f63305-0d90-1ebf-fa91-0ec33e657904@gmail.com>
Date: Sat, 8 Apr 2023 14:04:43 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <24F30612-5122-44A2-9B96-55EBB9FC45CB@gmail.com>
References: <20230407175813.1334028-1-mmpgouride@gmail.com>
 <71f63305-0d90-1ebf-fa91-0ec33e657904@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: paulmck@kernel.org, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Akira,

Thanks for pointing that out,  I have sent patch v4.

Thanks,
Alan



> 2023=E5=B9=B44=E6=9C=888=E6=97=A5 =E4=B8=8B=E5=8D=8812:25=EF=BC=8CAkira =
Yokosawa <akiyks@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Hi Alan,
>=20
> Maybe I was not clear enough, but there are minor inconsistencies in
> PDF rendering.  Please see below.
>=20
> On Fri,  7 Apr 2023 13:58:13 -0400, Alan Huang wrote:
>> In count_lim_sig.c, there is only one ordering required, that is
>> writing to counter happens before setting theft to THEFT_READY in
>> add_count/sub_count's fast path. Therefore, partial memory barrier
>> will suffice.
>>=20
>> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
>> ---
>> CodeSamples/count/count_lim_sig.c | 10 +++-------
>> count/count.tex                   | 12 ++++++------
>> 2 files changed, 9 insertions(+), 13 deletions(-)
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
>> diff --git a/count/count.tex b/count/count.tex
>> index 8ab67e2e..4c139d63 100644
>> --- a/count/count.tex
>> +++ b/count/count.tex
>> @@ -2425,12 +2425,11 @@ handler used in the theft process.
>> \Clnref{check:REQ,return:n} check to see if
>> the \co{theft} state is REQ, and, if not
>> returns without change.
>> -\Clnref{mb:1} executes a \IX{memory barrier} to ensure that the =
sampling
>> -of the theft variable happens before any change to that variable.
>> \Clnref{set:ACK} sets the \co{theft} state to ACK, and, if
>> \clnref{check:fast} sees that
>> this thread's fastpaths are not running, \clnref{set:READY} sets the =
\co{theft}
>> -state to READY\@.
>> +state to READY, with the release store ensuring any change to =
counter in
>                                                                 =
\co{counter}
>=20
>> +the fastpath happens before the change of theft to READY\@.
>                                             \co{theft}
>=20
>> \end{fcvref}
>>=20
>> \begin{listing}
>> @@ -2595,9 +2594,10 @@ handlers to undertake theft.
>> \Clnref{barrier:3} again disables compiler reordering, and then
>> \clnref{check:ACK}
>> checks to see if the signal handler deferred the \co{theft}
>> -state-change to READY, and, if so, \clnref{mb} executes a memory
>> -barrier to ensure that any CPU that sees \clnref{READY} setting =
state to
>> -READY also sees the effects of \clnref{add:f}.
>> +state-change to READY, and, if so, \clnref{READY} changes theft to
>                                                             \co{theft}
>=20
>> +READY with the release store ensuring that
>> +any CPU that sees the READY state also sees the effects
>> +of \clnref{add:f}.
>> If the fastpath addition at \clnref{add:f} was executed, then
>> \clnref{return:fs} returns
>> success.
>=20
> With those addressed,
>=20
> Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
>=20
>        Thanks, Akira

