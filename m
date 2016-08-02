Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38286 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)	by vger.kernel.org with
 ESMTP id S1751000AbcHBECK (ORCPT	<rfc822;perfbook@vger.kernel.org>); Tue, 2
 Aug 2016 00:02:10 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])	by
 mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u723xSch140201
 for <perfbook@vger.kernel.org>; Tue, 2 Aug 2016 00:02:09 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])	by
 mx0a-001b2d01.pphosted.com with ESMTP id 24grd4wr74-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Tue,
 02 Aug 2016 00:02:09 -0400
Received: from localhost	by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Tue, 2 Aug 2016
 00:02:08 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26])	by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 8F766C90045
 for <perfbook@vger.kernel.org>; Tue, 2 Aug 2016 00:01:54 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u72425hc56950956	for <perfbook@vger.kernel.org>; Tue, 2 Aug 2016 04:02:05 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u72424aP007384	for <perfbook@vger.kernel.org>; Tue, 2 Aug 2016 00:02:04 -0400
Date: Mon, 1 Aug 2016 21:02:04 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Memory barrier -- fix sample code
Reply-To: paulmck@linux.vnet.ibm.com
References: <1470097946.3000.3.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1470097946.3000.3.camel@gmail.com>
Message-Id: <20160802040204.GY3482@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Balbir Singh <bsingharora@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Aug 02, 2016 at 10:32:26AM +1000, Balbir Singh wrote:
> From: Balbir singh <bsingharora@gmail.com>
> Date: Tue, 2 Aug 2016 10:26:34 +1000
> Subject: [PATCH] Correct a sample in memorybarriers.tex
>=20
> We probably don't want to show GFP_KERNEL allocation
> under spin_lock, GFP_ATOMIC seems much better.
>=20
> Signed-off-by: Balbir singh <bsingharora@gmail.com>

Good catch, applied, thank you!

However, I had to apply this by hand due to some recent mass changes to
figures containing code.  Could you please move to current perfbook.git
for future submissions?

							Thanx, Paul

> ---
> =A0advsync/memorybarriers.tex | 2 +-
> =A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
> index 9eaa0ea..efbd4a2 100644
> --- a/advsync/memorybarriers.tex
> +++ b/advsync/memorybarriers.tex
> @@ -936,7 +936,7 @@ Then the following code might leak memory!
> =A0\begin{verbatim}
> =A0spin_lock(&mylock);
> =A0if (p =3D=3D NULL)
> -=A0=A0p =3D kmalloc(sizeof(*p), GFP_KERNEL);
> +=A0=A0p =3D kmalloc(sizeof(*p), GFP_ATOMIC);
> =A0spin_unlock(&mylock);
> =A0\end{verbatim}
> =A0\end{minipage}
> --=A0
> 2.7.4
>=20

