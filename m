Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63E93D3D16
	for <perfbook@vger.kernel.org>; Fri, 20 Mar 2026 16:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774025145; cv=pass; b=OU4i27mbcOMvjCvb0H6uvMKzZvSimiCLWqm0yBpd0ibeomjVOklVpKe8DXVWmXLuooRswxbn8F0ckwdyX4dfTuoZjXRyI/qqrHWLi3NDGKZ0I0cIM5Wq3NuBWMAfCMgfXmuLh2Ct8qZg6eLzd9uvzWHRnj0Mx6g9DMIeAOY5qkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774025145; c=relaxed/simple;
	bh=5oclTWMqVHwnqNr9n672faA+FzWCFkEd1Krxk4VJLUY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=SP3wGSH3rmK7QWqvVJHF+vWhWsP2rh//zsy6NVgKfYLSXA4//lqew6Rcv8EqMOJFeta1TxN8vVJ0SuRsNkg6FyRG4dLd1+LYH3tb0AI1HoyBbWeQfz3el7oys4DEBsQjpVF9yFCt0D9X/yR2f2uwmSiARpX/i0gUKs71eiE7L2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U19mZy7A; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U19mZy7A"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35a09e0dd63so1004703a91.3
        for <perfbook@vger.kernel.org>; Fri, 20 Mar 2026 09:45:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774025143; cv=none;
        d=google.com; s=arc-20240605;
        b=f5hQxMr/gyqJmuUUEOs1mCBtC6KoH7WNFZFX9JBIJoX4JRm+R8YCgd3Ah7y7EEsC+/
         8NbescjtlcIjT/StRDeEIJ7/JmQo0tr1WVnqIzAGMV4hsGhRBovr/IIlsbEJ/OCpxdTC
         SBct0IJ42jER1r5IMAQTf9sh95MT0bItTGI5KYtCGknfTtnh3GK/KEiXYctqlSq64EKj
         YWfLhuAvsqZ99hyTZr8lCcH/ggjgsv0DL+wWHvjOulPYP3yxY27x8JR8o6e0W8O6/0Zl
         qAlOUycyxjNmcZXFbZEiyUZzj8bKzm0wmpf+VUylbzRZ/4Z8ErcN6esvIZKYofxbDKbZ
         coVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=uDColZsx4P4SIb4zK3sI79s9G9y2xk472Na54Nb+eug=;
        fh=KwKc2RY8NzF9yNUBhUq83701zlM7t8k1VJ/kqPtlzck=;
        b=HCKyB8wF+ZwCryF5RLxWsdzKoYy8EUPXj9cYFi2+m1At2VsFSJw1/1/yrO7KjnfD/+
         NHAnQUNI7PfuIwvcSp8iE5jdcZ1gxY0/3zBOI2UEjCFHnI8CXg3vfxrz1kJY5ZIOrlvf
         GDbR9mgelbWLEnCrqTlXHFUskXyRr9WbZ90ZMQBixfBJ2gsg4Teu6Sz5BQ79pExlScCt
         enC15tm+UFtgmdkKLns3LGkNxNSNEoIOAiZ+IMo4thxu2asVENGatGwPrSxmq0D0IiJG
         4BIZZpKIaf2VObvJSleBOxYAValRuEZ7+D8QXrr9LiX7nV4SCmSMmB8VcYLptoZWOCF3
         auUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774025143; x=1774629943; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uDColZsx4P4SIb4zK3sI79s9G9y2xk472Na54Nb+eug=;
        b=U19mZy7A2M+4N1LLbC7So6wroXiUK9b4fBJSdloSd+x3Iw2Zc5XTOGG8/xwFtQDHf+
         RLTnSAC4ytUu+cWhn6+HFAFj+VYEjw4nTxMR3ALO8cPTYWOk+U1aTK6mGMfMUStJ48C/
         ZB6MKR0uanslKKwULULyPZMfmteaf5+YFxIxk0ntRjLdY6iZzM/Z5ESEIdiHyDkAP7+D
         7ZHySvNaaHF1cqOIq2iMABJfPTObAVKzN82ceHyPL1A/2CutvYlNhOwd0m+5Q99vyh/J
         ecLBlRbEOXClSSCNkTgqe5ozTbsPvpdloHRR9o8/moqyvUxnSL9qgjATX23mur5RnquG
         7X5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774025143; x=1774629943;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uDColZsx4P4SIb4zK3sI79s9G9y2xk472Na54Nb+eug=;
        b=Zu2HK4N8SYUULJu2TXdx/049GtpaXPxOshJngJ/IHUriwuLjkL+IiGLcLd8wR2OLAg
         Gp7qu5kJxTlcKQjOpDdDcdDuR/aksrGLp19lFS4LyOklQBjqc3VPhrT3esMO6ZGX11Sn
         mnpLNixs8YMUsQl5t3lXOB9PcR5N0WKj0jBxDOwrKgN7Mm2y6RoErDCr0I08ALWIsVR3
         jlq1X2vs7CI58P6lIsvoHabm9/FazgN17dcOzL6CtMlEHU+t6SlG2PIy887l0RgHsKdr
         FEDoK+9wJ2f78qPa1rpYvTjxpztVY0jKWowj454i1Xt2svQyGZucSr+4WO7cPqmX6FRe
         ZH9Q==
X-Gm-Message-State: AOJu0YxlFN1QP7GwmISF3OdHbTlJz+LBuwHuYxIv9ZkIMmRpodZQ+596
	5gBdPV9ExnEk6XC3cvyOWAi7EAzA9XTPq0D3uEtojjpgv4cgzeNrx559NBWU5KAR5MZV2TwykES
	cDJnxVXayK5vyn3+xvQv3kaLHEuj9wH2RM+Qd1Ro=
X-Gm-Gg: ATEYQzzyhu7w6oymUu7kmtgKHoHHgdfKOaOmOBgOFZDtBaZNwFFRsRvSK14w37AI2Mn
	9oIkp9NJr2EIf/cZOv0QLxThvHT8mLJ09qPPyDVeBGODBINSFoghYzr9y3VzOBhjJFXYi2btFxf
	z6lh4uCyWeUHHY7okJK4FVKkb4lmEL/aa0N03HfTEgVwV0mCwX1AbnA3krNcX3NQ/S8/haHNxBh
	E5tMXcaVxIJOhTTRBFwZPTut/yD+vDyqPjD/1lkxKRejqFzlNsP4gqP+Z/mq6NTtyqzlqiiFwAD
	tX9JrVQ2pccYIzPH6FsiY9bWcN1Xe4T71pc22p02wA==
X-Received: by 2002:a17:90b:390e:b0:35b:9682:51e6 with SMTP id
 98e67ed59e1d1-35bd2d21ce8mr3090197a91.16.1774025142410; Fri, 20 Mar 2026
 09:45:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Y L <ly1054657282@gmail.com>
Date: Sat, 21 Mar 2026 00:45:31 +0800
X-Gm-Features: AaiRm535nPtu80Ytxw7nho6HNLM8qqDGayRTm5EcaHGAf975sAJ_PxFGZsEovME
Message-ID: <CAKPpmEA0qZNe27Nk_K-xgJ1+Z5jez2m_1a0pu=u9HdncT8Dccw@mail.gmail.com>
Subject: Thoughts on Section 5.3 about the `count_lim` implementation and its
 use case
To: perfbook@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

I've been reading Chapter 5 of perfbook and thoroughly enjoying the
deep dive into counting algorithms. However, while studying the
`count_lim` approach in Section 5.3.3 in the context of the
structure-allocation limit problem from Quick Quiz 5.3, I noticed what
seems to be a mismatch between the stated requirement and the actual
problem the code solves best.

It appears to me that the `count_lim` implementation is perfectly
tailored for a Producer-Consumer model, rather than an Allocate-Free
model. To visualize the specific Producer-Consumer requirement it
solves, I picture each thread as a "direct-sales factory": Once a
local factory produces enough goods to hit its local capacity, it
ships the products to a central warehouse, dynamically adjusts its
local limit based on the central warehouse's remaining capacity, and
retains half for local sales. If a factory receives an order and local
inventory is insufficient, it pulls products from the central
warehouse. If the central warehouse is also empty, the order simply
fails. Even if other local factories might have surplus goods, the
model dictates it is better to let the consumer wait for new local
production rather than undertaking the expensive task of pulling
inventory from all other local warehouses.

This model is extremely valuable in real-world scenarios, such as
generating TLS Session Tickets. In that scenario, tickets must be
strictly unique (use-and-destroy, never returned back) to prevent
replay attacks, and generating them is CPU-intensive, requiring
background production limits to prevent hoarding. `count_lim` fits
this perfectly.

However, this requirement differs significantly from the
"Allocate-Free" model implied in Quick Quiz 5.3. I've summarized their
differences here:

| Aspect | Producer-Consumer Model | Allocate-Free Model |
|  ----  |  ----  | ----  |
| `add_count` Semantics | Produces a resource out of thin air
(consuming CPU/time) and adds it to inventory. | Acquires a resource
from a strictly finite global pool. |
| `sub_count` Semantics | Consumes the resource completely (it leaves
the system). | Returns the resource back to the global pool. |
| Meaning of the Limit | Prevents endless over-production/hoarding
when there are no consumers. | A hard physical limit; fails when the
pool is completely empty. |
| `sub_count` Failure | Necessary: If production lags, inventory is
empty, and consumers must wait/fail. | Conceptually unnecessary:
Assuming correct program logic (no double-frees), returning an
acquired resource back to the pool shouldn't fail. |

The count_lim approach works brilliantly for Producer-Consumer
scenarios. However, applying it to an Allocate-Free scenario
introduces a critical issue: cross-thread freeing (as discussed in
Quick Quiz 5.35) can easily cause a legitimate `sub_count` to fail. In
an Allocate-Free model, a resource return failing due to counter
implementation details (rather than actual logical bugs like
double-free) is highly counterintuitive. While Section 5.4's exact
limit counter solves this, it does so at a massive performance cost.
Sections 5.3.3 and 5.3.4, unfortunately, drop these legitimate
cross-thread frees.

Assuming the caller enforces strict lifecycle correctness (no
double-frees or unallocated-frees), I experimented with two
alternative implementations for the Allocate-Free model that ensure
sub_count never fails, while maintaining performance on par with
Sections 5.3.3 and 5.3.4:

- Signed Quota Counter: Converting the counters to signed integers,
allowing sub_count to drive the local counter into negative values
(representing pending returns), and balancing with the global counter
only at a negative threshold.

- Available Capacity Tracking: Inverting the logic to track "free
space" instead of "used space" (similar to a semaphore). Here,
add_count (allocation) decrements the available quota, and sub_count
(freeing) increments it.

Have you ever considered framing the `count_lim` examples explicitly
around the Producer-Consumer pattern, or explored using
signed/capacity-tracking counters to achieve zero-fail fast-path
freeing for resource management scenarios?

I would love to hear your thoughts on this distinction.

                                                        Best regards,
npc1054657282

---------------------------------------------------------
Appendix 1: Signed Quota Implementation
---------------------------------------------------------
static __inline__ void globalize_count(void);
static __inline__ void balance_count(void);

long __thread counter = 0;
long __thread countermax = 0;
// long __thread countermin = 0;
long globalcountmax = 10000;
long globalcount = 0;
long globalreserve = 0;
long *counterp[NR_THREADS] = { NULL };
DEFINE_SPINLOCK(gblcnt_mutex);

static __inline__ int add_count(unsigned short delta)
{
    if (countermax - counter >= (long)delta) {
        WRITE_ONCE(counter, counter + delta);
        return 1;
    }
    spin_lock(&gblcnt_mutex);
    globalize_count();
    if (globalcountmax -
        globalcount - globalreserve < (long)delta) {
        spin_unlock(&gblcnt_mutex);
        return 0;
    }
    globalcount += delta;
    balance_count();
    spin_unlock(&gblcnt_mutex);
    return 1;
}

static __inline__ int sub_count(unsigned short delta)
{
    // if (counter - countermin >= (long)delta) {
    if (counter + countermax >= (long)delta) {
        WRITE_ONCE(counter, counter - delta);
        return 1;
    }
    spin_lock(&gblcnt_mutex);
    globalize_count();
    globalcount -= delta;
    balance_count();
    spin_unlock(&gblcnt_mutex);
    return 1;
}

static __inline__ unsigned long read_count(void)
{
    int t;
    long sum;

    spin_lock(&gblcnt_mutex);
    sum = globalcount;
    for_each_thread(t) {
        if (counterp[t] != NULL)
            sum += READ_ONCE(*counterp[t]);
    }
    spin_unlock(&gblcnt_mutex);
    return (unsigned long)sum;
}

static __inline__ void globalize_count(void)
{
    globalcount += counter;
    counter = 0;
    globalreserve -= countermax;
    countermax = 0;
}

static __inline__ void balance_count(void)
{
    countermax = globalcountmax -
                 globalcount - globalreserve;
    countermax /= 2 * num_online_threads();
    globalreserve += countermax;
    // countermin = - countermax;
}

---------------------------------------------------------
Appendix 2: Available Capacity Tracking
---------------------------------------------------------
static __inline__ void globalize_count(void);
static __inline__ void balance_count(void);

unsigned long __thread counter = 0;
unsigned long __thread countermax = 0;
const unsigned long globalcountmax = 10000;
unsigned long globalcount = globalcountmax;
unsigned long *counterp[NR_THREADS] = { NULL };
DEFINE_SPINLOCK(gblcnt_mutex);

static __inline__ int add_count(unsigned long delta)
{
    if (counter >= delta) {
        WRITE_ONCE(counter, counter - delta);
        return 1;
    }
    spin_lock(&gblcnt_mutex);
    globalize_count();
    if (globalcount < delta) {
        spin_unlock(&gblcnt_mutex);
        return 0;
    }
    globalcount -= delta;
    balance_count();
    spin_unlock(&gblcnt_mutex);
    return 1;
}

static __inline__ int sub_count(unsigned long delta)
{
    if (countermax - counter >= delta) {
        WRITE_ONCE(counter, counter + delta);
        return 1;
    }
    spin_lock(&gblcnt_mutex);
    globalize_count();
    globalcount += delta;
    balance_count();
    spin_unlock(&gblcnt_mutex);
    return 1;
}

static __inline__ unsigned long read_count(void)
{
    int t;
    unsigned long sum;

    spin_lock(&gblcnt_mutex);
    sum = globalcount;
    for_each_thread(t) {
        if (counterp[t] != NULL)
            sum += READ_ONCE(*counterp[t]);
    }
    spin_unlock(&gblcnt_mutex);
    return globalcountmax - sum;
}

static __inline__ void globalize_count(void)
{
    globalcount += counter;
    counter = 0;
    countermax = 0;
}

static __inline__ void balance_count(void)
{
    countermax = globalcount;
    countermax /= num_online_threads();
    counter = countermax / 2;
    globalcount -= counter;
}
