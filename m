Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:41039 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S935268AbdCXSMo (ORCPT <rfc822;perfbook@vger.kernel.org>); Fri,
 24 Mar 2017 14:12:44 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v2OI92wG029970
 for <perfbook@vger.kernel.org>; Fri, 24 Mar 2017 14:12:43 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 29cnst35jd-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Fri,
 24 Mar 2017 14:12:43 -0400
Received: from localhost by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Fri, 24 Mar
 2017 14:12:42 -0400
Date: Fri, 24 Mar 2017 11:12:39 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] FAQ-BUILD.txt: Fix misinfomation crept in wordsmithing
Reply-To: paulmck@linux.vnet.ibm.com
References: <d4e3f6ba-bdc9-fa85-7404-f189adfb6436@gmail.com>
 <20170323153558.GD3637@linux.vnet.ibm.com>
 <c7a6f457-3914-9e5e-a42a-29e9b8f67b77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7a6f457-3914-9e5e-a42a-29e9b8f67b77@gmail.com>
Message-Id: <20170324181239.GJ3637@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Mar 24, 2017 at 07:20:28AM +0900, Akira Yokosawa wrote:
> >From f7c19259ce4182688d94853c7fddc092011e802b Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Fri, 24 Mar 2017 07:03:54 +0900
> Subject: [PATCH] FAQ-BUILD.txt: Fix misinformation crept in by wordsmithing
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Hello, Akira,

I tried applying all three, then just the two in the series, and either
way, "git am" complains about not being able to apply the patches.
I did merge my wordsmithing into your original patch, which might be
the source of the problem.  Could you please check?

							Thanx, Paul

> ---
> Hi Paul,
> 
> Thanks for the wordsmithing.
> There were a few things I want fix.
> How about this patch?
> 
>                                  Thanks, Akira
> 
>  FAQ-BUILD.txt | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
> index c772e8f..a47eef6 100644
> --- a/FAQ-BUILD.txt
> +++ b/FAQ-BUILD.txt
> @@ -91,8 +91,8 @@
>  	A.	The simplest approach is to upgrade to a recent TeX
>  		distribution such as TeX Live 2016.  Upgrading your Linux
>  		distribution (e.g. to Ubuntu Xenial) is one way to
> -		upgrade to TeX Live 2016, and might have many other
> -		benefits as well.
> +		upgrade TeX Live (to 2015 on Xenial), and might	have many
> +		other benefits as well.
> 
>  		However, if you prefer to manually install individual
>  		packages, refer to "Method 3" in:
> @@ -105,9 +105,10 @@
>  			http://tex.stackexchange.com/questions/88423/
> 
>  		Note: If available, you can use the <package>.tds.zip,
> -		which will automatically put the files in the right place.
> -		Note that font packages should be copied to the TEXMFLOCAL
> -		directory rather than to the TEXFMHOME directory.
> +		which will automatically put the files in a relatively
> +		right place. Note that font packages should be copied to
> +		the TEXMFLOCAL directory rather than to the TEXFMHOME
> +		directory.
> 
>  		Following is a list of links to optional packages as of
>  		March 2017:
> -- 
> 2.7.4
> 

