Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55320 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750948AbdH3Qo0 (ORCPT <rfc822;perfbook@vger.kernel.org>); Wed, 30
 Aug 2017 12:44:26 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v7UGhl3r105386
 for <perfbook@vger.kernel.org>; Wed, 30 Aug 2017 12:44:26 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2cnur1hx2n-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 30 Aug 2017 12:44:26 -0400
Received: from localhost by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 30 Aug
 2017 12:44:25 -0400
Date: Wed, 30 Aug 2017 09:44:21 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] memorder: Fix conjunction use
Reply-To: paulmck@linux.vnet.ibm.com
References: <d1a261b4-cd41-b61b-2847-b6bbd80ca4d7@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1a261b4-cd41-b61b-2847-b6bbd80ca4d7@gmail.com>
Message-Id: <20170830164421.GA11320@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
Content-Transfer-Encoding: Quoted-printable
MIME-Version: 1.0
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Aug 31, 2017 at 12:12:46AM +0900, Akira Yokosawa wrote:
> >From 453e325a5fbfc1de64cb51d200fe744bbb79016f Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 30 Aug 2017 23:55:37 +0900
> Subject: [PATCH] memorder: Fix conjunction use
>=20
> Fixes: 06ca30969d19 ("memorder: Acquire operations are not cumulative")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Paul,
>=20
> This "unless" doesn't make sense as the following clause is
> "there are at most two threads involved". There should be
> other word choices. It's up to you which one to use.

Good catch, applied, thank you!

							Thanx, Paul

>     Thanks, Akira
> --
>  memorder/memorder.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 3b4763e..78f2cc4 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -518,7 +518,7 @@ failure.
>  Column ``C'' indicates cumulativity and propagation, as explained in
>  Sections~\ref{sec:memorder:Cumulativity}
>  and~\ref{sec:memorder:Propagation}.
> -In the meantime, this column can always be ignored unless there
> +In the meantime, this column can always be ignored when there
>  are at most two threads involved.
>=20
>  \QuickQuiz{}
> --=20
> 2.7.4
>=20

--
To unsubscribe from this list: send the line "unsubscribe perfbook" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3=
A__vger.kernel.org_majordomo-2Dinfo.html&d=3DDwIBAg&c=3Djf_iaSHvJObTbx-siA1=
ZOg&r=3Dux41CW3B5BSVxDMRNRWyLbUmPebZc70Kq4AkfdiRGMI&m=3DP-CUSqaCC4Mz9bsuPiE=
KNEf8kcq8e0zMNmGrlO7ehb0&s=3Db6OIqlcQfcpwzpHhLzCOAxwU3XdI7i72kw461yi05pI&e=
=3D=20

