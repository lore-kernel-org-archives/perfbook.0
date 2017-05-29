Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ujBy6vO3/65RFksTMISt093o+YyuiPd/aFjFQhCYGp8=;
 b=nlhWvsfZdgC/HYcxb7rS89weQZky1FphaCKKeA7YGxTHogjP4q/Js2c761xFOtyQgO
 HuBR0hgwOcLBr9vOctoLA8fCm/xtzCrm33QMq4fZmbqcHDLQNppGAHl71a/yQTeNPzbT
 IMmL7+1o8oq/agY+xc7V7X9XtPAoY1+UpqgViS0dNCkcX+HFCS3zSD9zlxe8fz4aJ+C7
 w8pJZ9jCfgr4YnUUPgjCfgN5ALBXkG9l+nuVDRCBqgTymWC1NwK5NTa+OE4aFgzA1/KI
 ItQo3mavEIfc9KSI7r4RmSemuwSqC4z40Y1OsEDGsndzvJaO72SLLQEmdjVETMixWBkk
 E+Dw==
Subject: [RFC PATCH 2/4] CodeSamples: Remove generated files from repository
References: <f9df1cc9-32af-951c-1f89-b89331c9dce9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5103353e-f8d5-1cb3-59b4-a068fa11d8a1@gmail.com>
Date: Tue, 30 May 2017 07:16:15 +0900
MIME-Version: 1.0
In-Reply-To: <f9df1cc9-32af-951c-1f89-b89331c9dce9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 10024f2b41c129e5e7e892c60946c8dd5dd58007 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 28 May 2017 09:40:21 +0900
Subject: [RFC PATCH 2/4] CodeSamples: Remove generated files from repository

Now, as Makefile.arch and api.h are generated when necessary,
they are no longer necessary in the repository.

Also fix entry for gprof-helper.c in .gitignore and remove an
executable file sneaked into repository under datastruct/Issaquah/.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/.gitignore                         |   4 +-
 CodeSamples/Makefile.arch                      |   6 -
 CodeSamples/api.h                              | 808 -------------------------
 CodeSamples/datastruct/Issaquah/existence_test | Bin 26359 -> 0 bytes
 4 files changed, 3 insertions(+), 815 deletions(-)
 delete mode 100644 CodeSamples/Makefile.arch
 delete mode 100644 CodeSamples/api.h
 delete mode 100755 CodeSamples/datastruct/Issaquah/existence_test

diff --git a/CodeSamples/.gitignore b/CodeSamples/.gitignore
index 9e3642f..e116055 100644
--- a/CodeSamples/.gitignore
+++ b/CodeSamples/.gitignore
@@ -1 +1,3 @@
-./gprof-helper.c
+/gprof-helper.c
+/Makefile.arch
+/api.h
diff --git a/CodeSamples/Makefile.arch b/CodeSamples/Makefile.arch
deleted file mode 100644
index 07a4b33..0000000
--- a/CodeSamples/Makefile.arch
+++ /dev/null
@@ -1,6 +0,0 @@
-# MECHANICALLY GENERATED, DO NOT EDIT!!!
-
-# For use on 64-bit systems, add -m32.  You might also need to install
-# g++-multilib (thanks to robert.berger@reliableembeddedsystems.com).
-
-GCC_ARGS=-g -O3 -Wall
diff --git a/CodeSamples/api.h b/CodeSamples/api.h
deleted file mode 100644
index 3b4bc16..0000000
--- a/CodeSamples/api.h
+++ /dev/null
@@ -1,808 +0,0 @@
-#ifndef __PERFBOOK_API_H__
-#define __PERFBOOK_API_H__
-/* MECHANICALLY GENERATED, DO NOT EDIT!!! */
-
-/*
- * common.h: Common Linux kernel-isms.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; but version 2 of the License only due
- * to code included from the Linux kernel.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, you can access it online at
- * http://www.gnu.org/licenses/gpl-2.0.html.
- *
- * Copyright (c) 2006 Paul E. McKenney, IBM.
- *
- * Much code taken from the Linux kernel.  For such code, the option
- * to redistribute under later versions of GPL might not be available.
- */
-
-#ifndef __always_inline
-#define __always_inline inline
-#endif
-#ifndef __maybe_unused
-#define __maybe_unused __attribute__((unused))
-#endif
-
-#define BUILD_BUG_ON(condition) ((void)sizeof(char[1 - 2*!!(condition)]))
-#define BUILD_BUG_ON_ZERO(e) (sizeof(char[1 - 2 * !!(e)]) - 1)
-
-#ifdef __ASSEMBLY__
-#  define stringify_in_c(...)   __VA_ARGS__
-#  define ASM_CONST(x)          x
-#else
-/* This version of stringify will deal with commas... */
-#  define __stringify_in_c(...) #__VA_ARGS__
-#  define stringify_in_c(...)   __stringify_in_c(__VA_ARGS__) " "
-#  define __ASM_CONST(x)        x##UL
-#  define ASM_CONST(x)          __ASM_CONST(x)
-#endif
-
-
-/*
- * arch-i386.h: Expose x86 atomic instructions.  80486 and better only.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation, but version 2 only due to inclusion
- * of Linux-kernel code.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, you can access it online at
- * http://www.gnu.org/licenses/gpl-2.0.html.
- *
- * Copyright (c) 2006 Paul E. McKenney, IBM.
- *
- * Much code taken from the Linux kernel.  For such code, the option
- * to redistribute under later versions of GPL might not be available.
- */
-
-/*
- * Machine parameters.
- */
-
-#define CONFIG_SMP
-
-#define CACHE_LINE_SIZE 64
-#define ____cacheline_internodealigned_in_smp \
-	__attribute__((__aligned__(1 << 6)))
-
-#define LOCK_PREFIX "lock ; "
-
-/* These are x86-specific, used by some header files */
-#define atomic_clear_mask(mask, addr) \
-__asm__ __volatile__(LOCK_PREFIX "andl %0,%1" \
-: : "r" (~(mask)),"m" (*addr) : "memory")
-
-#define atomic_set_mask(mask, addr) \
-__asm__ __volatile__(LOCK_PREFIX "orl %0,%1" \
-: : "r" (mask),"m" (*(addr)) : "memory")
-
-/* Atomic operations are already serializing on x86 */
-#define smp_mb__before_atomic_dec()	barrier()
-#define smp_mb__after_atomic_dec()	barrier()
-#define smp_mb__before_atomic_inc()	barrier()
-#define smp_mb__after_atomic_inc()	barrier()
-
-#define smp_mb() \
-__asm__ __volatile__("mfence" : : : "memory")
-/* __asm__ __volatile__("lock; addl $0,0(%%esp)" : : : "memory") */
-
-
-/*
- * Generate 64-bit timestamp.
- */
-
-static __inline__ long long get_timestamp(void)
-{
-	unsigned int __a,__d;
-
-	__asm__ __volatile__("rdtsc" : "=a" (__a), "=d" (__d));
-	return ((long long)__a) | (((long long)__d)<<32);
-}
-
-/*
- * api_pthreads.h: API mapping to pthreads environment.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.  However, please note that much
- * of the code in this file derives from the Linux kernel, and that such
- * code may not be available except under GPLv2.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, you can access it online at
- * http://www.gnu.org/licenses/gpl-2.0.html.
- *
- * Copyright (c) 2006 Paul E. McKenney, IBM.
- */
-
-#include <stdio.h>
-#include <stdlib.h>
-#include <unistd.h>
-#include <strings.h>
-#include <errno.h>
-#include <limits.h>
-#include <sys/types.h>
-#include <sys/wait.h>
-#include <poll.h>
-#include <sys/time.h>
-#include <string.h>
-#ifndef _GNU_SOURCE
-#define _GNU_SOURCE
-#endif /* #ifndef _GNU_SOURCE */
-#ifndef __USE_GNU
-#define __USE_GNU
-#endif /* #ifndef __USE_GNU */
-#include <pthread.h>
-#include <sched.h>
-#include <sys/param.h>
-/* #include "atomic.h" */
-
-/*
- * Compiler magic.
- */
-#ifndef offsetof
-#define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)
-#endif /* #ifndef offsetof */
-#ifndef container_of
-#define container_of(ptr, type, member) ({			\
-	const typeof( ((type *)0)->member ) *__mptr = (ptr);	\
-	(type *)( (char *)__mptr - offsetof(type,member) );})
-#endif /* #ifndef offsetof */
-#define barrier() __asm__ __volatile__("": : :"memory")
-
-/*
- * Default machine parameters.
- */
-
-#ifndef CACHE_LINE_SIZE
-#define CACHE_LINE_SIZE 128
-#endif /* #ifndef CACHE_LINE_SIZE */
-
-/*
- * Exclusive locking primitives.
- */
-
-typedef pthread_mutex_t spinlock_t;
-
-#define DEFINE_SPINLOCK(lock) spinlock_t lock = PTHREAD_MUTEX_INITIALIZER;
-#define __SPIN_LOCK_UNLOCKED(lockp) PTHREAD_MUTEX_INITIALIZER
-
-static __inline__ void spin_lock_init(spinlock_t *sp)
-{
-	int ret;
-
-retry:
-	ret = pthread_mutex_init(sp, NULL);
-	if (ret) {
-		if (ret == EINTR)
-			goto retry;
-		fprintf(stderr, "spin_lock_init:pthread_mutex_init %d\n", ret);
-		abort();
-	}
-}
-
-static __inline__ void spin_lock(spinlock_t *sp)
-{
-	if (pthread_mutex_lock(sp) != 0) {
-		perror("spin_lock:pthread_mutex_lock");
-		abort();
-	}
-}
-
-static __inline__ int spin_trylock(spinlock_t *sp)
-{
-	int retval;
-
-	if ((retval = pthread_mutex_trylock(sp)) == 0)
-		return 1;
-	if (retval == EBUSY)
-		return 0;
-	perror("spin_trylock:pthread_mutex_trylock");
-	abort();
-}
-
-static __inline__ void spin_unlock(spinlock_t *sp)
-{
-	if (pthread_mutex_unlock(sp) != 0) {
-		perror("spin_unlock:pthread_mutex_unlock");
-		abort();
-	}
-}
-
-static __inline__ int spin_is_locked(spinlock_t *sp)
-{
-	if (spin_trylock(sp)) {
-		spin_unlock(sp);
-		return 0;
-	}
-	return 1;
-}
-
-#define spin_lock_irqsave(l, f) do { f = 1; spin_lock(l); } while (0)
-#define spin_unlock_irqrestore(l, f) do { f = 0; spin_unlock(l); } while (0)
-
-#define ACCESS_ONCE(x) (*(volatile typeof(x) *)&(x))
-#define READ_ONCE(x) ({ typeof(x) ___x = ACCESS_ONCE(x); ___x; })
-#define WRITE_ONCE(x, val) ({ ACCESS_ONCE(x) = (val); })
-#ifndef unlikely
-#define unlikely(x) x
-#endif /* #ifndef unlikely */
-#ifndef likely
-#define likely(x) x
-#endif /* #ifndef likely */
-#define prefetch(x) x
-
-/*
- * Thread creation/destruction primitives.
- */
-
-typedef pthread_t thread_id_t;
-
-#define NR_THREADS 128
-
-#define __THREAD_ID_MAP_EMPTY 0
-#define __THREAD_ID_MAP_WAITING 1
-thread_id_t __thread_id_map[NR_THREADS];
-spinlock_t __thread_id_map_mutex;
-
-#define for_each_thread(t) \
-	for (t = 0; t < NR_THREADS; t++)
-
-#define for_each_running_thread(t) \
-	for (t = 0; t < NR_THREADS; t++) \
-		if ((__thread_id_map[t] != __THREAD_ID_MAP_EMPTY) && \
-		    (__thread_id_map[t] != __THREAD_ID_MAP_WAITING))
-
-#define for_each_tid(t, tid) \
-	for (t = 0; t < NR_THREADS; t++) \
-		if ((((tid) = __thread_id_map[t]) != __THREAD_ID_MAP_EMPTY) && \
-		    ((tid) != __THREAD_ID_MAP_WAITING))
-
-pthread_key_t thread_id_key;
-
-static __inline__ int num_online_threads(void)
-{
-	int t;
-	int nonline = 0;
-
-	for_each_running_thread(t)
-		nonline++;
-	return nonline;
-}
-
-static __inline__ int __smp_thread_id(void)
-{
-	int i;
-	thread_id_t tid = pthread_self();
-
-	for (i = 0; i < NR_THREADS; i++) {
-		if (__thread_id_map[i] == tid) {
-			long v = i + 1;  /* must be non-NULL. */
-
-			if (pthread_setspecific(thread_id_key, (void *)v) != 0) {
-				perror("pthread_setspecific");
-				exit(-1);
-			}
-			return i;
-		}
-	}
-	spin_lock(&__thread_id_map_mutex);
-	for (i = 0; i < NR_THREADS; i++) {
-		if (__thread_id_map[i] == tid) {
-			spin_unlock(&__thread_id_map_mutex);
-			return i;
-		}
-	}
-	spin_unlock(&__thread_id_map_mutex);
-	fprintf(stderr, "smp_thread_id: Rogue thread, id: %d(%#x)\n",
-		(int)tid, (int)tid);
-	exit(-1);
-}
-
-static __inline__ int smp_thread_id(void)
-{
-	void *id;
-
-	id = pthread_getspecific(thread_id_key);
-	if (id == NULL)
-		return __smp_thread_id();
-	return (long)(id - 1);
-}
-
-static __inline__ thread_id_t create_thread(void *(*func)(void *), void *arg)
-{
-	thread_id_t tid;
-	int i;
-
-	spin_lock(&__thread_id_map_mutex);
-	for (i = 0; i < NR_THREADS; i++) {
-		if (__thread_id_map[i] == __THREAD_ID_MAP_EMPTY)
-			break;
-	}
-	if (i >= NR_THREADS) {
-		spin_unlock(&__thread_id_map_mutex);
-		fprintf(stderr, "Thread limit of %d exceeded!\n", NR_THREADS);
-		exit(-1);
-	}
-	__thread_id_map[i] = __THREAD_ID_MAP_WAITING;
-	if (pthread_create(&tid, NULL, func, arg) != 0) {
-		perror("create_thread:pthread_create");
-		exit(-1);
-	}
-	__thread_id_map[i] = tid;
-	spin_unlock(&__thread_id_map_mutex);
-	return tid;
-}
-
-static __inline__ void *wait_thread(thread_id_t tid)
-{
-	int i;
-	void *vp;
-
-	for (i = 0; i < NR_THREADS; i++) {
-		if (__thread_id_map[i] == tid)
-			break;
-	}
-	if (i >= NR_THREADS){
-		fprintf(stderr, "wait_thread: bad tid = %d(%#x)\n",
-			(int)tid, (int)tid);
-		exit(-1);
-	}
-	if (pthread_join(tid, &vp) != 0) {
-		perror("wait_thread:pthread_join");
-		exit(-1);
-	}
-	__thread_id_map[i] = __THREAD_ID_MAP_EMPTY;
-	return vp;
-}
-
-static __inline__ void wait_all_threads(void)
-{
-	int i;
-	thread_id_t tid;
-
-	for (i = 1; i < NR_THREADS; i++) {
-		tid = __thread_id_map[i];
-		if (tid != __THREAD_ID_MAP_EMPTY &&
-		    tid != __THREAD_ID_MAP_WAITING)
-			(void)wait_thread(tid);
-	}
-}
-
-/*
- * Wait on all child processes.
- */
-static __inline__ void waitall(void)
-{
-	int pid;
-	int status;
-
-	for (;;) {
-		pid = wait(&status);
-		if (pid == -1) {
-			if (errno == ECHILD)
-				break;
-			perror("wait");
-			exit(-1);
-		}
-		poll(NULL, 0, 1);
-	}
-}
-
-static __inline__ void run_on(int cpu)
-{
-	cpu_set_t mask;
-
-	CPU_ZERO(&mask);
-	CPU_SET(cpu, &mask);
-	sched_setaffinity(0, sizeof(mask), &mask);
-}
-
-/*
- * timekeeping -- very crude -- should use MONOTONIC...
- */
-
-static __inline__ long long get_microseconds(void)
-{
-	struct timeval tv;
-
-	if (gettimeofday(&tv, NULL) != 0)
-		abort();
-	return ((long long)tv.tv_sec) * 1000000LL + (long long)tv.tv_usec;
-}
-
-/*
- * Per-thread variables.
- */
-
-#define DEFINE_PER_THREAD(type, name) \
-	struct { \
-		__typeof__(type) v \
-			__attribute__((__aligned__(CACHE_LINE_SIZE))); \
-	} __per_thread_##name[NR_THREADS];
-#define DECLARE_PER_THREAD(type, name) extern DEFINE_PER_THREAD(type, name)
-
-#define per_thread(name, thread) __per_thread_##name[thread].v
-#define __get_thread_var(name) per_thread(name, smp_thread_id())
-
-#define init_per_thread(name, v) \
-	do { \
-		int __i_p_t_i; \
-		for (__i_p_t_i = 0; __i_p_t_i < NR_THREADS; __i_p_t_i++) \
-			per_thread(name, __i_p_t_i) = v; \
-	} while (0)
-
-/*
- * CPU traversal primitives.
- */
-
-#ifndef NR_CPUS
-#define NR_CPUS 16
-#endif /* #ifndef NR_CPUS */
-
-#define for_each_possible_cpu(cpu) \
-	for (cpu = 0; cpu < NR_CPUS; cpu++)
-#define for_each_online_cpu(cpu) \
-	for (cpu = 0; cpu < NR_CPUS; cpu++)
-
-/*
- * Per-CPU variables.
- */
-
-#define DEFINE_PER_CPU(type, name) \
-	struct { \
-		__typeof__(type) v \
-			__attribute__((__aligned__(CACHE_LINE_SIZE))); \
-	} __per_cpu_##name[NR_CPUS]
-#define DECLARE_PER_CPU(type, name) extern DEFINE_PER_CPU(type, name)
-
-DEFINE_PER_THREAD(int, smp_processor_id);
-
-static __inline__ int smp_processor_id(void)
-{
-	return __get_thread_var(smp_processor_id);
-}
-
-static __inline__ void set_smp_processor_id(int cpu)
-{
-	__get_thread_var(smp_processor_id) = cpu;
-}
-
-#define per_cpu(name, thread) __per_cpu_##name[thread].v
-#define __get_cpu_var(name) per_cpu(name, smp_processor_id())
-
-#define init_per_cpu(name, v) \
-	do { \
-		int __i_p_c_i; \
-		for (__i_p_c_i = 0; __i_p_c_i < NR_CPUS; __i_p_c_i++) \
-			per_cpu(name, __i_p_c_i) = v; \
-	} while (0)
-
-/*
- * CPU state checking (crowbarred).
- */
-
-#define idle_cpu(cpu) 0
-#define in_softirq() 1
-#define hardirq_count() 0
-#define PREEMPT_SHIFT   0
-#define SOFTIRQ_SHIFT   (PREEMPT_SHIFT + PREEMPT_BITS)
-#define HARDIRQ_SHIFT   (SOFTIRQ_SHIFT + SOFTIRQ_BITS)
-#define PREEMPT_BITS    8
-#define SOFTIRQ_BITS    8
-
-/*
- * CPU hotplug.
- */
-
-struct notifier_block {
-	int (*notifier_call)(struct notifier_block *, unsigned long, void *);
-	struct notifier_block *next;
-	int priority;
-};
-
-#define CPU_ONLINE		0x0002 /* CPU (unsigned)v is up */
-#define CPU_UP_PREPARE		0x0003 /* CPU (unsigned)v coming up */
-#define CPU_UP_CANCELED		0x0004 /* CPU (unsigned)v NOT coming up */
-#define CPU_DOWN_PREPARE	0x0005 /* CPU (unsigned)v going down */
-#define CPU_DOWN_FAILED		0x0006 /* CPU (unsigned)v NOT going down */
-#define CPU_DEAD		0x0007 /* CPU (unsigned)v dead */
-#define CPU_DYING		0x0008 /* CPU (unsigned)v not running any task,
-				        * not handling interrupts, soon dead */
-#define CPU_POST_DEAD		0x0009 /* CPU (unsigned)v dead, cpu_hotplug
-					* lock is dropped */
-
-/* Used for CPU hotplug events occuring while tasks are frozen due to a suspend
- * operation in progress
- */
-#define CPU_TASKS_FROZEN	0x0010
-
-#define CPU_ONLINE_FROZEN	(CPU_ONLINE | CPU_TASKS_FROZEN)
-#define CPU_UP_PREPARE_FROZEN	(CPU_UP_PREPARE | CPU_TASKS_FROZEN)
-#define CPU_UP_CANCELED_FROZEN	(CPU_UP_CANCELED | CPU_TASKS_FROZEN)
-#define CPU_DOWN_PREPARE_FROZEN	(CPU_DOWN_PREPARE | CPU_TASKS_FROZEN)
-#define CPU_DOWN_FAILED_FROZEN	(CPU_DOWN_FAILED | CPU_TASKS_FROZEN)
-#define CPU_DEAD_FROZEN		(CPU_DEAD | CPU_TASKS_FROZEN)
-#define CPU_DYING_FROZEN	(CPU_DYING | CPU_TASKS_FROZEN)
-
-/* Hibernation and suspend events */
-#define PM_HIBERNATION_PREPARE	0x0001 /* Going to hibernate */
-#define PM_POST_HIBERNATION	0x0002 /* Hibernation finished */
-#define PM_SUSPEND_PREPARE	0x0003 /* Going to suspend the system */
-#define PM_POST_SUSPEND		0x0004 /* Suspend finished */
-#define PM_RESTORE_PREPARE	0x0005 /* Going to restore a saved image */
-#define PM_POST_RESTORE		0x0006 /* Restore failed */
-
-#define NOTIFY_DONE		0x0000		/* Don't care */
-#define NOTIFY_OK		0x0001		/* Suits me */
-#define NOTIFY_STOP_MASK	0x8000		/* Don't call further */
-#define NOTIFY_BAD		(NOTIFY_STOP_MASK|0x0002)
-						/* Bad/Veto action */
-/*
- * Clean way to return from the notifier and stop further calls.
- */
-#define NOTIFY_STOP		(NOTIFY_OK|NOTIFY_STOP_MASK)
-
-/*
- * Bug checks.
- */
-
-#define BUG_ON(c) do { if (c) abort(); } while (0)
-
-/*
- * Initialization -- Must be called before calling any primitives.
- */
-
-static __inline__ void smp_init(void)
-{
-	int i;
-
-	spin_lock_init(&__thread_id_map_mutex);
-	__thread_id_map[0] = pthread_self();
-	for (i = 1; i < NR_THREADS; i++)
-		__thread_id_map[i] = __THREAD_ID_MAP_EMPTY;
-	init_per_thread(smp_processor_id, 0);
-	if (pthread_key_create(&thread_id_key, NULL) != 0) {
-		perror("pthread_key_create");
-		exit(-1);
-	}
-}
-
-/*
- * api-gcc.h: API mapping to pthreads gcc environment.
- *	Uses C11-like gcc intrinsics.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.  However, please note that much
- * of the code in this file derives from the Linux kernel, and that such
- * code may not be available except under GPLv2.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, you can access it online at
- * http://www.gnu.org/licenses/gpl-2.0.html.
- *
- * Copyright (c) 2016 Paul E. McKenney, IBM.
- */
-
-/*
- * Atomic data structure, initialization, and access.
- */
-
-typedef struct { volatile int counter; } atomic_t;
-
-#define ATOMIC_INIT(i)  { (i) }
-
-#define atomic_read(v) \
-	__atomic_load_n(&(v)->counter, __ATOMIC_RELAXED)
-#define atomic_set(v, i) \
-	__atomic_store_n(&(v)->counter, (i), __ATOMIC_RELAXED)
-#define smp_load_acquire(p) \
-	__atomic_load_n(p, __ATOMIC_ACQUIRE)
-#define smp_store_release(p, i) \
-	__atomic_store_n(p, (i), __ATOMIC_RELEASE)
-
-/*
- * Atomic operations.
- */
-
-/**
- * atomic_add - add integer to atomic variable
- * @i: integer value to add
- * @v: pointer of type atomic_t
- *
- * Atomically adds @i to @v.
- */
-static __inline__ void atomic_add(int i, atomic_t *v)
-{
-	__atomic_add_fetch(&v->counter, i, __ATOMIC_RELAXED);
-}
-
-/**
- * atomic_sub - subtract the atomic variable
- * @i: integer value to subtract
- * @v: pointer of type atomic_t
- *
- * Atomically subtracts @i from @v.
- */
-static __inline__ void atomic_sub(int i, atomic_t *v)
-{
-	__atomic_sub_fetch(&v->counter, i, __ATOMIC_RELAXED);
-}
-
-/**
- * atomic_sub_and_test - subtract value from variable and test result
- * @i: integer value to subtract
- * @v: pointer of type atomic_t
- *
- * Atomically subtracts @i from @v and returns
- * true if the result is zero, or false for all
- * other cases.
- */
-static __inline__ int atomic_sub_and_test(int i, atomic_t *v)
-{
-	return __atomic_sub_fetch(&v->counter, i, __ATOMIC_SEQ_CST) == 0;
-}
-
-/**
- * atomic_inc - increment atomic variable
- * @v: pointer of type atomic_t
- *
- * Atomically increments @v by 1.
- */
-static __inline__ void atomic_inc(atomic_t *v)
-{
-	atomic_add(1, v);
-}
-
-/**
- * atomic_dec - decrement atomic variable
- * @v: pointer of type atomic_t
- *
- * Atomically decrements @v by 1.
- */
-static __inline__ void atomic_dec(atomic_t *v)
-{
-	atomic_sub(1, v);
-}
-
-/**
- * atomic_dec_and_test - decrement and test
- * @v: pointer of type atomic_t
- *
- * Atomically decrements @v by 1 and
- * returns true if the result is 0, or false for all other
- * cases.
- */
-static __inline__ int atomic_dec_and_test(atomic_t *v)
-{
-	return atomic_sub_and_test(1, v);
-}
-
-/**
- * atomic_inc_and_test - increment and test
- * @v: pointer of type atomic_t
- *
- * Atomically increments @v by 1
- * and returns true if the result is zero, or false for all
- * other cases.
- */
-static __inline__ int atomic_inc_and_test(atomic_t *v)
-{
-	return __atomic_add_fetch(&v->counter, 1, __ATOMIC_SEQ_CST) == 0;
-}
-
-/**
- * atomic_add_negative - add and test if negative
- * @v: pointer of type atomic_t
- * @i: integer value to add
- *
- * Atomically adds @i to @v and returns true
- * if the result is negative, or false when
- * result is greater than or equal to zero.
- */
-static __inline__ int atomic_add_negative(int i, atomic_t *v)
-{
-	return __atomic_add_fetch(&v->counter, 1, __ATOMIC_SEQ_CST) < 0;
-}
-
-/**
- * atomic_add_return - add and return
- * @v: pointer of type atomic_t
- * @i: integer value to add
- *
- * Atomically adds @i to @v and returns @i + @v
- */
-static __inline__ int atomic_add_return(int i, atomic_t *v)
-{
-	return __atomic_add_fetch(&v->counter, 1, __ATOMIC_SEQ_CST);
-}
-
-static __inline__ int atomic_sub_return(int i, atomic_t *v)
-{
-	return atomic_add_return(-i, v);
-}
-
-struct __xchg_dummy {
-	unsigned long a[100];
-};
-#define __xg(x) ((struct __xchg_dummy *)(x))
-
-#define cmpxchg(ptr, o, n) \
-({ \
-	typeof(*ptr) _____actual = (o); \
-	\
-	(void)__atomic_compare_exchange_n(ptr, (void *)&_____actual, (n), 1, \
-					  __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST); \
-	_____actual; \
-})
-
-static __inline__ int atomic_cmpxchg(atomic_t *v, int old, int new)
-{
-	return cmpxchg(&v->counter, old, new);
-}
-
-#define xchg(ptr, v) __atomic_exchange_n((ptr), (v), __ATOMIC_SEQ_CST)
-#define atomic_xchg(ptr, v) \
-	__atomic_exchange_n(&(ptr)->counter, (v), __ATOMIC_SEQ_CST)
-
-/**
- * atomic_add_unless - add unless the number is a given value
- * @v: pointer of type atomic_t
- * @a: the amount to add to v...
- * @u: ...unless v is equal to u.
- *
- * Atomically adds @a to @v, so long as it was not @u.
- * Returns non-zero if @v was not @u, and zero otherwise.
- */
-#define atomic_add_unless(v, a, u)				\
-({								\
-	int c, old;						\
-	c = atomic_read(v);					\
-	for (;;) {						\
-		if (unlikely(c == (u)))				\
-			break;					\
-		old = atomic_cmpxchg((v), c, c + (a));		\
-		if (likely(old == c))				\
-			break;					\
-		c = old;					\
-	}							\
-	c != (u);						\
-})
-#define atomic_inc_not_zero(v) atomic_add_unless((v), 1, 0)
-
-#define atomic_inc_return(v)  (atomic_add_return(1,v))
-#define atomic_dec_return(v)  (atomic_sub_return(1,v))
-
-#define _LGPL_SOURCE
-#include <urcu/rculist.h>
-#include <urcu/rcuhlist.h>
-#include <urcu-pointer.h>
-#endif /* #ifndef __PERFBOOK_API_H__ */
diff --git a/CodeSamples/datastruct/Issaquah/existence_test b/CodeSamples/datastruct/Issaquah/existence_test
deleted file mode 100755
index a3ef38115581c15944e82e5d57ddc86e8da4afb9..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 26359
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

-- 
2.7.4


