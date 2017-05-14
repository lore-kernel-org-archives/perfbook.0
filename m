Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:44817 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1750848AbdENEU3 (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sun, 14 May 2017 00:20:29 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v4E4JIGY054555
 for <perfbook@vger.kernel.org>; Sun, 14 May 2017 00:20:29 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2aee5gu4vj-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 14 May 2017 00:20:28 -0400
Received: from localhost by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 14 May
 2017 00:20:28 -0400
Date: Sat, 13 May 2017 21:20:23 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] count_stat_eventual: Switch from ACCESS_ONCE() to
 READ_ONCE()/WRITE_ONCE()
Reply-To: paulmck@linux.vnet.ibm.com
References: <1494515022-30278-1-git-send-email-junchangwang@gmail.com>
 <1494515022-30278-2-git-send-email-junchangwang@gmail.com>
 <61acaa88-abd6-58f5-4d1f-80a2ef58d53e@gmail.com>
 <20170513124556.GJ3956@linux.vnet.ibm.com>
 <831607d1-8169-ee2c-1d48-c70381481cda@gmail.com>
 <20170513225637.GL3956@linux.vnet.ibm.com>
 <45998636-1d97-3c44-1e89-543366637317@gmail.com>
 <223e58f6-0689-8357-e25d-a69dfb459d1a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <223e58f6-0689-8357-e25d-a69dfb459d1a@gmail.com>
Message-Id: <20170514042023.GN3956@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Junchang Wang <junchangwang@gmail.com>, perfbook@vger.kernel.org

On Sun, May 14, 2017 at 10:31:51AM +0900, Akira Yokosawa wrote:
> On 2017/05/14 9:58, Akira Yokosawa wrote:
> > On 2017/05/14 7:56, Paul E. McKenney wrote:
> >> On Sat, May 13, 2017 at 11:37:06PM +0900, Akira Yokosawa wrote:
> >>> On 2017/05/13 05:45:56 -0700, Paul E. McKenney wrote:
> >>>> On Sat, May 13, 2017 at 09:04:38PM +0900, Akira Yokosawa wrote:
> >>>>> Hi Jason & Paul,
> >>>>>
> >>>>> although this has already been applied, I have a comment.
> >>>>>
> >>>>> On 2017/05/11 23:03:41 +0800, Junchang Wang wrote:
> >>>>>> Signed-off-by: Junchang Wang <junchangwang@gmail.com>
> >>>>>> ---
> >>>>>>  CodeSamples/count/count_stat_eventual.c | 8 ++++----
> >>>>>>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>>>>>
> >>>>>> diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
> >>>>>> index 059ab8b..cbde4aa 100644
> >>>>>> --- a/CodeSamples/count/count_stat_eventual.c
> >>>>>> +++ b/CodeSamples/count/count_stat_eventual.c
> >>>>>> @@ -27,12 +27,12 @@ int stopflag;
> >>>>>>  
> >>>>>>  void inc_count(void)
> >>>>>>  {
> >>>>>> -	ACCESS_ONCE(__get_thread_var(counter))++;
> >>>>>> +	READ_ONCE(__get_thread_var(counter))++;
> >>>>>
> >>>>> This is OK because READ_ONCE() is defined as the same as ACCESS_ONCE()
> >>>>> in CodeSamples. However, the definition in the current Linux kernel
> >>>>> would not permit this.
> >>>>>
> >>>>> A read-modify-write access would need both READ_ONCE() and WRITE_ONCE().
> >>>>> However, since "counter" is thread local and updated only by its owner,
> >>>>> we don't need READ_ONCE() here. So:
> >>>>>
> >>>>> +	WRITE_ONCE(__get_thread_var(counter), __get_thread_var(counter) + 1);
> >>>>>
> >>>>> should have been sufficient.
> >>>>>
> >>>>> Problem with this change is that the line gets too wide when applied to
> >>>>> the code snippet in 2-column layout.
> >>>>
> >>>> Good point -- though renumbering the code is not all -that- hard.
> >>>>
> >>>> I clearly should have made a better READ_ONCE() that enforced the same
> >>>> constraints as does the Linux kernel, perhaps something like this:
> >>>>
> >>>> 	#define READ_ONCE(x) ({ ACCESS_ONCE(x) })
> >>>>
> >>>> Thoughts?
> >>>
> >>> I assume you meant:
> >>>
> >>> 	#define READ_ONCE(x) ({ ACCESS_ONCE(x); })
> >>
> >> Indeed!  Good catch!!!
> >>
> >>> I'm afraid this still permits uses such as:
> >>>
> >>> 	READ_ONCE(y)++;
> >>>
> >>> Looks like we need a complex definition which resembles that of
> >>> include/linux/compiler.h.  Hmm???
> >>
> >> OK, how about this?
> >>
> >> #define READ_ONCE(x) ({ typeof(x) ___x = ACCESS_ONCE(x); ___x; })
> > 
> > Ah, this resulted in an error as expected!
> > 
> > 	main.c: In function ‘inc_test’:
> > 	main.c:11:18: error: lvalue required as increment operand
> > 	     READ_ONCE(*p)++;
> >
> 
> But the definition above will conflict with the argument "___x":
> 
> 	y = READ_ONCE(___x);
> 
> This won't work as expected.
> For CodeSamples, I guess we can safely reserve the name "___x".
> 
> Thoughts?

It is already reserved.  User programs are not supposed to start
variables with "__".  Which means that the "___x" name is of dubious
legality as far as the C standard is concerned, but so it goes.
If the compiler starts complaining about it, it can be changed.  ;-)

							Thanx, Paul

>                    Thanks, Akira
> 
> > Glad to know we can avoid the complexity of the kernel.
> > 
> >                         Thanks, Akira
> > 
> >>
> >>> And I have another pending question regarding 2/2 of this patch set.
> >>> That might result in other addition of line to the code. I think
> >>> I can send it tomorrow.
> >>
> >> Looking forward to seeing it!  ;-)
> >>
> >> 							Thanx, Paul
> >>
> >>>>> Hmm...
> >>>>>
> >>>>>                                  Thanks, Akira
> >>>>>
> >>>>>>  }
> >>>>>>  
> >>>>>>  unsigned long read_count(void)
> >>>>>>  {
> >>>>>> -	return ACCESS_ONCE(global_count);
> >>>>>> +	return READ_ONCE(global_count);
> >>>>>>  }
> >>>>>>  
> >>>>>>  void *eventual(void *arg)
> >>>>>> @@ -43,8 +43,8 @@ void *eventual(void *arg)
> >>>>>>  	while (stopflag < 3) {
> >>>>>>  		sum = 0;
> >>>>>>  		for_each_thread(t)
> >>>>>> -			sum += ACCESS_ONCE(per_thread(counter, t));
> >>>>>> -		ACCESS_ONCE(global_count) = sum;
> >>>>>> +			sum += READ_ONCE(per_thread(counter, t));
> >>>>>> +		WRITE_ONCE(global_count, sum);
> >>>>>>  		poll(NULL, 0, 1);
> >>>>>>  		if (stopflag) {
> >>>>>>  			smp_mb();
> >>>>>>
> >>>>>
> >>>>
> >>>>
> >>>
> >>
> >> .
> >>
> > 
> > 
> 

