Return-Path: <SRS0=pRlB=AY=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683088285; x=1685680285;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NrBncyeHOS6rsvq98eCZ4NP7FSojGz8QRMUZDrM0lVQ=;
        b=TilcLDck1dT14F/Dm/Ymqf0zz8g3M+XynjSr6GHxdw4BQ4IXsnR+yD27y/Wke3Kt8v
         546wx7PRm/Y4w8ACyManO5xEyekaBJsQmQIIdrtTrlHUQO0Rf4IBiJ4ZKYD19fCOs+sl
         J/7jvt23AVE2jUi5jUbMXUo3CTfEVV1xQm2TaYdoRgZlOnoU2FUpDvt83t8nPI9QHY8l
         noNmKg9M5RLTY9faiwNMpqywd4s5j3kre060z2v5F11mmOtuhk4CJe9+Gm+EXO1MpGVA
         vom5BO0mfEz93CLZ/TYmxDWkI/u0gnDxu5+Qluzj8OBta4eSZdXVNpxVuUSzdfs7U8JJ
         G/0g==
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: Question: Are there conflicts between the paragraph and the
 figure?
From: Alan Huang <mmpgouride@gmail.com>
In-Reply-To: <203d3e8b-f75b-460c-8a28-5a3b72121cff@paulmck-laptop>
Date: Wed, 3 May 2023 12:31:05 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <2B23416A-3E98-46A3-85DE-77D397A06FE7@gmail.com>
References: <6FC864F5-A6CD-4C5F-BC63-9670AB95F8F7@gmail.com>
 <6146DDCA-450B-43A1-8158-2D8766E3B86F@gmail.com>
 <3083120a-7c17-4349-9389-7ebde03676de@paulmck-laptop>
 <AE67636E-D24E-4174-AF1C-98123161823F@gmail.com>
 <203d3e8b-f75b-460c-8a28-5a3b72121cff@paulmck-laptop>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>



> 2023=E5=B9=B45=E6=9C=883=E6=97=A5 01:28=EF=BC=8CPaul E. McKenney =
<paulmck@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Tue, May 02, 2023 at 11:51:33PM +0800, Alan Huang wrote:
>>=20
>>=20
>>> 2023=E5=B9=B45=E6=9C=882=E6=97=A5 03:02=EF=BC=8CPaul E. McKenney =
<paulmck@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>>=20
>>> On Mon, May 01, 2023 at 07:09:49PM +0800, Alan Huang wrote:
>>>>=20
>>>>> 2023=E5=B9=B45=E6=9C=881=E6=97=A5 =E4=B8=8B=E5=8D=887:05=EF=BC=8CAla=
n Huang <mmpgouride@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>>>>>=20
>>>>> Hi,
>>>>>=20
>>>>> I=E2=80=99m reading section 9.5.4.9, in the second to the last =
paragraph, there is:
>>>>>=20
>>>>> Before the first horizontal line, all readers see the leftmost =
myconfig structure,
>>>>> and after the second horizontal line, all readers will see the =
rightmost structure.=20
>>>>> Between the two lines, that is, during the grace period, different =
readers might see different objects
>>>>>=20
>>>>> I=E2=80=99m a little confused, in Figure 9.29, the xchg is before =
the first horizontal line, in my understanding, if the=20
>>>>> reader=E2=80=99s reading is before the xchg, it will read the =
leftmost myconfg structure.
>>>>=20
>>>> And if reader=E2=80=99s reading is after the xchg, it will see the =
rightmost structure, and because xchg is before the first horizontal =
line,
>>>> Readers before the first horizontal line may also see the rightmost =
structure.
>>>>=20
>>>>>=20
>>>>> So, are there some conflicts between the paragraph and the figure?
>>>>>=20
>>>>> Please correct me if I=E2=80=99m wrong.
>>>=20
>>> Consider the point in time just before the left-hand reader's
>>> rcu_read_unlock() and just after the right-hand reader's =
rcu_read_lock().
>>> These two readers are both running at that time, and one of those =
readers
>>> sees the old state and the other sees the new state.
>>=20
>> The sentence that may lead to conflict is this one from the original =
text:
>>=20
>> Before the first horizontal line, all readers see the leftmost =
myconfig structure.
>>=20
>> There may be a situation where:
>>=20
>>        mcp =3D xchg(&curconfig, mcp);
>> rcu_read_lock();=20
>> mcp =3D =E2=80=A6
>> *cur_a =3D mcp->a;=20
>> -------------------------------------------------first horizontal =
line-------------------------------------------------
>>=20
>> So, the reader will see the rightmost myconfig structure although it =
is before the first horizontal line.
>=20
> Ah, I understand now, good catch and thank you!  I updated that =
paragraph
> to the following, with your Reported-by:
>=20
> The two horizontal grey dashed lines represent the period of time
> during which different readers get different results, however,
> each reader will see one and only one of the two objects. All
> readers that end before the first horizontal line will see the


How about this:

        				mcp =3D xchg(&curconfig, mcp);
	rcu_read_lock();=20
	mcp =3D =E2=80=A6
	*cur_a =3D mcp->a;=20
	rcu_read_unlock();
-------------------------------------------------first horizontal =
line-------------------------------------------------

The reader above end before the first horizontal line, but still get the =
rightmost myconfig structure.

The point is that there is a time period between xchg and the first =
horizontal line during which a reader
will see the rightmost myconfig structure.=20

One possible solution is to move xchg behind the first horizontal line, =
assuming that I understand correctly.

> leftmost myconfig structure, and all readers that start after the
> second horizontal line will see the rightmost structure. Between
> the two lines, that is, during the grace period, different readers
> might see different objects, but as long as each reader loads the
> curconfig pointer only once, each reader will see a consistent
> view of its myconfig structure.
>=20
> Does that help?
>=20
>> BTW, the original text says that black dotted arrows pointing from an =
older event to a newer event,=20
>> but there exists two black dotted arrows in the wrong direction:
>>=20
>> 1.The arrow pointing from synchronize_rcu() to left-hand =
rcu_read_lock()
>> 2.The arrow pointing right-hand rcu_read_lock() to synchronize_rcu()=20=

>>=20
>> The directions of the two arrows above may need to be adjusted. I =
tried to modify this, but after a few hours, I still can=E2=80=99t =
figure out the svg...
>=20
> The trick is to use an SVG editor.  For better or for worse, I use
> inkscape.  But easy for me to change, so I did, again, with your
> Reported-by.
>=20
> The trick is to flip each arrow horizontally and then vertically, =
which
> reverses the direction without having to test one's manual dexterity,
> which I lack in abundance.  ;-)


Thanks for the tricks, will try to use it!

Thanks,
Alan

>=20
> Thanx, Paul
>=20
>> Thanks,
>> Alan
>>=20
>>>=20
>>> Does that help, or am I missing the point of your question?
>>>=20
>>> Thanx, Paul


