Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55378 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S934685AbcI0QOS (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 27
 Sep 2016 12:14:18 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id u8RGDbrl071292
 for <perfbook@vger.kernel.org>; Tue, 27 Sep 2016 12:14:18 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 25qr13d7vb-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 27 Sep 2016 12:14:17 -0400
Received: from localhost by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 27 Sep
 2016 10:14:16 -0600
Date: Tue, 27 Sep 2016 09:14:14 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] formal/dyntickrcu: Adjust font size of sample code
Reply-To: paulmck@linux.vnet.ibm.com
References: 
 <CAEjAshrzBH+=e7mHU3Dzw5ydOwBFHVtOVU-4Vqg0xJQX3HDewQ@mail.gmail.com>
 <20160921130548.9393-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160921130548.9393-1-sj38.park@gmail.com>
Message-Id: <20160927161414.GK14933@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: akiyks@gmail.com, perfbook@vger.kernel.org

On Wed, Sep 21, 2016 at 10:05:48PM +0900, SeongJae Park wrote:
> Code for `dyntickRCU-irqnn-ssl.spin` has a too long line.  Because the
> line breaks the layout, this commit reduces font size of the sample code
> for better layout.
> 
> Suggested-by: Akira Yokosawa <akiyks@gmail.com>
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Thank you both!

SeongJae, could you please resend the series?  Sorry to be so picky,
but you might be underestimating my ability to apply the wrong patch
at the wrong time.  ;-)

							Thanx, Paul

> ---
>  formal/dyntickrcu.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
> index d0b2c6e..a63d324 100644
> --- a/formal/dyntickrcu.tex
> +++ b/formal/dyntickrcu.tex
> @@ -1252,7 +1252,7 @@ and finally lines~32-43 model \co{rcu_irq_exit()}.
> 
>  The \co{grace_period()} process then becomes as follows:
> 
> -{ \scriptsize
> +{ \fontsize{6.7pt}{8pt}\selectfont
>  \begin{verbatim}
>    1 proctype grace_period()
>    2 {
> -- 
> 2.10.0
> 

