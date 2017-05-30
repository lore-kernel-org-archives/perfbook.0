Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46732 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1750844AbdE3AMt (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Mon, 29 May 2017 20:12:49 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v4U092KE061333
 for <perfbook@vger.kernel.org>; Mon, 29 May 2017 20:12:48 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2arverajb1-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 29 May 2017 20:12:48 -0400
Received: from localhost by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 29 May
 2017 20:12:48 -0400
Date: Mon, 29 May 2017 17:12:48 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 4/4] CodeSamples/defer: Add compiler barriers in
 gettimestampmp.c
Reply-To: paulmck@linux.vnet.ibm.com
References: <f9df1cc9-32af-951c-1f89-b89331c9dce9@gmail.com>
 <7422a673-c911-4916-b626-348f693f1180@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7422a673-c911-4916-b626-348f693f1180@gmail.com>
Message-Id: <20170530001247.GS3956@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, May 30, 2017 at 07:18:51AM +0900, Akira Yokosawa wrote:
> >From fd5fb9afb6b99b15370a9823b42fa2a92342b92a Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 28 May 2017 15:42:45 +0900
> Subject: [RFC PATCH 4/4] CodeSamples/defer: Add compiler barriers in gettimestampmp.c
> 
> They ensure curtimestamp is read and written once in every
> iteration.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

I was actually more or less OK with this one, but it does not apply
cleanly without 3/4.

Nevertheless, given that it needs change anyway, would it be better to
replace the ++ with a WRITE_ONCE and capture the value in the "while"
expression?

							Thanx, Paul

> ---
>  CodeSamples/defer/gettimestampmp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/CodeSamples/defer/gettimestampmp.c b/CodeSamples/defer/gettimestampmp.c
> index e794e82..7012caa 100644
> --- a/CodeSamples/defer/gettimestampmp.c
> +++ b/CodeSamples/defer/gettimestampmp.c
> @@ -32,7 +32,7 @@ void *collect_timestamps(void *mask_in)
>  	intptr_t mask = (intptr_t)mask_in;
> 
>  	while (curtimestamp < MAX_TIMESTAMPS) {
> -		while ((curtimestamp & CURTIMESTAMP_MASK) != mask)
> +		while ((READ_ONCE(curtimestamp) & CURTIMESTAMP_MASK) != mask)
>  			continue;
>  		if (curtimestamp >= MAX_TIMESTAMPS)
>  			break;
> @@ -40,6 +40,7 @@ void *collect_timestamps(void *mask_in)
>  		/* Don't need memory barrier -- no other shared vars!!! */
> 
>  		ts[curtimestamp++] = get_timestamp();
> +		barrier();
>  	}
>  	smp_mb();
>  	return (NULL);
> -- 
> 2.7.4
> 
> 

