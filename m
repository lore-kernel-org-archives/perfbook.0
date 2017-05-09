Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58033 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751306AbdEIOrw (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Tue, 9 May 2017 10:47:52 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v49EcmeB095001
 for <perfbook@vger.kernel.org>; Tue, 9 May 2017 10:47:52 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2aavrtse29-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 09 May 2017 10:47:51 -0400
Received: from localhost by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 9 May 2017
 10:47:51 -0400
Date: Tue, 9 May 2017 07:47:47 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] Replace definition of variable sum from int to
 unsigned long
Reply-To: paulmck@linux.vnet.ibm.com
References: <1494306511-9022-1-git-send-email-junchangwang@gmail.com>
 <1494306511-9022-2-git-send-email-junchangwang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1494306511-9022-2-git-send-email-junchangwang@gmail.com>
Message-Id: <20170509144747.GM3956@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Junchang Wang <junchangwang@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, May 09, 2017 at 01:08:30PM +0800, Junchang Wang wrote:
>  The maximum size of integer variable on 64bit machines is 2^31. Suppose the
>  writer takes 5 nanosecond to increase the counter by one, the result wraps
>  around in about 10 seconds.
> 
> Signed-off-by: Junchang Wang <junchangwang@gmail.com>

Good catch, queued!

							Thanx, Paul

> ---
>  CodeSamples/count/count_stat_eventual.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
> index 75a0ca9..059ab8b 100644
> --- a/CodeSamples/count/count_stat_eventual.c
> +++ b/CodeSamples/count/count_stat_eventual.c
> @@ -38,7 +38,7 @@ unsigned long read_count(void)
>  void *eventual(void *arg)
>  {
>  	int t;
> -	int sum;
> +	unsigned long sum;
> 
>  	while (stopflag < 3) {
>  		sum = 0;
> -- 
> 2.7.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

