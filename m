Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:29671 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)	by vger.kernel.org with
 ESMTP id S1757054AbcGZPWV (ORCPT	<rfc822;perfbook@vger.kernel.org>); Tue, 26
 Jul 2016 11:22:21 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])	by
 mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u6QFJHOc066443
 for <perfbook@vger.kernel.org>; Tue, 26 Jul 2016 11:22:21 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])	by
 mx0a-001b2d01.pphosted.com with ESMTP id 24e27ce53y-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Tue,
 26 Jul 2016 11:22:20 -0400
Received: from localhost	by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Tue, 26 Jul
 2016 09:22:19 -0600
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23])	by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id
 A75BE3E400A1	for <perfbook@vger.kernel.org>; Tue, 26 Jul 2016 09:22:16 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u6QFMGdG47448134	for <perfbook@vger.kernel.org>; Tue, 26 Jul 2016 15:22:16
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u6QFMFm6011608	for <perfbook@vger.kernel.org>; Tue, 26 Jul 2016 11:22:16
 -0400
Date: Tue, 26 Jul 2016 08:22:16 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] Tweak width of epigraph for two-column layout
Reply-To: paulmck@linux.vnet.ibm.com
References: <7dd18275-9406-b024-9766-6fe6aa3cb7e4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7dd18275-9406-b024-9766-6fe6aa3cb7e4@gmail.com>
Message-Id: <20160726152216.GY7094@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Jul 26, 2016 at 11:49:16PM +0900, Akira Yokosawa wrote:
> >From aa7969fe4675ab8ee3c7da0470b04f90574b641c Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 26 Jul 2016 20:31:20 +0900
> Subject: [PATCH] Tweak width of epigraph for two-column layout
> 
> The default of \epigraphwidth is .5\textwidth.
> It is too wide for two-column layout.
> This commit modifies it to .65\columnwidth for two-column
> layout.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

I am not so sure about this.  For example, see Chapter 3's epigraph,
which ends up with a separate line for the last word.  Ditto for the
"Glossary and Bibliography", and Appendix A.

Chapter 16 ends up with a piled-high epigraph, as does Chapter 7.

Of course, the one-column version has similarly compressed epigraphs.

So I am wondering if it might be better to leave the two-column
epigraph width alone and to expand the single-column epigraph width.

Thoughts?

							Thanx, Paul

> ---
>  perfbook.tex | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/perfbook.tex b/perfbook.tex
> index 9216485..24fffc6 100644
> --- a/perfbook.tex
> +++ b/perfbook.tex
> @@ -102,6 +102,10 @@
>  \setlength{\evensidemargin}{-4pt}
>  }{}
> 
> +\IfTwoColumn{
> +\setlength{\epigraphwidth}{0.65\columnwidth}
> +}{}
> +
>  \setcounter{secnumdepth}{3}
> 
>  \frontmatter
> -- 
> 1.9.1
> 
> 

