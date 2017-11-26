Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55376 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751297AbdKZSkW (ORCPT <rfc822;perfbook@vger.kernel.org>); Sun, 26
 Nov 2017 13:40:22 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vAQIcvo3133736
 for <perfbook@vger.kernel.org>; Sun, 26 Nov 2017 13:40:22 -0500
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2efpqdm7w2-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 26 Nov 2017 13:40:21 -0500
Received: from localhost by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 26 Nov
 2017 13:40:20 -0500
Date: Sun, 26 Nov 2017 10:40:24 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] CodeSamples/formal/herd: Remove dependency to memory
 model in cross-klitmus
Reply-To: paulmck@linux.vnet.ibm.com
References: <eb163ed9-ab88-6227-30ab-a985ababfc69@gmail.com>
 <436dc15a-073d-adec-3fd6-92633bd93041@gmail.com>
 <7350c9f9-6f73-3a00-eee6-239889f93d37@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="6Nae48J/T25AfBN4"
Content-Disposition: inline
In-Reply-To: <7350c9f9-6f73-3a00-eee6-239889f93d37@gmail.com>
Message-Id: <20171126184024.GC3624@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org


--6Nae48J/T25AfBN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 23, 2017 at 12:17:57PM +0900, Akira Yokosawa wrote:
> >From 62491d966a645d08ffc6bb0c5bae9f725458cbec Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Thu, 23 Nov 2017 12:07:18 +0900
> Subject: [PATCH] CodeSamples/formal/herd: Remove dependency to memory model in cross-klitmus
> 
> Target "cross-klitmus" does not depend on memory model.
> Remove the implicit dependency of "cd $(LKMM_DIR)" from the recipe.
> 
> Fixes: ef76630632df ("CodeSamples/formal/herd: Add Makefile and utility script")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

I applied and pushed both, the first just before the release and the one
below as the first commit after the release.

I also attached the (very crude) scripts that I use to collect herd
performance data, just in case they are useful.

							Thanx, Paul

> ---
>  CodeSamples/formal/herd/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/CodeSamples/formal/herd/Makefile b/CodeSamples/formal/herd/Makefile
> index 1abe5c7..b99699b 100644
> --- a/CodeSamples/formal/herd/Makefile
> +++ b/CodeSamples/formal/herd/Makefile
> @@ -73,7 +73,7 @@ cross-klitmus: klitmus.tar
> 
>  klitmus.tar: litmus2herd
>  	mkdir -p klitmus
> -	cd $(LKMM_DIR); klitmus7 -o $(HERD_DIR)/klitmus $(addprefix $(HERD_DIR)/,$(LITMUS7_HERD_TEST))
> +	klitmus7 -o klitmus $(LITMUS7_HERD_TEST)
>  	tar cf klitmus.tar ./klitmus
> 
>  clean:
> -- 
> 2.7.4
> 
> 

--6Nae48J/T25AfBN4
Content-Type: application/x-sh
Content-Description: absperf.sh
Content-Disposition: attachment; filename="absperf.sh"
Content-Transfer-Encoding: quoted-printable

#!/bin/sh=0A=0Afor n in 1 2 3 4 5 6 7 8 9 10=0Ado=0A	for i in litmus-tests/=
absperf/*.litmus=0A	do=0A		echo $i=0A		time timeout 15m herd7 -conf linux-k=
ernel.cfg $i=0A	done=0Adone=0A
--6Nae48J/T25AfBN4
Content-Type: application/x-sh
Content-Description: absperf-reduce.sh
Content-Disposition: attachment; filename="absperf-reduce.sh"
Content-Transfer-Encoding: quoted-printable

#!/bin/sh=0A=0Aawk '=0A/^litmus-tests/ {=0A	curtest=3D$1;=0A	testran =3D 0;=
=0A}=0A=0A/^Test/ {=0A	testran =3D 1;=0A}=0A=0A/maxresident)k/ {=0A	if (tes=
tran) {=0A		curtesttime =3D $0;=0A		gsub(/user .*$/, "", curtesttime);=0A		=
testtime_n[curtest]++;=0A		testtime_sum[curtest] +=3D curtesttime;=0A		if (=
testtime_max[curtest] =3D=3D "" || curtesttime > testtime_max[curtest])=0A	=
		testtime_max[curtest] =3D curtesttime;=0A		if (testtime_min[curtest] =3D=
=3D "" || curtesttime < testtime_min[curtest])=0A			testtime_min[curtest] =
=3D curtesttime;=0A	}=0A}=0A=0AEND {=0A	for (i in testtime_n)=0A		print i, =
testtime_sum[i] / testtime_n[i], testtime_min[i], testtime_max[i];=0A}=0A'=
=0A
--6Nae48J/T25AfBN4--

