Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:50514 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1729641AbeGQQ6S (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 17
 Jul 2018 12:58:18 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w6HGNaWb129277
 for <perfbook@vger.kernel.org>; Tue, 17 Jul 2018 12:24:52 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2k9k3xaca1-1 (version=TLSv1.2
 cipher=AES256-GCM-SHA384 bits=256 verify=NOT) for <perfbook@vger.kernel.org>;
 Tue, 17 Jul 2018 12:24:52 -0400
Received: from localhost by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 17 Jul
 2018 12:24:50 -0400
Date: Tue, 17 Jul 2018 09:27:11 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Section 4.2: wrong error reporting for pthread functions
Reply-To: paulmck@linux.vnet.ibm.com
References: 
 <CAJbg=FVjq_rwhvSw3Y=7xOxUqN_kV4P=wD42HU9=1u3KGnyJpg@mail.gmail.com>
 <20180714233313.GH12945@linux.vnet.ibm.com>
 <4131cfaa-45c2-e0e0-ecc0-dfa3058c53c3@gmail.com>
 <CAJbg=FW7vpepT_0wq+ffpQBHgKX+s1ruDb5Bs-m3FCPHKcPV3A@mail.gmail.com>
 <488f7451-7a08-4a93-f2d0-60fb4c541782@gmail.com>
 <CAJbg=FWbVmimBhPb_C35uwSepfnuJGRJKtN=3dEL7LsggGBg1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAJbg=FWbVmimBhPb_C35uwSepfnuJGRJKtN=3dEL7LsggGBg1g@mail.gmail.com>
Message-Id: <20180717162711.GN12945@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Tue, Jul 17, 2018 at 07:05:03AM -0400, Elad Lahav wrote:
> Sure, that works for me ;-)
> 
> One more nitpick - on sub-section 4.2.7 there is an unmatched left
> parenthesis before "and":
> 
> "POSIX supplies the pthread_key_create() function to create
> a per-thread variable (and return the corresponding key, ..."

Good eyes, but SeongJae Park beat you to this one:

97bae8658482 ("toolsoftrade: Close uncompleted parentheses")

Hmmm...  That was fixed in January 2017.  I suggest upgrading to the
most recent release (November 2017), which may be found here:

https://kernel.org/pub/linux/kernel/people/paulmck/perfbook/perfbook.html

Or, if you wish, build from the current git archive, which may be cloned
like this:

git clone git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/perfbook.git

							Thanx, Paul

> --Elad
> 
> 
> On Mon, Jul 16, 2018 at 7:51 PM, Akira Yokosawa <akiyks@gmail.com> wrote:
> > Hi Elad,
> >
> > On 2018/07/17 1:35, Elad Lahav wrote:
> >> On Mon, Jul 16, 2018 at 11:42 AM, Akira Yokosawa <akiyks@gmail.com> wrote:
> >>> First, two helpers are defined as follows:
> >>>
> >>>        #define handle_error_en(en, msg) \
> >>>                do { errno = en; perror(msg); exit(EXIT_FAILURE); } while (0)
> >>>
> >>>        #define handle_error(msg) \
> >>>                do { perror(msg); exit(EXIT_FAILURE); } while (0)
> >>>
> >>> Then, one of the call sites looks as follows:
> >>>
> >>>                s = pthread_create(&tinfo[tnum].thread_id, &attr,
> >>>                                   &thread_start, &tinfo[tnum]);
> >>>                if (s != 0)
> >>>                    handle_error_en(s, "pthread_create");
> >>>
> >>> If we employ this pattern, one of the hunks in your patch will look like:
> >>>
> >>> -       if (pthread_mutex_lock(pmlp) != 0) {
> >>> -               perror("lock_reader:pthread_mutex_lock");
> >>> -               exit(-1);
> >>> -       }
> >>> +       if ((en = pthread_mutex_lock(pmlp)) != 0)
> >>> +               handle_error_en(en, "lock_reader:pthread_mutex_lock");
> >>>
> >>> Thoughts?
> >>
> >> You are, of course, free to do as you want with your book, but I would
> >> advise against the proposal. Novice software developers will often
> >> copy patterns from books, which means that the examples need to be
> >> held to a higher standard. I do agree that error handling is not the
> >> point of these examples, so you shouldn't spend too much time on it,
> >> but at least at one point it should show the correct pattern. The rest
> >> of the code can just have a "// Report error and exit" comment.
> >> If you do want a helper, then a better solution would be:
> >>
> >> static inline void __attribute__((noreturn))
> >> fatal(char const * const msg, int const err)
> >> {
> >>     fprintf(stderr, "%s: %s\n", msg, strerror(err));
> >>     exit(EXIT_FAILURE);
> >> }
> >>
> >> The name 'fatal' better conveys to the reader of the code the fact
> >> that the call doesn't return. The snippet also demonstrates a more
> >> modern approach to C code (use of inline functions, const, function
> >> attributes).
> >
> > Thank you for your feedback!
> >
> > I agree with you that inline functions are better choice.
> > You might also want to update the example in the man pages? ;-)
> >
> > Would function names of "fatal_en()" and "fatal()" as defined below
> > work with you?
> >
> > static inline void __attribute__((noreturn))
> > fatal_en(char const * const msg, int const err)
> > {
> >     fprintf(stderr, "%s: %s\n", msg, strerror(err));
> >     exit(EXIT_FAILURE);
> > }
> >
> > static inline void __attribute__((noreturn))
> > fatal(char const * const msg)
> > {
> >     perror(msg);
> >     exit(EXIT_FAILURE);
> > }
> >
> >       Thanks, Akira
> >>
> >> --Elad
> >>
> >
> 

