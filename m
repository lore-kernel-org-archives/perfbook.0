Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:42803 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1753847AbdIDQ63 (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 4
 Sep 2017 12:58:29 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v84GtMB5070211
 for <perfbook@vger.kernel.org>; Mon, 4 Sep 2017 12:58:29 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2cs9jsv02y-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 04 Sep 2017 12:58:29 -0400
Received: from localhost by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 4 Sep 2017
 12:58:27 -0400
Date: Mon, 4 Sep 2017 09:58:27 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] memorder: Silence compiler warnings in litmus tests
Reply-To: paulmck@linux.vnet.ibm.com
References: <937d7bee-b3dd-831a-98a5-c0dcab3996b3@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <937d7bee-b3dd-831a-98a5-c0dcab3996b3@gmail.com>
Message-Id: <20170904165827.GH15437@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
Content-Transfer-Encoding: Quoted-printable
MIME-Version: 1.0
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Sep 05, 2017 at 12:05:37AM +0900, Akira Yokosawa wrote:
> >From 410b1edcf1255563371b9b9bc8b54f10b3125090 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 4 Sep 2017 23:35:06 +0900
> Subject: [PATCH] memorder: Silence compiler warnings in litmus tests
>=20
> Silence warnings from gcc:
>=20
>     C-MP+o-r+o-ctrl-o.c:
>         warning: 'r3' may be used uninitialized in this function
>         [-Wmaybe-uninitialized]
>     C-W+RWC+o-mb-o+a-o+o-mb-o.c, C-W+RWC+o-r+a-o+o-mb-o.c:
>         warning: assignment makes pointer from integer without a cast
>         [-Wint-conversion]
>     C-W+RWC+o-mb-o+a-o+o-mb-o.c, C-W+RWC+o-r+a-o+o-mb-o.c:
>         warning: cast from pointer to integer of different size
>         [-Wpointer-to-int-cast]
>=20
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good catches, fixed, thank you!

I am clearly going to have train myself to scroll up beyond the
final-state histogram, aren't I?

							Thanx, Paul

> ---
>  CodeSamples/advsync/herd/C-MP+o-r+o-ctrl-o.litmus         |  2 +-
>  CodeSamples/advsync/herd/C-W+RWC+o-mb-o+a-o+o-mb-o.litmus |  6 +++---
>  CodeSamples/advsync/herd/C-W+RWC+o-r+a-o+o-mb-o.litmus    |  6 +++---
>  memorder/memorder.tex                                     | 14 +++++++--=
-----
>  4 files changed, 14 insertions(+), 14 deletions(-)
>=20
> diff --git a/CodeSamples/advsync/herd/C-MP+o-r+o-ctrl-o.litmus b/CodeSamp=
les/advsync/herd/C-MP+o-r+o-ctrl-o.litmus
> index fe44072..82cf629 100644
> --- a/CodeSamples/advsync/herd/C-MP+o-r+o-ctrl-o.litmus
> +++ b/CodeSamples/advsync/herd/C-MP+o-r+o-ctrl-o.litmus
> @@ -16,7 +16,7 @@ P0(int* x0, int* x1) {
>=20
>  P1(int* x0, int* x1) {
>  	int r2;
> -	int r3;
> +	int r3 =3D 0;
>=20
>  	r2 =3D READ_ONCE(*x1);
>  	if (r2 >=3D 0)
> diff --git a/CodeSamples/advsync/herd/C-W+RWC+o-mb-o+a-o+o-mb-o.litmus b/=
CodeSamples/advsync/herd/C-W+RWC+o-mb-o+a-o+o-mb-o.litmus
> index 1e0f1b7..23050e6 100644
> --- a/CodeSamples/advsync/herd/C-W+RWC+o-mb-o+a-o+o-mb-o.litmus
> +++ b/CodeSamples/advsync/herd/C-W+RWC+o-mb-o+a-o+o-mb-o.litmus
> @@ -19,8 +19,8 @@ P0(int *x, int *y)
>=20
>  P1(int *y, int *z)
>  {
> -	int *r1;
> -	int *r2;
> +	int r1;
> +	int r2;
>=20
>  	r1 =3D smp_load_acquire(y);
>  	r2 =3D READ_ONCE(*z);
> @@ -28,7 +28,7 @@ P1(int *y, int *z)
>=20
>  P2(int *z, int *x)
>  {
> -	int *r3;
> +	int r3;
>=20
>  	WRITE_ONCE(*z, 1);
>  	smp_mb();
> diff --git a/CodeSamples/advsync/herd/C-W+RWC+o-r+a-o+o-mb-o.litmus b/Cod=
eSamples/advsync/herd/C-W+RWC+o-r+a-o+o-mb-o.litmus
> index a71f1ac..527b373 100644
> --- a/CodeSamples/advsync/herd/C-W+RWC+o-r+a-o+o-mb-o.litmus
> +++ b/CodeSamples/advsync/herd/C-W+RWC+o-r+a-o+o-mb-o.litmus
> @@ -18,8 +18,8 @@ P0(int *x, int *y)
>=20
>  P1(int *y, int *z)
>  {
> -	int *r1;
> -	int *r2;
> +	int r1;
> +	int r2;
>=20
>  	r1 =3D smp_load_acquire(y);
>  	r2 =3D READ_ONCE(*z);
> @@ -27,7 +27,7 @@ P1(int *y, int *z)
>=20
>  P2(int *z, int *x)
>  {
> -	int *r3;
> +	int r3;
>=20
>  	WRITE_ONCE(*z, 1);
>  	smp_mb();
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 624f9a8..151af4e 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -1567,7 +1567,7 @@ P0(int* x0, int* x1) {
>=20
>  P1(int* x0, int* x1) {
>    int r2;
> -  int r3;
> +  int r3 =3D 0;
>=20
>    r2 =3D READ_ONCE(*x1);
>    if (r2 >=3D 0)
> @@ -2162,8 +2162,8 @@ P0(int *x, int *y)
>=20
>  P1(int *y, int *z)
>  {
> -  int *r1;
> -  int *r2;
> +  int r1;
> +  int r2;
>=20
>    r1 =3D smp_load_acquire(y);
>    r2 =3D READ_ONCE(*z);
> @@ -2171,7 +2171,7 @@ P1(int *y, int *z)
>=20
>  P2(int *z, int *x)
>  {
> -  int *r3;
> +  int r3;
>=20
>    WRITE_ONCE(*z, 1);
>    smp_mb();
> @@ -2258,8 +2258,8 @@ P0(int *x, int *y)
>=20
>  P1(int *y, int *z)
>  {
> -  int *r1;
> -  int *r2;
> +  int r1;
> +  int r2;
>=20
>    r1 =3D smp_load_acquire(y);
>    r2 =3D READ_ONCE(*z);
> @@ -2267,7 +2267,7 @@ P1(int *y, int *z)
>=20
>  P2(int *z, int *x)
>  {
> -  int *r3;
> +  int r3;
>=20
>    WRITE_ONCE(*z, 1);
>    smp_mb();
> --=20
> 2.7.4
>=20

--
To unsubscribe from this list: send the line "unsubscribe perfbook" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3=
A__vger.kernel.org_majordomo-2Dinfo.html&d=3DDwIBAg&c=3Djf_iaSHvJObTbx-siA1=
ZOg&r=3Dux41CW3B5BSVxDMRNRWyLbUmPebZc70Kq4AkfdiRGMI&m=3DbuSAKCmyVChRbvIbC5p=
qfrs3MK6aPbJv2midOUInLkY&s=3DS8ysDKR7FYGRxmPSL7QpBhmGXmJeIFCz8LL7uOlscv0&e=
=3D=20

