Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:52319 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1752154AbdHHX2E (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Tue, 8 Aug 2017 19:28:04 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v78NOAjW001214
 for <perfbook@vger.kernel.org>; Tue, 8 Aug 2017 19:28:03 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2c7kkg904e-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 08 Aug 2017 19:28:03 -0400
Received: from localhost by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 8 Aug 2017
 19:28:03 -0400
Date: Tue, 8 Aug 2017 16:27:59 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] Promote 'ruled' style as default of 'listing' environment
Reply-To: paulmck@linux.vnet.ibm.com
References: <acc91026-d2fe-3cc8-7c6f-f43662b533b8@gmail.com>
 <20170808223314.GK3730@linux.vnet.ibm.com>
 <51e05fb2-c89d-0cd5-d69f-968b5f61e0b8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51e05fb2-c89d-0cd5-d69f-968b5f61e0b8@gmail.com>
Message-Id: <20170808232759.GP3730@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Aug 09, 2017 at 07:44:39AM +0900, Akira Yokosawa wrote:
> >From 74a0c53cb677deafcb68b9a22efcffd08b724f74 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 9 Aug 2017 07:40:41 +0900
> Subject: [PATCH] Promote 'ruled' style as default of 'listing' environment
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  appendix/styleguide/styleguide.tex | 3 ---
>  perfbook.tex                       | 2 +-
>  2 files changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
> index f869360..829a9c2 100644
> --- a/appendix/styleguide/styleguide.tex
> +++ b/appendix/styleguide/styleguide.tex
> @@ -636,9 +636,6 @@ For code snippets, the ``ruled'' style would be our choice.
>  Listing~\ref{lst:app:styleguide:Sample Code Snippet (Ruled)}
>  is an example using the style.
> 
> -\floatstyle{ruled}
> -\restylefloat{listing}
> -
>  \begin{listing}
>  { \scriptsize
>  \begin{verbbox}[\LstLineNo]
> diff --git a/perfbook.tex b/perfbook.tex
> index f622708..8f166ec 100644
> --- a/perfbook.tex
> +++ b/perfbook.tex
> @@ -18,7 +18,7 @@
>  \usepackage{etoolbox}
> 
>  \usepackage{float}
> -\floatstyle{plain}
> +\floatstyle{ruled}
>  \newfloat{listing}{tbhp}{lst}[chapter]
>  \floatname{listing}{Listing}
>  \usepackage{lscape}
> -- 
> 2.7.4
> 
> 

