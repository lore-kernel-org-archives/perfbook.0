Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7Kcd50pF7ZCGY/49doajuL1r9rUiEJXfCS/MWtUzcmU=;
 b=bVZYv96W9vkjbzx5eXVy2a55Q9wpX1gCdH3Un883uvHTBMJu6vjnHH1leYVYMjEr/7
 6mEW5YylVaEZM/UUi3VU0jHE4MMjGvR4CcAahT2qzinRYwUNg97dvS15dHLiEehtIPVM
 n28gUkrs3pCsexPnYcVZNvWe5glFrSCSirbdBI+2A5pDtj08jjw58PgJVE2Ll9l6PXnt
 BxVnv7HcC/d1rR9wqs74qgakTPLzYn8ZoDTnw23riv3K0FgHdWzSWDhhrqKgmfuOrBgd
 2OqxJhppMCKTPglYWMjfDKL/3e9WsiyshY7ns/GPdZ5rthwzB1Gz8FwGiJwCaGBIH6DD
 k0dQ==
Subject: [PATCH 1/5] CodeSamples: Remove gprof-helper.c
References: <39761e77-17b7-7e05-d47b-07b89ff9b4b4@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e890e900-77f7-8d5f-99ae-97a579f3c338@gmail.com>
Date: Sat, 10 Jun 2017 00:24:15 +0900
MIME-Version: 1.0
In-Reply-To: <39761e77-17b7-7e05-d47b-07b89ff9b4b4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 5d81fb381768463ac02881edb5e8caf3896e9c48 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 6 Jun 2017 00:06:44 +0900
Subject: [PATCH 1/5] CodeSamples: Remove gprof-helper.c

Paul confirmed that he no longer needs this.
Also remove its entry in .gitignore.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/.gitignore     |   1 -
 CodeSamples/gprof-helper.c | 118 ---------------------------------------=
------
 2 files changed, 119 deletions(-)
 delete mode 100644 CodeSamples/gprof-helper.c

diff --git a/CodeSamples/.gitignore b/CodeSamples/.gitignore
index e116055..042e44d 100644
--- a/CodeSamples/.gitignore
+++ b/CodeSamples/.gitignore
@@ -1,3 +1,2 @@
-/gprof-helper.c
 /Makefile.arch
 /api.h
diff --git a/CodeSamples/gprof-helper.c b/CodeSamples/gprof-helper.c
deleted file mode 100644
index e413b17..0000000
--- a/CodeSamples/gprof-helper.c
+++ /dev/null
@@ -1,118 +0,0 @@
-/* gprof-helper.c -- preload library to profile pthread-enabled programs=
=20
- *=20
- * Authors: Sam Hocevar <sam at zoy dot org>=20
- *          Daniel J=C3=B6nsson <danieljo at fagotten dot org>=20
- *=20
- *  This program is free software; you can redistribute it and/or=20
- *  modify it under the terms of the Do What The Fuck You Want To=20
- *  Public License as published by Banlu Kemiyatorn. See=20
- *  http://sam.zoy.org/projects/COPYING.WTFPL for more details.=20
- *=20
- * Compilation example:=20
- * gcc -shared -fPIC gprof-helper.c -o gprof-helper.so -lpthread -ldl=20
- *=20
- * Usage example:=20
- * LD_PRELOAD=3D./gprof-helper.so your_program=20
- */=20
-=20
-#define _GNU_SOURCE=20
-#include <sys/time.h>=20
-#include <stdio.h>=20
-#include <stdlib.h>=20
-#include <dlfcn.h>=20
-#include <pthread.h>=20
-=20
-static void * wrapper_routine(void *);=20
-=20
-/* Original pthread function */=20
-static int (*pthread_create_orig)(pthread_t *__restrict,
-				  __const pthread_attr_t *__restrict,
-				  void *(*)(void *), void *__restrict) =3D NULL;=20
-=20
-/* Library initialization function */=20
-void wooinit(void) __attribute__((constructor));=20
-=20
-void wooinit(void)=20
-{=20
-	pthread_create_orig =3D dlsym(RTLD_NEXT, "pthread_create");=20
-	fprintf(stderr, "pthreads: using profiling hooks for gprof\n");=20
-	if(pthread_create_orig =3D=3D NULL) {=20
-		char *error =3D dlerror();=20
-		if(error =3D=3D NULL) {=20
-			error =3D "pthread_create is NULL";=20
-		}=20
-		fprintf(stderr, "%s\n", error);=20
-		exit(EXIT_FAILURE);=20
-	}=20
-}=20
-=20
-/* Our data structure passed to the wrapper */=20
-typedef struct wrapper_s=20
-{=20
-	void * (*start_routine)(void *);=20
-	void * arg;=20
-
-	pthread_mutex_t lock;=20
-	pthread_cond_t  wait;=20
-
-	struct itimerval itimer;=20
-
-} wrapper_t;=20
-=20
-/* The wrapper function in charge for setting the itimer value */=20
-static void * wrapper_routine(void * data)=20
-{=20
-	/* Put user data in thread-local variables */=20
-	void * (*start_routine)(void *) =3D ((wrapper_t*)data)->start_routine;=20
-	void * arg =3D ((wrapper_t*)data)->arg;=20
-
-	/* Set the profile timer value */=20
-	setitimer(ITIMER_PROF, &((wrapper_t*)data)->itimer, NULL);=20
-
-	/* Tell the calling thread that we don't need its data anymore */=20
-	pthread_mutex_lock(&((wrapper_t*)data)->lock);=20
-	pthread_cond_signal(&((wrapper_t*)data)->wait);=20
-	pthread_mutex_unlock(&((wrapper_t*)data)->lock);=20
-
-	/* Call the real function */=20
-	return start_routine(arg);=20
-}=20
-=20
-/* Our wrapper function for the real pthread_create() */=20
-int pthread_create(pthread_t *__restrict thread,
-		   __const pthread_attr_t *__restrict attr,
-		   void * (*start_routine)(void *),
-		   void *__restrict arg)=20
-{
-	wrapper_t wrapper_data;=20
-	int i_return;=20
-
-	/* Initialize the wrapper structure */=20
-	wrapper_data.start_routine =3D start_routine;=20
-	wrapper_data.arg =3D arg;=20
-	getitimer(ITIMER_PROF, &wrapper_data.itimer);=20
-	pthread_cond_init(&wrapper_data.wait, NULL);=20
-	pthread_mutex_init(&wrapper_data.lock, NULL);=20
-	pthread_mutex_lock(&wrapper_data.lock);=20
-
-	/* The real pthread_create call */=20
-	i_return =3D pthread_create_orig(thread,
-				       attr,
-				       &wrapper_routine,
-				       &wrapper_data);=20
-
-	/*
-	 * If the thread was successfully spawned, wait for the data
-	 * to be released
-	 */=20
-
-	if(i_return =3D=3D 0) {=20
-		pthread_cond_wait(&wrapper_data.wait, &wrapper_data.lock);=20
-	}=20
-
-	pthread_mutex_unlock(&wrapper_data.lock);=20
-	pthread_mutex_destroy(&wrapper_data.lock);=20
-	pthread_cond_destroy(&wrapper_data.wait);=20
-
-	return i_return;=20
-}=20
--=20
2.7.4


