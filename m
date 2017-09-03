Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41434 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1753099AbdICRik (ORCPT <rfc822;perfbook@vger.kernel.org>); Sun, 3
 Sep 2017 13:38:40 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v83Hce0h008291
 for <perfbook@vger.kernel.org>; Sun, 3 Sep 2017 13:38:40 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2cqs5grfu9-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 03 Sep 2017 13:38:40 -0400
Received: from localhost by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 3 Sep 2017
 13:38:37 -0400
Date: Sun, 3 Sep 2017 10:38:37 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] Style guide updates
Reply-To: paulmck@linux.vnet.ibm.com
References: <f5647f1b-5849-d267-4310-b18d72b9f63d@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5647f1b-5849-d267-4310-b18d72b9f63d@gmail.com>
Message-Id: <20170903173837.GE15437@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
Content-Transfer-Encoding: Quoted-printable
MIME-Version: 1.0
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Sep 03, 2017 at 11:54:19PM +0900, Akira Yokosawa wrote:
> >From 91874614a21874550a5d9ffa3d0fba5f6d6416f1 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 3 Sep 2017 23:39:54 +0900
> Subject: [PATCH 0/2] Style guide updates
>=20
> Hi Paul,
>=20
> This patch set adds a section of ellipsis and a couple of experimental
> tables corresponding to new tables in memorder.
> Booktabs' rules and gaps in mid-rules still works in these tables, I
> suppose.
>=20
> Let me know what you think.

Nice!  I have applied these.

I played with Table D.13 (WWC) a bit, as the lightgray looked a bit
heavy to me.  Using lightgray!25 was too light and made me strain a bit
to see the grey line, but anywhere between lightgray!35 and lightgray!60
looked fine.

The answer is probably "it depends" because my printer favors slightly
darker than does my monitor.  Might depend on the table as well, as I
would guess that the more empty cells the heavier the color needs to be.
Left to myself, I would choose lightgray!50.  But what level of shading
looks best to you on your equipment?

Either way, it looks way better than the current pervasive use of \hline
in the main body of the text for those particular tables.

							Thanx, Paul

>     Thanks, Akira
> --
> Akira Yokosawa (2):
>   styleguide: Add 'Ellipsis' section
>   styleguide: Add more experimental tables
>=20
>  appendix/styleguide/styleguide.tex | 206 ++++++++++++++++++++++++++++++-=
------
>  1 file changed, 169 insertions(+), 37 deletions(-)
>=20
> --=20
> 2.7.4
>=20

--
To unsubscribe from this list: send the line "unsubscribe perfbook" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3=
A__vger.kernel.org_majordomo-2Dinfo.html&d=3DDwIBAg&c=3Djf_iaSHvJObTbx-siA1=
ZOg&r=3Dux41CW3B5BSVxDMRNRWyLbUmPebZc70Kq4AkfdiRGMI&m=3Dj_ozzr5UQ7iOShlWz8j=
TnJpIivzQDwzX4hXGV91eHYE&s=3D-RHivQTkGEHbdiIdPhnAtLS16Xe_FLwxMwZ8co2KLVU&e=
=3D=20

