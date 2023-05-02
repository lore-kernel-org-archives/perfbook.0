Return-Path: <SRS0=dga1=AX=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683042712; x=1685634712;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWEHxL/d3HQyEeJ/6XWLxahWDtkZkpUkZiXnckSyHyk=;
        b=hw6FKTgLYMy4Bwxt5yWMoJ1XVXLBZAsVixrZqMy+YEtzXhLl6cAuW7yFvb+WVXxUVI
         4rRuOY0LR+VsolTGmd7/+ZAjAun6R/Sg10UYNvPfCDWMlVzoFv8JsKyKGYUeRRVALncu
         Xfe/gOnJdr3KXh0/4OpgFunx6gVI+nPu5m8q6g41KGUtS/xQNstEipWoZA6rK6tWTd4e
         H3gwXWJB7lLoTxoz0LW9H3+hufmOEbumjlqDSmvtbZvEria5Vgcol8Pq8GFHS9KKB35W
         mDv7S6a1nrSYUjc78SROOpgVAfTniENcxU1GN8zRS1mq5h4dpl12gbBWZvk+SpLohkPt
         TwhA==
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: Question: Are there conflicts between the paragraph and the
 figure?
From: Alan Huang <mmpgouride@gmail.com>
In-Reply-To: <3083120a-7c17-4349-9389-7ebde03676de@paulmck-laptop>
Date: Tue, 2 May 2023 23:51:33 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <AE67636E-D24E-4174-AF1C-98123161823F@gmail.com>
References: <6FC864F5-A6CD-4C5F-BC63-9670AB95F8F7@gmail.com>
 <6146DDCA-450B-43A1-8158-2D8766E3B86F@gmail.com>
 <3083120a-7c17-4349-9389-7ebde03676de@paulmck-laptop>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>



> 2023=E5=B9=B45=E6=9C=882=E6=97=A5 03:02=EF=BC=8CPaul E. McKenney =
<paulmck@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Mon, May 01, 2023 at 07:09:49PM +0800, Alan Huang wrote:
>>=20
>>> 2023=E5=B9=B45=E6=9C=881=E6=97=A5 =E4=B8=8B=E5=8D=887:05=EF=BC=8CAlan =
Huang <mmpgouride@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>>>=20
>>> Hi,
>>>=20
>>> I=E2=80=99m reading section 9.5.4.9, in the second to the last =
paragraph, there is:
>>>=20
>>> Before the first horizontal line, all readers see the leftmost =
myconfig structure,
>>> and after the second horizontal line, all readers will see the =
rightmost structure.=20
>>> Between the two lines, that is, during the grace period, different =
readers might see different objects
>>>=20
>>> I=E2=80=99m a little confused, in Figure 9.29, the xchg is before =
the first horizontal line, in my understanding, if the=20
>>> reader=E2=80=99s reading is before the xchg, it will read the =
leftmost myconfg structure.
>>=20
>> And if reader=E2=80=99s reading is after the xchg, it will see the =
rightmost structure, and because xchg is before the first horizontal =
line,
>> Readers before the first horizontal line may also see the rightmost =
structure.
>>=20
>>>=20
>>> So, are there some conflicts between the paragraph and the figure?
>>>=20
>>> Please correct me if I=E2=80=99m wrong.
>=20
> Consider the point in time just before the left-hand reader's
> rcu_read_unlock() and just after the right-hand reader's =
rcu_read_lock().
> These two readers are both running at that time, and one of those =
readers
> sees the old state and the other sees the new state.

The sentence that may lead to conflict is this one from the original =
text:

	Before the first horizontal line, all readers see the leftmost =
myconfig structure.

There may be a situation where:

	      				mcp =3D xchg(&curconfig, mcp);
	rcu_read_lock();=20
	mcp =3D =E2=80=A6
	*cur_a =3D mcp->a;=20
-------------------------------------------------first horizontal =
line-------------------------------------------------

So, the reader will see the rightmost myconfig structure although it is =
before the first horizontal line.


BTW, the original text says that black dotted arrows pointing from an =
older event to a newer event,=20
but there exists two black dotted arrows in the wrong direction:

	1.The arrow pointing from synchronize_rcu() to left-hand =
rcu_read_lock()
	2.The arrow pointing right-hand rcu_read_lock() to =
synchronize_rcu()=20

The directions of the two arrows above may need to be adjusted. I tried =
to modify this, but after a few hours, I still can=E2=80=99t figure out =
the svg...

Thanks,
Alan

>=20
> Does that help, or am I missing the point of your question?
>=20
> Thanx, Paul

