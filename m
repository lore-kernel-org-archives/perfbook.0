Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:45636 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1755422AbdIGPV1 (ORCPT <rfc822;perfbook@vger.kernel.org>); Thu, 7
 Sep 2017 11:21:27 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v87FIj4I000851
 for <perfbook@vger.kernel.org>; Thu, 7 Sep 2017 11:21:27 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2cu69n8tnx-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Thu,
 07 Sep 2017 11:21:26 -0400
Received: from localhost by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Thu, 7 Sep 2017
 11:21:24 -0400
Date: Thu, 7 Sep 2017 08:21:23 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] memorder: Fix conjugation
Reply-To: paulmck@linux.vnet.ibm.com
References: <b59bfc8c-5681-9e52-a407-7898fe22f821@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b59bfc8c-5681-9e52-a407-7898fe22f821@gmail.com>
Message-Id: <20170907152123.GM15437@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
Content-Transfer-Encoding: Quoted-printable
MIME-Version: 1.0
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Sep 07, 2017 at 11:47:16PM +0900, Akira Yokosawa wrote:
> >From 52de440ceddf2f7bd97b4ad31b656d089f4b7f78 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Thu, 7 Sep 2017 23:39:54 +0900
> Subject: [PATCH] memorder: Fix conjugation
>=20
> Fixes: bee1892d96f3 ("memorder: Shift more towards "load" and "store"")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good catch, applied, thank you!

							Thanx, Paul

> ---
>  memorder/memorder.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index c0d30c0..80b8ac3 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -256,7 +256,7 @@ record their stores in their respective store buffers.
>=20
>  Row~3 shows the two loads (lines~10 and~19 of
>  Listing~\ref{lst:memorder:Memory Misordering: Store-Buffering Litmus Tes=
t}).
> -Because the variable being load by each CPU is in that CPU's cache,
> +Because the variable being loaded by each CPU is in that CPU's cache,
>  each load immediately returns the cached value, which in both cases
>  is zero.
>=20
> --=20
> 2.7.4
>=20

--
To unsubscribe from this list: send the line "unsubscribe perfbook" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3=
A__vger.kernel.org_majordomo-2Dinfo.html&d=3DDwIBAg&c=3Djf_iaSHvJObTbx-siA1=
ZOg&r=3Dux41CW3B5BSVxDMRNRWyLbUmPebZc70Kq4AkfdiRGMI&m=3DAF8M59YhgZNjaQRkVXx=
1HMkLRY0jrU2xIAWd1hqt6Eg&s=3DXXKqO3-QhHfRFDxe_F37E6P2oDYZz-vdVh6nmIJtAlg&e=
=3D=20

