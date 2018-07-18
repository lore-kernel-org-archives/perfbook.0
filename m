Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:47014 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1726258AbeGRNuV (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Wed, 18 Jul 2018 09:50:21 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w6IDBPNU037849
 for <perfbook@vger.kernel.org>; Wed, 18 Jul 2018 09:12:27 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2ka5mvhuje-1 (version=TLSv1.2
 cipher=AES256-GCM-SHA384 bits=256 verify=NOT) for <perfbook@vger.kernel.org>;
 Wed, 18 Jul 2018 09:12:27 -0400
Received: from localhost by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 18 Jul
 2018 09:12:26 -0400
Date: Wed, 18 Jul 2018 06:14:48 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Section 4.2: wrong error reporting for pthread functions
Reply-To: paulmck@linux.vnet.ibm.com
References: 
 <CAJbg=FVjq_rwhvSw3Y=7xOxUqN_kV4P=wD42HU9=1u3KGnyJpg@mail.gmail.com>
 <20180714233313.GH12945@linux.vnet.ibm.com>
 <4131cfaa-45c2-e0e0-ecc0-dfa3058c53c3@gmail.com>
 <20180716163924.GZ12945@linux.vnet.ibm.com>
 <2def0b9d-d197-d1dd-2489-72b9c9d2be26@gmail.com>
 <20180717161531.GM12945@linux.vnet.ibm.com>
 <53b135c3-d9ac-915b-49ee-332efe4e60e5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53b135c3-d9ac-915b-49ee-332efe4e60e5@gmail.com>
Message-Id: <20180718131448.GZ12945@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Elad Lahav <e2lahav@gmail.com>, perfbook@vger.kernel.org

On Wed, Jul 18, 2018 at 09:15:12PM +0900, Akira Yokosawa wrote:
> On 2018/07/17 09:15:31 -0700, Paul E. McKenney wrote:
> > On Wed, Jul 18, 2018 at 12:43:16AM +0900, Akira Yokosawa wrote:
> >> On 2018/07/16 09:39:24 -0700, Paul E. McKenney wrote:
> >>> On Tue, Jul 17, 2018 at 12:42:57AM +0900, Akira Yokosawa wrote:
> >>>> Hi Paul,
> >>>>
> >>>> See inline comments below for a few nits and suggestions.
> >>>
> >>> I fixed the perror() calls straightforwardly, thank you!
> >>> Queued and pushed with both your and Elad's Reported-by.
> >>>
> >>>> On 2018/07/14 16:33:13 -0700, Paul E. McKenney wrote:
> >>>>> On Sat, Jul 14, 2018 at 08:59:48AM -0400, Elad Lahav wrote:
> >>>
> >>> [ . . . ]
> >>>
> >>>> I see you have already updated most of the code samples under CodeSamples/,
> >>>> but let me suggest an alternative way not to increase line counts
> >>>> (or even to decrease line counts).
> >>>>
> >>>> "pthread_create(3)" man page gives you an example code.
> >>>>
> >>>> First, two helpers are defined as follows:
> >>>>
> >>>>        #define handle_error_en(en, msg) \
> >>>>                do { errno = en; perror(msg); exit(EXIT_FAILURE); } while (0)
> >>>>
> >>>>        #define handle_error(msg) \
> >>>>                do { perror(msg); exit(EXIT_FAILURE); } while (0)
> >>>>
> >>>> Then, one of the call sites looks as follows:
> >>>>
> >>>>                s = pthread_create(&tinfo[tnum].thread_id, &attr,
> >>>>                                   &thread_start, &tinfo[tnum]);
> >>>>                if (s != 0)
> >>>>                    handle_error_en(s, "pthread_create");
> >>>>
> >>>> If we employ this pattern, one of the hunks in your patch will look like:
> >>>>
> >>>> -	if (pthread_mutex_lock(pmlp) != 0) {
> >>>> -		perror("lock_reader:pthread_mutex_lock");
> >>>> -		exit(-1);
> >>>> -	}
> >>>> +	if ((en = pthread_mutex_lock(pmlp)) != 0)
> >>>> +		handle_error_en(en, "lock_reader:pthread_mutex_lock");
> >>>>
> >>>> Thoughts?
> >>>>
> >>>> I think these error cases are not our main topic, and to hide the
> >>>> details inside helpers sounds reasonable.
> >>>
> >>> Does it make sense to pull the "if" into the handle_error_en() macro
> >>> as well, perhaps like this?
> >>>
> >>> #define handle_error_en(en, msg) \
> >>> 	do { if (!en) break; errno = en; perror(msg); exit(EXIT_FAILURE); } while (0)
> >>>
> >>> 	s = pthread_create(&tinfo[tnum].thread_id, &attr,
> >>> 			   &thread_start, &tinfo[tnum]);
> >>> 	handle_error_en(s, "pthread_create");
> >>>
> >>
> >> This version of handle_error_en() can return.
> >> As per Elad's suggestion, if we want to make fatal_en() not to return,
> >> we can't pull the "if".
> >>
> >> It looks to me by keeping the "if" out of helper funcs, fatal-error
> >> conditions can be made more obvious.
> >>
> >> 	s = pthread_create(&tinfo[tnum].thread_id, &attr,
> >> 			   &thread_start, &tinfo[tnum]);
> >> 	if (s != 0)
> >> 		fatal_en(s, "pthread_create");
> >>
> >> I prefer this approach.
> > 
> > At this point, I believe that the right approach is for me to instead
> > make use of the existing api.h wrappers for the pthread_*() functions.
> > Smaller code and fewer places to change as opinions shift.  I was
> > thinking in terms of instead moving to the pthread_*() functions, but
> > this discussion has clearly shown the folly of that approach.  ;-)
> > 
> > The exceptions are of course the exposition of the pthread_*()
> > functions in the toolsoftrade chapter.
> 
> Sounds reasonable to me.
> 
> > 
> >>>> Also, wouldn't it be a good idea to employ auto-numbering scheme as
> >>>> mentioned in Section D.3.1.1 of Style Guide when updating code snippets?
> >>>> This update will involve a lot of renumbering of line numbers otherwise.
> >>>>
> >>>> If you feel OK with this approach, I can prepare a patch series
> >>>> on behalf of you. (Can take a little while, though.)
> >>>
> >>> This approach involves labeling lines that are referred to in the text?
> >>> If those labels could be introduced as comments in the original code,
> >>> that could be really nice!
> >>
> >> By using "fancyvrb" package instead of "verbatimbox", this is mostly
> >> possible.  by "mostly possible", I mean label within comments can
> >> be made invisible in the output, but "/*", "*/", and "//" will remain
> >> in the output.
> >>
> >> For example, original source code of Listing 4.1 (using fatal() helper)
> >> would look like:
> >>
> >> 	pid = fork(); //%label[ln:toolsoftrade:fork:fork]
> >> 	if (pid == 0) { //%label[ln:toolsoftrade:fork:if]
> >> 		/* child */ //%label[ln:toolsoftrade:fork:child]
> >> 	} else if (pid < 0) { //%label[ln:toolsoftrade:fork:else]
> >> 		/* parent, upon error */ //%label[ln:toolsoftrade:fork:errora]
> >> 		fatal("fork"); //%label[ln:toolsoftrade:fork:errorb]
> >> 	} else {
> >> 		/* parent, pid == child ID */ //%label[ln:toolsoftrade:fork:parent]
> >> 	}
> >>
> >> Corresponding source of the code snippet (after removal of "//") would
> >> look like:
> >>
> >>   pid = fork();%label[ln:toolsoftrade:fork:fork]
> >>   if (pid == 0) {%label[ln:toolsoftrade:fork:if]
> >>     /* child */%label[ln:toolsoftrade:fork:child]
> >>   } else if (pid < 0) {%label[ln:toolsoftrade:fork:else]
> >>     /* parent, upon error */%label[ln:toolsoftrade:fork:errora]
> >>     fatal("fork");%label[ln:toolsoftrade:fork:errorb]
> >>   } else {
> >>     /* parent, pid == child ID */%label[ln:toolsoftrade:fork:parent]
> >>   }
> >>
> >> Note that in this example, "%" represents "\" after escaping to LaTeX,
> >> "[" for "{", "]" for "}". These 3 escaping characters need to be
> >> chosen for each snippet so that they do not appear in the unescaped code.
> >> "[" and "]" can not be used for snippets that used array reference,
> >> for example.
> >>
> >> So in theory, we can do what you want, but need somewhat ad-hoc
> >> manual tweaks. Still, it might be possible to write a script or two
> >> to do such tweaks in a semi-automated way.
> > 
> > I already use scripts to do the auto-numbering and auto-intenting
> > for the old-style listings, so why not?  ;-)
> > 
> > If I haven't already made these available, please let me know and
> > I can send them on.  They aren't exactly profound.
> 
> So, there are 3 symbolic links under utilities/ in the Git repo:
> 
>     c2latex.sh -> /home/paulmck/bin/c2latex.sh
>     extractClatex.sh -> /home/paulmck/bin/extractClatex.sh
>     latex2c.sh -> /home/paulmck/bin/latex2c.sh
> 
> Now I know why I have no idea how you manage code snippets. ;-)

Heh!  I extract the code by hand and remove comments and any resulting
extraneous blank lines.  I run it through c2latex.sh, and occasionally
need to manually fix indentation.  Then I do any needed renumbering
manually in the text.

And latex2c.sh is more or less the inverse of c2latex.sh.

> >> If you'd like to see what the code snippet and reference to labels
> >> would be,  I can prepare a experimental branch which is relative to
> >> commit f2b9d37d3b95 ("count: Expand on gap between C11 atomics and
> >> the Linux kernel").
> >>
> >> Thoughts?
> > 
> > Sounds worth a try, thank you!
> 
> OK.
> I'll send a pseudo pull request when it is ready.
> Hopefully in a couple of days.

Sounds good!

							Thanx, Paul

