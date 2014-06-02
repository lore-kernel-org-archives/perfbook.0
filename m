Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e39.co.us.ibm.com ([32.97.110.160]:47526 "EHLO
 e39.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1752396AbaFBRvu (ORCPT	<rfc822;perfbook@vger.kernel.org>); Mon, 2 Jun 2014
 13:51:50 -0400
Received: from /spool/local	by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Mon, 2 Jun 2014
 11:51:49 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])	by d03dlp01.boulder.ibm.com
 (Postfix) with ESMTP id 95A3EC40003	for <perfbook@vger.kernel.org>; Mon, 2
 Jun 2014 11:51:47 -0600 (MDT)
Received: from d03av06.boulder.ibm.com (d03av06.boulder.ibm.com
 [9.17.195.245])	by b03cxnp07029.gho.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0)
 with ESMTP id s52FmQQ74522442	for <perfbook@vger.kernel.org>; Mon, 2 Jun 2014
 17:48:26 +0200
Received: from d03av06.boulder.ibm.com (loopback [127.0.0.1])	by
 d03av06.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
 s52HtlLl015316	for <perfbook@vger.kernel.org>; Mon, 2 Jun 2014 11:55:47 -0600
Date: Mon, 2 Jun 2014 10:51:46 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Minor patch for perfbook
Message-ID: <20140602175146.GW22231@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: 
 <CA+rru_O9D8rFiE-8vniGroi_Hx0p0YbkvWm=fE6jhMh+bpCsUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CA+rru_O9D8rFiE-8vniGroi_Hx0p0YbkvWm=fE6jhMh+bpCsUQ@mail.gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Zygmunt Bazyli Krynicki <zkrynicki@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Jun 02, 2014 at 07:24:43PM +0200, Zygmunt Bazyli Krynicki wrote:
> Hi.
> 
> I sent this patch a while ago but I haven't seen any replies or it being
> applied in master so here it is again.

Either I fat-fingered it or a spam filter ate it.  Either way, I have
queued this one and pushed it, thank you for catching it and for
resending!

							Thanx, Paul

> Thanks
> ZK

> From ff8057f470c5c30a403dab66ed892005e1568ab7 Mon Sep 17 00:00:00 2001
> From: Zygmunt Krynicki <zygmunt.krynicki@canonical.com>
> Date: Mon, 28 Apr 2014 14:01:33 +0200
> Subject: [PATCH] Correct error message in lock_writer() in lock.c and
>  toolsoftrade.tex
> 
> Signed-off-by: Zygmunt Krynicki <zygmunt.krynicki@canonical.com>
> ---
>  CodeSamples/toolsoftrade/lock.c | 4 ++--
>  toolsoftrade/toolsoftrade.tex   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/CodeSamples/toolsoftrade/lock.c b/CodeSamples/toolsoftrade/lock.c
> index 1c129e2..56489a7 100644
> --- a/CodeSamples/toolsoftrade/lock.c
> +++ b/CodeSamples/toolsoftrade/lock.c
> @@ -62,7 +62,7 @@ void *lock_writer(void *arg)
>  	pthread_mutex_t *pmlp = (pthread_mutex_t *)arg;
>  
>  	if (pthread_mutex_lock(pmlp) != 0) {
> -		perror("lock_reader:pthread_mutex_lock");
> +		perror("lock_writer:pthread_mutex_lock");
>  		exit(-1);
>  	}
>  	for (i = 0; i < 3; i++) {
> @@ -70,7 +70,7 @@ void *lock_writer(void *arg)
>  		poll(NULL, 0, 5);
>  	}
>  	if (pthread_mutex_unlock(pmlp) != 0) {
> -		perror("lock_reader:pthread_mutex_unlock");
> +		perror("lock_writer:pthread_mutex_unlock");
>  		exit(-1);
>  	}
>  	return NULL;
> diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> index b4a237a..c98f3a7 100644
> --- a/toolsoftrade/toolsoftrade.tex
> +++ b/toolsoftrade/toolsoftrade.tex
> @@ -549,7 +549,7 @@ the other will wait until the first thread releases the lock.
>   34   pthread_mutex_t *pmlp = (pthread_mutex_t *)arg;
>   35 
>   36   if (pthread_mutex_lock(pmlp) != 0) {
> - 37     perror("lock_reader:pthread_mutex_lock");
> + 37     perror("lock_writer:pthread_mutex_lock");
>   38     exit(-1);
>   39   }
>   40   for (i = 0; i < 3; i++) {
> @@ -557,7 +557,7 @@ the other will wait until the first thread releases the lock.
>   42     poll(NULL, 0, 5);
>   43   }
>   44   if (pthread_mutex_unlock(pmlp) != 0) {
> - 45     perror("lock_reader:pthread_mutex_unlock");
> + 45     perror("lock_writer:pthread_mutex_unlock");
>   46     exit(-1);
>   47   }
>   48   return NULL;
> -- 
> 1.9.1
> 

