Return-Path: <SRS0=Gw67=2U=gmail.com=e2lahav@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ExLBnqLbigUf+sYW4jgwy3gxi2g1sDyQVIdyz+cp4F8=;
        b=jFEhg7g6jKzmWZWqSlKES9cRYZPuP2EJtFSCdpcf9wACsgrmuXfiDu0Wxu8K+36rb5
         oS6gophToS8kwOyyWnxu/3fhTALOkl172SjPv1lCiSqs/apdYbA1CyvCqkJmfp1jD2ul
         2FTiG+Qew+5cLcik8fiy7g5tliZheMGr2I1XDFGKF6kD1+1LvVich8TOPfef7uSNuqQX
         odtmFDDgPzsvZk/LhfYaRiTJca4wpMb3vihkE+Wa2EGluZ59WAduBLmeMQzMIJKFVKfO
         hxt3ZbifaqH2gjMs8MZkmFyf2negJRkBJqXYkgzSDLo5VbtipjG7xDma1fcLaE+t8BfV
         jtig==
MIME-Version: 1.0
References: <CAJbg=FU6Sa=vc6DRGsewXMP6N1Hz2HHUsKkgNTUzPx9Bh0VuKQ@mail.gmail.com>
 <20221019233220.GH5600@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20221019233220.GH5600@paulmck-ThinkPad-P17-Gen-1>
From: Elad Lahav <e2lahav@gmail.com>
Date: Wed, 19 Oct 2022 19:51:46 -0400
Message-ID: <CAJbg=FX92LNrP5d3-a0pGj_cLkUzy52LSzN6XJwamM7Zsjy_Uw@mail.gmail.com>
Subject: Re: 7.5.2.7: Library Functions Used Between fork() and exec()
Content-Type: text/plain; charset="UTF-8"
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Looks good to me!

--Elad

On Wed, 19 Oct 2022 at 19:32, Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Fri, Oct 14, 2022 at 08:14:42AM -0400, Elad Lahav wrote:
> > Ah, multi-threaded fork, my arch-nemesis.
> >
> > A few points, though I'm not sure any of these are worth mentioning in the book:
> >
> > 1. It should perhaps be made clear that the child's copy of the lock
> > is, in fact, a separate lock. The statement that the lock is held by a
> > parent thread is somewhat inaccurate. That is, unless the lock is in
> > explicitly-shared memory (i.e., the result of mmap(MAP_SHARED)), in
> > which case the lock is indeed the same and is (presumably) meant to be
> > shared between the parent and child.
> >
> > 2. POSIX explicitly says that you can't execute any
> > non-async-signal-safe functions between fork() and exec(), which
> > pretty much eliminates any function that acquires a lock.
> >
> > 3. posix_spawn() is a safer alternative to the fork()/exec() pair
> > (though not to fork() by itself), at least with sensible
> > implementations that don't devolve to fork() and exec().
>
> Good points!
>
> How about the following update?
>
>                                                         Thanx, Paul
>
> ------------------------------------------------------------------------
>
> commit 069eb5ee2b570c9216b7f1244847a4bf2d2dfb47
> Author: Paul E. McKenney <paulmck@kernel.org>
> Date:   Wed Oct 19 16:30:52 2022 -0700
>
>     locking: Expand on fork()/exec() locking issues
>
>     Reported-by: Elad Lahav <e2lahav@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
>
> diff --git a/bib/os.bib b/bib/os.bib
> index 3ae9b617..0846801e 100644
> --- a/bib/os.bib
> +++ b/bib/os.bib
> @@ -1442,3 +1442,24 @@ Paul E. McKenney",
>   note="\url{https://google.github.io/tcmalloc/overview.html}",
>   lastchecked="January 24, 2020",
>  }
> +
> +@unpublished{JoshTriplett2022io_uring_spawn,
> + author="Josh Triplett",
> + title="Spawning processes faster and easier with \co{io_uring}",
> + year="2022",
> + month="September",
> + day="12",
> + url={https://lpc.events/event/16/contributions/1213/},
> + note="\url{https://www.youtube.com/watch?v=_h-kV8AYYqM&t=4074s}",
> + lastchecked="October 19, 2022",
> +}
> +
> +@unpublished{JakeEdge2022io_uring_spawn,
> + author="Jake Edge",
> + title="Introducing \co{io_uring_spawn}",
> + year="2022",
> + month="September",
> + day="20",
> + note="\url{https://lwn.net/Articles/908268/}",
> + lastchecked="October 19, 2022",
> +}
> diff --git a/locking/locking.tex b/locking/locking.tex
> index 6d3bb1c8..f74e0784 100644
> --- a/locking/locking.tex
> +++ b/locking/locking.tex
> @@ -2436,11 +2436,11 @@ As noted earlier, if a thread executing a library function is holding
>  a lock at the time that some other thread invokes \apipx{fork()}, the
>  fact that the parent's memory is copied to create the child means that
>  this lock will be born held in the child's context.
> -The thread that will release this lock is running in the parent, but not
> -in the child, which means that the child's copy of this lock will never
> -be released.
> +The thread that will release this lock is running in the parent, but
> +not in the child, which means that although the parent's copy of this
> +lock will be released, the child's copy never will be.
>  Therefore, any attempt on the part of the child to invoke that same
> -library function will result in deadlock.
> +library function (thus acquiring that same lock) will result in deadlock.
>
>  A pragmatic and straightforward way of solving this problem is
>  to \co{fork()} a child process while the process is still single-threaded,
> @@ -2472,10 +2472,16 @@ parent before the \co{fork()}, one to be called by the parent after the
>  \co{fork()}, and one to be called by the child after the \co{fork()}.
>  Appropriate cleanups can then be carried out at these three points.
>
> -Be warned, however, that coding of \co{pthread_atfork()} handlers is quite subtle
> -in general.
> -The cases where \co{pthread_atfork()} works best are cases where the data structure
> -in question can simply be re-initialized by the child.
> +Be warned, however, that coding of \co{pthread_atfork()} handlers is
> +quite subtle in general.
> +The cases where \co{pthread_atfork()} works best are cases where the
> +data structure in question can simply be re-initialized by the child.
> +Which might be one reason why the POSIX standard forbids use of any
> +non-async-signal-safe functions between the \co{fork()} and the
> +\co{exec()}, which rules out acquisition of locks during that time.
> +
> +Other alternatives to \co{fork()}/\co{exec()} include \co{posix_spawn()}
> +and \co{io_uring_spawn()}~\cite{JoshTriplett2022io_uring_spawn,JakeEdge2022io_uring_spawn}.
>
>  \subsubsection{Parallel Libraries:
>                                    Discussion}
