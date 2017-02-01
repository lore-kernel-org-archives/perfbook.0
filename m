Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51578 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751014AbdBAPw4 (ORCPT <rfc822;perfbook@vger.kernel.org>); Wed, 1
 Feb 2017 10:52:56 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v11FntXG145577
 for <perfbook@vger.kernel.org>; Wed, 1 Feb 2017 10:52:55 -0500
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 28bhehusrx-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 01 Feb 2017 10:52:55 -0500
Received: from localhost by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 1 Feb 2017
 08:52:53 -0700
Date: Wed, 1 Feb 2017 07:52:54 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] howto: Specify style of enumerate header
Reply-To: paulmck@linux.vnet.ibm.com
References: <11bda1dc-d40d-602c-b583-b1588bd1a7c4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11bda1dc-d40d-602c-b583-b1588bd1a7c4@gmail.com>
Message-Id: <20170201155254.GS30506@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Feb 02, 2017 at 12:10:06AM +0900, Akira Yokosawa wrote:
> >From c6d2effca0b51ec680dc3e7b4072279686a2690f Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 31 Jan 2017 22:14:49 +0900
> Subject: [PATCH] howto: Specify style of enumerate header
> 
> This enumeration contains reference to its headers.
> Specify "(a)" style for consistency.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Applied, thank you!

							Thanx, Paul

> ---
>  howto/howto.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/howto/howto.tex b/howto/howto.tex
> index f1f9cfe..2f1b0fc 100644
> --- a/howto/howto.tex
> +++ b/howto/howto.tex
> @@ -453,7 +453,7 @@ patch containing a \co{Signed-off-by:} line.
>  It is important to note that the \co{Signed-off-by:} line has
>  a very specific meaning, namely that you are certifying that:
> 
> -\begin{enumerate}
> +\begin{enumerate}[(a)]
>  \item	The contribution was created in whole or in part
>  	by me and I have the right to submit it under
>  	the open source license indicated in the file; or
> -- 
> 2.7.4
> 

