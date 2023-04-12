Return-Path: <SRS0=k9bS=AD=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681262120;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFFRD9deRua5r507Un+BXVM/HC0U0vX7AuEpUlXK/Vc=;
        b=NZzAD9gciNrmrHslLBOEAdKB7GYFiqwk+jsiSO8VYtWPBmMuAH4tgJR6Yig1W2l2mH
         kkA+swYKTffgA7K9oNlXgwmMdz9T3ZYVaiaRlTJwCE+ey3XcdwYi/7tmbS+27Zj5vWrA
         hN/7imrvVGUpBleKZnv81vrTdg5kfXQdXqznHALn/R7R+tumGZUy5vFpLA9qWbLdzMeq
         F/M9C4ICWDvaDw0P1C1Mz0HmY2S9EpIpJ690+HaOGZBEBk4grjauFLNK9eEfOCIA5AEI
         JlsQTSZbzieiRZiE3bcJhWtKPTJ0hCrknsglr5PdHnXoZWlnvAAjwnEOGnGphdwMI5bg
         mxyQ==
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH] SMPDesign: Remove duplicate item
From: Alan Huang <mmpgouride@gmail.com>
In-Reply-To: <ee5d3aff-58ef-85a4-ee0f-9ce8fbe7bfd8@gmail.com>
Date: Wed, 12 Apr 2023 09:15:12 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <DAB6D77C-C34D-4F12-A589-63F42648E1C2@gmail.com>
References: <20230411162805.1343469-1-mmpgouride@gmail.com>
 <ee5d3aff-58ef-85a4-ee0f-9ce8fbe7bfd8@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, paulmck@kernel.org
List-ID: <perfbook.vger.kernel.org>

>> -	Similarly, the greater the desired efficiency, the smaller
>> +	Similarly, the greater the desired efficiency, the bigger
>> 	the achievable speedup.
>=20
> I might not be fully woken up, but this change doesn't make
> sense to me.

The original sentence means (to me) If we get greater efficiency use of =
CPUs,
we get smaller speedup.

If I misunderstood, please correct me.

>    If the critical sections have high overhead compared to
>    the primitives guarding them, the best way to improve
>                                                  ^^^^^^^
>    speedup is to increase parallelism by moving to reader/writer
>    ^^^^^^^
>    locking, data locking, asymmetric, or data ownership.
>             ^^^^^^^^^^^^^                ^^^^^^^^^^^^^^
>=20
> Item 5:
>=20
>    If the critical sections have high overhead compared to
>    the primitives guarding them and the data structure being
>                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>    guarded is read much more often than modified, the best way
>    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>    to increase parallelism is to move to reader/writer locking
>    or asymmetric primitives.
>=20
> Are you sure they are duplicates ???


If the critical sections have high overhead compared to the primitives =
guarding them,
It means that the overhead of primitives is relative small, but the aim =
of data locking and data ownership=20
is to reduce the overhead of primitives.=20

Thanks,
Alan



> 2023=E5=B9=B44=E6=9C=8812=E6=97=A5 =E4=B8=8A=E5=8D=888:16=EF=BC=8CAkira =
Yokosawa <akiyks@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Hi Alan,
>=20
> On Tue, 11 Apr 2023 12:28:05 -0400, Alan Huang wrote:
>> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
>> ---
>> SMPdesign/criteria.tex | 7 +------
>> 1 file changed, 1 insertion(+), 6 deletions(-)
>>=20
>> diff --git a/SMPdesign/criteria.tex b/SMPdesign/criteria.tex
>> index d3d84506..bc4d3a77 100644
>> --- a/SMPdesign/criteria.tex
>> +++ b/SMPdesign/criteria.tex
>> @@ -145,7 +145,7 @@ parallel program.
>> 	The larger the gap between the number of CPUs
>> 	and the actual speedup, the less efficiently the
>> 	CPUs will be used.
>> -	Similarly, the greater the desired efficiency, the smaller
>> +	Similarly, the greater the desired efficiency, the bigger
>> 	the achievable speedup.
>=20
> I might not be fully woken up, but this change doesn't make
> sense to me.
>=20
>> \item	If the available synchronization primitives have
>> 	high overhead compared to the critical sections
>> @@ -157,11 +157,6 @@ parallel program.
>> 	using asymmetric primitives
>> 	(see \cref{chp:Deferred Processing}),
>> 	or by using a coarse-grained design such as \IXh{code}{locking}.
>> -\item	If the critical sections have high overhead compared
>> -	to the primitives guarding them, the best way
>> -	to improve speedup is to increase parallelism
>> -	by moving to reader/writer locking, \IXh{data}{locking}, =
asymmetric,
>> -	or data ownership.
>=20
> You mean, this and the next item says the same thing?
> I don't think so.
>=20
> Item 4:
>=20
>    If the critical sections have high overhead compared to
>    the primitives guarding them, the best way to improve
>                                                  ^^^^^^^
>    speedup is to increase parallelism by moving to reader/writer
>    ^^^^^^^
>    locking, data locking, asymmetric, or data ownership.
>             ^^^^^^^^^^^^^                ^^^^^^^^^^^^^^
>=20
> Item 5:
>=20
>    If the critical sections have high overhead compared to
>    the primitives guarding them and the data structure being
>                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>    guarded is read much more often than modified, the best way
>    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>    to increase parallelism is to move to reader/writer locking
>    or asymmetric primitives.
>=20
> Are you sure they are duplicates ???
>=20
>        Thanks, Akira
>=20
>> \item	If the critical sections have high overhead compared
>> 	to the primitives guarding them and the data structure
>> 	being guarded is read much more often than modified,

