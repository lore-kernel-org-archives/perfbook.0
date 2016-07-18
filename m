Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38691 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)	by vger.kernel.org with
 ESMTP id S1751290AbcGRWmV (ORCPT	<rfc822;perfbook@vger.kernel.org>); Mon, 18
 Jul 2016 18:42:21 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])	by
 mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u6IMXhEY132072
 for <perfbook@vger.kernel.org>; Mon, 18 Jul 2016 18:42:21 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])	by
 mx0a-001b2d01.pphosted.com with ESMTP id 2495r7c2na-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Mon,
 18 Jul 2016 18:42:20 -0400
Received: from localhost	by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Mon, 18 Jul
 2016 18:42:19 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])	by d01dlp02.pok.ibm.com (Postfix) with ESMTP id 67D4C6E803F
 for <perfbook@vger.kernel.org>; Mon, 18 Jul 2016 18:41:58 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u6IMgHuM64028826	for <perfbook@vger.kernel.org>; Mon, 18 Jul 2016 22:42:17
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u6IMgHGD025449	for <perfbook@vger.kernel.org>; Mon, 18 Jul 2016 18:42:17
 -0400
Date: Mon, 18 Jul 2016 15:42:41 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] qqz: Modify back link target at end of QQA to the end of
 QQ
Reply-To: paulmck@linux.vnet.ibm.com
References: <0bf67306-7169-4ce5-ca66-b68c2833ee99@gmail.com>
 <20160717215900.GD7094@linux.vnet.ibm.com>
 <731d8ed0-deae-e159-a889-ba38822011e8@gmail.com>
 <20160717233606.GE7094@linux.vnet.ibm.com>
 <113d52db-a2b8-8900-8163-576e8129877f@gmail.com>
 <51abb1c5-e843-ef5c-0c7f-121281ba2631@gmail.com>
 <20160718152525.GK7094@linux.vnet.ibm.com>
 <db41c385-84b4-78ea-8c08-faea987f8175@gmail.com>
 <3c27b3c8-77e2-e672-290d-a4dca787681e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c27b3c8-77e2-e672-290d-a4dca787681e@gmail.com>
Message-Id: <20160718224241.GO7094@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Jul 19, 2016 at 06:50:07AM +0900, Akira Yokosawa wrote:
> >From e51d65d2b5e10dcf4bd4f5970010c0cded292f0e Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 18 Jul 2016 08:41:12 +0900
> Subject: [PATCH] qqz: Modify back link target at end of QQA to the end of QQ
> 
> This commit modifies the target of back link at the end of QQA
> (white box) to the end of corresponding QQ in the main text.
> This change enables you to easily reach the text following a
> (possibly long) QQ by clicking a white box at the end of the QQA.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Much better!  Queued and pushed, thank you!

							Thanx, Paul

> ---
>  qqz.sty | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/qqz.sty b/qqz.sty
> index 0c97df9..4505f8c 100644
> --- a/qqz.sty
> +++ b/qqz.sty
> @@ -20,6 +20,7 @@
>  %%          Akira Yokosawa <akiyks@gmail.com>   # improvement of cross-link
> 
>  \newcounter{quickquizctr}[chapter]
> +\newcounter{quickquizctrE}[chapter]
>  \newcounter{quickquizctrC}[section]
>  \newcommand*{\theHNum}{\arabic{chapter}.\arabic{quickquizctr}}
>  \newcommand{\QuickQuizAnswerChapter}{\textbf{Unknown QuickQAC!!!}}
> @@ -33,7 +34,10 @@
>  \newcommand{\QuickQuiz}[1]{
>  	\refstepcounter{quickquizctr}
>  	\QuickQHeading{QQ}{QQA}{\thechapter.\thequickquizctr}}
> -\newcommand{\QuickQuizAnswer}[1]{\hyperref[QQA.\thechapter.\thequickquizctr]{\rule{7pt}{7pt}}}
> +\newcommand{\QuickQuizAnswer}[1]{%
> +	\refstepcounter{quickquizctrE}%
> +	\hyperref[QQA.\thechapter.\thequickquizctr]{\rule{7pt}{7pt}}%
> +	\label{QQE.\thechapter.\thequickquizctrE}}
>  \newcommand{\QuickQuizEnd}{}
> 
>  % To create a macro referencing the previously defined quick quiz:
> @@ -84,7 +88,7 @@
>  	\noindent\textbf{Answer:} \\ }
> 
>  \newcommand{\QuickE}{%
> -	\hyperref[QQ.\QuickQuizAnswerChapter.\thequickquizctrC]{\ding{113}}
> +	\hyperref[QQE.\QuickQuizAnswerChapter.\thequickquizctrC]{\ding{113}}
>  	\vspace{1.5\baselineskip}
>  }
> 
> -- 
> 1.9.1
> 
> 

