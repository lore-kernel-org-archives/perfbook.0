Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P8IFqfdCg/Fu+LvPeAyNDmEESvH1B1NBTMhKIkoF2wQ=;
        b=ciISotdjIap95LNN1sH3ao0HbHEsLbPQfdEImwltQmBYPzerxR3kqmZsOHYcYgWR+n
         sW+2PGbgJQgjzS1VRyBBxesQ/xsPtuo7JgJh7g6uegFeFOYHcs7CidPQri8WkO/xY139
         WScTzvqS2Dow8Vsv9UpDSO6yS2BggDiqKjQv9nMK3YwlG/wXTmFf+F+bBvmOMuka8X5i
         jRI04aC7xmFDV7zTRcKaOMC/RlRUnh4qzNQqxIBj2HXMufVHft0+8l10Ihlejk2eHf3a
         KK5j7Y29nVkeWS/5hTU7MiCJ0qM8o5tDsHVNF5iTBhLiI98Uxwx1nO9Hw4RpLlS5w5GA
         a7zw==
MIME-Version: 1.0
References: <1543052094-8306-1-git-send-email-junchangwang@gmail.com> <20181124164741.GX4170@linux.ibm.com>
In-Reply-To: <20181124164741.GX4170@linux.ibm.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Sun, 25 Nov 2018 10:18:55 +0800
Message-ID: <CABoNC828q_hzc1as4FG-iL+qfY_y63r8H5zTt+3dOwcV38TW8w@mail.gmail.com>
Subject: Re: [PATCH 0/3] Patches for Section Deferred Processing
Content-Type: text/plain; charset="UTF-8"
To: Paul McKenney <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Sun, Nov 25, 2018 at 12:47 AM Paul E. McKenney <paulmck@linux.ibm.com> wrote:
>
> On Sat, Nov 24, 2018 at 05:34:51PM +0800, Junchang Wang wrote:
> > Hi Paul,
> >
> > This is the patch sets for Section Deferred Processing. Please take a look.
> >
> > The first patch fixes a dependency issue in compiling route_hazptr.c.
> >
> > The second patch fixes a memory leak bug in hazptr.c.
> >
> > The last one fixes a typo in writing.
> >
> >
> > Thanks,
> > --Junchang
>
> Good catches, applied, thank you!
>
> On the memory-leak bug, I removed the "if" due to POSIX specifying
> that free() is a no-op when given a NULL pointer.
>
>         http://pubs.opengroup.org/onlinepubs/009695399/functions/free.html
>
> Please see below for the updated commit, and please let me know if I
> messed anything up.
>

That's right. Thanks a lot for the comment and link :-).


Thanks,
--Junchang


>                                                 Thanx, Paul
>
> > Junchang Wang (3):
> >   route_hazptr: Add dependency to hazptr
> >   route_hazptr: Fix a memory leak bug
> >   defer: Fix a typo
> >
> >  CodeSamples/defer/Makefile | 2 +-
> >  CodeSamples/defer/hazptr.c | 4 ++++
> >  defer/hazptr.tex           | 2 +-
> >  3 files changed, 6 insertions(+), 2 deletions(-)
>
> ------------------------------------------------------------------------
>
> commit b8c1647f53ddedf10bf2973371f6f685dfd31d62
> Author: Junchang Wang <junchangwang@gmail.com>
> Date:   Sat Nov 24 17:34:53 2018 +0800
>
>     route_hazptr: Fix a memory leak bug
>
>     Global pointer gplist is used to record hazard pointer array once it's
>     allocated. This can avoid allocating and freeing hazptr array each time
>     function hazptr_scan() is invoked. This patch fixes a memory leak bug and
>     helps achieve the design goal.
>
>     Signed-off-by: Junchang Wang <junchangwang@gmail.com>
>     [ paulmck: Remove redundant "if" because free() ignores NULL argument. ]
>     Signed-off-by: Paul E. McKenney <paulmck@linux.ibm.com>
>
> diff --git a/CodeSamples/defer/hazptr.c b/CodeSamples/defer/hazptr.c
> index 91df310e24a2..fdb387e59ea1 100644
> --- a/CodeSamples/defer/hazptr.c
> +++ b/CodeSamples/defer/hazptr.c
> @@ -53,6 +53,8 @@ void hazptr_thread_exit(void)
>                 hazptr_scan();
>                 poll(NULL, 0, 1);
>         }
> +
> +       free(gplist);
>  }
>
>  void hazptr_reinitialize()
> @@ -103,6 +105,7 @@ void hazptr_scan()
>                         fprintf(stderr, "hazptr_scan: out of memory\n");
>                         exit(EXIT_FAILURE);
>                 }
> +               gplist = plist;
>         }
>
>         /*
>

