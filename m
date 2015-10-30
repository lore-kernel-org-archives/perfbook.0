Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e32.co.us.ibm.com ([32.97.110.150]:47458 "EHLO
 e32.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1759012AbbJ3KAL (ORCPT	<rfc822;perfbook@vger.kernel.org>); Fri, 30 Oct 2015
 06:00:11 -0400
Received: from localhost	by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Fri, 30 Oct
 2015 04:00:11 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])	by d03dlp03.boulder.ibm.com
 (Postfix) with ESMTP id 9BB2A19D803F	for <perfbook@vger.kernel.org>; Fri, 30
 Oct 2015 03:48:17 -0600 (MDT)
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 t9U9wjV88782196	for <perfbook@vger.kernel.org>; Fri, 30 Oct 2015 02:58:45
 -0700
Received: from d03av05.boulder.ibm.com (localhost [127.0.0.1])	by
 d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 t9UA075A011325	for <perfbook@vger.kernel.org>; Fri, 30 Oct 2015 04:00:07
 -0600
Date: Fri, 30 Oct 2015 03:00:14 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] remove wraiths of 2up from FAQ and .gitignore
Message-ID: <20151030100014.GE4122@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <1446197836-25128-1-git-send-email-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1446197836-25128-1-git-send-email-sj38.park@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Oct 30, 2015 at 06:37:16PM +0900, SeongJae Park wrote:
> Output have unified to perfbook.pdf from the commit
> 0835aa627d2accb1f39c5584ddb693cf31c57db2 (Remove 2up from Makefile).
> However, the wraiths of 2up still exist. This commit removes them from
> FAQ and gitignore.
> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Good catch, applied, thank you!

							Thanx, Paul

> ---
>  .gitignore | 1 -
>  FAQ.txt    | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/.gitignore b/.gitignore
> index 7c9c46f..5df1646 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -34,7 +34,6 @@ RCS
>  /Pieces
>  /.Detritus
>  /perfbook.ps
> -/perfbook-2up.ps
>  perfbook_html/
> 
>  !/todo.txt
> diff --git a/FAQ.txt b/FAQ.txt
> index 631e18c..a698d3d 100644
> --- a/FAQ.txt
> +++ b/FAQ.txt
> @@ -1,7 +1,7 @@
>  1.	OK, I have downloaded this stuff.  What do I do now?
> 
>  	A.	Type "make" from the top-level directory.  If all goes
> -		well, this will produce a file named "perfbook-2up.pdf",
> +		well, this will produce a file named "perfbook.pdf",
>  		which prints two virtual pages per physical page.
> 
>  2.	The Makefile cannot find pdflatex.  What is it and where can I
> -- 
> 1.9.1
> 

