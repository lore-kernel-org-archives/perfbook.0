Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:44902 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751128AbdCNQax (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Tue, 14 Mar 2017 12:30:53 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v2EGNn19140930
 for <perfbook@vger.kernel.org>; Tue, 14 Mar 2017 12:30:52 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 295xm4c8p6-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 14 Mar 2017 12:30:52 -0400
Received: from localhost by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 14 Mar
 2017 12:30:51 -0400
Date: Tue, 14 Mar 2017 09:30:48 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 1/6] runlatex.sh: Refactor further
Reply-To: paulmck@linux.vnet.ibm.com
References: <b0933155-7c2b-d271-c2a4-8cf78b133193@gmail.com>
 <c00849e8-cff8-2db0-d14a-d46593766761@gmail.com>
 <eed95c0b-befe-4514-55d2-a64b03ab6f28@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eed95c0b-befe-4514-55d2-a64b03ab6f28@gmail.com>
Message-Id: <20170314163048.GD3637@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Mar 14, 2017 at 09:38:31PM +0900, Akira Yokosawa wrote:
> >From a87bed749d870ce45fd7b328f4099a58271dfa20 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 13 Mar 2017 20:42:39 +0900
> Subject: [PATCH v2 1/6] runlatex.sh: Refactor further
> 
> This won't result in reducing line count, but is worth doing.

I applied and pushed this v2 series, thank you!

							Thanx, Paul

> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  utilities/runlatex.sh | 27 +++++++++++++++++----------
>  1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
> index e6b3938..cece545 100644
> --- a/utilities/runlatex.sh
> +++ b/utilities/runlatex.sh
> @@ -39,6 +39,17 @@ diff_warning () {
>  	fi
>  }
> 
> +identical_warnings () {
> +	if test -r $basename-warning-prev.log
> +	then
> +		if test "$iter" -gt "$min_iter" && diff_warning
> +		then
> +			return 0 ;
> +		fi
> +	fi
> +	return 1 ;
> +}
> +
>  iterate_latex () {
>  	pdflatex $basename > /dev/null 2>&1 < /dev/null || :
>  	if grep -q '! Emergency stop.' $basename.log
> @@ -76,27 +87,23 @@ rm -f $basename-first.log
>  iter=2
>  echo "pdflatex 2 for $basename.pdf # for possible bib update"
>  iterate_latex
> +min_iter=2
>  while grep -q 'LaTeX Warning: There were undefined references' $basename.log
>  do
> -	if test -r $basename-warning-prev.log
> +	if identical_warnings
>  	then
> -		if test "$iter" -gt 2 && diff_warning
> -		then
> -			break
> -		fi
> +		break
>  	fi
>  	iter=`expr $iter + 1`
>  	echo "pdflatex $iter for $basename.pdf # remaining undefined refs"
>  	iterate_latex
>  done
> +min_iter=3
>  while grep -q 'LaTeX Warning: Label(s) may have changed' $basename.log
>  do
> -	if test -r $basename-warning-prev.log
> +	if identical_warnings
>  	then
> -		if test "$iter" -gt 3 && diff_warning
> -		then
> -			break
> -		fi
> +		break
>  	fi
>  	iter=`expr $iter + 1`
>  	echo "pdflatex $iter for $basename.pdf # label(s) may have changed"
> -- 
> 2.7.4
> 
> 

