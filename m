Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38313 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1750987AbdGaMpz (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Mon, 31 Jul 2017 08:45:55 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v6VCitKl103872
 for <perfbook@vger.kernel.org>; Mon, 31 Jul 2017 08:45:54 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2c20rwv0a3-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 31 Jul 2017 08:45:54 -0400
Received: from localhost by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 31 Jul
 2017 08:45:54 -0400
Date: Mon, 31 Jul 2017 05:45:54 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 03/10] Localize floatrow.sty
Reply-To: paulmck@linux.vnet.ibm.com
References: <26a47dec-a9a0-87e6-88c8-b9ba82c477d5@gmail.com>
 <a6974c7a-0847-75e7-3e53-f859a49e0174@gmail.com>
 <20170731032619.GY3730@linux.vnet.ibm.com>
 <30502107-EDBA-4834-8129-BBB128B3C980@gmail.com>
 <FA1EBFD0-3BFE-4D77-9BED-87EDC03397C4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <FA1EBFD0-3BFE-4D77-9BED-87EDC03397C4@gmail.com>
Message-Id: <20170731124554.GZ3730@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Jul 31, 2017 at 02:01:55PM +0900, Akira Yokosawa wrote:
> 2017/07/31 13:05=E3=80=81Akira Yokosawa <akiyks@gmail.com> =E3=81=AE=E3=
=83=A1=E3=83=83=E3=82=BB=E3=83=BC=E3=82=B8:
>=20
> >=20
> >=20
> >=20
> >=20
> > 2017/07/31 12:26=E3=80=81Paul E. McKenney <paulmck@linux.vnet.ibm.com=
> =E3=81=AE=E3=83=A1=E3=83=83=E3=82=BB=E3=83=BC=E3=82=B8:
> >=20
> >> On Fri, Jul 28, 2017 at 06:58:07PM +0900, Akira Yokosawa wrote:
> >>>> From 53ff86011be07a62dba37a5bef56f04f25531dd1 Mon Sep 17 00:00:00 =
2001
> >>> From: Akira Yokosawa <akiyks@gmail.com>
> >>> Date: Thu, 20 Jul 2017 23:34:58 +0900
> >>> Subject: [PATCH 03/10] Localize floatrow.sty
> >>>=20
> >>> The "floatrow" package conflicts with two-column layout.
> >>> A possible workaround was posted at [1] and it seems to work
> >>> in perfbook. Before the change, import the style file as of v0.3b
> >>> with trailing white spaces removed.
> >>>=20
> >>> [1] https://tex.stackexchange.com/questions/133127/
> >>=20
> >> If I understand the license correctly, we have to use a different na=
me
> >> due to having modified the file. =20
> >=20
> > Yes.
> > I did the rename in the next commit. By splitting them,
> > it would be easier to see the workaround.
>=20
> Ah, now I see your point.
> This patch should have used the renamed file name.
> Then the following diff would have been much smaller.
>=20
> I'll respin later.

Very good, thank you!

							Thanx, Paul

> Thanks, Akira=E2=80=82
> (from mobile, might be QP encoded)
>=20
> >=20
> > Or, do we need to keep the trailing blanks at this point?
> >=20
> >> Or has this change (commenting out
> >> \textwidth\columnwidth) been applied upstream?
> >=20
> > No, the workaround looks like only a hint.
> > Again, two-column layout tend to have little attention.
> >=20
> >> Or does changing the
> >> name mean that the fix is ineffective?
> >=20
> > It is effective for perfbook AFAICS.
> >=20
> > Thanks, Akira=E2=80=82
> > (from mobile, might be QP encoded)
> >>=20
> >> (I applied the first two, thank you!)
> >>=20
> >>                           Thanx, Paul
>=20
> [...]--
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

