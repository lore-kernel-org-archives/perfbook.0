Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50814 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751732AbdH3OrO (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Wed, 30 Aug 2017 10:47:14 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v7UEiICk130742
 for <perfbook@vger.kernel.org>; Wed, 30 Aug 2017 10:47:13 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2cnujj3s2u-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 30 Aug 2017 10:47:13 -0400
Received: from localhost by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 30 Aug
 2017 10:47:13 -0400
Date: Wed, 30 Aug 2017 07:47:09 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] memorder: Adjust position of wide tables in 1c layout
Reply-To: paulmck@linux.vnet.ibm.com
References: <5ecfbfc6-2a3f-407e-1d03-01d7a088261c@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ecfbfc6-2a3f-407e-1d03-01d7a088261c@gmail.com>
Message-Id: <20170830144709.GW11320@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
Content-Transfer-Encoding: Quoted-printable
MIME-Version: 1.0
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Aug 30, 2017 at 11:12:31PM +0900, Akira Yokosawa wrote:
> >From 10938ccbfc54a9a99f177455cb1beee2892ea3e4 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 30 Aug 2017 23:03:31 +0900
> Subject: [PATCH] memorder: Adjust position of wide tables in 1c layout
>=20
> Also fix typo in row count.

Good catch, applied and pushed!

							Thanx, Paul

> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  memorder/memorder.tex | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index e059384..56d94c3 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -424,7 +424,7 @@ things out in the end.
>=20
>  \begin{table*}
>  \small
> -\centering\OneColumnHSpace{-0.1in}
> +\centering\OneColumnHSpace{-0.7in}
>  \begin{tabular}{l||c||c|c|c|c||c|c|c|c|c|c}
>  	& & \multicolumn{4}{c||}{Prior Ordered Operation} &
>  		\multicolumn{6}{c}{Subsequent Ordered Operation} \\
> @@ -1811,7 +1811,7 @@ line to carry this new value to them.
>=20
>  \begin{table*}
>  \small
> -\centering\OneColumnHSpace{-0.1in}
> +\centering\OneColumnHSpace{-0.8in}
>  \begin{tabular}{r||l|l|l|l||l|l|l}
>  	& \tco{P0()} & \multicolumn{2}{c|}{\tco{P0()} \& \tco{P1()}} & \tco{P1(=
)} & \multicolumn{3}{c}{\tco{P2()}} \\
>  	\cline{2-8}
> @@ -1853,7 +1853,7 @@ line to carry this new value to them.
>  	11 & & \tco{x=3D=3D&x} & \tco{x=3D=3D&a} &
>  		 & (Respond \co{x}) & & \tco{y=3D=3D&c} \\
>  	\hline
> -	11 & (Finish store) & & \tco{x=3D=3D&x} &
> +	12 & (Finish store) & & \tco{x=3D=3D&x} &
>  		 &  & & \tco{y=3D=3D&c} \\
>  \end{tabular}
>  \caption{Memory Ordering: WWC Sequence of Events}
> --=20
> 2.7.4
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  https://urldefense.proofpoint.com/v2/url?u=3Dhttp=
-3A__vger.kernel.org_majordomo-2Dinfo.html&d=3DDwIBAg&c=3Djf_iaSHvJObTbx-si=
A1ZOg&r=3Dux41CW3B5BSVxDMRNRWyLbUmPebZc70Kq4AkfdiRGMI&m=3DjSlZ9F8tSMl3gPIQt=
RQZm3_MuIdzYHB6qMy4TRGVOts&s=3DULDs7hyETcZsSJo38R0lZRkC6Yg2tHuL90Iu4pjkAvU&=
e=3D=20
>=20

--
To unsubscribe from this list: send the line "unsubscribe perfbook" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3=
A__vger.kernel.org_majordomo-2Dinfo.html&d=3DDwIBAg&c=3Djf_iaSHvJObTbx-siA1=
ZOg&r=3Dux41CW3B5BSVxDMRNRWyLbUmPebZc70Kq4AkfdiRGMI&m=3DjSlZ9F8tSMl3gPIQtRQ=
Zm3_MuIdzYHB6qMy4TRGVOts&s=3DULDs7hyETcZsSJo38R0lZRkC6Yg2tHuL90Iu4pjkAvU&e=
=3D=20

