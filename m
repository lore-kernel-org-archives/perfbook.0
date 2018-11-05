Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:50896 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725777AbeKFFJg (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 6 Nov 2018 00:09:36 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wA5Jfi9t067966
        for <perfbook@vger.kernel.org>; Mon, 5 Nov 2018 14:48:20 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2njv4j0ev6-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Mon, 05 Nov 2018 14:48:19 -0500
Received: from localhost
        by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Mon, 5 Nov 2018 19:48:18 -0000
Date: Mon, 5 Nov 2018 11:48:13 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 2/2] memorybarriercum.svg: fix typo
Reply-To: paulmck@linux.ibm.com
References: <1541330319-14491-1-git-send-email-junchangwang@gmail.com>
 <1541330319-14491-3-git-send-email-junchangwang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1541330319-14491-3-git-send-email-junchangwang@gmail.com>
Message-Id: <20181105194813.GA4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Junchang Wang <junchangwang@gmail.com>
Cc: akiyks@gmail.com, perfbook@vger.kernel.org

On Sun, Nov 04, 2018 at 07:18:39PM +0800, Junchang Wang wrote:
> Fix typo in memorybarriercum.svg.
> 
> Signed-off-by: Junchang Wang <junchangwang@gmail.com>

Good catch, applied and queued, thank you!

							Thanx, Paul

> ---
>  memorder/memorybarriercum.svg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/memorder/memorybarriercum.svg b/memorder/memorybarriercum.svg
> index ac9e5cf..71b69a5 100644
> --- a/memorder/memorybarriercum.svg
> +++ b/memorder/memorybarriercum.svg
> @@ -212,7 +212,7 @@
>               id="tspan5462-5"
>               y="-981.5686"
>               x="-13.718384"
> -             sodipodi:role="line">... cumulativity guarantees CPU 0's store before CPU 2's store</tspan></text>
> +             sodipodi:role="line">... cumulativity guarantees CPU 0's store before CPU 1's store</tspan></text>
>        </g>
>        <g
>           transform="translate(0,53.92809)"
> -- 
> 2.7.4
> 

