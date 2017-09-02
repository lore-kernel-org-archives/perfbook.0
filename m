Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35350 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1752721AbdIBQMe (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sat, 2 Sep 2017 12:12:34 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v82GAGwA080815
 for <perfbook@vger.kernel.org>; Sat, 2 Sep 2017 12:12:33 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2cqnk5nkbm-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sat,
 02 Sep 2017 12:12:33 -0400
Received: from localhost by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 2 Sep 2017
 12:12:32 -0400
Date: Sat, 2 Sep 2017 09:12:30 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] memorder: Express `value-returning RMW` more
 explicitly
Reply-To: paulmck@linux.vnet.ibm.com
References: <20170902024937.4227-1-sj38.park@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170902024937.4227-1-sj38.park@gmail.com>
Message-Id: <20170902161230.GJ19872@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
Content-Transfer-Encoding: Quoted-printable
MIME-Version: 1.0
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Sep 02, 2017 at 11:49:36AM +0900, SeongJae Park wrote:
> A sentence represents `Successful Non-Relaced Non-void RMW' row in
> `Linux-Kernel Memory-Ordering Cheat Sheet` as `value-returning RMW` row.
> Because it is far different expression, some reader may confuse.  This
> commit remove the confuse by representing the row with exactly same
> words.
>=20
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Good catches, applied both, thank you!

							Thanx, Paul

> ---
>  memorder/memorder.tex | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 3e85eca..5e7176e 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -507,9 +507,9 @@ The \co{*_acquire} row covers \co{smp_load_acquire()},
>  \co{cmpxchg_acquire()}, \co{xchg_release()}, and so on;
>  the \co{*_release} row covers \co{smp_store_release()},
>  \co{cmpxchg_release()}, \co{xchg_release()}, and so on; and
> -the value-returning RMW row covers \co{atomic_add_return()},
> -\co{atomic_add_unless()},
> -\co{atomic_dec_and_test()}, \co{cmpxchg()}, \co{xchg()}, and so on.
> +the ``Successful Non-Relaxed Non-\co{void} RMW'' row covers
> +\co{atomic_add_return()}, \co{atomic_add_unless()}, \co{atomic_dec_and_t=
est()},
> +\co{cmpxchg()}, \co{xchg()}, and so on.
>  The ``Successful'' qualifiers apply to primitives such as
>  \co{atomic_add_unless()}, \co{cmpxchg_acquire()}, and \co{cmpxchg_releas=
e()},
>  which have no effect on either memory or on ordering when they indicate
> --=20
> 2.10.0
>=20

--
To unsubscribe from this list: send the line "unsubscribe perfbook" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3=
A__vger.kernel.org_majordomo-2Dinfo.html&d=3DDwIBAg&c=3Djf_iaSHvJObTbx-siA1=
ZOg&r=3Dux41CW3B5BSVxDMRNRWyLbUmPebZc70Kq4AkfdiRGMI&m=3DVjmF1wSmnKfzHsjtYLh=
nVDL4Sn_rjJ0qmIkI1wh9cDM&s=3DIRasYQidXsEuhEadRYwKZtOJuZD_KbTh3IIyCMnRMLM&e=
=3D=20

