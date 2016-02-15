Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e18.ny.us.ibm.com ([129.33.205.208]:36150 "EHLO
 e18.ny.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1752090AbcBOGMC (ORCPT	<rfc822;perfbook@vger.kernel.org>); Mon, 15 Feb 2016
 01:12:02 -0500
Received: from localhost	by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Mon, 15 Feb
 2016 01:12:02 -0500
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])	by d01dlp02.pok.ibm.com (Postfix) with ESMTP id 2C4106E803F
 for <perfbook@vger.kernel.org>; Mon, 15 Feb 2016 00:58:51 -0500 (EST)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1F6BxVB22347946	for <perfbook@vger.kernel.org>; Mon, 15 Feb 2016 06:11:59
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1F6Bw6U000559	for <perfbook@vger.kernel.org>; Mon, 15 Feb 2016 01:11:59
 -0500
Date: Sun, 14 Feb 2016 22:12:04 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] toolsoftrade: fix a typo
Message-ID: <20160215061204.GX6719@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <1455406117-6924-1-git-send-email-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1455406117-6924-1-git-send-email-sj38.park@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Feb 14, 2016 at 08:28:36AM +0900, SeongJae Park wrote:
> There is a miss of a tilde between line and line number. This change fix
> the typo.
> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Queued, good catch, thank you!

							Thanx, Paul

> ---
>  toolsoftrade/toolsoftrade.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> index ccbe0ad..8d54d3a 100644
> --- a/toolsoftrade/toolsoftrade.tex
> +++ b/toolsoftrade/toolsoftrade.tex
> @@ -207,7 +207,7 @@ Otherwise, this is the parent, which checks for an error return from
>  the \co{fork()} primitive on line~4, and prints an error and exits
>  on lines~5-7 if so.
>  Otherwise, the \co{fork()} has executed successfully, and the parent
> -therefore executes line 9 with the variable \co{pid} containing the
> +therefore executes line~9 with the variable \co{pid} containing the
>  process ID of the child.
> 
>  \begin{figure}[tbp]
> -- 
> 1.9.1
> 

