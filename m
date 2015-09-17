Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e32.co.us.ibm.com ([32.97.110.150]:51905 "EHLO
 e32.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1751104AbbIQSeQ (ORCPT	<rfc822;perfbook@vger.kernel.org>); Thu, 17 Sep 2015
 14:34:16 -0400
Received: from /spool/local	by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Thu, 17 Sep
 2015 12:34:16 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])	by d03dlp01.boulder.ibm.com
 (Postfix) with ESMTP id 728D71FF0049	for <perfbook@vger.kernel.org>; Thu, 17
 Sep 2015 12:25:22 -0600 (MDT)
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com
 [9.17.195.170])	by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0)
 with ESMTP id t8HIXLCG63307874	for <perfbook@vger.kernel.org>; Thu, 17 Sep
 2015 11:33:21 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])	by
 d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 t8HIYBU0004816	for <perfbook@vger.kernel.org>; Thu, 17 Sep 2015 12:34:12
 -0600
Date: Thu, 17 Sep 2015 11:34:09 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] qqz: avoid duplicate references
Message-ID: <20150917183409.GG4029@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <1442482376-16981-1-git-send-email-pbonzini@redhat.com>
 <1442482376-16981-2-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1442482376-16981-2-git-send-email-pbonzini@redhat.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: perfbook@vger.kernel.org

On Thu, Sep 17, 2015 at 11:32:55AM +0200, Paolo Bonzini wrote:
> \refstepcounter makes LaTeX create a label "quickquizctr.NN".  However
> such labels repeat in every chapter, which causes a complaint that
> "destination with the same identifier has been already used" in the
> log.  Avoid clutter by using \stepcounter instead.

Nice!  Queued and pushed.

							Thanx, Paul

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  qqz.sty | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/qqz.sty b/qqz.sty
> index 6a9da91..ca70c56 100644
> --- a/qqz.sty
> +++ b/qqz.sty
> @@ -23,7 +23,7 @@
>  	\label{#1}
>  	\setcounter{quickquizctr}{0}}
>  \newcommand{\QuickQuiz}[1]{
> -	\refstepcounter{quickquizctr}
> +	\stepcounter{quickquizctr}
>  	\textbf{Quick Quiz \thechapter.\thequickquizctr:}}
>  \newcommand{\QuickQuizAnswer}[1]{\rule{7pt}{7pt}}
>  \newcommand{\QuickQuizEnd}{}
> @@ -48,7 +48,7 @@
>  	\section{#2}}
> 
>  \newcommand{\QuickQ}[1]{
> -	\refstepcounter{quickquizctr} ~ \\ ~ \\
> +	\stepcounter{quickquizctr} ~ \\ ~ \\
>  	\textbf{Quick Quiz \QuickQuizAnswerChapter.\thequickquizctr:} #1 ~ \\ }
> 
>  \newcommand{\QuickA}[1]{\rule{7pt}{7pt} \\ ~ \\ \textbf{Answer:} \\ }
> -- 
> 2.5.0
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

