Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e31.co.us.ibm.com ([32.97.110.149]:49478 "EHLO
 e31.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1756088AbbJASG2 (ORCPT	<rfc822;perfbook@vger.kernel.org>); Thu, 1 Oct 2015
 14:06:28 -0400
Received: from localhost	by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Thu, 1 Oct 2015
 12:06:27 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])	by d03dlp02.boulder.ibm.com
 (Postfix) with ESMTP id C11B43E4003B	for <perfbook@vger.kernel.org>; Thu, 1
 Oct 2015 12:06:23 -0600 (MDT)
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 t91I5BXp8389078	for <perfbook@vger.kernel.org>; Thu, 1 Oct 2015 11:05:11
 -0700
Received: from d03av05.boulder.ibm.com (localhost [127.0.0.1])	by
 d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 t91I6MPY023808	for <perfbook@vger.kernel.org>; Thu, 1 Oct 2015 12:06:23 -0600
Date: Thu, 1 Oct 2015 11:06:23 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] Fix capitalisation of "Figure" in credits for real-time
 chapter
Message-ID: <20151001180623.GK4043@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <1443681916-394-1-git-send-email-andrew.donnellan@au1.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1443681916-394-1-git-send-email-andrew.donnellan@au1.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Cc: perfbook@vger.kernel.org

On Thu, Oct 01, 2015 at 04:45:16PM +1000, Andrew Donnellan wrote:
> Signed-off-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>

Good catch, applied and pushed, thank you!

							Thanx, Paul

> ---
>  contrib.tex | 16 ++++++++--------
>  rt/rt.tex   | 16 ++++++++--------
>  2 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/contrib.tex b/contrib.tex
> index 14cc20e..11bcdb3 100644
> --- a/contrib.tex
> +++ b/contrib.tex
> @@ -37,14 +37,14 @@
>  \ContribItem{Figure}{fig:advsync:Speculative Loads Cancelled by Barrier}{David Howells}
>  \ContribItem{Figure}{fig:advsync:Memory Architecture}{David Howells}
>  \ContribItem{Figure}{fig:advsync:Split Caches}{David Howells}
> -\ContribItem{figure}{fig:rt:Hard Real-Time Response Guarantee, Meet Hammer}{Melissa Broussard}
> -\ContribItem{figure}{fig:rt:Real-Time Response: Hardware Matters}{Melissa Broussard}
> -\ContribItem{figure}{fig:rt:Real-Time Response: Notification Insufficient}{Melissa Broussard}
> -\ContribItem{figure}{fig:rt:Timer Wheel at 1kHz}{Melissa Broussard}
> -\ContribItem{figure}{fig:rt:Timer Wheel at 100kHz}{Melissa Broussard}
> -\ContribItem{figure}{fig:rt:Priority Inversion and User Input}{Melissa Broussard}
> -\ContribItem{figure}{fig:rt:The Dark Side of Real-Time Computing}{Sarah McKenney}
> -\ContribItem{figure}{fig:rt:The Dark Side of Real-Fast Computing}{Sarah McKenney}
> +\ContribItem{Figure}{fig:rt:Hard Real-Time Response Guarantee, Meet Hammer}{Melissa Broussard}
> +\ContribItem{Figure}{fig:rt:Real-Time Response: Hardware Matters}{Melissa Broussard}
> +\ContribItem{Figure}{fig:rt:Real-Time Response: Notification Insufficient}{Melissa Broussard}
> +\ContribItem{Figure}{fig:rt:Timer Wheel at 1kHz}{Melissa Broussard}
> +\ContribItem{Figure}{fig:rt:Timer Wheel at 100kHz}{Melissa Broussard}
> +\ContribItem{Figure}{fig:rt:Priority Inversion and User Input}{Melissa Broussard}
> +\ContribItem{Figure}{fig:rt:The Dark Side of Real-Time Computing}{Sarah McKenney}
> +\ContribItem{Figure}{fig:rt:The Dark Side of Real-Fast Computing}{Sarah McKenney}
>  \ContribItem{Figure}{fig:easy:Shaving the Mandelbrot Set}{Melissa Broussard}
>  \ContribItem{Figure}{fig:future:Uniprocessor Uber Alles}{Melissa Broussard}
>  \ContribItem{Figure}{fig:future:Multithreaded Mania}{Melissa Broussard}
> diff --git a/rt/rt.tex b/rt/rt.tex
> index 12a75ca..efd1d9d 100644
> --- a/rt/rt.tex
> +++ b/rt/rt.tex
> @@ -75,7 +75,7 @@ some measure of exactly how soft it is.
>  \resizebox{3in}{!}{\includegraphics{cartoons/realtime-smash}}
>  \end{center}
>  \caption{Real-Time Response Guarantee, Meet Hammer}
> -\ContributedBy{figure}{fig:rt:Hard Real-Time Response Guarantee, Meet Hammer}{Melissa Broussard}
> +\ContributedBy{Figure}{fig:rt:Hard Real-Time Response Guarantee, Meet Hammer}{Melissa Broussard}
>  \end{figure}
> 
>  In contrast, the definition of hard real time is quite definite.
> @@ -94,7 +94,7 @@ But it is also true that I can always get a bigger hammer.
>  \resizebox{3in}{!}{\includegraphics{cartoons/realtime-lifesupport-nobomb}}
>  \end{center}
>  \caption{Real-Time Response: Hardware Matters}
> -\ContributedBy{figure}{fig:rt:Real-Time Response: Hardware Matters}{Melissa Broussard}
> +\ContributedBy{Figure}{fig:rt:Real-Time Response: Hardware Matters}{Melissa Broussard}
>  \end{figure}
> 
>  Then again, perhaps it is unfair to blame the software for what is clearly
> @@ -125,7 +125,7 @@ it can alert the hospital staff.
>  \resizebox{6in}{!}{\rotatebox{90}{\includegraphics{cartoons/realtime-lazy-crop}}}
>  \end{center}
>  \caption{Real-Time Response: Notification Insufficient}
> -\ContributedBy{figure}{fig:rt:Real-Time Response: Notification Insufficient}{Melissa Broussard}
> +\ContributedBy{Figure}{fig:rt:Real-Time Response: Notification Insufficient}{Melissa Broussard}
>  \end{figure*}
> 
>  Unfortunately, this approach has the trivial solution fancifully depicted in
> @@ -892,7 +892,7 @@ levels.
>  \resizebox{3.0in}{!}{\includegraphics{cartoons/1kHz}}
>  \end{center}
>  \caption{Timer Wheel at 1kHz}
> -\ContributedBy{figure}{fig:rt:Timer Wheel at 1kHz}{Melissa Broussard}
> +\ContributedBy{Figure}{fig:rt:Timer Wheel at 1kHz}{Melissa Broussard}
>  \end{figure}
> 
>  \begin{figure}[tb]
> @@ -900,7 +900,7 @@ levels.
>  \resizebox{3.0in}{!}{\includegraphics{cartoons/100kHz}}
>  \end{center}
>  \caption{Timer Wheel at 100kHz}
> -\ContributedBy{figure}{fig:rt:Timer Wheel at 100kHz}{Melissa Broussard}
> +\ContributedBy{Figure}{fig:rt:Timer Wheel at 100kHz}{Melissa Broussard}
>  \end{figure}
> 
>  Unfortunately, timer wheels do not work well for real-time systems, and for
> @@ -1046,7 +1046,7 @@ priority inversion.
>  \resizebox{3.4in}{!}{\includegraphics{cartoons/Priority_Boost_2}}
>  \end{center}
>  \caption{Priority Inversion and User Input}
> -\ContributedBy{figure}{fig:rt:Priority Inversion and User Input}{Melissa Broussard}
> +\ContributedBy{Figure}{fig:rt:Priority Inversion and User Input}{Melissa Broussard}
>  \end{figure}
> 
>  Of course, priority inheritance does have its limitations.
> @@ -1760,7 +1760,7 @@ unforgiving.
>  \resizebox{3.2in}{!}{\includegraphics{cartoons/RealTimeNotRealFast}}
>  \end{center}
>  \caption{The Dark Side of Real-Time Computing}
> -\ContributedBy{figure}{fig:rt:The Dark Side of Real-Time Computing}{Sarah McKenney}
> +\ContributedBy{Figure}{fig:rt:The Dark Side of Real-Time Computing}{Sarah McKenney}
>  \end{figure}
> 
>  \begin{figure}[tb]
> @@ -1768,7 +1768,7 @@ unforgiving.
>  \resizebox{3.2in}{!}{\includegraphics{cartoons/RealFastNotRealTime}}
>  \end{center}
>  \caption{The Dark Side of Real-Fast Computing}
> -\ContributedBy{figure}{fig:rt:The Dark Side of Real-Fast Computing}{Sarah McKenney}
> +\ContributedBy{Figure}{fig:rt:The Dark Side of Real-Fast Computing}{Sarah McKenney}
>  \end{figure}
> 
>  The choice between real-time and real-fast computing can be a difficult one.
> -- 
> Andrew Donnellan              Software Engineer, OzLabs
> andrew.donnellan@au1.ibm.com  Australia Development Lab, Canberra
> +61 2 6201 8874 (work)        IBM Australia Limited
> 
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

