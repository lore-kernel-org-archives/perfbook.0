Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=tEJTk0wGxBAfqB+r/2ng0Quwo9H/Hli3FHrOBvdtM3M=;
 b=oqU8sQsX8p2DSihXk+ejmEjjk/dCnEKfUPc5c/2sHjh1vqALvTYqdidRiT3QUM1oCe
 xQSmK7effvHgoAUxzsk1Yb1tRAYFuEQOrEuN759kgFBedwUFIDZKAWeMFF3DRHawK34Z
 Oo2A4yk44E/tFhHpRw9LNegKgISgZabehGgMR0OskD3nXrU24JM+AInMzf+Zun0U41gt
 X7j9hdn6DYRVyHEA3qm1Q7FqbtnU4vbj/KmDVg4C8J6IguduCmS/5l9nlTLrIj8cd9ZP
 M6dBPDyUoqCaBt2ez174ZFKY/tzDVeXLpV0uO6SUP/kLmj9KQMSDSa9OpfObhLf9XGiZ
 J2MA==
Content-Type: text/plain;	charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 0/5] Bibliography update round 5
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <52CB7A57-7BDC-42C7-9AD7-5957F5CBC973@gmail.com>
Date: Thu, 9 Feb 2017 06:40:58 +0900
Content-Transfer-Encoding: quoted-printable
Message-Id: <77A817C2-3C8D-4B09-B658-4FE3D66652A8@gmail.com>
References: <3aa61663-43c2-6663-278a-2554ee4d5736@gmail.com>
 <20170208163747.GO30506@linux.vnet.ibm.com>
 <78D82D63-A7BA-4F43-B320-679D6EA44FD8@gmail.com>
 <20170208211009.GT30506@linux.vnet.ibm.com>
 <52CB7A57-7BDC-42C7-9AD7-5957F5CBC973@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>


Oops, sent prematurely.
Hope you can see what I mean.

Akira

> On Feb 9, 2017, at 6:36, Akira Yokosawa <akiyks@gmail.com> wrote:
>=20
>=20
>=20
> Akira=E2=80=82
> (from mobile, might be QP encoded)
>=20
>>> On Feb 9, 2017, at 6:10, Paul E. McKenney <paulmck@linux.vnet.ibm.com> w=
rote:
>>>=20
>>> On Thu, Feb 09, 2017 at 05:57:23AM +0900, Akira Yokosawa wrote:
>>>=20
>>>=20
>>>> On Feb 9, 2017, at 1:37, Paul E. McKenney <paulmck@linux.vnet.ibm.com> w=
rote:
>>>>=20
>>>> On Wed, Feb 08, 2017 at 11:54:41PM +0900, Akira Yokosawa wrote:
>>>>>> =46rom 58a0655ab2b5c555bd19a6d7624a9d4413cf1360 Mon Sep 17 00:00:00 2=
001
>>>>> From: Akira Yokosawa <akiyks@gmail.com>
>>>>> Date: Wed, 8 Feb 2017 23:34:47 +0900
>>>>> Subject: [PATCH 0/5] Bibliography update round 5
>>>>>=20
>>>>> Hi Paul,
>>>>>=20
>>>>> Here is round 5 of bibliography updates.
>>>>> Patches 1, 2, and 3 take care of broken urls. Patch 2 contains an
>>>>> alternative link to a webpage capture.
>>>>> Patch 4 is cosmetic fix of UCB in author fields
>>>>> Patch 5 is a different type of update. It adds awareness of "location"=

>>>>> field in "inproceedings" entry. Please see the commit log for details.=

>>>>> I think this is a reasonable change for perfbook.
>>>>=20
>>>> I applied the first four, and might be convinced to apply the fifth.
>>>> But first a question -- how many changes would be required to bring
>>>> my old bib entries in line with current practice?
>>>=20
>>> No change is required. Because this change has effect
>>> only on entries with both "address" and "location".
>>> I thought I explained this somewhere, but missed to do so.
>>> Can this clarification convince you?
>>=20
>> Ah, thank you for the clarification!  And on to the next question...
>>=20
>> Does it really make sense for me to have both "address" and "location"
>> on a given bib entry?  If I am doing something strange (quite likely!),
>> it is probably better for me to fix my strange bib entries than to modify=

>> the tools.  Especially given the possibility that others might well
>> harvest bib entries from perfbook.
>>=20
>=20
> Well, I don't think your usage of "address" field is strange at all.
> It would be easy to find people who do the same.
>=20
> The fact that genuine alpha style does not recognize "location" entry woul=
d support my observation.
>=20
>> After all, some of my bib entries were old enough to drink almost a
>> decade ago.  I guess we can only be thankful that they are unable
>> to do any driving.  ;-)
>>=20
>>                           Thanx, Paul
>>=20

