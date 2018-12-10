Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=eTb6EWaluDY2kc3yTTnYEtSoxAECKhxtd43y0nPN1HU=;
        b=rzbgnKDIMQ48JziyXO8I3TuZy4VwCRCdsrYFBFZwv74ZRaMmD8k/OrsDGYi1Tirb+6
         rpERLCgMxO4UV/oO5PjnNuSmVVvRZe6tPLJKZcOFZ3UE3roF6pQBLpXXx8yHfYejBtIs
         QxtZ0eINJVUQl4yqswwI3M0EnBHoKlMCdAtGxVKhUCkitseBZLg72cOAy8xVOddXMxmh
         +EUbaqr3rYccK3Um0j1J9Ewvoi9Z/EAW2kOV0UpXPs8xSlRe5vA535EU8ZRoLSCC503l
         N1NcmxgghnB0jLg0Bbl06KkbT14+SiguiENUcL+bkIPEY4pZPvMKxDf774LiB5OwvMHK
         YqsA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Definition of cmpxchg()
Message-ID: <daa12711-177f-6f25-09c4-841751365a8f@gmail.com>
Date: Tue, 11 Dec 2018 00:29:08 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>, Junchang Wang <junchangwang@gmail.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul and Junchang,

This is a continuation of the discussion on the definition of
cmpxchg() in CodeSamples/api-pthreads/api-gcc.h.

Current definition is as follows:

#define cmpxchg(ptr, o, n) \
({ \
	typeof(*ptr) _____actual = (o); \
	\
	__atomic_compare_exchange_n(ptr, (void *)&_____actual, (n), 1, \
			__ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST) ? (o) : (o)+1; \
})

As was already pointed out by Paul, this definition has potential issue
when an argument with side-effect is given to "o". Also, (o)+1 can overflow.

As a matter of fact, there is another definition of cmpxchg() in
CodeSamples/formal/litmus/api.h. Currently it is defined as follows:

#define cmpxchg(x, o, n) ({ \
	typeof(o) __old = (o); \
	__atomic_compare_exchange_n((x), &__old, (n), 1, __ATOMIC_SEQ_CST, __ATOMIC_RELAXED); \
	__old; \
})

Apparently, this definition is not good on PPC or ARM.

Following is a simple litmus test of cmpxchg() (to be executed by litmus7):
--------------------------------------------
C C-cmpxchg
{
}

{
#include "api.h"
}

P0(int *x)
{
	int r1;

	r1 = cmpxchg(x, 1, 2);
}

P1(int *x)
{
	int r1;

	r1 = cmpxchg(x, 0, 1);
}

locations [1:r1]
exists (0:r1=1 /\ ~x=2)
---------------------------------

Testing on PPC with the current api.h yields the following:
---------------------------------
Test C-cmpxchg Allowed
Histogram (4 states)
2789  :>0:r1=0; 1:r1=0; x=0;
50452053:>0:r1=0; 1:r1=0; x=1;
36003 *>0:r1=1; 1:r1=0; x=1;
49509155:>0:r1=1; 1:r1=0; x=2;
Ok

Witnesses
Positive: 36003, Negative: 99963997
Condition exists (0:r1=1 /\ not (x=2)) is validated
Hash=3f625d680407ff822fb56f1a80834291
Observation C-cmpxchg Sometimes 36003 99963997
Time C-cmpxchg 43.37
----------------------------------

If we change the definition to suppress spurious failure in
__atomic_compare_exchange_n(), i.e.:

#define cmpxchg(x, o, n) ({ \
	typeof(o) __old = (o); \
	__atomic_compare_exchange_n((x), &__old, (n), 0, __ATOMIC_SEQ_CST, __ATOMIC_RELAXED); \
	__old; \
})

, litmus7 yields the following:
----------------------------------
Test C-cmpxchg Allowed
Histogram (2 states)
50766497:>0:r1=0; 1:r1=0; x=1;
49233503:>0:r1=1; 1:r1=0; x=2;
No

Witnesses
Positive: 0, Negative: 100000000
Condition exists (0:r1=1 /\ not (x=2)) is NOT validated
Hash=3f625d680407ff822fb56f1a80834291
Observation C-cmpxchg Never 0 100000000
Time C-cmpxchg 35.20
----------------------------------

This matches what herd7 says (with the 2nd pair of {} removed):
----------------------------------
Test C-cmpxchg Allowed
States 2
0:r1=0; 1:r1=0; x=1;
0:r1=1; 1:r1=0; x=2;
No
Witnesses
Positive: 0 Negative: 2
Condition exists (0:r1=1 /\ not (x=2))
Observation C-cmpxchg Never 0 2
Time C-cmpxchg 0.01
Hash=1720691890ea69e35615997626680d6f
----------------------------------

Also, klitmus7 on PPC says:
----------------------------------
Test C-cmpxchg Allowed
Histogram (2 states)
2019624 :>0:r1=0; 1:r1=0; x=1;
1980376 :>0:r1=1; 1:r1=0; x=2;
No

Witnesses
Positive: 0, Negative: 4000000
Condition exists (0:r1=1 /\ not (x=2)) is NOT validated
Hash=1720691890ea69e35615997626680d6f
Observation C-cmpxchg Never 0 4000000
Time C-cmpxchg 0.76
----------------------------------

If we use the definition in api-gcc.h, litmus7 says:
----------------------------------
Test C-cmpxchg Allowed
Histogram (3 states)
11388 :>0:r1=2; 1:r1=1; x=0;
50373528:>0:r1=2; 1:r1=0; x=1;
49615084:>0:r1=1; 1:r1=0; x=2;
No

Witnesses
Positive: 0, Negative: 100000000
Condition exists (0:r1=1 /\ not (x=2)) is NOT validated
Hash=3f625d680407ff822fb56f1a80834291
Observation C-cmpxchg Never 0 100000000
Time C-cmpxchg 52.06
----------------------------------
The result is still "Never", but the statistics look quite different.
There is no "0:r1=0" observed!

So, at least for litmus test, cmpxchg() should be defined as follows:

#define cmpxchg(x, o, n) ({ \
	typeof(o) __old = (o); \
	__atomic_compare_exchange_n((x), &__old, (n), 0, __ATOMIC_SEQ_CST, __ATOMIC_RELAXED); \
	__old; \
})

If this is the way to go, I think the definition in api-gcc.h should
be the same way for consistency, even if it would cause a little
performance degradation. Then there would be no worry about overflows.

Thoughts?

        Thanks, Akira

