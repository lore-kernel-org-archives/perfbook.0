Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjBDEgT (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 3 Feb 2023 23:36:19 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E45DD4ED1E
        for <perfbook@vger.kernel.org>; Fri,  3 Feb 2023 20:36:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DE70EB82CDD
        for <perfbook@vger.kernel.org>; Sat,  4 Feb 2023 04:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675485374;
        bh=5x+7/aXARkPn6F1k+XQxP9iAjaW9PrnPyVdAoWYO6Jk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=mKa943GMB6jS+1ATAcmOAfslAMwUI/D0SIPUSo85HKin//6aJgYMDMdPTkHvqX98W
         Tc6pTPvFPcKFU3NrBY3jAPRBesdLv4YSKgfqE3A7HnTUcp6FxNRMufwyG/GKuZEE8L
         RDI9Bd7JuL3EJJEGyVUe2UNLBl2R4D2x6RCu97J29sqie3c0xC7GMI4mPX97hCBofE
         nrh2f0lHJiRXMDmVEcPEBxYq9FZFU5e17OPF3Ohx26f8SF7vuKA7Ls3SrUlBhYcfx6
         THKNPq3SD37sBRDlgJiw5Glvd7Y2bFuGuQQFWnSXTmDip0zgiJcjkky/3bK2E8nEii
         T+wz7DcIewBgQ==
Date: Fri, 3 Feb 2023 20:36:14 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] autodate.sh: Add graceful fallback of
 commitid-only mode for shallow clone
Message-ID: <20230204043614.GU2948950@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <5011ac44-402f-5185-bb62-0d2ac908da5e@gmail.com>
 <20230203164716.GJ2948950@paulmck-ThinkPad-P17-Gen-1>
 <402f2ac0179552e214206fb6adb36240113ddc51.camel@gmail.com>
 <20230203181950.GL2948950@paulmck-ThinkPad-P17-Gen-1>
 <72fe4499f87fb861c5fca94b6a8670e4c1100d4c.camel@gmail.com>
 <20230203185539.GM2948950@paulmck-ThinkPad-P17-Gen-1>
 <f04b56846957201b4212b5cdc183eaff926b6f85.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f04b56846957201b4212b5cdc183eaff926b6f85.camel@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Leonardo =?iso-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Feb 03, 2023 at 11:55:20PM -0300, Leonardo Brás wrote:
> On Fri, 2023-02-03 at 10:55 -0800, Paul E. McKenney wrote:
> > On Fri, Feb 03, 2023 at 03:45:05PM -0300, Leonardo Brás wrote:
> > > On Fri, 2023-02-03 at 10:19 -0800, Paul E. McKenney wrote:
> > > > On Fri, Feb 03, 2023 at 02:32:35PM -0300, Leonardo Brás wrote:
> > > > > On Fri, 2023-02-03 at 08:47 -0800, Paul E. McKenney wrote:
> > > > > > On Sat, Feb 04, 2023 at 12:23:25AM +0900, Akira Yokosawa wrote:
> > > > > > > Under shallow clone of perfbook repo, "git describe" can't work.
> > > > > > > Catch the error and use "git log" to obtain the commit id instead.
> > > > > > > 
> > > > > > > Following is the comparison of autodate.tex. 
> > > > > > > 
> > > > > > > Before:
> > > > > > > 
> > > > > > >     \date{February 3, 2023 \\ Tag: \texttt{} }
> > > > > > >     \newcommand{\commityear}{2023}
> > > > > > >     \newcommand{\commitid}{}
> > > > > > >     \IfQqzBg{}{\setboolean{qqzbg}{false}}
> > > > > > >     % tcolorbox version: 5.1
> > > > > > >     \tcbsetforeverylayer{autoparskip}
> > > > > > > 
> > > > > > > After:
> > > > > > > 
> > > > > > >     \date{February 3, 2023 \\ Commit: \texttt{g25bd138c30bf} (shallow clone) }
> > > > > > >     \newcommand{\commityear}{2023}
> > > > > > >     \newcommand{\commitid}{g25bd138c30bf}
> > > > > > >     \IfQqzBg{}{\setboolean{qqzbg}{false}}
> > > > > > >     % tcolorbox version: 5.1
> > > > > > >     \tcbsetforeverylayer{autoparskip}
> > > > > > > 
> > > > > > > Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > > > > > > Cc: Leonardo Bras <leobras.c@gmail.com>
> > > > > > 
> > > > > > Thank you, Akira, and I have queued this.
> > > > > > 
> > > > > > Leonardo, could you please check to see whether this works for you in
> > > > > > your particular environment?
> > > > > > 
> > > > > 
> > > > > Sure, 
> > > > > I reconfigured it as a shallow git clone, and then pushed master + this patch on
> > > > > leobras_ci, and it seems to have worked just fine. Please see:
> > > > > https://gitlab.com/linux-kernel/perfbook/-/jobs/3712415008/artifacts/file/perfbook.pdf
> > > > > 
> > > > > 
> > > > > >   If it does, please include something
> > > > > > like this in your reply:
> > > > > > 
> > > > > > 
> > > > > > 
> > > > > 
> > > > > So, yeah:
> > > > > Tested-by: Leonardo Bras <leobras.c@gmail.com>
> > > > 
> > > > Applied, thank you very much!
> > > > 
> > > > > Paul, could you please help me test some other feature?
> > > > > It would require you to push master + this patch on a test branch in your
> > > > > kernel.org repository.
> > > > > 
> > > > > If everything works as intended, it should automatically trigger the build +
> > > > > testing for that branch.
> > > > 
> > > > One approach is to go into the CodeSamples/count directory and invoke
> > > > all the programs with no arguments.  If they all exit with zero status,
> > > > life is good.
> > > 
> > > I think there was a misunderstanding:
> > > I asked help for testing a Gitlab feature, which is buiding any test branches
> > > from your kernel.org repository automatically when you push to a new branch.
> > > 
> > > > 
> > > > Would you be interested in adding a "make check" target to the
> > > > CodeSamples/count/Makefile to support this?
> > > 
> > > Sure, I could do that!
> > > Just noticed by running `make -C CodeSamples/` it doesn't generate anything in
> > > CodeSamples/count:
> > > 
> > > ### None in count/ can be built on arch: 'unknown'.
> > > 
> > > I did some hacking, and then tried:
> > > make target=x86 -C CodeSamples/
> > > 
> > > And suddenly I see errors such as:
> > > 
> > > cc  -g -o lockdeq -DTEST lockdeq.c -lpthread
> > > lockdeq.c:78:26: error: expected ‘:’, ‘,’, ‘;’, ‘}’ or ‘__attribute__’ before
> > > ‘____cacheline_internodealigned_in_smp’
> > >    78 |         spinlock_t rlock ____cacheline_internodealigned_in_smp;
> > >       |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > lockdeq.c: In function ‘init_pdeq’:
> > > lockdeq.c:100:12: error: ‘struct pdeq’ has no member named ‘ridx’; did you mean
> > > ‘lidx’?
> > >   100 |         d->ridx = 1;
> > >       |            ^~~~
> > >       |            lidx
> > > 
> > > and warnings such as :
> > > cc -g -Wall -o xchglock xchglock.c -lpthread
> > > xchglock.c: In function ‘main’:
> > > xchglock.c:87:9: warning: implicit declaration of function ‘smp_mb’; did you
> > > mean ‘cmm_mb’? [-Wimplicit-function-declaration]
> > >    87 |         smp_mb();
> > >       |         ^~~~~~
> > >       |         cmm_mb
> > > /usr/bin/ld: /tmp/ccDvA7Yo.o: in function `main':
> > > /dev/shm/perfbook/CodeSamples/locking/xchglock.c:87: undefined reference to
> > > `smp_mb'
> > > /usr/bin/ld: /dev/shm/perfbook/CodeSamples/locking/xchglock.c:91: undefined
> > > reference to `smp_mb'
> > > /usr/bin/ld: /dev/shm/perfbook/CodeSamples/locking/xchglock.c:93: undefined
> > > reference to `smp_mb'
> > > /usr/bin/ld: /dev/shm/perfbook/CodeSamples/locking/xchglock.c:95: undefined
> > > reference to `smp_mb'
> > > collect2: error: ld returned 1 exit status
> > > make[1]: *** [Makefile:21: xchglock] Error 1
> > > 
> > > Is that the correct way of calling the make on CodeSamples?
> > 
> > Ah, the top-level Makefile has some historical baggage, which is entirely
> > my doing.  Something about me not expecting this to be a publicly
> > available project when I first set it up.  ;-)
> > 
> > So I suggest something like this:
> > 
> > 	cd CodeSamples
> > 	make pthreads
> > 	cd count
> > 	make
> > 
> > Please let me know how this goes.
> 
> No luck:
> 
> ###
> [perfbook]$ cd CodeSamples/
> [CodeSamples]$ make pthreads 
> echo "#ifndef __PERFBOOK_API_H__" > api.h
> echo "#define __PERFBOOK_API_H__" >> api.h
> echo "/* MECHANICALLY GENERATED, DO NOT EDIT!!! */" >> api.h
> echo "" >> api.h
> cat linux/common.h >> api.h
> echo "" >> api.h
> cat api-pthreads/api-pthreads.h | \
> 	sed '/begin{snippet}/d' | \
> 	sed '/end{snippet}/d' >> api.h
> echo "" >> api.h
> cat api-pthreads/api-gcc.h >> api.h
> cat api-pthreads/api-linux.h >> api.h
> echo "" >> api.h
> if test -f /usr/include/urcu-call-rcu.h -o \
> 	-f /usr/local/include/urcu-call-rcu.h -o \
> 	-f /usr/include//urcu-call-rcu.h -o \
> 	-f /usr/include/urcu-call-rcu.h ; \
> then \
> 	echo "#define _LGPL_SOURCE" >> api.h; \
> 	echo "#include <urcu/rculist.h>" >> api.h; \
> 	echo "#include <urcu/rcuhlist.h>" >> api.h; \
> 	echo "#include <urcu-pointer.h>" >> api.h; \
> elif test -d /usr/include/urcu -o -d /usr/local/include/urcu ; \
> then \
> 	echo "#define _LGPL_SOURCE" >> api.h; \
> 	echo "#include <urcu/rculist.h>" >> api.h; \
> 	echo "#include <urcu/rcuhlist.h>" >> api.h; \
> 	echo "#include <urcu-pointer-static.h>" >> api.h; \
> else \
> 	echo "### Missing liburcu package!!!  Install it. ###"; \
> 	exit 1;  \
> fi
> echo "#endif /* #ifndef __PERFBOOK_API_H__ */" >> api.h
> echo "# MECHANICALLY GENERATED, DO NOT EDIT!!!" > Makefile.arch
> echo "" >> Makefile.arch
> [CodeSamples]$ cd count/
> [count]$ make
> ### None in count/ can be built on arch: 'unknown'.
> ###
> 
> 
> So, for some reason, it couldn't still get the architecture.
> 
> Oh, I noticed depends.mk use `uname -p` for getting the arch, which is non-
> portable:
> 
> ###
> uname --help
> Usage: uname [OPTION]...
> Print certain system information.  With no OPTION, same as -s.
> [...]
>   -m, --machine            print the machine hardware name
>   -p, --processor          print the processor type (non-portable)
> ###
> 
> 
> I heard some distros patch this by doing uname -p the same as uname -m, which
> seems to have the correct output. I patched this and then now it works:
> 
> ###
> make
> make -C .. Makefile.arch
> make[1]: Entering directory '/dev/shm/perfbook/CodeSamples'
> make pthreads
> make[2]: Entering directory '/dev/shm/perfbook/CodeSamples'
> echo "#ifndef __PERFBOOK_API_H__" > api.h
> echo "#define __PERFBOOK_API_H__" >> api.h
> echo "/* MECHANICALLY GENERATED, DO NOT EDIT!!! */" >> api.h
> echo "" >> api.h
> cat linux/common.h >> api.h
> echo "" >> api.h
> cat arch-x86/arch-x86.h >> api.h
> echo "" >> api.h
> cat api-pthreads/api-pthreads.h | \
> 	sed '/begin{snippet}/d' | \
> 	sed '/end{snippet}/d' >> api.h
> echo "" >> api.h
> cat api-pthreads/api-gcc.h >> api.h
> cat api-pthreads/api-linux.h >> api.h
> echo "" >> api.h
> if test -f /usr/include/urcu-call-rcu.h -o \
> 	-f /usr/local/include/urcu-call-rcu.h -o \
> 	-f /usr/include/x86_64-linux-gnu/urcu-call-rcu.h -o \
> 	-f /usr/include/urcu-call-rcu.h ; \
> then \
> 	echo "#define _LGPL_SOURCE" >> api.h; \
> 	echo "#include <urcu/rculist.h>" >> api.h; \
> 	echo "#include <urcu/rcuhlist.h>" >> api.h; \
> 	echo "#include <urcu-pointer.h>" >> api.h; \
> elif test -d /usr/include/urcu -o -d /usr/local/include/urcu ; \
> then \
> 	echo "#define _LGPL_SOURCE" >> api.h; \
> 	echo "#include <urcu/rculist.h>" >> api.h; \
> 	echo "#include <urcu/rcuhlist.h>" >> api.h; \
> 	echo "#include <urcu-pointer-static.h>" >> api.h; \
> else \
> 	echo "### Missing liburcu package!!!  Install it. ###"; \
> 	exit 1;  \
> fi
> echo "#endif /* #ifndef __PERFBOOK_API_H__ */" >> api.h
> echo "# MECHANICALLY GENERATED, DO NOT EDIT!!!" > Makefile.arch
> echo "" >> Makefile.arch
> cat arch-x86/Makefile.arch >> Makefile.arch
> make[2]: Leaving directory '/dev/shm/perfbook/CodeSamples'
> make[1]: Leaving directory '/dev/shm/perfbook/CodeSamples'
> cc -g -O3 -Wall  -o count_atomic count_atomic.c -lpthread
> cc -g -O3 -Wall  -o count_end count_end.c -lpthread
> cc -g -O3 -Wall  -o count_end_rcu count_end_rcu.c -lpthread
> cc -g -O3 -Wall  -o count_lim count_lim.c -lpthread
> cc -g -O3 -Wall  -o count_lim_app count_lim_app.c -lpthread
> cc -g -O3 -Wall  -o count_lim_atomic count_lim_atomic.c -lpthread
> cc -g -O3 -Wall  -o count_lim_sig count_lim_sig.c -lpthread
> cc -g -O3 -Wall  -o count_limd count_limd.c -lpthread
> cc -g -O3 -Wall  -o count_nonatomic count_nonatomic.c -lpthread
> cc -g -O3 -Wall  -o count_stack count_stack.c -lpthread
> cc -g -O3 -Wall  -o count_stat count_stat.c -lpthread
> cc -g -O3 -Wall  -o count_stat_atomic count_stat_atomic.c -lpthread
> cc -g -O3 -Wall  -o count_stat_eventual count_stat_eventual.c -lpthread
> cc -g -O3 -Wall  -o count_tstat count_tstat.c -lpthread
> ###
> 
> I will send a patch fixing the uname soon :)

Thank you for digging into this!

And yes, portability is easier than it was 40 years ago, but still not
easy.  :-/

							Thanx, Paul

> > This should probably be documented somewhere, perhaps in howto/howto.tex
> > or maybe in BUILD-FAQ.txt.  Thoughts?
> > 
> > 							Thanx, Paul
> 
> Best regards,
> Leo
> 
