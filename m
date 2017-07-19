Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:54473 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1752952AbdGSRoz (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Wed, 19 Jul 2017 13:44:55 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v6JHcjrO069523
 for <perfbook@vger.kernel.org>; Wed, 19 Jul 2017 13:44:55 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2bta8gvj8h-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 19 Jul 2017 13:44:54 -0400
Received: from localhost by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 19 Jul
 2017 13:44:54 -0400
Date: Wed, 19 Jul 2017 10:44:50 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH] advsync: Add litmus tests of control dependency
Reply-To: paulmck@linux.vnet.ibm.com
References: <491b2704-0d61-aebc-0787-94cd0da74694@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <491b2704-0d61-aebc-0787-94cd0da74694@gmail.com>
Message-Id: <20170719174450.GI3730@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Jul 17, 2017 at 11:28:09PM +0900, Akira Yokosawa wrote:
> >From 892d8e1014c5bca1c83fbc35bcc1951c6c497b7f Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 17 Jul 2017 20:56:19 +0900
> Subject: [RFC PATCH] advsync: Add litmus tests of control dependency
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Hello, Akira,

If you make these have the ">" condition, I would be very happy to
apply the resulting patch.

							Thanx, Paul

> ---
> Hi Paul,
> 
> So I converted the 2 examples of control dependency to litmus tests.
> I mentioned the name "C-SB+o-c-o+o-c-o", but it should have been
> "C-LB+o-c-o+o-c-o".
> 
> They correspond to the example after the partial revert to the
> two-CPU example I submitted earlier.
> 
> Do they make sense?
> 
>           Thanks, Akira
> --
>  CodeSamples/advsync/herd/C-LB+o-c-o+o-c-o.litmus   | 27 ++++++++++++++++++
>  .../advsync/herd/C-WWC+o-c-o+o-c-o+o.litmus        | 32 ++++++++++++++++++++++
>  2 files changed, 59 insertions(+)
>  create mode 100644 CodeSamples/advsync/herd/C-LB+o-c-o+o-c-o.litmus
>  create mode 100644 CodeSamples/advsync/herd/C-WWC+o-c-o+o-c-o+o.litmus
> 
> diff --git a/CodeSamples/advsync/herd/C-LB+o-c-o+o-c-o.litmus b/CodeSamples/advsync/herd/C-LB+o-c-o+o-c-o.litmus
> new file mode 100644
> index 0000000..023af2e
> --- /dev/null
> +++ b/CodeSamples/advsync/herd/C-LB+o-c-o+o-c-o.litmus
> @@ -0,0 +1,27 @@
> +C C-LB+o-c-o+o-c-o
> +{
> +}
> +
> +{
> +#include "api.h"
> +}
> +
> +P0(int *x, int *y)
> +{
> +	int r1;
> +
> +	r1 = READ_ONCE(*x);
> +	if (r1 >= 0)
> +		WRITE_ONCE(*y, 1);
> +}
> +
> +P1(int *x, int *y)
> +{
> +	int r2;
> +
> +	r2 = READ_ONCE(*y);
> +	if (r2 >= 0)
> +		WRITE_ONCE(*x, 1);
> +}
> +
> +exists (0:r1=1 /\ 1:r2=1)
> diff --git a/CodeSamples/advsync/herd/C-WWC+o-c-o+o-c-o+o.litmus b/CodeSamples/advsync/herd/C-WWC+o-c-o+o-c-o+o.litmus
> new file mode 100644
> index 0000000..80dc2f6
> --- /dev/null
> +++ b/CodeSamples/advsync/herd/C-WWC+o-c-o+o-c-o+o.litmus
> @@ -0,0 +1,32 @@
> +C C-WWC+o-c-o+o-c-o+o
> +{
> +}
> +
> +{
> +#include "api.h"
> +}
> +
> +P0(int *x, int *y)
> +{
> +	int r1;
> +
> +	r1 = READ_ONCE(*x);
> +	if (r1 >= 0)
> +		WRITE_ONCE(*y, 1);
> +}
> +
> +P1(int *x, int *y)
> +{
> +	int r2;
> +
> +	r2 = READ_ONCE(*y);
> +	if (r2 >= 0)
> +		WRITE_ONCE(*x, 1);
> +}
> +
> +P2(int *x)
> +{
> +	WRITE_ONCE(*x, 2);
> +}
> +
> +exists (0:r1=2 /\ 1:r2=1 /\ x=2)
> -- 
> 2.7.4
> 

