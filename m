Return-Path: <SRS0=2gMv=RH=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sQFJizDhukRAVWtMiGMcYUguKKNC7GDChquk11g6FJA=;
        b=Dfp+LnLr9Bu9qir70xpa2Cu07uico5pHC5vR/i6jG/hMUlDBHKdnfuaQ8zN8lbG1el
         4FsmGz3fkc8wBQ2Onll+peRsyUjLRa51KYlvgskYyJsnIBg8wfAGJnq7H/riOe7q7xYa
         6YUuQQMxyxMf1ifj4G/xYEjy/tm30yLnFQ98cqOMMnbN/wuupmGhdt2MHpCQsxsUU7H7
         lIcCAOEy+dPO1+R1yHVLVPdUXiwIq3sxWX70ZsYp/Hqd8PYZ61/PYs3rHFjAvup92DRK
         BZJ+lD7ftK7BkXTNok9qhP5USnGQukxPk4qjMdf+iqtKdE7tEsMybihg9ZOWPrTACdVa
         N28g==
Subject: Re: Section 9.5: Nobody expects the Spanish Acquisition!
References: <CAJbg=FWZG2EicBGKBbVzYnhH7oT3FqkwY738pmra9G9riGssVQ@mail.gmail.com>
 <b2851e07-d804-eff9-cb48-c636a159f868@gmail.com>
 <4f0ee3e7-73dc-9a76-0272-c49c2f09ccbc@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5be72d6b-54e8-4ac2-dd8d-cb9a8fd2d436@gmail.com>
Date: Wed, 22 Dec 2021 23:35:02 +0900
MIME-Version: 1.0
In-Reply-To: <4f0ee3e7-73dc-9a76-0272-c49c2f09ccbc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>
List-ID: <perfbook.vger.kernel.org>

Hi,

On Wed, 22 Dec 2021 07:15:54 -0500, Elad Lahav wrote:
> Hi Akira,
>=20
>> I think this is mostly covered in Section 9.5.2.1 "Publish-Subscribe
>> Mechanism" and Figure 9.10 "Publication/Subscription Constraints".
>=20
> I don't believe it is. I think you can infer that from reading sections=
 9.5
> and chapter 15, but it is never made explicit.

I agree it is not explicit.

>=20
> Sub-section 9.5.2.1 talks about the use of rcu_dereference() to obtain =
a
> pointer, but it doesn't go very deep into how that's implemented. You w=
ould
> think that the writer's use of store-release semantics would necessitat=
e
> the reader's use of load-acquire semantics, but the discussion here, th=
e
> previous examples, and a quick inspection of how rcu_dereference() is
> implemented, suggest that a READ_ONCE() is sufficient (or some less
> Linux-kernel-specific equivalent).
>=20
> If I am a naive reader (and a lazy one, who haven't read chapter 15 and=
 made
> the necessary connection), I could write something like:
>=20
> =C2=A0=C2=A0=C2=A0 struct foo_s {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int a;
> =C2=A0=C2=A0=C2=A0 } foo;
> =C2=A0=C2=A0=C2=A0 int b;
> =C2=A0=C2=A0=C2=A0 struct foo_s *g_foop =3D &foo;
>=20
> =C2=A0=C2=A0=C2=A0 // Reader
> =C2=A0=C2=A0=C2=A0 rcu_read_lock();
> =C2=A0=C2=A0=C2=A0 struct foo *l_foop =3D rcu_dereference(g_foop);
> =C2=A0=C2=A0=C2=A0 use(l_foop->a);
> =C2=A0=C2=A0=C2=A0 use(b);
> =C2=A0=C2=A0=C2=A0 rcu_read_unlock();
>=20
> =C2=A0=C2=A0=C2=A0 // Writer
> =C2=A0=C2=A0=C2=A0 struct foo *l_foop =3D malloc(sizeof(struct foo));
> =C2=A0=C2=A0=C2=A0 l_foop->a =3D 1;
> =C2=A0=C2=A0=C2=A0 b =3D 2;
> =C2=A0=C2=A0=C2=A0 // Release semantics ensure previous stores are obse=
rved
> =C2=A0=C2=A0=C2=A0 rcu_assign_pointer(g_foop, l_foop);
>=20
> But since b has no address dependency to g_foop and since neither
> rcu_read_lock() nor rcu_dereference() impose acquire semantics, then
> the reader may not observe the new value of b.

No, it may not.
So what you want is the mention of "address dependency" somewhere in
Section 9.5.2.1?

>=20
> Again, I may be missing something, but this seems to be a major point
> that needs to be explained and emphasized.

I guess Paul is intentionally avoiding discussions on memory ordering
here in Section 9.5.

Such a discussion would easily frighten naive readers...

Anyway, I guess Paul would have some good compromise to satisfy you.=20

>=20
>> BTW, I couldn't figure out what you meant by "the Spanish
>> Acquisition"...
> It's a reference to an old Monty Python skit. Apologies for the silly p=
un...

Ah, now I guess I see the pun of "acquire" and "acquisition".  ;-)

        Thanks, Akira

>=20
> --Elad

