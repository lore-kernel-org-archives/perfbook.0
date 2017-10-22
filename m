Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:55790 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751018AbdJVCsC (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sat, 21 Oct 2017 22:48:02 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v9M2iKTx111783
 for <perfbook@vger.kernel.org>; Sat, 21 Oct 2017 22:48:01 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2dr24degsb-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sat,
 21 Oct 2017 22:48:01 -0400
Received: from localhost by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 21 Oct
 2017 22:48:00 -0400
Date: Sat, 21 Oct 2017 19:47:57 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] advsync/rt: Restore epigraph under section
Reply-To: paulmck@linux.vnet.ibm.com
References: <458f0875-24ae-d62b-6448-152affe8fb7c@gmail.com>
 <20171021171459.GM3521@linux.vnet.ibm.com>
 <a3fafdfc-4791-e648-204c-e879717a929a@gmail.com>
 <669ca5d5-c8e6-9ffe-8c39-97b94c80e30b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <669ca5d5-c8e6-9ffe-8c39-97b94c80e30b@gmail.com>
Message-Id: <20171022024757.GZ3521@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Oct 22, 2017 at 09:21:54AM +0900, Akira Yokosawa wrote:
> >From 101b029a0d2ab0296d51556a305099e73c6156e2 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 22 Oct 2017 09:03:58 +0900
> Subject: [PATCH] advsync/rt: Restore epigraph under section
> 
> By using the \epigraph{} command, sections can have their own
> epigraphs. The \noindent command is to keep afterheading-ness.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Not at all bad, actually!

However, I want to hold off on this one, as it will take some time
to come up with epigraphs for enough of the first-level sections
to avoid making this one look weird.

Something to start on after the upcoming release.  Oh, and suggestions
welcome.

							Thanx, Paul

> ---
>  advsync/rt.tex | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/advsync/rt.tex b/advsync/rt.tex
> index 4d86c5d..ebbb2f4 100644
> --- a/advsync/rt.tex
> +++ b/advsync/rt.tex
> @@ -3,9 +3,10 @@
>  \section{Parallel Real-Time Computing}
>  \label{sec:Parallel Real-Time Computing}
>  %
> -%\Epigraph{The difference between you and me is that I was right in time.}
> -%	 {\emph{Konrad Adenauer}}
> +\epigraph{The difference between you and me is that I was right in time.}
> +	 {\emph{Konrad Adenauer}}
> 
> +\noindent%
>  An important emerging area in computing is that of parallel real-time
>  computing.
>  Section~\ref{sec:advsync:What is Real-Time Computing?}
> -- 
> 2.7.4
> 
> 

