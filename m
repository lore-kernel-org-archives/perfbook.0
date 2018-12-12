Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=idBSXypMsHdZOZyfC/DnGFQyuNtu6yd/CIV/03TlEeA=;
        b=n7qOzSGH80ksOMv6OPTwlxm173oaCGu7Hv36SEia0AfnypTrQNeCf5WisH1IZ4C/HP
         +jzjAHA9H167ZPy6fOVaELczMIUdJKWa2G8VfkYmQSfVrnotcn0hX93gvORT+ZkPq6zK
         5MxUFO/k/Ssjhj2UCMPSPZLORV2r/ekEVPyto1+ZY3T70EtX7qhzZHjvlQJBen0H4NEc
         umLd0wcjCSsi1KjlAv/5lljna974x7b5L9zB4Fgzl14CrYRuqFqb/Zp2QxW5Y3ky5F/B
         +QrLD3ORc/e+e1kcgpthVB2at4tn+EJZlaornWYhQsN7lO7shDjrkUHb3LrjeKI06uZM
         lHpw==
Subject: Re: [PATCH 3/4] CodeSamples: Fix definition of cmpxchg() in api-gcc.h
References: <184fed6d-f9ae-8a0b-e8e8-7bcb3e3acf8e@gmail.com>
 <98448fa1-c391-fdfe-22fa-803dacd72749@gmail.com>
From: Junchang Wang <junchangwang@gmail.com>
Message-ID: <43a14ef6-0fba-7619-b385-475940f244ac@gmail.com>
Date: Thu, 13 Dec 2018 00:01:33 +0800
MIME-Version: 1.0
In-Reply-To: <98448fa1-c391-fdfe-22fa-803dacd72749@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Akira Yokosawa <akiyks@gmail.com>, "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>



On 12/11/18 11:42 PM, Akira Yokosawa wrote:
> From 7e7c3a20d08831cd64b77a4e8d8f693b4725ef89 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 11 Dec 2018 21:37:11 +0900
> Subject: [PATCH 3/4] CodeSamples: Fix definition of cmpxchg() in api-gcc.h
> 
> Do the same change as CodeSamples/formal/litmus/api.h.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  CodeSamples/api-pthreads/api-gcc.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/CodeSamples/api-pthreads/api-gcc.h b/CodeSamples/api-pthreads/api-gcc.h
> index 3afe340..b66f4b9 100644
> --- a/CodeSamples/api-pthreads/api-gcc.h
> +++ b/CodeSamples/api-pthreads/api-gcc.h
> @@ -168,8 +168,9 @@ struct __xchg_dummy {
>  ({ \
>  	typeof(*ptr) _____actual = (o); \
>  	\
> -	__atomic_compare_exchange_n(ptr, (void *)&_____actual, (n), 1, \
> -			__ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST) ? (o) : (o)+1; \
> +	__atomic_compare_exchange_n((ptr), (void *)&_____actual, (n), 0, \
> +			__ATOMIC_SEQ_CST, __ATOMIC_RELAXED); \
> +	_____actual; \
>  })
>  

Hi Akira,

Another reason that the performance of cmpxchg is catching up with cmpxchg_weak is that __ATOMIC_SEQ_CST is replaced by __ATOMIC_RELAXED in this patch. The use of __ATOMIC_RELAXED means if the CAS primitive fails, the relaxed semantic is used, rather than sequential consistent. Following are some experiment results:

# If __ATOMIC_RELAXED is used for both cmpxchg and cmpxchg_weak

./count_lim_atomic 64 uperf
ns/update: 290

./count_lim_atomic_weak 64 uperf
ns/update: 301


# and then if __ATOMIC_SEQ_CST is used for both cmpxchg and cmpxchg_weak

./count_lim_atomic 64 uperf
ns/update: 316

./count_lim_atomic_weak 64 uperf
ns/update: 302

./count_lim_atomic 120 uperf
ns/update: 630

./count_lim_atomic_weak 120 uperf
ns/update: 568

The results show that if we want to ensure sequential consistency when the CAS primitive fails, cmpxchg_weak performs better than cmpxchg. It seems that the (type of variation, failure_memorder) pair affects performance. I know that PPC uses LL/SC to simulate CAS. But what's the relationship between a simulated CAS and the memory order. This is interesting because as far as I know, PPC and ARM are using LL/SC to simulate atomic primitives such as CAS and FAA. So FAA might have the same behavior.

In actually, I'm not very clear about the meaning of different types of failure memory orders. For example, when should we use __ATOMIC_RELAXED, rather than __ATOMIC_SEQ_CST, if a CAS fails? What happen if __ATOMIC_RELAXED is used for x86? The one I'm look at is https://gcc.gnu.org/onlinedocs/gcc/_005f_005fatomic-Builtins.html . Do you know some resources about this? I can look into this tomorrow. Thanks.


--Junchang



>  static __inline__ int atomic_cmpxchg(atomic_t *v, int old, int new)
> 

