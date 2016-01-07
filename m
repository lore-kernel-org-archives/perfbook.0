Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e38.co.us.ibm.com ([32.97.110.159]:44742 "EHLO
 e38.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1752181AbcAGU4A (ORCPT	<rfc822;perfbook@vger.kernel.org>); Thu, 7 Jan 2016
 15:56:00 -0500
Received: from localhost	by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Thu, 7 Jan 2016
 13:56:00 -0700
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])	by d03dlp03.boulder.ibm.com
 (Postfix) with ESMTP id 4F10A19D8026	for <perfbook@vger.kernel.org>; Thu, 7
 Jan 2016 13:44:00 -0700 (MST)
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u07KtvBh25952266	for <perfbook@vger.kernel.org>; Thu, 7 Jan 2016 13:55:57
 -0700
Received: from d03av05.boulder.ibm.com (localhost [127.0.0.1])	by
 d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u07KtuXP028806	for <perfbook@vger.kernel.org>; Thu, 7 Jan 2016 13:55:57 -0700
Date: Thu, 7 Jan 2016 12:56:07 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] FAQ: remove duplicated prerequisite packages
Message-ID: <20160107205607.GV3818@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <1452185957-16022-1-git-send-email-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1452185957-16022-1-git-send-email-sj38.park@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Jan 08, 2016 at 01:59:17AM +0900, SeongJae Park wrote:
> Prerequisites for fedora has duplicated entry. This commit removes the
> duplicates.
> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Good catch, applied!

							Thanx, Paul

> ---
>  FAQ.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/FAQ.txt b/FAQ.txt
> index a698d3d..9af9cc0 100644
> --- a/FAQ.txt
> +++ b/FAQ.txt
> @@ -30,7 +30,7 @@
> 
>  			texlive-latex texlive-collection-latexextra
>  			psutils texlive-math* texlive-bibtex latex2html
> -			xfig latex2html xfig (and maybe also gnuplot-latex
> +			xfig (and maybe also gnuplot-latex
>  			texlive-publishers-doc texlive-fonts-extra
>  			texlive-science).
> 
> -- 
> 2.5.0
> 

