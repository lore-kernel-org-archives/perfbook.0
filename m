Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pg0-f41.google.com ([74.125.83.41]:34786 "EHLO
 mail-pg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750969AbdGaFB6 (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 31
 Jul 2017 01:01:58 -0400
Received: by mail-pg0-f41.google.com with SMTP id u185so27878694pgb.1 for
 <perfbook@vger.kernel.org>; Sun, 30 Jul 2017 22:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=tRek10Db4Ob2WDYyGuO/wLm6eKv1CbN9BRJmLjWq9XI=;
 b=A+pYCZTAG6zpfE8X8st1f2uVZ+x2m8aeI+nJ0D1BabyMBxhhkKphR/vA7SJXApYr3f
 FiF6dsokMFReksj6Z2zG0WlJIJj/Yvfn9Y7YOgSwlGFZIvh+ezAkhjkXQsx56NrWSjbD
 TlIOJ+RPhrVo5XRzo1ty1kYxq6aTB7hLQ2tOsUZC/PAeg0IKa+P0+GWSNdEn0n4KuE7a
 reo6Na3TcinvMeHjYydyCLrd0vbvD48UsTYd58OxIbajavneMkfFApKpY2pcSqgOE2/9
 IIL/P3X3bg0zYHngqCuG71CGKTGWmUkcAk3qVwk8KPWtVrERhC3iBE6s7jEyPyoMJmYh
 +shQ==
Content-Type: text/plain;        charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 03/10] Localize floatrow.sty
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <30502107-EDBA-4834-8129-BBB128B3C980@gmail.com>
Date: Mon, 31 Jul 2017 14:01:55 +0900
Content-Transfer-Encoding: quoted-printable
Message-Id: <FA1EBFD0-3BFE-4D77-9BED-87EDC03397C4@gmail.com>
References: <26a47dec-a9a0-87e6-88c8-b9ba82c477d5@gmail.com>
 <a6974c7a-0847-75e7-3e53-f859a49e0174@gmail.com>
 <20170731032619.GY3730@linux.vnet.ibm.com>
 <30502107-EDBA-4834-8129-BBB128B3C980@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

2017/07/31 13:05=E3=80=81Akira Yokosawa <akiyks@gmail.com> =E3=81=AE=E3=83=A1=
=E3=83=83=E3=82=BB=E3=83=BC=E3=82=B8:

>=20
>=20
>=20
>=20
> 2017/07/31 12:26=E3=80=81Paul E. McKenney <paulmck@linux.vnet.ibm.com> =E3=
=81=AE=E3=83=A1=E3=83=83=E3=82=BB=E3=83=BC=E3=82=B8:
>=20
>> On Fri, Jul 28, 2017 at 06:58:07PM +0900, Akira Yokosawa wrote:
>>>> =46rom 53ff86011be07a62dba37a5bef56f04f25531dd1 Mon Sep 17 00:00:00 200=
1
>>> From: Akira Yokosawa <akiyks@gmail.com>
>>> Date: Thu, 20 Jul 2017 23:34:58 +0900
>>> Subject: [PATCH 03/10] Localize floatrow.sty
>>>=20
>>> The "floatrow" package conflicts with two-column layout.
>>> A possible workaround was posted at [1] and it seems to work
>>> in perfbook. Before the change, import the style file as of v0.3b
>>> with trailing white spaces removed.
>>>=20
>>> [1] https://tex.stackexchange.com/questions/133127/
>>=20
>> If I understand the license correctly, we have to use a different name
>> due to having modified the file. =20
>=20
> Yes.
> I did the rename in the next commit. By splitting them,
> it would be easier to see the workaround.

Ah, now I see your point.
This patch should have used the renamed file name.
Then the following diff would have been much smaller.

I'll respin later.

Thanks, Akira=E2=80=82
(from mobile, might be QP encoded)

>=20
> Or, do we need to keep the trailing blanks at this point?
>=20
>> Or has this change (commenting out
>> \textwidth\columnwidth) been applied upstream?
>=20
> No, the workaround looks like only a hint.
> Again, two-column layout tend to have little attention.
>=20
>> Or does changing the
>> name mean that the fix is ineffective?
>=20
> It is effective for perfbook AFAICS.
>=20
> Thanks, Akira=E2=80=82
> (from mobile, might be QP encoded)
>>=20
>> (I applied the first two, thank you!)
>>=20
>>                           Thanx, Paul

[...]=
