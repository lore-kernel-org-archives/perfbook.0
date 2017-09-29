Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:50844 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751692AbdI2A45 (ORCPT <rfc822;perfbook@vger.kernel.org>); Thu, 28
 Sep 2017 20:56:57 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v8T0sbWq096547
 for <perfbook@vger.kernel.org>; Thu, 28 Sep 2017 20:56:56 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2d96hwyu5m-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Thu,
 28 Sep 2017 20:56:56 -0400
Received: from localhost by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Thu, 28 Sep
 2017 20:56:55 -0400
Date: Thu, 28 Sep 2017 17:56:52 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] Use 'small' font in caption of code snippet
Reply-To: paulmck@linux.vnet.ibm.com
References: <dad58b29-1422-53cb-b2ab-98b060d5fed2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dad58b29-1422-53cb-b2ab-98b060d5fed2@gmail.com>
Message-Id: <20170929005652.GT3521@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Sep 29, 2017 at 07:42:07AM +0900, Akira Yokosawa wrote:
> >From e1a3f7e099581b811ea51ef20b27f019b25edee4 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Fri, 29 Sep 2017 07:16:07 +0900
> Subject: [PATCH] Use 'small' font in caption of code snippet
> 
> As code snippets use "scriptsize" font, the "normal" font of their
> captions looks too big when placed just above the code in the "ruled"
> style. Using the "small" font can reduce the size gap.
> 
> Also use colon as a separator in the caption as the same as those of
> figures and tables.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

It does look nicer, applied, thank you!!!

							Thanx, Paul

> ---
>  perfbook.tex | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/perfbook.tex b/perfbook.tex
> index 10346c7..84e48eb 100644
> --- a/perfbook.tex
> +++ b/perfbook.tex
> @@ -27,6 +27,7 @@
>  \usepackage{subfig}
>  \newsubfloat{listing}
>  \captionsetup{labelfont=bf}
> +\captionsetup[listing]{font=small,labelsep=colon}
>  % \usepackage{breakurl}
>  \usepackage{graphicx}
>  \usepackage{rotating}
> -- 
> 2.7.4
> 

