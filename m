Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266EE33062
	for <perfbook@vger.kernel.org>; Wed, 20 Mar 2024 20:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710967487; cv=none; b=FPQ2YRgCYZYlM5XwU/Uxpmi4doUa6UIiAi/VALSP2UodhbDUzHQblKP+GHn3HGYWievu9NvGM7W26w6g7ksqEKRbbvv0gRpT3bu/tJ+IOWDhZ2xkCDZpamdPeBvJalIDh9H16VCeBUEDWrK50NN9PEIqvuXoh0O28aWwK+KytoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710967487; c=relaxed/simple;
	bh=2M7R8BhvXtGMsa14LJBxTFDrDY/Uz4E1y0XUAgOlKWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fS+PC5s0sqASU2HRbq7vJOmq53ghxXEOTqMgwCcSImswepXIMcYxnaCpeVreb/JUxe9Ecap8yllH297/nYwZvAt/D8le2bWytkl+dgIe0vTKOsD54WTBMZfh/wrb5Mnv8PRJz2HcdFiL1sGssInQB+xocVyfnaYWcp3TN0JYNPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LAPZ+kSG; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LAPZ+kSG"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso186166276.2
        for <perfbook@vger.kernel.org>; Wed, 20 Mar 2024 13:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710967485; x=1711572285; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RpFlK3zzX2JJ4DQ7oxv5aKucZrjSvAP/l1PkBpA+MF0=;
        b=LAPZ+kSGOm0OOhaV42yz4+0iNVulnbFVeikPTl3tDEQ7FOThrbuF63EIYbRfFT8VUy
         DS7ZEp5u4gQpNUH6spfr3VnoG7tUPXSd+PmtI3ALqTjM8NYNe2mv8KeTH0PyndOdeSTg
         59f3n/Q5RfGZl61uGVmqO8g3ZYr6sXGkJozx0CE89KNvXliUZnFBUgZJ8A2Chakn42Cs
         9EEkonxXIx7c9vT7XIy+zzN3oLCQSqtVfPVhtWyFnLT2h01oaArZjTPRYC8Kuvi78FoS
         3WI0lYIIoG2AoVho8PgcHGZbcnnwh7MMBfZA9pqBtH2DqU4EqMydyNYCgqmXkfKdb2h7
         yH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710967485; x=1711572285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RpFlK3zzX2JJ4DQ7oxv5aKucZrjSvAP/l1PkBpA+MF0=;
        b=ldImxC+wEHy+3b7u42txoMRDpGdRqgvnWXD+LMvbABgrK2r5MhyQurleKxGXQnCUQO
         4LxKUsmDXTxSGg6yy6Qk7xo8JskF49YPNb+quHFbakmEilaLgmGrH94NPJ3kba40k+9o
         PnqN6KkXJSUbmuFiz6vadts5e9Q3we4PMq2WgGb0EHhzvRDTa1ZYp6ejpWxGyfhGqXCP
         9PdR0wdLJltbwEYApN6aXbMMsIGL5vw2EMD4HuibMsKw6kHVq2vyvoC6A3GYmqjv7QyM
         9uI67fIrskffKfShslmYs3JHc2yGO/Xon9JPDkAGwx3aHqc/SIOG5bmEn18rxS1RXHR9
         8d1Q==
X-Gm-Message-State: AOJu0YxTePWKjmMHpg4/ZxqKC+AIRYPUJ0SFIP3j3mhuDqDziFA7TLPp
	KFYu9bfBQkrIaL7GB5HNeQkyB/tKxZkbEglZpF3N/rf3oah3GVZMNgmGkHrJTBRReoc1ASGKCqY
	KKb5mq6fULcQRTf5miiDusakuqVEq9irM
X-Google-Smtp-Source: AGHT+IEGplXJAf8nP1mMjBYH3mLOTDlGCogBRPz9K96AKVT0pE7ZiDXQrDhd4FK/AEjo5L0SewyuhRFvo2pZQARUTLM=
X-Received: by 2002:a5b:c8b:0:b0:dd0:453b:485e with SMTP id
 i11-20020a5b0c8b000000b00dd0453b485emr15702722ybq.58.1710967485106; Wed, 20
 Mar 2024 13:44:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <wehwhnxba7wraxuevaqvuutug4k4orzn4yxrvlm2bcva5qpax6@ctvbjzt5dlqb>
In-Reply-To: <wehwhnxba7wraxuevaqvuutug4k4orzn4yxrvlm2bcva5qpax6@ctvbjzt5dlqb>
From: Elad Lahav <e2lahav@gmail.com>
Date: Wed, 20 Mar 2024 16:44:33 -0400
Message-ID: <CAJbg=FXeXVLvvUNHs6Z_usd0=5rcjTu_Vjkt+yzYgNb4KYLbzw@mail.gmail.com>
Subject: Re: [PATCH] signal handlers: volatile sigatomic_t, not volatile OR sigatomic_t
To: Guilherme Janczak <guilherme.janczak@yandex.com>
Cc: perfbook@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Do you really need volatile?
There are two cases to consider. Either your code synchronizes updates
to the shared value with the signal handler (e.g., by blocking and
then unblocking the signal), in which case I believe the compiler
cannot ignore updates to the value; or you don't, and you can't depend
on the variable having any specific value in the signal handler. The
only thing you want to prevent in the latter case is the handler
observing a partial update to the variable, which I presume is where
the other requirements originate. (In practice, there should be little
or no concern with any primitive type on modern hardware).

--Elad

On Wed, Mar 20, 2024 at 4:32=E2=80=AFPM Guilherme Janczak
<guilherme.janczak@yandex.com> wrote:
>
> Variables shared with signal handlers must be of type `volatile
> sigatomic_t`, not `volatile` or `sigatomic_t` as the current text says,
> according to a C11 draft:
>
>     When ... interrupted by ... a signal, values of objects that are
>     neither lock-free atomic objects nor of type volatile sig_atomic_t
>     are unspecified.
>
> Ref: https://www.iso-9899.info/n1570.html#5.1.2.3p5
> Signed-off-by: Guilherme Janczak <guilherme.janczak@yandex.com>
> ---
>  memorder/memorder.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 5c50d42d..873c3424 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -1317,8 +1317,8 @@ from the viewpoint of the interrupted thread, at le=
ast at the
>  assembly-language level.
>  However, the C and C++ languages do not define the results of handlers
>  and interrupted threads sharing plain variables.
> -Instead, such shared variables must be \co{sig_atomic_t}, lock-free
> -atomics, or \co{volatile}.
> +Instead, such shared variables must be \co{volatile sig_atomic_t} or
> +lock-free atomics.
>
>  On the other hand, because the handler executes within the interrupted
>  thread's context, the memory ordering used to synchronize communication
> --
> 2.42.0
>
>
