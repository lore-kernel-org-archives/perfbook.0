Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:52591 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1750737AbdHZQwS (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sat, 26 Aug 2017 12:52:18 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v7QGmrKO023575
 for <perfbook@vger.kernel.org>; Sat, 26 Aug 2017 12:52:18 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2ck352gr07-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sat,
 26 Aug 2017 12:52:18 -0400
Received: from localhost by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 26 Aug
 2017 12:52:17 -0400
Date: Sat, 26 Aug 2017 09:52:26 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] FAQ-BUILD.txt: Update Fedora requirements
Reply-To: paulmck@linux.vnet.ibm.com
References: <20170826093314.17614-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170826093314.17614-1-sj38.park@gmail.com>
Message-Id: <20170826165226.GY11320@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Aug 26, 2017 at 06:33:14PM +0900, SeongJae Park wrote:
> Fedora 24 has officially entered End of Life[1].  This commit updates
> necessary pacakges information for Fedora 24 to Fedora 26.
> 
> [1] https://fedoramagazine.org/fedora-24-eol/
> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Applied, thank you!

							Thanx, Paul

> ---
>  FAQ-BUILD.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
> index 2bd37f1..1fa581d 100644
> --- a/FAQ-BUILD.txt
> +++ b/FAQ-BUILD.txt
> @@ -46,9 +46,9 @@
>  		On Ubuntu Trusty, in addition to the above, you need:
>  			texlive-humanities
> 
> -		On Fedora 24, installing the following set of packages
> +		On Fedora 26, installing the following set of packages
>  		suffices:
> -			fig2ps graphviz texlive-epstopdf inkscape latex2html
> +			texlive-a2ping fig2ps graphviz inkscape latex2html
>  			texlive-collection-latexextra
> 
>  		Other systems might provide similarly named packages.
> -- 
> 2.10.0
> 

