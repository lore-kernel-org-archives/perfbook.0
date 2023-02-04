Return-Path: <SRS0=PvuL=6A=gmail.com=leobras.c@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hXH7E2uIzI5UAcNa+XHpDIhrFOOxZsBkRcJcQAr+Qok=;
        b=FxQwHwTUxIHDb+xXiUvAwR4cxMDhCj5X9sPLdCjVEdP0x7sDdoNH6NCHZ2QgOfZjOX
         eik0WYBAOtINtill4QmQji4xJGHl5tzz2qY6Kc9hRQktgP/au7GmwjEwKwMAEW4Az0BM
         FN2jy6/RK5Egr0hJ3dXqABeXp4TIhK3Ye29Hy2491qsRrDSrLBAchxd3Fj2iq39qrag0
         FNxmm57hpgDj1X3bQJD/TC0yf2ZFwlKzDG+b0WvyBWnzwQXGz3XYyxCg7ZOtHIXejwSU
         yE6XCVLMswCuksYKVDiOTpYw4ZUWmZ2qgMy1wxCSEP7EYhf8Al6bl2hwTMtrACRf3ND1
         wknQ==
Message-ID: <f04b56846957201b4212b5cdc183eaff926b6f85.camel@gmail.com>
Subject: Re: [PATCH -perfbook] autodate.sh: Add graceful fallback of
 commitid-only mode for shallow clone
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Date: Fri, 03 Feb 2023 23:55:20 -0300
In-Reply-To: <20230203185539.GM2948950@paulmck-ThinkPad-P17-Gen-1>
References: <5011ac44-402f-5185-bb62-0d2ac908da5e@gmail.com>
	 <20230203164716.GJ2948950@paulmck-ThinkPad-P17-Gen-1>
	 <402f2ac0179552e214206fb6adb36240113ddc51.camel@gmail.com>
	 <20230203181950.GL2948950@paulmck-ThinkPad-P17-Gen-1>
	 <72fe4499f87fb861c5fca94b6a8670e4c1100d4c.camel@gmail.com>
	 <20230203185539.GM2948950@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Fri, 2023-02-03 at 10:55 -0800, Paul E. McKenney wrote:
> On Fri, Feb 03, 2023 at 03:45:05PM -0300, Leonardo Br=C3=A1s wrote:
> > On Fri, 2023-02-03 at 10:19 -0800, Paul E. McKenney wrote:
> > > On Fri, Feb 03, 2023 at 02:32:35PM -0300, Leonardo Br=C3=A1s wrote:
> > > > On Fri, 2023-02-03 at 08:47 -0800, Paul E. McKenney wrote:
> > > > > On Sat, Feb 04, 2023 at 12:23:25AM +0900, Akira Yokosawa wrote:
> > > > > > Under shallow clone of perfbook repo, "git describe" can't work=
.
> > > > > > Catch the error and use "git log" to obtain the commit id inste=
ad.
> > > > > >=20
> > > > > > Following is the comparison of autodate.tex.=20
> > > > > >=20
> > > > > > Before:
> > > > > >=20
> > > > > >     \date{February 3, 2023 \\ Tag: \texttt{} }
> > > > > >     \newcommand{\commityear}{2023}
> > > > > >     \newcommand{\commitid}{}
> > > > > >     \IfQqzBg{}{\setboolean{qqzbg}{false}}
> > > > > >     % tcolorbox version: 5.1
> > > > > >     \tcbsetforeverylayer{autoparskip}
> > > > > >=20
> > > > > > After:
> > > > > >=20
> > > > > >     \date{February 3, 2023 \\ Commit: \texttt{g25bd138c30bf} (s=
hallow clone) }
> > > > > >     \newcommand{\commityear}{2023}
> > > > > >     \newcommand{\commitid}{g25bd138c30bf}
> > > > > >     \IfQqzBg{}{\setboolean{qqzbg}{false}}
> > > > > >     % tcolorbox version: 5.1
> > > > > >     \tcbsetforeverylayer{autoparskip}
> > > > > >=20
> > > > > > Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > > > > > Cc: Leonardo Bras <leobras.c@gmail.com>
> > > > >=20
> > > > > Thank you, Akira, and I have queued this.
> > > > >=20
> > > > > Leonardo, could you please check to see whether this works for yo=
u in
> > > > > your particular environment?
> > > > >=20
> > > >=20
> > > > Sure,=20
> > > > I reconfigured it as a shallow git clone, and then pushed master + =
this patch on
> > > > leobras_ci, and it seems to have worked just fine. Please see:
> > > > https://gitlab.com/linux-kernel/perfbook/-/jobs/3712415008/artifact=
s/file/perfbook.pdf
> > > >=20
> > > >=20
> > > > >   If it does, please include something
> > > > > like this in your reply:
> > > > >=20
> > > > >=20
> > > > >=20
> > > >=20
> > > > So, yeah:
> > > > Tested-by: Leonardo Bras <leobras.c@gmail.com>
> > >=20
> > > Applied, thank you very much!
> > >=20
> > > > Paul, could you please help me test some other feature?
> > > > It would require you to push master + this patch on a test branch i=
n your
> > > > kernel.org repository.
> > > >=20
> > > > If everything works as intended, it should automatically trigger th=
e build +
> > > > testing for that branch.
> > >=20
> > > One approach is to go into the CodeSamples/count directory and invoke
> > > all the programs with no arguments.  If they all exit with zero statu=
s,
> > > life is good.
> >=20
> > I think there was a misunderstanding:
> > I asked help for testing a Gitlab feature, which is buiding any test br=
anches
> > from your kernel.org repository automatically when you push to a new br=
anch.
> >=20
> > >=20
> > > Would you be interested in adding a "make check" target to the
> > > CodeSamples/count/Makefile to support this?
> >=20
> > Sure, I could do that!
> > Just noticed by running `make -C CodeSamples/` it doesn't generate anyt=
hing in
> > CodeSamples/count:
> >=20
> > ### None in count/ can be built on arch: 'unknown'.
> >=20
> > I did some hacking, and then tried:
> > make target=3Dx86 -C CodeSamples/
> >=20
> > And suddenly I see errors such as:
> >=20
> > cc  -g -o lockdeq -DTEST lockdeq.c -lpthread
> > lockdeq.c:78:26: error: expected =E2=80=98:=E2=80=99, =E2=80=98,=E2=80=
=99, =E2=80=98;=E2=80=99, =E2=80=98}=E2=80=99 or =E2=80=98__attribute__=E2=
=80=99 before
> > =E2=80=98____cacheline_internodealigned_in_smp=E2=80=99
> >    78 |         spinlock_t rlock ____cacheline_internodealigned_in_smp;
> >       |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > lockdeq.c: In function =E2=80=98init_pdeq=E2=80=99:
> > lockdeq.c:100:12: error: =E2=80=98struct pdeq=E2=80=99 has no member na=
med =E2=80=98ridx=E2=80=99; did you mean
> > =E2=80=98lidx=E2=80=99?
> >   100 |         d->ridx =3D 1;
> >       |            ^~~~
> >       |            lidx
> >=20
> > and warnings such as :
> > cc -g -Wall -o xchglock xchglock.c -lpthread
> > xchglock.c: In function =E2=80=98main=E2=80=99:
> > xchglock.c:87:9: warning: implicit declaration of function =E2=80=98smp=
_mb=E2=80=99; did you
> > mean =E2=80=98cmm_mb=E2=80=99? [-Wimplicit-function-declaration]
> >    87 |         smp_mb();
> >       |         ^~~~~~
> >       |         cmm_mb
> > /usr/bin/ld: /tmp/ccDvA7Yo.o: in function `main':
> > /dev/shm/perfbook/CodeSamples/locking/xchglock.c:87: undefined referenc=
e to
> > `smp_mb'
> > /usr/bin/ld: /dev/shm/perfbook/CodeSamples/locking/xchglock.c:91: undef=
ined
> > reference to `smp_mb'
> > /usr/bin/ld: /dev/shm/perfbook/CodeSamples/locking/xchglock.c:93: undef=
ined
> > reference to `smp_mb'
> > /usr/bin/ld: /dev/shm/perfbook/CodeSamples/locking/xchglock.c:95: undef=
ined
> > reference to `smp_mb'
> > collect2: error: ld returned 1 exit status
> > make[1]: *** [Makefile:21: xchglock] Error 1
> >=20
> > Is that the correct way of calling the make on CodeSamples?
>=20
> Ah, the top-level Makefile has some historical baggage, which is entirely
> my doing.  Something about me not expecting this to be a publicly
> available project when I first set it up.  ;-)
>=20
> So I suggest something like this:
>=20
> 	cd CodeSamples
> 	make pthreads
> 	cd count
> 	make
>=20
> Please let me know how this goes.

No luck:

###
[perfbook]$ cd CodeSamples/
[CodeSamples]$ make pthreads=20
echo "#ifndef __PERFBOOK_API_H__" > api.h
echo "#define __PERFBOOK_API_H__" >> api.h
echo "/* MECHANICALLY GENERATED, DO NOT EDIT!!! */" >> api.h
echo "" >> api.h
cat linux/common.h >> api.h
echo "" >> api.h
cat api-pthreads/api-pthreads.h | \
	sed '/begin{snippet}/d' | \
	sed '/end{snippet}/d' >> api.h
echo "" >> api.h
cat api-pthreads/api-gcc.h >> api.h
cat api-pthreads/api-linux.h >> api.h
echo "" >> api.h
if test -f /usr/include/urcu-call-rcu.h -o \
	-f /usr/local/include/urcu-call-rcu.h -o \
	-f /usr/include//urcu-call-rcu.h -o \
	-f /usr/include/urcu-call-rcu.h ; \
then \
	echo "#define _LGPL_SOURCE" >> api.h; \
	echo "#include <urcu/rculist.h>" >> api.h; \
	echo "#include <urcu/rcuhlist.h>" >> api.h; \
	echo "#include <urcu-pointer.h>" >> api.h; \
elif test -d /usr/include/urcu -o -d /usr/local/include/urcu ; \
then \
	echo "#define _LGPL_SOURCE" >> api.h; \
	echo "#include <urcu/rculist.h>" >> api.h; \
	echo "#include <urcu/rcuhlist.h>" >> api.h; \
	echo "#include <urcu-pointer-static.h>" >> api.h; \
else \
	echo "### Missing liburcu package!!!  Install it. ###"; \
	exit 1;  \
fi
echo "#endif /* #ifndef __PERFBOOK_API_H__ */" >> api.h
echo "# MECHANICALLY GENERATED, DO NOT EDIT!!!" > Makefile.arch
echo "" >> Makefile.arch
[CodeSamples]$ cd count/
[count]$ make
### None in count/ can be built on arch: 'unknown'.
###


So, for some reason, it couldn't still get the architecture.

Oh, I noticed depends.mk use `uname -p` for getting the arch, which is non-
portable:

###
uname --help
Usage: uname [OPTION]...
Print certain system information.  With no OPTION, same as -s.
[...]
  -m, --machine            print the machine hardware name
  -p, --processor          print the processor type (non-portable)
###


I heard some distros patch this by doing uname -p the same as uname -m, whi=
ch
seems to have the correct output. I patched this and then now it works:

###
make
make -C .. Makefile.arch
make[1]: Entering directory '/dev/shm/perfbook/CodeSamples'
make pthreads
make[2]: Entering directory '/dev/shm/perfbook/CodeSamples'
echo "#ifndef __PERFBOOK_API_H__" > api.h
echo "#define __PERFBOOK_API_H__" >> api.h
echo "/* MECHANICALLY GENERATED, DO NOT EDIT!!! */" >> api.h
echo "" >> api.h
cat linux/common.h >> api.h
echo "" >> api.h
cat arch-x86/arch-x86.h >> api.h
echo "" >> api.h
cat api-pthreads/api-pthreads.h | \
	sed '/begin{snippet}/d' | \
	sed '/end{snippet}/d' >> api.h
echo "" >> api.h
cat api-pthreads/api-gcc.h >> api.h
cat api-pthreads/api-linux.h >> api.h
echo "" >> api.h
if test -f /usr/include/urcu-call-rcu.h -o \
	-f /usr/local/include/urcu-call-rcu.h -o \
	-f /usr/include/x86_64-linux-gnu/urcu-call-rcu.h -o \
	-f /usr/include/urcu-call-rcu.h ; \
then \
	echo "#define _LGPL_SOURCE" >> api.h; \
	echo "#include <urcu/rculist.h>" >> api.h; \
	echo "#include <urcu/rcuhlist.h>" >> api.h; \
	echo "#include <urcu-pointer.h>" >> api.h; \
elif test -d /usr/include/urcu -o -d /usr/local/include/urcu ; \
then \
	echo "#define _LGPL_SOURCE" >> api.h; \
	echo "#include <urcu/rculist.h>" >> api.h; \
	echo "#include <urcu/rcuhlist.h>" >> api.h; \
	echo "#include <urcu-pointer-static.h>" >> api.h; \
else \
	echo "### Missing liburcu package!!!  Install it. ###"; \
	exit 1;  \
fi
echo "#endif /* #ifndef __PERFBOOK_API_H__ */" >> api.h
echo "# MECHANICALLY GENERATED, DO NOT EDIT!!!" > Makefile.arch
echo "" >> Makefile.arch
cat arch-x86/Makefile.arch >> Makefile.arch
make[2]: Leaving directory '/dev/shm/perfbook/CodeSamples'
make[1]: Leaving directory '/dev/shm/perfbook/CodeSamples'
cc -g -O3 -Wall  -o count_atomic count_atomic.c -lpthread
cc -g -O3 -Wall  -o count_end count_end.c -lpthread
cc -g -O3 -Wall  -o count_end_rcu count_end_rcu.c -lpthread
cc -g -O3 -Wall  -o count_lim count_lim.c -lpthread
cc -g -O3 -Wall  -o count_lim_app count_lim_app.c -lpthread
cc -g -O3 -Wall  -o count_lim_atomic count_lim_atomic.c -lpthread
cc -g -O3 -Wall  -o count_lim_sig count_lim_sig.c -lpthread
cc -g -O3 -Wall  -o count_limd count_limd.c -lpthread
cc -g -O3 -Wall  -o count_nonatomic count_nonatomic.c -lpthread
cc -g -O3 -Wall  -o count_stack count_stack.c -lpthread
cc -g -O3 -Wall  -o count_stat count_stat.c -lpthread
cc -g -O3 -Wall  -o count_stat_atomic count_stat_atomic.c -lpthread
cc -g -O3 -Wall  -o count_stat_eventual count_stat_eventual.c -lpthread
cc -g -O3 -Wall  -o count_tstat count_tstat.c -lpthread
###

I will send a patch fixing the uname soon :)

>=20
> This should probably be documented somewhere, perhaps in howto/howto.tex
> or maybe in BUILD-FAQ.txt.  Thoughts?
>=20
> 							Thanx, Paul

Best regards,
Leo

