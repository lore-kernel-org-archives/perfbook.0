Return-Path: <SRS0=D5ZN=BG=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684342947; x=1686934947;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2juaeBGYNKj3ElvUpqHRVxqdm84XWQvN5Ap93XbQgnE=;
        b=qZo1y8r5Xe326SF2M3+QsC5zkql8DgZWeGUTcT0l9gtI9Pp5zwaxN4gWrpHVukNdHS
         vuTtweoptMVAXqPj6JFCAmwwioqQK7dZ0H5MblZHuVh+1fm9vt1fKuyqv/8Oau60RqRg
         SoUrfJQHzDqdErgx4FJoalrXj4RsC/L5jlHW1syhgA4VoXhkPATSAwe5L20io03urCVt
         8rFikCxHZ5V0VpwAjCilVr6tO38vziJwNHWZVZAH5liFN2E9X/zpY6vZO4zN8MzM5UTy
         pS9KoPL607Aqt/CXnvvmt7QRRpQQFH/yycFqIfWp16huUyORVrsxomtJkGVTadxLW84H
         1K8Q==
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH] formal/spinhint: Clarify the proof
From: Alan Huang <mmpgouride@gmail.com>
In-Reply-To: <27a4aeaf-5eb4-fb15-4951-0fb200d4edd9@gmail.com>
Date: Thu, 18 May 2023 01:02:21 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <99837CAE-E2E2-4BF5-940A-98DFFFF6E9E6@gmail.com>
References: <20230514145123.37079-1-mmpgouride@gmail.com>
 <8c07d99a-cc0b-c277-4a09-d7072c70911d@gmail.com>
 <B595FC9D-9EC6-401B-8181-D75C64E427CC@gmail.com>
 <27a4aeaf-5eb4-fb15-4951-0fb200d4edd9@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: paulmck@kernel.org, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Akira,

> 2023=E5=B9=B45=E6=9C=8817=E6=97=A5 =E4=B8=8B=E5=8D=8810:55=EF=BC=8CAkira=
 Yokosawa <akiyks@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Hi Alan,
>=20
> On Tue, 16 May 2023 18:15:31 +0800, Alan Huang wrote:
>> Hi Akira,
>>=20
>>> 2023=E5=B9=B45=E6=9C=8816=E6=97=A5 =E4=B8=8B=E5=8D=886:07=EF=BC=8CAkir=
a Yokosawa <akiyks@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>>>=20
>>> Hi Alan,
>>>=20
>>> On Sun, 14 May 2023 14:51:23 +0000, Alan Huang wrote:
>>>> The third step and the fourth step seem to have no causal =
relationship between them.
>>>=20
>>> Why do you expect causal relationship between the two?
>>>=20
>>>> Therefore, this patch explains under what circumstances both =
counters will be at least 1.
>>>>=20
>>>> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
>>>> ---
>>>> formal/spinhint.tex | 5 +++--
>>>> 1 file changed, 3 insertions(+), 2 deletions(-)
>>>>=20
>>>> diff --git a/formal/spinhint.tex b/formal/spinhint.tex
>>>> index 16764aef..dd2e88cc 100644
>>>> --- a/formal/spinhint.tex
>>>> +++ b/formal/spinhint.tex
>>>> @@ -1103,8 +1103,9 @@ follows:
>>>> 	execution.
>>>> \item	The counter corresponding to this reader will have been
>>>> 	at least 1 during this time interval.
>>>> -\item	The \co{synchronize_qrcu()} code forces at least one
>>>> -	of the counters to be at least 1 at all times.
>>>> +\item	If the counter corresponding to this reader is 1, then
>>>> +	the other counter is at least 1 because of the completion of
>>>> +	counter flip.
>>>> \item	Therefore, at any given point in time, either one of the
>>>> 	counters will be at least 2, or both of the counters will
>>>> 	be at least one.
>>>=20
>>> "Therefore" on item 4 looks to me assumes all of items 1, 2, and 3.
>>=20
>> Yeah, that=E2=80=99s right. My commit message is misleading.
>>=20
>> This patch makes item 3 more specific.
>=20
> I might be too nit-picky, but you are changing the simple statement
> of observation:
>=20
>    The synchronize_qrcu() code forces at least one of the counters
>    to be at least 1 at all times.
>=20
> to a complex sentence of:
>=20
>    If the counter corresponding to this reader is 1, then
>    the other counter is at least 1 because of the completion of
>    counter flip.
>=20
> Your wording describes something different from the original one,
> doesn't it?=20
>=20
> Can you elaborate what you find hard to follow in this _informal_
> proof?

Item 4 says:

	Therefore, at any given point in time, either one of the
	counters will be at least 2, or both of the counters will
	be at least one.

=E2=80=9Cat least 2=E2=80=9D is obvious, but it took me some time to =
figure this out:

	 "or both of the counters will be at least one=E2=80=9D

The original item 3 is not very helpful to me.

But others may prefer the original one :)

Thanks,
Alan

>=20
>        Thanks, Akira
>>=20
>> Thanks,
>> Alan
>>=20
>>>=20
>>> What am I missing?
>>>=20
>>>       Thanks, Akira

