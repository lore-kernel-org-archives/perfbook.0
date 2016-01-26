Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mailgw.movielink.com.au ([175.103.28.14]:49006 "EHLO
 mailgw.movielink.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with
 ESMTP id S1751196AbcAZFxQ (ORCPT	<rfc822;perfbook@vger.kernel.org>); Tue, 26
 Jan 2016 00:53:16 -0500
Date: Mon, 25 Jan 2016 16:58:00 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] intro: trivial: remove an unnecessary dot
Message-ID: <20160126005800.GG4503@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <1453709567-9156-1-git-send-email-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1453709567-9156-1-git-send-email-sj38.park@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Jan 25, 2016 at 05:12:47PM +0900, SeongJae Park wrote:
> There is an unnecessary dot that seemed to be inserted by trivial
> mistake. This commit just removes the dot.
> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Good catch, applied!

							Thanx, Paul

> ---
>  intro/intro.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/intro/intro.tex b/intro/intro.tex
> index fc5a51e..0a8ecb7 100644
> --- a/intro/intro.tex
> +++ b/intro/intro.tex
> @@ -332,7 +332,7 @@ This change in focus is due to the fact that, although Moore's Law
>  continues to deliver increases in transistor density, it has ceased to
>  provide the traditional single-threaded performance increases.
>  This can be seen in
> -Figure~\ref{fig:intro:Clock-Frequency Trend for Intel CPUs}.\footnote{	
> +Figure~\ref{fig:intro:Clock-Frequency Trend for Intel CPUs}\footnote{	
>  	This plot shows clock frequencies for newer CPUs theoretically
>  	capable of retiring one or more instructions per clock, and MIPS
>  	(millions of instructions per second, usually from the old
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.

