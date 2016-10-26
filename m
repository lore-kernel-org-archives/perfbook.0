Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:45524 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1752282AbcJZPWk (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Wed, 26 Oct 2016 11:22:40 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id u9QFKiAh116996
 for <perfbook@vger.kernel.org>; Wed, 26 Oct 2016 11:22:40 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 26ac6qap3r-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 26 Oct 2016 11:22:39 -0400
Received: from localhost by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 26 Oct
 2016 09:22:38 -0600
Date: Wed, 26 Oct 2016 08:22:40 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] formal: Replace 'article' with 'section'
Reply-To: paulmck@linux.vnet.ibm.com
References: <5879c432-65ed-fc6c-7984-5b322b4bc4b8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5879c432-65ed-fc6c-7984-5b322b4bc4b8@gmail.com>
Message-Id: <20161026152240.GR3716@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Oct 27, 2016 at 12:07:02AM +0900, Akira Yokosawa wrote:
> >From 32b72b9fccd06a3ea30cd844e8361a176a9892aa Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 22 Oct 2016 20:35:44 +0900
> Subject: [PATCH] formal: Replace 'article' with 'section'
> 
> This commit removes a remnant of this section's origin in LWN.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good eyes!  Applied and pushed, thank you.

							Thanx, Paul

> ---
>  formal/spinhint.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/formal/spinhint.tex b/formal/spinhint.tex
> index ec53a7f..906de31 100644
> --- a/formal/spinhint.tex
> +++ b/formal/spinhint.tex
> @@ -51,7 +51,7 @@ book~\cite{Holzmann03a} on Promela and Spin,
>  as well as searchable online references starting at:
>  \url{http://www.spinroot.com/spin/Man/index.html}.
> 
> -The remainder of this article describes how to use Promela to debug
> +The remainder of this section describes how to use Promela to debug
>  parallel algorithms, starting with simple examples and progressing to
>  more complex uses.
> 
> -- 
> 2.7.4
> 

