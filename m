Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38347 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1753361AbdIDESL (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Mon, 4 Sep 2017 00:18:11 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v844DfMS032926
 for <perfbook@vger.kernel.org>; Mon, 4 Sep 2017 00:18:10 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2crmrsnb3y-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 04 Sep 2017 00:18:10 -0400
Received: from localhost by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 4 Sep 2017
 00:18:09 -0400
Date: Sun, 3 Sep 2017 21:18:09 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] Style guide updates
Reply-To: paulmck@linux.vnet.ibm.com
References: <f5647f1b-5849-d267-4310-b18d72b9f63d@gmail.com>
 <20170903173837.GE15437@linux.vnet.ibm.com>
 <fc924fba-1dd2-dede-c557-2d42b7777fb0@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc924fba-1dd2-dede-c557-2d42b7777fb0@gmail.com>
Message-Id: <20170904041809.GF15437@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
Content-Transfer-Encoding: Quoted-printable
MIME-Version: 1.0
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Sep 04, 2017 at 07:30:32AM +0900, Akira Yokosawa wrote:
> On 2017/09/04 2:38, Paul E. McKenney wrote:
> > On Sun, Sep 03, 2017 at 11:54:19PM +0900, Akira Yokosawa wrote:
> >> >From 91874614a21874550a5d9ffa3d0fba5f6d6416f1 Mon Sep 17 00:00:00 2001
> >> From: Akira Yokosawa <akiyks@gmail.com>
> >> Date: Sun, 3 Sep 2017 23:39:54 +0900
> >> Subject: [PATCH 0/2] Style guide updates
> >>
> >> Hi Paul,
> >>
> >> This patch set adds a section of ellipsis and a couple of experimental
> >> tables corresponding to new tables in memorder.
> >> Booktabs' rules and gaps in mid-rules still works in these tables, I
> >> suppose.
> >>
> >> Let me know what you think.
> >=20
> > Nice!  I have applied these.
> >=20
> > I played with Table D.13 (WWC) a bit, as the lightgray looked a bit
> > heavy to me.  Using lightgray!25 was too light and made me strain a bit
> > to see the grey line, but anywhere between lightgray!35 and lightgray!60
> > looked fine.
>=20
> lightgray is defined on line 930 in styleguide.tex at the moment.
> Current definition is:
>=20
> 	\definecolor{lightgray}{gray}{0.9}
>=20
> You can tweak it as you like. If you need more variation, you can define
> another color and use it in specific tables.
> But I'm against tweaking darkness in each table.

Ah, I was assuming that lightgray was a builtin.  Agreed, per-table
tweaks should be avoided.

> > The answer is probably "it depends" because my printer favors slightly
> > darker than does my monitor.  Might depend on the table as well, as I
> > would guess that the more empty cells the heavier the color needs to be.
> > Left to myself, I would choose lightgray!50.  But what level of shading
> > looks best to you on your equipment?
>=20
> It definitely depends on the printer/display to use.
> But as the definition of lightgray can be tuned as you like, I'm OK with
> the default of, for example:
>=20
> 	\definecolor{lightgray}{gray}{0.95}
>=20
> Let's see what people think.
>=20
> The definition will be moved into perfbook.tex when we start conversion
> of table layout and should be easy to find for people to customize.

The people I showed printouts to prefered your level of grayness,
so let's stick with that for the time being.  But yes, easy adjustment
is good, given the variation in monitors, printers, and eyes.  ;-)

							Thanx, Paul

>       Thanks, Akira
>=20
> > > Either way, it looks way better than the current pervasive use of \hl=
ine
> > in the main body of the text for those particular tables.
> >=20
> > 							Thanx, Paul
> >=20
> >>     Thanks, Akira
> >> --
> >> Akira Yokosawa (2):
> >>   styleguide: Add 'Ellipsis' section
> >>   styleguide: Add more experimental tables
> >>
> >>  appendix/styleguide/styleguide.tex | 206 ++++++++++++++++++++++++++++=
++-------
> >>  1 file changed, 169 insertions(+), 37 deletions(-)
> >>
> >> --=20
> >> 2.7.4
> >>
> >=20
> >=20
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  https://urldefense.proofpoint.com/v2/url?u=3Dhttp=
-3A__vger.kernel.org_majordomo-2Dinfo.html&d=3DDwICaQ&c=3Djf_iaSHvJObTbx-si=
A1ZOg&r=3Dux41CW3B5BSVxDMRNRWyLbUmPebZc70Kq4AkfdiRGMI&m=3DuyhL4QLWRXYTZychf=
v95fU4Rb5i9T45Skiw-rOvTrSY&s=3DsHKlmz4HbWX3x0yqdKF5SarQcDgJHf8f3R9ZYQk2mm4&=
e=3D=20
>=20

--
To unsubscribe from this list: send the line "unsubscribe perfbook" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3=
A__vger.kernel.org_majordomo-2Dinfo.html&d=3DDwIBAg&c=3Djf_iaSHvJObTbx-siA1=
ZOg&r=3Dux41CW3B5BSVxDMRNRWyLbUmPebZc70Kq4AkfdiRGMI&m=3DMS4Ss7GQu0IZzTJ120B=
mJpvVMyZnQuEAFTFByGvMMx4&s=3D8Vyd5hRdslQKHP3rZclReXUd4jJP8CzoJqAkc22SLDo&e=
=3D=20

