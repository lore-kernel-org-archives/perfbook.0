Return-Path: <SRS0=vYjJ=AN=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682164588; x=1684756588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VNZPxGGI60VvbsoaOXtLAMr9aXRBe9HfXWCAmVXHGew=;
        b=BZW1ZTHk8OS8Ve4DDFFTHjo2nCSy2kkkW6pq4MRomQye3ek5QdXO858VS5zcyGXLS5
         KdWMOP+rhAlJkG61aR3Eix1NjYPp0IYmRYVXN0VDVR7bQ2F1odBRNkqQJ3AmSnNKla0w
         lKmFkm4/F1LRy1yp7jzYAIyJR5GlW9b3/HMqKg6yjA7xgVQL3q0TSf7uCbaxZa3Kkm2O
         ZEwtl0BeSxNX7n4DKbF6GxEjiAgANCCG4YbXjnGUk+7iV1gRgOu05Y2E3dShFIEvwzvz
         +JNjecRJO7ZT8WJX6wn8acKrbHHUkcygQuODATvMGGRtCbAUkCj2KTrw21e/3Q8yug3C
         HUjg==
Message-ID: <c5b09b36-1b3f-6d03-2dda-ad2514c71de9@gmail.com>
Date: Sat, 22 Apr 2023 20:56:17 +0900
MIME-Version: 1.0
Subject: Re: [PATCH v2] CodeSamples/defer: Fix hazard torture
References: <20230422103421.1382-1-mmpgouride@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230422103421.1382-1-mmpgouride@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: Alan Huang <mmpgouride@gmail.com>, paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sat, 22 Apr 2023 10:34:21 +0000, Alan Huang wrote:
> Because hp_try_record() must check for concurrent modifications,
> we should not dereference the pointer. The arg of hazptr_read_stress_test
> is always NULL, which is designated at time when create the thread,
> therefore, all threads will store their hazard pointer in the same slot.
> Also, hazptr_thread_exit will clear their own hazard pointer from
> smp_thread_id() * K.
> 
> Signed-off-by: Alan Huang <mmpgouride@gmail.com>

Now I see all your points.  Thank you for your thorough review
of the code!

As I mentioned earlier, the deref of p was introduced by commit
a082aba85ce0 ("defer/hazptr: Checkpoint for text/code update"),
while the uses of arg in hazptr_read_stress_test() and
hazptr_read_perf_test() were there since the addition of this code
by commit c672535d475a ("Convert Tom Hart's hazard-pointer
implementation to perfbook"), that is, if I'm reading the code
correctly.

So,

Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
Fixes: c672535d475a ("Convert Tom Hart's hazard-pointer implementation to perfbook")
Fixes: a082aba85ce0 ("defer/hazptr: Checkpoint for text/code update")

        Thanks, Akira

> ---
>  CodeSamples/defer/hazptr.h        | 2 +-
>  CodeSamples/defer/hazptrtorture.h | 5 ++---
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/CodeSamples/defer/hazptr.h b/CodeSamples/defer/hazptr.h
> index 759ab53d..e061303d 100644
> --- a/CodeSamples/defer/hazptr.h
> +++ b/CodeSamples/defer/hazptr.h
> @@ -87,7 +87,7 @@ static inline void *hp_record(void **p,			//\lnlbl{hr:b}
>  	void *tmp;
>  
>  	do {
> -		tmp = hp_try_record(*p, hp);
> +		tmp = hp_try_record(p, hp);
>  	} while (tmp == (void *)HAZPTR_POISON);
>  	return tmp;
>  }							//\lnlbl{hr:e}
> diff --git a/CodeSamples/defer/hazptrtorture.h b/CodeSamples/defer/hazptrtorture.h
> index 53efa259..acdd532b 100644
> --- a/CodeSamples/defer/hazptrtorture.h
> +++ b/CodeSamples/defer/hazptrtorture.h
> @@ -99,7 +99,7 @@ void *hazptr_read_perf_test(void *arg)
>  {
>  	int i;
>  	int me = (long)arg;
> -	int base = me * K;
> +	int base = smp_thread_id() * K;
>  	long long n_reads_local = 0;
>  	hazptr_head_t hh;
>  	hazptr_head_t *hhp = &hh;
> @@ -241,8 +241,7 @@ DEFINE_PER_THREAD(long long [HAZPTR_STRESS_PIPE_LEN + 1], hazptr_stress_count);
>  
>  void *hazptr_read_stress_test(void *arg)
>  {
> -	int me = (int)(long)arg;
> -	int base = me * K;
> +	int base = smp_thread_id() * K;
>  	struct hazptr_stress *p;
>  	int pc;
>  
