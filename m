Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6B33594C
	for <perfbook@vger.kernel.org>; Wed, 18 Dec 2024 01:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734486810; cv=none; b=YK1HbXKWvdTsbGj4EOQRupPy0dtPLXe7ILrLh81RSD+LSVscy+ul2cGWcwpsaiJ72sopBtW4KvI29I+cg/PdJhEqP1TP68MuqY9ZQ5WEdmKaTSkRlOKFLTnA4JVz/oeSZvliuAftlJ+BVPPDrpa/6kzWkFjPfJ0zYVHxRoepHmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734486810; c=relaxed/simple;
	bh=Ehf64qVE4AQHBasdg6IlNfm71B4eZ5o9W2qTweUD2zg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=Z0coSRIgBZwWydwmckatv65U342zx7IJ2IKveDx4ALUBF6W0/Sgisz3G0S8s8JyfoSrOodWWXUZ83Lpafr1ZwFnLKXNUQ3YXDWZaAfswKTFFkxw3jyrRM2LRN371h3qpcL78BH333SExsj7hH9pjTwDlgeJKXBRQSEftZW1AiMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XsJQ+rXG; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XsJQ+rXG"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21631789fcdso1668645ad.1
        for <perfbook@vger.kernel.org>; Tue, 17 Dec 2024 17:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734486808; x=1735091608; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X+cKdWBlfn9YQTn2cvnydRQvtg4kUYlqDCMNr18tXLE=;
        b=XsJQ+rXGxEWZvYb7MTEwXDITQRizUaeYnxWqFk9X7ElfXIf6vOnxdkYrqd3S2TCTVY
         MabgSfphHizv0V8GmElHQX2BskZ9S0lB155xTQ8bicDi4LJqa7oM9xZvd3+afJfffssm
         7ERabOodLEsU6leEWESLwi9ODZpZ+rMnALtJZkPPmmuwPiq2DXjHcAlAc04NUbzmTvQi
         5UibDJ2I41UMBI9At2/etEtAVcUChOy6+EDpDaCEMV1MZ2crQDOZd1j67kRyL+u48cP7
         TKdHMNWooGg9iDyyzBuFKTOQyjzkQE3I/qdvk8jNxXWwF7t4f2a/UlWF1UnhGsaxyTEV
         Fhcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734486808; x=1735091608;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X+cKdWBlfn9YQTn2cvnydRQvtg4kUYlqDCMNr18tXLE=;
        b=q+VMBvuxfrfD15eQEEokyyX20zpiqlHyahz2Hlj5sVdHAIqo4Nu4rqlFR3bhgZDcDB
         C08sOVKnug0NTc85yiwNTtVOcTu9xVZKa9bOutFrXJZI9MmwylrvmgTYv+O0R8ItC4/T
         Wr64TqouWuIrLiB+rDbK+zeLUE5QYpoEEQhvLQ0F9xOVnSHWBtX9t/BnAdgW2z0+H2rp
         M5bTV/hlWaXW2V0hzSGUc1/aC9oOwu6ecPjTAc+XeTW/ja7agKnT2o7cIOOdcubuvcLm
         wVQ5QC33eYUzYE7Oxvl+bB3A0vQEptP08YpJ6y4/fdr5O/H6kjWpCla8kmpUnbbP7mal
         Hw9A==
X-Gm-Message-State: AOJu0YyzLcG2uddQRScdDJxOYgBsaNkBRgRs0x7ksrr4ayLjRt4v49yw
	D98LsWVo+j1ICflUPt2J8vNV8quzs9A08ibb6PxamXOacGq5ZDGeDF2dUQ==
X-Gm-Gg: ASbGnctGIy/5oLGt+63HCSPccs21vWjy54Jloyu36X3dLIluzqaoEYss3WweEW96Hxz
	xi9gPSk0meIBbOZ8c8fVwCbTxoT3a1h+qSkH16n8dwDZWCD9GmzOc00PPJx5rtt0/T4cCEySSYz
	D/7ks7K4ncsn22utKzkd0zOrcnvMcPixUKhXCuKwaSiX0+vQjAOiFFKuNSqD//h9o/yRI0CT8Jj
	h6huS7WPDf0bZ/KI0r3L27r2Y0kRHk+ESUY2LQnvK6gQ14QKLGxH0JFBxHfbbNpmHxmG1f3FzB4
	JokMt9h1RR/xMv35nepekYU=
X-Google-Smtp-Source: AGHT+IGo5DgKvdWFfCU82SwcWz1f4hG7R6sEIjOkf9FKC4INTRC4+CGwpcbGPpljDp/4SB3qPl6QBA==
X-Received: by 2002:a17:903:32cf:b0:215:758c:52e8 with SMTP id d9443c01a7336-218d72940c3mr16911475ad.12.1734486808248;
        Tue, 17 Dec 2024 17:53:28 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e723afsm65777565ad.275.2024.12.17.17.53.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 17:53:27 -0800 (PST)
Message-ID: <114890d2-e51c-4bb7-943d-9276c6e3de93@gmail.com>
Date: Wed, 18 Dec 2024 10:53:23 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] seqlock: Use WRITE_ONCE() on sequence update
To: Daniel Xu <dxu@dxuuu.xyz>
References: <3a7519aaad6329084fb4f8e6acfebc8f05924bc4.1734474057.git.dxu@dxuuu.xyz>
Content-Language: en-US
Cc: perfbook@vger.kernel.org, paulmck@kernel.org,
 Akira Yokosawa <akiyks@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <3a7519aaad6329084fb4f8e6acfebc8f05924bc4.1734474057.git.dxu@dxuuu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

Daniel Xu wrote:
> WRITE_ONCE() is needed here to prevent store tears and other unwanted
> compiler optimizations.

That might be true if there were chances of these two accesses to
race with each other.

I don't see any possibility of such races.

Can you elaborate?

        Thanks, Akira

> 
> Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
> ---
>  CodeSamples/defer/seqlock.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/CodeSamples/defer/seqlock.h b/CodeSamples/defer/seqlock.h
> index ec00177b..842d10a6 100644
> --- a/CodeSamples/defer/seqlock.h
> +++ b/CodeSamples/defer/seqlock.h
> @@ -60,14 +60,14 @@ static inline int read_seqretry(seqlock_t *slp,		//\lnlbl{read_seqretry:b}
>  static inline void write_seqlock(seqlock_t *slp)	//\lnlbl{write_seqlock:b}
>  {
>  	spin_lock(&slp->lock);
> -	++slp->seq;
> +	WRITE_ONCE(slp->seq, READ_ONCE(slp->seq) + 1);
>  	smp_mb();
>  }							//\lnlbl{write_seqlock:e}
>  
>  static inline void write_sequnlock(seqlock_t *slp)	//\lnlbl{write_sequnlock:b}
>  {
>  	smp_mb();					//\lnlbl{write_sequnlock:mb}
> -	++slp->seq;					//\lnlbl{write_sequnlock:inc}
> +	WRITE_ONCE(slp->seq, READ_ONCE(slp->seq) + 1);  //\lnlbl{write_sequnlock:inc}
>  	spin_unlock(&slp->lock);
>  }							//\lnlbl{write_sequnlock:e}
>  //\end{snippet}

