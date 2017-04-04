Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37401 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1754908AbdDDRo6 (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Tue, 4 Apr 2017 13:44:58 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v34HijnV050355
 for <perfbook@vger.kernel.org>; Tue, 4 Apr 2017 13:44:57 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 29mee856f0-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 04 Apr 2017 13:44:57 -0400
Received: from localhost by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 4 Apr 2017
 13:44:56 -0400
Date: Tue, 4 Apr 2017 10:44:54 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] bib/QC: Replace UTF-8 encoded chars with escaped codes in
 ASCII
Reply-To: paulmck@linux.vnet.ibm.com
References: <c7ea071a-a2cb-8279-762a-ec75bd9fe3d1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c7ea071a-a2cb-8279-762a-ec75bd9fe3d1@gmail.com>
Message-Id: <20170404174454.GC3637@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Mar 26, 2017 at 06:21:59PM +0900, Akira Yokosawa wrote:
> >From bb2058728b0b9d979b93cc0e0b3ff65a7906d450 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 26 Mar 2017 17:44:22 +0900
> Subject: [PATCH] bib/QC: Replace UTF-8 encoded chars with escaped codes=
 in ASCII
>=20
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good catches, thank you for your attention to detail!  Queued and pushed.

							Thanx, Paul

> ---
> Hi Paul,
>=20
> In yet to be cited bibliography database recently added, I found
> several entries with UTF-8 encoded characters.
> This patch is to replace them with escaped codes of LaTeX.
>=20
> Another option is to enable UTF-8 awareness by using "inputenc" package
> with "utf8" option. The problem is BibTeX does not support UTF-8.
> It is said that combination of "biblatex" and "biber" can bridge
> the gap. I'll see if it is feasible for perfbook, but with a lower
> priority.
>=20
> Any help in this respect from someone on the list is welcome!
>=20
>                                     Thanks, Akira
> --
>  bib/QC.bib | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/bib/QC.bib b/bib/QC.bib
> index 551bdbb..d51ecb1 100644
> --- a/bib/QC.bib
> +++ b/bib/QC.bib
> @@ -277,7 +277,7 @@
>  }
>=20
>  @article{LeonidDubrovinsky2012640GPaDiamondAnvilCell
> -,title =3D "Implementation of micro-ball nanodiamond anvils for high-p=
ressure studies above 6=E2=80=89{Mbar}"
> +,title =3D "Implementation of micro-ball nanodiamond anvils for high-p=
ressure studies above 6\,{Mbar}"
>  ,author =3D "Leonid Dubrovinsky and Natalia Dubrovinskaia and Vitali B=
. Prakapenka and Artem M Abakumov"
>  ,journal =3D {Nat. Commun.}
>  ,volume =3D {3}
> @@ -425,7 +425,7 @@
>=20
>  @article{TroelsFRonnow2014QC-D-WaveNoSpeedup
>  ,title =3D "Defining and detecting quantum speedup"
> -,author =3D "Troels F. R=C3=B8nnow and Zhihui Wang and Joshua Job and =
Sergio Boixo and Sergei V. Isakov and David Wecker and John M. Martinis a=
nd Daniel A. Lidar and Matthias Troyer"
> +,author =3D "Troels F. R{\o}nnow and Zhihui Wang and Joshua Job and Se=
rgio Boixo and Sergei V. Isakov and David Wecker and John M. Martinis and=
 Daniel A. Lidar and Matthias Troyer"
>  ,journal =3D "Science"
>  ,volume =3D {345}
>  ,issue =3D {6195}
> @@ -725,7 +725,7 @@
>=20
>  @unpublished{BradJones2017IBM-QC-Crowder
>  ,Author=3D"Brad Jones"
> -,Title=3D"It=E2=80=99s the 1940s again: {IBM's} Scott Crowder on the i=
nfancy of quantum computers"
> +,Title=3D"It's the 1940s again: {IBM's} Scott Crowder on the infancy o=
f quantum computers"
>  ,month=3D"March"
>  ,day=3D"13"
>  ,year=3D"2017"
> @@ -734,7 +734,7 @@
>=20
>  @unpublished{TomSimonite2017QC-MS-Chemistry
>  ,Author=3D"Tom Simonite"
> -,Title=3D"Chemists Are First in Line for Quantum Computing=E2=80=99s B=
enefits"
> +,Title=3D"Chemists Are First in Line for Quantum Computing's Benefits"
>  ,month=3D"March"
>  ,day=3D"17"
>  ,year=3D"2017"
> --=20
> 2.7.4
>=20

