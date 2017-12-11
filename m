Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:56446 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751628AbdLKRIJ (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Mon, 11 Dec 2017 12:08:09 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vBBH62Rq152839
 for <perfbook@vger.kernel.org>; Mon, 11 Dec 2017 12:08:09 -0500
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2esw0p467b-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 11 Dec 2017 12:08:08 -0500
Received: from localhost by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 11 Dec
 2017 12:07:53 -0500
Date: Mon, 11 Dec 2017 09:07:55 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] CodeSamples/formal/herd: Import absperf scripts of
 Paul's litmus repo
Reply-To: paulmck@linux.vnet.ibm.com
References: <84124977-6d34-3760-b596-0b7d5502373e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84124977-6d34-3760-b596-0b7d5502373e@gmail.com>
Message-Id: <20171211170755.GT7829@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Dec 10, 2017 at 12:23:05AM +0900, Akira Yokosawa wrote:
> >From d44f361687f33ef3c293154d94a18571591d97ba Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Fri, 8 Dec 2017 00:11:26 +0900
> Subject: [PATCH 1/2] CodeSamples/formal/herd: Import absperf scripts of Paul's litmus repo
> 
> Import scripts as of commit 62d56aa9b4a2 ("Make absperf scripts more
> flexible") in Paul's repository at:
> 
>     https://github.com/paulmckrcu/litmus.git
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  CodeSamples/formal/herd/absperf-reduce.sh | 30 ++++++++++++++++++++++++++++++
>  CodeSamples/formal/herd/absperf.sh        | 15 +++++++++++++++
>  2 files changed, 45 insertions(+)
>  create mode 100644 CodeSamples/formal/herd/absperf-reduce.sh
>  create mode 100644 CodeSamples/formal/herd/absperf.sh
> 
> diff --git a/CodeSamples/formal/herd/absperf-reduce.sh b/CodeSamples/formal/herd/absperf-reduce.sh
> new file mode 100644
> index 0000000..0c338b8
> --- /dev/null
> +++ b/CodeSamples/formal/herd/absperf-reduce.sh
> @@ -0,0 +1,30 @@
> +#!/bin/sh
> +
> +awk '
> +/absperf/ {
> +	curtest=$1;
> +	testran = 0;
> +}
> +
> +/^Test/ {
> +	testran = 1;
> +}
> +
> +/maxresident)k/ {
> +	if (testran) {
> +		curtesttime = $0;
> +		gsub(/user .*$/, "", curtesttime);
> +		testtime_n[curtest]++;
> +		testtime_sum[curtest] += curtesttime;
> +		if (testtime_max[curtest] == "" || curtesttime > testtime_max[curtest])
> +			testtime_max[curtest] = curtesttime;
> +		if (testtime_min[curtest] == "" || curtesttime < testtime_min[curtest])
> +			testtime_min[curtest] = curtesttime;
> +	}
> +}
> +
> +END {
> +	for (i in testtime_n)
> +		print i, testtime_sum[i] / testtime_n[i], testtime_min[i], testtime_max[i];
> +}
> +'
> diff --git a/CodeSamples/formal/herd/absperf.sh b/CodeSamples/formal/herd/absperf.sh
> new file mode 100644
> index 0000000..4b54680
> --- /dev/null
> +++ b/CodeSamples/formal/herd/absperf.sh
> @@ -0,0 +1,15 @@
> +#!/bin/sh
> +
> +TIMECMD=/usr/bin/time
> +TESTBASE=${1:-litmus-tests}
> +TIMEOUT=${2:-15m}
> +ITER=${3:-10}
> +
> +for n in $(seq $ITER)
> +do
> +	for i in $TESTBASE/absperf/*.litmus
> +	do
> +		echo $i
> +		$TIMECMD timeout $TIMEOUT herd7 -conf linux-kernel.cfg $i
> +	done
> +done
> -- 
> 2.7.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

