Return-Path: <SRS0=vYjJ=AN=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682152128; x=1684744128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=64aN1fMLzp+TNM+qEd38ryoGlm7WqO7kPBMSWoooOVk=;
        b=PAVDILEQKrSyWZsLoo4ZIY9guZcXb9PylNSr6bdf6ko2/hyu8QDGVhPOeOUowBSGQy
         tIA/BII3EPYppa0SZOTrjSexD5Jsw9eF9GbQvmugS7J3Q/sR6sHiaUNUuo6Uxr5NfjSO
         bQNPBAoxXttFG0rQcPf5u04/38SyKDoY4jCOOaPD5so1x2B0zn2aDx4g6PRfJREo/KH3
         MvqSR1e8pE+QTVUAqtNbsnOf3Bs7wN49sQjNFoAOJxggWiyegbAcgCnEsjXasvsl3XfI
         weOLHojSSxLSXi+wcpDHlR2Wvcg/dGPqKTyh/Qu5BSC3Ko+9Y14p+rP/4qskFhn2u9GD
         RlSQ==
Message-ID: <f4c9bb03-a9c9-cd05-dba3-503ee1a0f0bf@gmail.com>
Date: Sat, 22 Apr 2023 17:28:43 +0900
MIME-Version: 1.0
Subject: Re: [PATCH] CodeSamples/defer: Fix hazard torture
References: <20230420072923.35042-1-mmpgouride@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230420072923.35042-1-mmpgouride@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: Alan Huang <mmpgouride@gmail.com>, paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Alan,

On Thu, 20 Apr 2023 07:29:23 +0000, Alan Huang wrote:
> This patch fixes hazard torture.

Please describe what bug you are fixing.

> 
> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
> ---
>  CodeSamples/defer/hazptr.h        | 2 +-
>  CodeSamples/defer/hazptrtorture.h | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
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

This looks to me fixes the regression introduced by commit
a082aba85ce0 ("defer/hazptr: Checkpoint for text/code update")
made back on Apr 1, 2019.

Was it an April fool?  I don't know, but Paul planted this bug to
see if there is somebody who would catch it.  ;-)

>  	} while (tmp == (void *)HAZPTR_POISON);
>  	return tmp;
>  }							//\lnlbl{hr:e}
> diff --git a/CodeSamples/defer/hazptrtorture.h b/CodeSamples/defer/hazptrtorture.h
> index 53efa259..29761e3d 100644
> --- a/CodeSamples/defer/hazptrtorture.h
> +++ b/CodeSamples/defer/hazptrtorture.h
> @@ -241,8 +241,7 @@ DEFINE_PER_THREAD(long long [HAZPTR_STRESS_PIPE_LEN + 1], hazptr_stress_count);
>  
>  void *hazptr_read_stress_test(void *arg)
>  {
> -	int me = (int)(long)arg;
> -	int base = me * K;
> +	int base = smp_thread_id() * K;

I'm not sure if this change is related to the fix above.

Or are you fixing an independent issue?  If so, can you make this part
a follow-up patch, with the other patch squashed?

        Thanks, Akira

>  	struct hazptr_stress *p;
>  	int pc;
>  
