Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e37.co.us.ibm.com ([32.97.110.158]:51056 "EHLO
 e37.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1751785AbbIQSdH (ORCPT	<rfc822;perfbook@vger.kernel.org>); Thu, 17 Sep 2015
 14:33:07 -0400
Received: from /spool/local	by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Thu, 17 Sep
 2015 12:33:06 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])	by d03dlp01.boulder.ibm.com
 (Postfix) with ESMTP id 482EA1FF0045	for <perfbook@vger.kernel.org>; Thu, 17
 Sep 2015 12:24:13 -0600 (MDT)
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com
 [9.17.195.170])	by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0)
 with ESMTP id t8HIVuYF41680968	for <perfbook@vger.kernel.org>; Thu, 17 Sep
 2015 11:31:56 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])	by
 d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 t8HIX3bE029670	for <perfbook@vger.kernel.org>; Thu, 17 Sep 2015 12:33:03
 -0600
Date: Thu, 17 Sep 2015 11:33:02 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] Typo in battery-powered systems Quick Quiz
Message-ID: <20150917183302.GF4029@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <1442482108-16627-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1442482108-16627-1-git-send-email-pbonzini@redhat.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: perfbook@vger.kernel.org

On Thu, Sep 17, 2015 at 11:28:28AM +0200, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Good catch, queued and pushed.

							Thanx, Paul

> ---
>  qqz.tex   | 4 ++--
>  rt/rt.tex | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/qqz.tex b/qqz.tex
> index cfd0356..2786754 100644
> --- a/qqz.tex
> +++ b/qqz.tex
> @@ -6822,8 +6822,8 @@ srcu_read_unlock(&srcucb, idx);
>  	But what about battery-powered systems?
>  	They don't require energy flowing into the system as a whole.
>  \QuickA{}
> -	Sooner or later, either the battery much be recharged, which
> -	requires energy to flow into the system, otherwise the system will
> +	Sooner or later, either the battery must be recharged, which
> +	requires energy to flow into the system, or the system will
>  	stop operating.
> 
>  \QuickQ{}
> diff --git a/rt/rt.tex b/rt/rt.tex
> index daf943c..12a75ca 100644
> --- a/rt/rt.tex
> +++ b/rt/rt.tex
> @@ -213,8 +213,8 @@ that portion of the outside world that is to be monitored or controlled.
>  	But what about battery-powered systems?
>  	They don't require energy flowing into the system as a whole.
>  \QuickQuizAnswer{
> -	Sooner or later, either the battery much be recharged, which
> -	requires energy to flow into the system, otherwise the system will
> +	Sooner or later, either the battery must be recharged, which
> +	requires energy to flow into the system, or the system will
>  	stop operating.
>  } \QuickQuizEnd
> 
> -- 
> 2.5.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

