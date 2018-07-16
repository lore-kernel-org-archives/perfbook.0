Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49986 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1727479AbeGPRFS (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Mon, 16 Jul 2018 13:05:18 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w6GGXVGk022335
 for <perfbook@vger.kernel.org>; Mon, 16 Jul 2018 12:37:05 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2k8uww97hq-1 (version=TLSv1.2
 cipher=AES256-GCM-SHA384 bits=256 verify=NOT) for <perfbook@vger.kernel.org>;
 Mon, 16 Jul 2018 12:37:05 -0400
Received: from localhost by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 16 Jul
 2018 12:37:04 -0400
Date: Mon, 16 Jul 2018 09:39:24 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Section 4.2: wrong error reporting for pthread functions
Reply-To: paulmck@linux.vnet.ibm.com
References: 
 <CAJbg=FVjq_rwhvSw3Y=7xOxUqN_kV4P=wD42HU9=1u3KGnyJpg@mail.gmail.com>
 <20180714233313.GH12945@linux.vnet.ibm.com>
 <4131cfaa-45c2-e0e0-ecc0-dfa3058c53c3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4131cfaa-45c2-e0e0-ecc0-dfa3058c53c3@gmail.com>
Message-Id: <20180716163924.GZ12945@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Elad Lahav <e2lahav@gmail.com>, perfbook@vger.kernel.org

On Tue, Jul 17, 2018 at 12:42:57AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> See inline comments below for a few nits and suggestions.

I fixed the perror() calls straightforwardly, thank you!
Queued and pushed with both your and Elad's Reported-by.

> On 2018/07/14 16:33:13 -0700, Paul E. McKenney wrote:
> > On Sat, Jul 14, 2018 at 08:59:48AM -0400, Elad Lahav wrote:

[ . . . ]

> I see you have already updated most of the code samples under CodeSamples/,
> but let me suggest an alternative way not to increase line counts
> (or even to decrease line counts).
> 
> "pthread_create(3)" man page gives you an example code.
> 
> First, two helpers are defined as follows:
> 
>        #define handle_error_en(en, msg) \
>                do { errno = en; perror(msg); exit(EXIT_FAILURE); } while (0)
> 
>        #define handle_error(msg) \
>                do { perror(msg); exit(EXIT_FAILURE); } while (0)
> 
> Then, one of the call sites looks as follows:
> 
>                s = pthread_create(&tinfo[tnum].thread_id, &attr,
>                                   &thread_start, &tinfo[tnum]);
>                if (s != 0)
>                    handle_error_en(s, "pthread_create");
> 
> If we employ this pattern, one of the hunks in your patch will look like:
> 
> -	if (pthread_mutex_lock(pmlp) != 0) {
> -		perror("lock_reader:pthread_mutex_lock");
> -		exit(-1);
> -	}
> +	if ((en = pthread_mutex_lock(pmlp)) != 0)
> +		handle_error_en(en, "lock_reader:pthread_mutex_lock");
> 
> Thoughts?
> 
> I think these error cases are not our main topic, and to hide the
> details inside helpers sounds reasonable.

Does it make sense to pull the "if" into the handle_error_en() macro
as well, perhaps like this?

#define handle_error_en(en, msg) \
	do { if (!en) break; errno = en; perror(msg); exit(EXIT_FAILURE); } while (0)

	s = pthread_create(&tinfo[tnum].thread_id, &attr,
			   &thread_start, &tinfo[tnum]);
	handle_error_en(s, "pthread_create");

> Also, wouldn't it be a good idea to employ auto-numbering scheme as
> mentioned in Section D.3.1.1 of Style Guide when updating code snippets?
> This update will involve a lot of renumbering of line numbers otherwise.
> 
> If you feel OK with this approach, I can prepare a patch series
> on behalf of you. (Can take a little while, though.)

This approach involves labeling lines that are referred to in the text?
If those labels could be introduced as comments in the original code,
that could be really nice!

							Thanx, Paul

