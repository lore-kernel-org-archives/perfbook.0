Return-Path: <SRS0=k9bS=AD=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681296067;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bwKH+Jk7bTlEp5v0q/7LvGyq17Lv0JxDrDkmJ1xFbIU=;
        b=P3vfUFn0KY1psSoJ2gAqeDXzxlppox3K/ABMXoUoXUzO/9XCdtkqPyO3F2k62fo067
         fFXhhQVLA+MZJkZp8MN07jpjmZy53VmG4HkWP1BraL7MFXjUkr/HgyrdyK1FixcnbHjY
         e4N80zNJlHAd+LDEEim4owrmmGWyQ/sGXsPAfSolz8d+JvUXpCbgmfovB+qkHD/cdi/t
         zKToRgo+HYWMOafjDLF5XFbNTnyWYc+TIGa/5AV4A+N0MC3YwJgbyuGGZ2Y2rPORlqE8
         2Wmaph2OyXhUE06g6iuajMWHsMAV/OgsxS9LuzdLx8EYy5z4MvysIq11kUe+eOLVmni5
         DQ3A==
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH] SMPDesign: Remove duplicate item
From: Alan Huang <mmpgouride@gmail.com>
In-Reply-To: <65116a6a-50c1-583b-0790-31b405c2c4dd@gmail.com>
Date: Wed, 12 Apr 2023 18:40:53 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <3F00B031-34BC-4636-9DE9-888797028524@gmail.com>
References: <20230411162805.1343469-1-mmpgouride@gmail.com>
 <ee5d3aff-58ef-85a4-ee0f-9ce8fbe7bfd8@gmail.com>
 <DAB6D77C-C34D-4F12-A589-63F42648E1C2@gmail.com>
 <65116a6a-50c1-583b-0790-31b405c2c4dd@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>, paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

> One extreme approach for the greatest efficiency might be not to
> parallelize at all, to use a single CPU, and to get a negative
> speedup (i.e., speed down).

But we can also get the greatest efficiency using data ownership under =
the maximum degree of parallelism.

> Anyway, this list is more of a guideline of approaches to
> parallel-programming design considerations.

Got it.


Thanks,
Alan



> 2023=E5=B9=B44=E6=9C=8812=E6=97=A5 =E4=B8=8A=E5=8D=8810:51=EF=BC=8CAkira=
 Yokosawa <akiyks@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Wed, 12 Apr 2023 09:15:12 +0800, Alan Huang wrote:
>>>> -	Similarly, the greater the desired efficiency, the smaller
>>>> +	Similarly, the greater the desired efficiency, the bigger
>>>> 	the achievable speedup.
>>>=20
>>> I might not be fully woken up, but this change doesn't make
>>> sense to me.
>>=20
>> The original sentence means (to me) If we get greater efficiency use =
of CPUs,
>> we get smaller speedup.
>>=20
>> If I misunderstood, please correct me.
>=20
> My version of interpretation of the sentence:
>=20
>   Similarly, if our goal is greater efficiency, we might end up
>   in a smaller speedup in the end.
>=20
> One extreme approach for the greatest efficiency might be not to
> parallelize at all, to use a single CPU, and to get a negative
> speedup (i.e., speed down).
>=20
>>=20
>>>   If the critical sections have high overhead compared to
>>>   the primitives guarding them, the best way to improve
>>>                                                 ^^^^^^^
>>>   speedup is to increase parallelism by moving to reader/writer
>>>   ^^^^^^^
>>>   locking, data locking, asymmetric, or data ownership.
>>>            ^^^^^^^^^^^^^                ^^^^^^^^^^^^^^
>>>=20
>>> Item 5:
>>>=20
>>>   If the critical sections have high overhead compared to
>>>   the primitives guarding them and the data structure being
>>>                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>   guarded is read much more often than modified, the best way
>>>   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>   to increase parallelism is to move to reader/writer locking
>>>   or asymmetric primitives.
>>>=20
>>> Are you sure they are duplicates ???
>>=20
>>=20
>> If the critical sections have high overhead compared to the =
primitives guarding them,
>> It means that the overhead of primitives is relative small, but the =
aim of data locking and data ownership=20
>> is to reduce the overhead of primitives.
>=20
> Well, I think Paul's motivation of special casing read-mostly
> data comes from his expertise in RCU.
>=20
> I'd like to respect his motivation.
>=20
> Anyway, this list is more of a guideline of approaches to
> parallel-programming design considerations.
> Why do you want it to be so precise ???
>=20
>        Thanks, Akira
>=20
>>=20
>> Thanks,
>> Alan
>>=20
> [...]

