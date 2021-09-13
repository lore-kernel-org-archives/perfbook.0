Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:58600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349820AbhIMWxB (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Mon, 13 Sep 2021 18:53:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631573497;
        bh=SfBFSB6eUxGZP4n6+Nrx0ry/GYkq3E18GECg9VEtipw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=jyXT/h+84xxeX0is56ncRMjcoW7mBYM0chAn8QXb+loS124/BIkNXSwAQAtrTuDHt
         mmp1YtQ8j9Bli/SxmyGcitJIV+l4NJNAXbVszia6vAl7jhkdY/sShh16CKGdz/kxUC
         F09gx22q2UIXYpHjurlKP5tLH0irzH99sA1ZLeankMKO2XSAhvFDWudOvAlnfWxqQ+
         j3BBEMiqP2swKd5TkrhZ/5X6QGtec3W+EuEyE23zI9hFzgn4vz1LEBtGttaw3Ihlk0
         pYRaRp+l49Y2Jia2hRliNuIPWZCZ7duy2PeI5xwO7HDTQH4lsFm1QuGwQrB1GxCTtU
         XGDuZRwIyBh9g==
Date: Mon, 13 Sep 2021 15:51:37 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 1/2] CodeSamples/defer: Comment out 'cp'
 commands of .eps files
Message-ID: <20210913225137.GL4156@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <dd6cee88-16ba-31d1-224a-469a25c76aa0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd6cee88-16ba-31d1-224a-469a25c76aa0@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Sep 12, 2021 at 08:52:01AM +0900, Akira Yokosawa wrote:
> They are supposed to have been commented out in commit d49e63354d45
> ("defer: Mark directories of unused data, take 2").
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good catches, thank you!  Queued and pushed.

							Thanx, Paul

> ---
>  CodeSamples/defer/data/OLD-paulmck.2016/plots.sh     | 10 +++++-----
>  .../defer/data/OLD-rcuscale.hps.2020.05.27a/plots.sh |  4 ++--
>  .../defer/data/rcuscale.hps.2020.05.28a/plots.sh     | 12 ++++++------
>  3 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/CodeSamples/defer/data/OLD-paulmck.2016/plots.sh b/CodeSamples/defer/data/OLD-paulmck.2016/plots.sh
> index a1ced80d..ef5bfcc2 100644
> --- a/CodeSamples/defer/data/OLD-paulmck.2016/plots.sh
> +++ b/CodeSamples/defer/data/OLD-paulmck.2016/plots.sh
> @@ -50,7 +50,7 @@ set label 2 "refcnt" at 7.8,30000 right
>  # set label 5 "refcnt" at 0.15,2.8 left
>  plot "route_seq.paulmck.2016.07.07a.dat" w l, "route_seq.paulmck.2016.07.07a.dat" w e, "route_refcnt.paulmck.2016.07.07a.dat" w l, "route_refcnt.paulmck.2016.07.07a.dat" w e
>  ---EOF---
> -cp perf-refcnt.eps ../..
> +# cp perf-refcnt.eps ../..
>  
>  gnuplot << ---EOF---
>  set term postscript portrait ${fontsize} enhanced "NimbusSanL-Regu" fontfile "${font}fonts/uhvr8a.pfb"
> @@ -69,7 +69,7 @@ set label 3 "hazptr" at 5,48000 left
>  # set label 5 "refcnt" at 0.15,2.8 left
>  plot "route_seq.paulmck.2016.07.07a.dat" w l, "route_seq.paulmck.2016.07.07a.dat" w e, "route_refcnt.paulmck.2016.07.07a.dat" w l, "route_refcnt.paulmck.2016.07.07a.dat" w e, "route_hazptr.paulmck.2016.07.07a.dat" w l, "route_hazptr.paulmck.2016.07.07a.dat" w e
>  ---EOF---
> -cp perf-hazptr.eps ../..
> +# cp perf-hazptr.eps ../..
>  
>  gnuplot << ---EOF---
>  set term postscript portrait ${fontsize} enhanced "NimbusSanL-Regu" fontfile "${font}fonts/uhvr8a.pfb"
> @@ -88,7 +88,7 @@ set label 4 "seqlock" at 7.8,165000 right
>  # set label 5 "refcnt" at 0.15,2.8 left
>  plot "route_seq.paulmck.2016.07.07a.dat" w l, "route_seq.paulmck.2016.07.07a.dat" w e, "route_refcnt.paulmck.2016.07.07a.dat" w l, "route_refcnt.paulmck.2016.07.07a.dat" w e, "route_hazptr.paulmck.2016.07.07a.dat" w l, "route_hazptr.paulmck.2016.07.07a.dat" w e, "route_seqlock.paulmck.2016.07.07a.dat" w l, "route_seqlock.paulmck.2016.07.07a.dat" w e
>  ---EOF---
> -cp perf-seqlock.eps ../..
> +# cp perf-seqlock.eps ../..
>  
>  gnuplot << ---EOF---
>  set term postscript portrait ${fontsize} enhanced "NimbusSanL-Regu" fontfile "${font}fonts/uhvr8a.pfb"
> @@ -107,7 +107,7 @@ set label 4 "seqlock" at 7.8,165000 right
>  set label 5 "RCU" at 7.8,286000 right
>  plot "route_seq.paulmck.2016.07.07a.dat" w l, "route_seq.paulmck.2016.07.07a.dat" w e, "route_refcnt.paulmck.2016.07.07a.dat" w l, "route_refcnt.paulmck.2016.07.07a.dat" w e, "route_hazptr.paulmck.2016.07.07a.dat" w l, "route_hazptr.paulmck.2016.07.07a.dat" w e, "route_seqlock.paulmck.2016.07.07a.dat" w l, "route_seqlock.paulmck.2016.07.07a.dat" w e, "route_rcu.paulmck.2016.07.07a.dat" w l, "route_rcu.paulmck.2016.07.07a.dat" w e
>  ---EOF---
> -cp perf-rcu.eps ../..
> +# cp perf-rcu.eps ../..
>  
>  gnuplot << ---EOF---
>  set term postscript portrait ${fontsize} enhanced "NimbusSanL-Regu" fontfile "${font}fonts/uhvr8a.pfb"
> @@ -126,4 +126,4 @@ set label 4 "seqlock" at 7.8,165000 right
>  set label 5 "RCU" at 7.8,286000 right
>  plot "route_seq.paulmck.2016.07.07a.dat" w l, "route_seq.paulmck.2016.07.07a.dat" w e, "route_refcnt.paulmck.2016.07.07a.dat" w l, "route_refcnt.paulmck.2016.07.07a.dat" w e, "route_hazptr.paulmck.2016.07.07a.dat" w l, "route_hazptr.paulmck.2016.07.07a.dat" w e, "route_seqlock.paulmck.2016.07.07a.dat" w l, "route_seqlock.paulmck.2016.07.07a.dat" w e, "route_rcu.paulmck.2016.07.07a.dat" w l, "route_rcu.paulmck.2016.07.07a.dat" w e, "route_rcu_qsbr.paulmck.2016.07.12a.dat" w l, "route_rcu_qsbr.paulmck.2016.07.12a.dat" w e
>  ---EOF---
> -cp perf-rcu-qsbr.eps ../..
> +# cp perf-rcu-qsbr.eps ../..
> diff --git a/CodeSamples/defer/data/OLD-rcuscale.hps.2020.05.27a/plots.sh b/CodeSamples/defer/data/OLD-rcuscale.hps.2020.05.27a/plots.sh
> index 64035066..2a4634ac 100644
> --- a/CodeSamples/defer/data/OLD-rcuscale.hps.2020.05.27a/plots.sh
> +++ b/CodeSamples/defer/data/OLD-rcuscale.hps.2020.05.27a/plots.sh
> @@ -49,7 +49,7 @@ set label 2 "rwlock" at 4,650 left
>  # set label 5 "RCU" at 400,1.4e7 right
>  plot "rcu-eb.$tag.dat" w l, "rcu-eb.$tag.dat" w e, "rwlock-eb.$tag.dat" w l, "rwlock-eb.$tag.dat" w e
>  ---EOF---
> -cp rwlockRCUperf.eps ../../../../defer
> +# cp rwlockRCUperf.eps ../../../../defer
>  
>  gnuplot << ---EOF---
>  set term postscript portrait ${fontsize} enhanced "NimbusSanL-Regu" fontfile "${font}fonts/uhvr8a.pfb"
> @@ -87,7 +87,7 @@ set label 2 "refcnt" at 4,450 left
>  # set label 5 "RCU" at 400,1.4e7 right
>  plot "rcu-eb.$tag.dat" w l, "rcu-eb.$tag.dat" w e, "refcnt-eb.$tag.dat" w l, "refcnt-eb.$tag.dat" w e
>  ---EOF---
> -cp refcntRCUperf.eps ../../../../defer
> +# cp refcntRCUperf.eps ../../../../defer
>  
>  exit 0
>  
> diff --git a/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/plots.sh b/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/plots.sh
> index 99f2e8d0..f967e358 100644
> --- a/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/plots.sh
> +++ b/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/plots.sh
> @@ -72,7 +72,7 @@ set output "prz-rwlockRCUperf.eps"
>  set size $przsize
>  replot
>  ---EOF---
> -cp rwlockRCUperf.eps ../../../../defer
> +# cp rwlockRCUperf.eps ../../../../defer
>  
>  gnuplot << ---EOF---
>  set term postscript portrait ${fontsize} enhanced "NimbusSanL-Regu" fontfile "${font}fonts/uhvr8a.pfb"
> @@ -94,7 +94,7 @@ set output "prz-rwlockRCUperfPREEMPT.eps"
>  set size $przsize
>  replot
>  ---EOF---
> -cp rwlockRCUperfPREEMPT.eps ../../../../defer
> +# cp rwlockRCUperfPREEMPT.eps ../../../../defer
>  
>  gnuplot << ---EOF---
>  set term postscript portrait ${fontsize} enhanced "NimbusSanL-Regu" fontfile "${font}fonts/uhvr8a.pfb"
> @@ -132,7 +132,7 @@ set label 2 "refcnt" at 4,450 left
>  # set label 5 "RCU" at 400,1.4e7 right
>  plot "rcu-eb.$tag.dat" w l, "rcu-eb.$tag.dat" w e, "refcnt-eb.$tag.dat" w l, "refcnt-eb.$tag.dat" w e
>  ---EOF---
> -cp refcntRCUperf.eps ../../../../defer
> +# cp refcntRCUperf.eps ../../../../defer
>  
>  gnuplot << ---EOF---
>  set term postscript portrait ${fontsize} enhanced "NimbusSanL-Regu" fontfile "${font}fonts/uhvr8a.pfb"
> @@ -151,7 +151,7 @@ set label 2 "refcnt" at 4,500 left
>  # set label 5 "RCU" at 400,1.4e7 right
>  plot "rcu-eb.$tag.preempt.dat" w l, "rcu-eb.$tag.preempt.dat" w e, "refcnt-eb.$tag.preempt.dat" w l, "refcnt-eb.$tag.preempt.dat" w e
>  ---EOF---
> -cp refRCUperfPREEMPT.eps ../../../../defer
> +# cp refRCUperfPREEMPT.eps ../../../../defer
>  
>  gnuplot << ---EOF---
>  set term postscript portrait ${fontsize} enhanced "NimbusSanL-Regu" fontfile "${font}fonts/uhvr8a.pfb"
> @@ -189,7 +189,7 @@ set output "prz-rwlockRCUperfwtlin.eps"
>  set size $przsize
>  replot
>  ---EOF---
> -cp rwlockRCUperfwt.eps ../../../../defer
> +# cp rwlockRCUperfwt.eps ../../../../defer
>  
>  gnuplot << ---EOF---
>  set term postscript portrait ${fontsize} enhanced "NimbusSanL-Regu" fontfile "${font}fonts/uhvr8a.pfb"
> @@ -208,7 +208,7 @@ set label 4 "1 CPU" at 120,500 left
>  # set label 5 "RCU" at 400,1.4e7 right
>  plot "rcu-1-eb.$tag.dat" w l, "refcnt-1-eb.$tag.dat" w l, "refcnt-1-eb.$tag.dat" w e, "refcnt-10-eb.$tag.dat" w l, "refcnt-10-eb.$tag.dat" w e, "refcnt-100-eb.$tag.dat" w l, "refcnt-100-eb.$tag.dat" w e
>  ---EOF---
> -cp refRCUperfwt.eps ../../../../defer
> +# cp refRCUperfwt.eps ../../../../defer
>  
>  exit 0
>  @@@  The following are needed when regenerating the pre-BSD routing plots
> -- 
> 2.17.1
> 
> 
