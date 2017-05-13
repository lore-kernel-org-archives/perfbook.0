Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34433 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1754551AbdEMMqB (ORCPT <rfc822;perfbook@vger.kernel.org>); Sat, 13
 May 2017 08:46:01 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v4DChlRi035320
 for <perfbook@vger.kernel.org>; Sat, 13 May 2017 08:46:00 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2ae252rh4b-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sat,
 13 May 2017 08:46:00 -0400
Received: from localhost by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 13 May
 2017 08:45:59 -0400
Date: Sat, 13 May 2017 05:45:56 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] count_stat_eventual: Switch from ACCESS_ONCE() to
 READ_ONCE()/WRITE_ONCE()
Reply-To: paulmck@linux.vnet.ibm.com
References: <1494515022-30278-1-git-send-email-junchangwang@gmail.com>
 <1494515022-30278-2-git-send-email-junchangwang@gmail.com>
 <61acaa88-abd6-58f5-4d1f-80a2ef58d53e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61acaa88-abd6-58f5-4d1f-80a2ef58d53e@gmail.com>
Message-Id: <20170513124556.GJ3956@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Junchang Wang <junchangwang@gmail.com>, perfbook@vger.kernel.org

On Sat, May 13, 2017 at 09:04:38PM +0900, Akira Yokosawa wrote:
> Hi Jason & Paul,
> 
> although this has already been applied, I have a comment.
> 
> On 2017/05/11 23:03:41 +0800, Junchang Wang wrote:
> > Signed-off-by: Junchang Wang <junchangwang@gmail.com>
> > ---
> >  CodeSamples/count/count_stat_eventual.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
> > index 059ab8b..cbde4aa 100644
> > --- a/CodeSamples/count/count_stat_eventual.c
> > +++ b/CodeSamples/count/count_stat_eventual.c
> > @@ -27,12 +27,12 @@ int stopflag;
> >  
> >  void inc_count(void)
> >  {
> > -	ACCESS_ONCE(__get_thread_var(counter))++;
> > +	READ_ONCE(__get_thread_var(counter))++;
> 
> This is OK because READ_ONCE() is defined as the same as ACCESS_ONCE()
> in CodeSamples. However, the definition in the current Linux kernel
> would not permit this.
> 
> A read-modify-write access would need both READ_ONCE() and WRITE_ONCE().
> However, since "counter" is thread local and updated only by its owner,
> we don't need READ_ONCE() here. So:
> 
> +	WRITE_ONCE(__get_thread_var(counter), __get_thread_var(counter) + 1);
> 
> should have been sufficient.
> 
> Problem with this change is that the line gets too wide when applied to
> the code snippet in 2-column layout.

Good point -- though renumbering the code is not all -that- hard.

I clearly should have made a better READ_ONCE() that enforced the same
constraints as does the Linux kernel, perhaps something like this:

	#define READ_ONCE(x) ({ ACCESS_ONCE(x) })

Thoughts?

							Thanx, Paul

> Hmm...
> 
>                                  Thanks, Akira
> 
> >  }
> >  
> >  unsigned long read_count(void)
> >  {
> > -	return ACCESS_ONCE(global_count);
> > +	return READ_ONCE(global_count);
> >  }
> >  
> >  void *eventual(void *arg)
> > @@ -43,8 +43,8 @@ void *eventual(void *arg)
> >  	while (stopflag < 3) {
> >  		sum = 0;
> >  		for_each_thread(t)
> > -			sum += ACCESS_ONCE(per_thread(counter, t));
> > -		ACCESS_ONCE(global_count) = sum;
> > +			sum += READ_ONCE(per_thread(counter, t));
> > +		WRITE_ONCE(global_count, sum);
> >  		poll(NULL, 0, 1);
> >  		if (stopflag) {
> >  			smp_mb();
> > 
> 

