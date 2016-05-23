Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e34.co.us.ibm.com ([32.97.110.152]:49480 "EHLO
 e34.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1752407AbcEWShv (ORCPT	<rfc822;perfbook@vger.kernel.org>); Mon, 23 May 2016
 14:37:51 -0400
Received: from localhost	by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Mon, 23 May
 2016 12:37:50 -0600
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26])	by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id
 CDB1219D8040	for <perfbook@vger.kernel.org>; Mon, 23 May 2016 12:37:30 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4NIbmT044237054	for <perfbook@vger.kernel.org>; Mon, 23 May 2016 18:37:48
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4NIbme5022694	for <perfbook@vger.kernel.org>; Mon, 23 May 2016 14:37:48
 -0400
Date: Mon, 23 May 2016 11:37:47 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] FAQ: Replace deprecated manual font install path
Message-ID: <20160523183747.GF3825@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <1463700048-10268-1-git-send-email-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1463700048-10268-1-git-send-email-sj38.park@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, May 20, 2016 at 08:20:48AM +0900, SeongJae Park wrote:
> FAQ explains manual font installation with ~/.font/ directory though it
> is deprecated[1].  This commit modifies the sentence to use alternative
> path.
> 
> [1] https://wiki.archlinux.org/index.php/fonts#Manual_installation
> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Applied and pushed, thank you!

							Thanx, Paul

> ---
>  FAQ.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/FAQ.txt b/FAQ.txt
> index 6b13532..febc1df 100644
> --- a/FAQ.txt
> +++ b/FAQ.txt
> @@ -4,8 +4,8 @@
>  		fonts/steel-city-comic.regular.ttf. On most modern
>  		Linux systems, this can be done easily from your
>  		desktop environment, or by copying the file to the
> -		~/.fonts directory. You may need to run "fc-cache" to
> -		rebuild your font cache.
> +		~/.local/share/fonts directory. You may need to run
> +		"fc-cache" to rebuild your font cache.
> 
>  		Type "make" from the top-level directory.  If all goes
>  		well, this will produce a file named "perfbook.pdf",
> -- 
> 1.9.1
> 

