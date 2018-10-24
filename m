Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=07jyg2XUnNtz6vtBcGjPimamD7ZHxWu2j3Ur9WUhcvc=;
        b=cDpD0o4l/yH0Q9UnYD9EZFbSaAUJsFsJ/W8CTfQG3yAZsP7SblZLk3eF/dG6CIexRS
         nlHBXObonelDl1dhhArxPo+NQvrdT+IoATKCP5sfM3xvHa/sNnvp0UKam/Ab8aHT/Mit
         vJE674gQ01EggGXR2AyT4MPCwOjHCjQZillaEXhKlwyXglf0g19t7Jp6H0O+GE8ve4b/
         2fKxSo96KncjunTIcer01l4FrZ/Ra8Uy5AmH6+2feAVQ0tcoUiOjnSxb8KB/GTYjjOW3
         rnpaailSPxcP+ulNvw5P7kuvbKpxYu60o05LpTVLUeWlaU+6PyYdvynbeIbOU3qCzUvA
         jixg==
MIME-Version: 1.0
References: <d6abdc9c-9d0e-9435-05be-85a4fe9d3347@gmail.com> <20181020163648.GA2674@linux.ibm.com>
In-Reply-To: <20181020163648.GA2674@linux.ibm.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Wed, 24 Oct 2018 23:53:29 +0800
Message-ID: <CABoNC80CeE8XsQMHAO-GrSuUQ86z7Z6frm04XUWNbxWtkmKsNA@mail.gmail.com>
Subject: Re: [Possible BUG] count_lim_atomic.c fails on POWER8
Content-Type: text/plain; charset="UTF-8"
To: Paul McKenney <paulmck@linux.ibm.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Akira and Paul,

I checked the code today and the implementation of cmpxchg() looks
very suspicious to me; Current  cmpxchg() first executes function
__atomic_compare_exchange_n, and then checks whether the value stored
in field __actual (old) has been changed to decide if the CAS
instruction has been successfully performed. However, I saw the *weak*
field is set, which, as far as I know, means
__atomic_compare_exchange_n could fail even if the value of *ptr is
equal to __actual (old). Unfortunately, current cmpxchg will treat
this case as a success because the value of __actual(old) does not
change.

This bug happens in both Power8 and ARMv8. It seems it affects
architectures that use LL/SC to emulate CAS. Following patch helps
solve this issue on my testbeds. Please take a look. Any thoughts?

---
 CodeSamples/api-pthreads/api-gcc.h | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/CodeSamples/api-pthreads/api-gcc.h
b/CodeSamples/api-pthreads/api-gcc.h
index 1dd26ca..38a16c0 100644
--- a/CodeSamples/api-pthreads/api-gcc.h
+++ b/CodeSamples/api-pthreads/api-gcc.h
@@ -166,11 +166,9 @@ struct __xchg_dummy {

 #define cmpxchg(ptr, o, n) \
 ({ \
-       typeof(*ptr) _____actual = (o); \
-       \
-       (void)__atomic_compare_exchange_n(ptr, (void *)&_____actual, (n), 1, \
-                                         __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST); \
-       _____actual; \
+       typeof(*ptr) old = (o); \
+       (__atomic_compare_exchange_n(ptr, (void *)&old, (n), 1,
__ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST))? \
+                               (o) : (n); \
 })

 static __inline__ int atomic_cmpxchg(atomic_t *v, int old, int new)
-- 
2.7.4


Thanks,
--Junchang

On Sun, Oct 21, 2018 at 12:37 AM Paul E. McKenney <paulmck@linux.ibm.com> wrote:
>
> On Sun, Oct 21, 2018 at 12:53:17AM +0900, Akira Yokosawa wrote:
> > Hi Paul,
> >
> > I just noticed occasional error of count_lim_atomic.c on POWER8 at current master.
> > As I've recently touched the code under Codesamples/count/, I also tested on
> > the tag "v2017.11.22a", and saw the same behavior.
> >
> > The POWER8 virtual machine is Ubuntu 16.04.
> >
> > Example output:
> >
> > $ ./count_lim_atomic 6 uperf 1
> > !!! Count mismatch: 0 counted vs. 8 final value
> > n_reads: 0  n_updates: 26038000  nreaders: 0  nupdaters: 6 duration: 240
> > ns/read: nan  ns/update: 55.3038
> >
> > $ ./count_lim_atomic 6 perf 1
> > !!! Count mismatch: 0 counted vs. 11 final value
> > n_reads: 287000  n_updates: 1702000  nreaders: 6  nupdaters: 1 duration: 240
> > ns/read: 5017.42  ns/update: 141.011
> >
> > As you see, the final count check of zero fails even when nupdaters == 1.
>
> Yow!!!  Thank you for checking this!
>
> That said, it probably wasn't really single threaded, at least assuming
> that you had at least one reader.
>
> > I have no idea what's wrong in count_lim_atomic.c.
> >
> > Can you look into this? There might be something wrong in the header file
> > under CodeSamples/arch-ppc64.h.
>
> There isn't much in that file anymore because we now rely on the gcc
> intrinsics for the most part.  Which might well be the problem, depending
> on compiler versions and so on.
>
> Could you please send me the output of "objdump -d" on count_lim_atomic.o?
> And on the full count_lim_atomic binary, just in case gcc decides to be
> tricky in its code generation?
>
> In the meantime, there might well be a generic bug in count_lim_atomic.c
> that just happens not to be exercised on x86, and I will look into that.
> I am on travel next week, so will be in odd timezones, but should have
> at least a little useful airplane time to look into this.
>
> > On x86_64, I've never seen the count mismatch.
>
> Well, David Goldblatt's first C++11 signal-based litmus test wouldn't fail
> on PowerPC but did on x86, so I guess that they are now even.  ;-)
>
>                                                         Thanx, Paul
>

