Return-Path: <SRS0=4sqk=3O=qa2.so-net.ne.jp=akys@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qa2.so-net.ne.jp;
	s=sn2021; t=1668425488;
	bh=mGPnvhmbc5EGhAtBgz+zvmPIUy7miZjyJxEca44sDok=;
	h=Date:To:Cc:From:Subject;
	b=Mn3VQsz6bXBdfyiKzzDETXaC32qkpqtxTNQ4ji1DtOeuR5cdDzo8ZoIwhLqv+7QpJ
	 5zn8xMondpz7LGBn7xvptadgerf7QnXwrConXJeWR0fyi6BaMrYHS8+7mPoDOChxL/
	 c77sYnxNKKPddTzVn/idLUP9FuU5gKU1m3NJYWHgNkYdFpnpTA4Yh5e0tWzvHfNVVe
	 PHoB4Rh9pKQPxqPAOsRwraoSxPB8Q1nbEERbADPSWlzKpgGCFCr5LLQ3tcWzl1nb1s
	 PiR01kwm46zJFg29BKdLKLKX0e+ODmvZp3rnqPbPHH75PHCF2ml9pNP6RaRD/UU/rs
	 vCWAjXyvFa73g==
Message-ID: <a72f12a9-0b7a-b711-62c4-11bd76cfde65@qa2.so-net.ne.jp>
Date: Mon, 14 Nov 2022 20:31:27 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akys@qa2.so-net.ne.jp>
Subject: [PATCH -perfbook] CodeSamples: Add -fcommon to GCC_ARGS
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: "Paul E. McKenney" <paulmck@kernel.org>, Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

An item on GCC 10 changes [1] reads:

  - GCC now defaults to -fno-common. As a result, global variable
    accesses are more efficient on various targets. In C, global
    variables with multiple tentative definitions now result in
    linker errors. With -fcommon such definitions are silently
    merged during linking.

This change affects builds under CodeSamples/ as reported by Elad [2].

As a band-aide fix, add -fcommon to GCC_ARGS where necessary.

Reported-by: Elad Lahav <e2lahav@gmail.com>
Link: [1] https://gcc.gnu.org/gcc-10/changes.html
Link: [2] https://www.spinics.net/lists/perfbook/msg03690.html
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi,

Under Ubuntu 22.04, there is another issue with distro package of
liburcu-dev (0.13.1).
"make" under CodeSamples/datastuct/Issaquah/ result in error:

cc -g -O3 -Wall -fcommon -o existence_test existence.c existence_test.c -=
lpthread -lurcu -lurcu-signal
In file included from /usr/include/x86_64-linux-gnu/urcu/pointer.h:39,
                 from /usr/include/x86_64-linux-gnu/urcu-pointer.h:1,
                 from /usr/include/x86_64-linux-gnu/urcu/rculist.h:30,
                 from ../../api.h:847,
                 from existence.c:30:
existence.h: In function =E2=80=98existence_exists_relaxed=E2=80=99:
existence.h:54:32: error: invalid use of undefined type =E2=80=98struct e=
xistence=E2=80=99
   54 |         struct existence *ep =3D rcu_dereference(*epp);
      |                                ^~~~~~~~~~~~~~~
In file included from /usr/include/x86_64-linux-gnu/urcu/pointer.h:39,
                 from /usr/include/x86_64-linux-gnu/urcu-pointer.h:1,
                 from /usr/include/x86_64-linux-gnu/urcu/rculist.h:30,
                 from ../../api.h:847,
                 from existence_test.c:26:
existence.h: In function =E2=80=98existence_exists_relaxed=E2=80=99:
existence.h:54:32: error: invalid use of undefined type =E2=80=98struct e=
xistence=E2=80=99
   54 |         struct existence *ep =3D rcu_dereference(*epp);
      |                                ^~~~~~~~~~~~~~~
make: *** [Makefile:48: existence_test] Error 1

This can be fixed by installing 0.13.2 (from https://liburcu.org/).
However, you will still see warning messages like:

cc -g -O3 -Wall -fcommon -o treetorture tree.c existence.c spinlockmult.c=
 ../../lib/random.c -lpthread -lurcu -lurcu-signal
In function 'free_treenode_cache',
    inlined from 'tree_remove_all' at tree.c:102:2,
    inlined from 'tree_free' at tree.c:128:2:
tree.c:251:9: warning: 'free' called on pointer 'trp' with nonzero offset=
 96 [-Wfree-nonheap-object]
  251 |         free(tnp);
      |         ^~~~~~~~~
In function 'free_treenode_cache',
    inlined from 'tree_remove_all' at tree.c:102:2,
    inlined from 'tree_free' at tree.c:128:2,
    inlined from 'manual_smoke' at treetorture.h:481:2:
tree.c:251:9: warning: 'free' called on pointer 'trp0' with nonzero offse=
t 96 [-Wfree-nonheap-object]
  251 |         free(tnp);
      |         ^~~~~~~~~
In file included from tree.c:928:
treetorture.h: In function 'manual_smoke':
treetorture.h:424:16: note: returned from 'tree_alloc'
  424 |         trp0 =3D tree_alloc();
      |                ^~~~~~~~~~~~
In function 'free_treenode_cache',
    inlined from 'tree_remove_all' at tree.c:102:2,
    inlined from 'tree_free' at tree.c:128:2,
    inlined from 'manual_smoke' at treetorture.h:482:2:
tree.c:251:9: warning: 'free' called on pointer 'trp1' with nonzero offse=
t 96 [-Wfree-nonheap-object]
  251 |         free(tnp);
      |         ^~~~~~~~~
[snip]

I have not yet looked into these warnings.

        Thanks, Akira

--
 CodeSamples/datastruct/Issaquah/Makefile | 2 ++
 CodeSamples/datastruct/hash/Makefile     | 2 ++
 CodeSamples/defer/Makefile               | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/CodeSamples/datastruct/Issaquah/Makefile b/CodeSamples/datas=
truct/Issaquah/Makefile
index 51b91fd8dafa..c3b724d750b2 100644
--- a/CodeSamples/datastruct/Issaquah/Makefile
+++ b/CodeSamples/datastruct/Issaquah/Makefile
@@ -32,6 +32,8 @@ endif
=20
 include $(top)/recipes.mk
=20
+GCC_ARGS +=3D -fcommon
+
 # NOTE:  For decent scalability on update-side tests as of early 2015,
 #	 use something like jemalloc() instead of glibc malloc().
 #	 If you install jemalloc at /home/paulmck/jemalloc, you will
diff --git a/CodeSamples/datastruct/hash/Makefile b/CodeSamples/datastruc=
t/hash/Makefile
index 80568cd11981..a56255a272eb 100644
--- a/CodeSamples/datastruct/hash/Makefile
+++ b/CodeSamples/datastruct/hash/Makefile
@@ -32,6 +32,8 @@ endif
=20
 include $(top)/recipes.mk
=20
+GCC_ARGS +=3D -fcommon
+
 hash_bkt: hash_bkt.c ../../api.h hashtorture.h
 	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt hash_bkt.c $(LIB)/random.c -lpth=
read
=20
diff --git a/CodeSamples/defer/Makefile b/CodeSamples/defer/Makefile
index 46cb87a1c9dc..3cf3e5a5f134 100644
--- a/CodeSamples/defer/Makefile
+++ b/CodeSamples/defer/Makefile
@@ -61,6 +61,8 @@ endif
=20
 include $(top)/recipes.mk
=20
+GCC_ARGS +=3D -fcommon
+
 # Note that bug_srcu_a is disabled until completed.
 bug_srcu_a: bug_srcu_a.c srcu.c ../api.h
 	cc $(GCC_ARGS) -o bug_srcu_a -DTEST bug_srcu_a.c -lurcu -lpthread

base-commit: 7f7a2c25e3d2e87412d10bdb355b369eca524b1a
--=20
2.25.1

