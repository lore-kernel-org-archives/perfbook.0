Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34921 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751075AbcL3BjJ (ORCPT <rfc822;perfbook@vger.kernel.org>); Thu, 29
 Dec 2016 20:39:09 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id uBU1d89w023899
 for <perfbook@vger.kernel.org>; Thu, 29 Dec 2016 20:39:09 -0500
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 27n40g30m8-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Thu,
 29 Dec 2016 20:39:08 -0500
Received: from localhost by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Thu, 29 Dec
 2016 18:39:08 -0700
Date: Thu, 29 Dec 2016 17:39:11 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] howto: Embed mailto: link into perfbook list address
Reply-To: paulmck@linux.vnet.ibm.com
References: <082e1ee1-267c-7143-5740-0f6a0ac47b16@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <082e1ee1-267c-7143-5740-0f6a0ac47b16@gmail.com>
Message-Id: <20161230013911.GM3742@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Dec 30, 2016 at 09:17:36AM +0900, Akira Yokosawa wrote:
> >From ad87c108ddaea7b5521ccfc9b57e8aa99fb20258 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Fri, 30 Dec 2016 09:06:12 +0900
> Subject: [PATCH] howto: Embed mailto: link into perfbook list address
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good catch, applied and pushed.

							Thanx, Paul

> ---
>  howto/howto.tex | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/howto/howto.tex b/howto/howto.tex
> index b48ce3f..9a8604c 100644
> --- a/howto/howto.tex
> +++ b/howto/howto.tex
> @@ -394,7 +394,8 @@ Other types of systems have well-known ways of locating files by filename.
> 
>  As the cover says, the editor is one Paul E.~McKenney.
>  However, the editor does accept contributions via the
> -\co{perfbook@vger.kernel.org} email list.
> +\href{mailto:perfbook@vger.kernel.org}
> +{\nolinkurl{perfbook@vger.kernel.org}} email list.
>  These contributions can be in pretty much any form, with popular
>  approaches including text emails,
>  patches against the book's \LaTeX{} source, and even \co{git pull} requests.
> -- 
> 2.7.4
> 

