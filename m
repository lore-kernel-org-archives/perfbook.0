Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7B735945
	for <perfbook@vger.kernel.org>; Wed, 18 Dec 2024 02:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734488919; cv=none; b=STv+QauFlKv7Lu1Ww26xjbLoYzTykvXj205PeiVYF6Ocjmx9tW8c1Hyy073sjVUmzDFYOh+1wv17C+f3sApRcT/oJE+nVWKei592wG8lgsCpDn4Wb7M4/mhBvNllGvOwHbkfvsqCRHkJdGokmZl3l5G74ilAS2NOgwNRne4nHOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734488919; c=relaxed/simple;
	bh=Tu4AKKfq2Fb0bZ0P6Cyt+ZMAixuhMrzPCfro8r3BpvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M5F4ImyFyhYO+bE3IvUgpnPJSNjTJy8SqMBUmwaqvo4QzTtpK5oDQR69YxZ4Ze/y0Fl1NfWPPaDjs99msF7jbmc5RfJgYPhynFN4hcvz6IWWF8mMtMMoidM5Ihs46NdmuzrVx971te1uRMPS+Ci6l06TI7HvgvZ7Rgvka4BHYOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TEPXkkh4; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEPXkkh4"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7242f559a9fso7631004b3a.1
        for <perfbook@vger.kernel.org>; Tue, 17 Dec 2024 18:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734488917; x=1735093717; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IFLzx2e8ALVhKDBYvwzulmjaO5Bzg1D3fv+AWm5hvdc=;
        b=TEPXkkh4r3AqlEH3lChgHI0FFwhzEPDKs/t8H35bMCEkuOnv6rP6UYhRDJChEkE0w2
         9WStObYKn0qMg5cytaZtwsbUGYybw/uzPpKqvReFTBV9igz9+5OyvkGYkDvhxfeUT6IX
         Uzd9x4o26M4Yony64RuORJIPbPKreNuGUb5Nmo7l1bGbv+HXGDU5KjhmJJZlgED31XRI
         Mm+Rh0TEMk6YMqbj+/RLmwDb8akELX7uzGsjWLyshCT318uL7T10zeVfRM6Lilo2W9SF
         pIbmsrOqJgLiWOBb8eZ9t1aD5JoBvibWCYNfWY11GMawNQmDidhmu56/HsWze4CVO0aA
         ceFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734488917; x=1735093717;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IFLzx2e8ALVhKDBYvwzulmjaO5Bzg1D3fv+AWm5hvdc=;
        b=eCmTKe6dqe5eCfN396vcezuoC3PgeadSP2uUo+kJbALYBjgmDVxeWftN7LoKr2afH4
         o3K5qvZsu1LIpegPZdNWXVrixPDU2OfGKrvSdSjlYyPcG8ZcvrtkuKkMvv1wz28QeldR
         Y0KD6YA4yXA9KuODyDayeiA41+EfT6TnC4cZ03qch4f7rhbJOniW+X0GdVWyKdz3nsgi
         fvDe7aXdVXQW5nahb3/ozr0dWSGsDYyzoJXnRn8xGKyPQezVSlZkOZ4eFWVRSRMYXbLs
         PqYjoopUHnoalCyzJxM/xxcPLEv/wFOT+Mtx3f3jLdZINl/ivxvEbVJVUzE7le78lUxD
         Ci6A==
X-Gm-Message-State: AOJu0Yy1dSe816e96RFoYqv4zJYk68huJgqv/alCv6gJu/XW1+P78IZP
	f7lcP8VIB8CZXP8AW2beXkj5uup4eyfGhteTWCvkhNRM3xl3b8bb
X-Gm-Gg: ASbGncu/rFZ7dU0jsGFopIrbq79mEDCuH9iP56kFSVqgxqtxy3CPLWBG7CfI2T3IYCS
	WXcgb7UaDY9m5dOsK+Tda0ZC1RIfgivGQNKqR00neqrdtqZ1s2/i0y3aQzAHntswG+lP1yG2fD1
	rZgkpr1NCfR9hCVV1M4guvBLsBan+TsXTZc28QbZeLa+t/eqs5wQVH9X2ckfcI7wXPBnUXFoWNT
	9GWMKHf8SeRcvvkJnzbUMzldMiqfT4q8DPW0r3rdOc6jt6nD9MYbXPu2vydviGMwCkiONUYe7PU
	CvxpmNpnDU66xBpUezsKVNI=
X-Google-Smtp-Source: AGHT+IFHV7/xD62w/4E0q6O3I0frZWwVYvh8+nY8jb6eClMhjC3C814/X3HJLvmu+yh6kYC2a2alaw==
X-Received: by 2002:aa7:9316:0:b0:724:ed8f:4d35 with SMTP id d2e1a72fcca58-72a8d2e0557mr2178454b3a.26.1734488917373;
        Tue, 17 Dec 2024 18:28:37 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-801d5c14a8asm6491433a12.63.2024.12.17.18.28.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 18:28:37 -0800 (PST)
Message-ID: <9d088173-a038-483c-a4ba-ef56f7162b62@gmail.com>
Date: Wed, 18 Dec 2024 11:28:33 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] seqlock: Use WRITE_ONCE() on sequence update
To: Daniel Xu <dxu@dxuuu.xyz>
Cc: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>
References: <3a7519aaad6329084fb4f8e6acfebc8f05924bc4.1734474057.git.dxu@dxuuu.xyz>
 <114890d2-e51c-4bb7-943d-9276c6e3de93@gmail.com>
 <bb8ad6dd-7a9e-4288-9b11-c173d318a87a@app.fastmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <bb8ad6dd-7a9e-4288-9b11-c173d318a87a@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Daniel Xu wrote:
> Hi Akira,
> 
> Thanks for taking a look!
> 
> On Tue, Dec 17, 2024, at 5:53 PM, Akira Yokosawa wrote:
>> Hello,
>>
>> Daniel Xu wrote:
>>> WRITE_ONCE() is needed here to prevent store tears and other unwanted
>>> compiler optimizations.
>>
>> That might be true if there were chances of these two accesses to
>> race with each other.
>>
>> I don't see any possibility of such races.
>>
>> Can you elaborate?
> 
> My understanding is that read_seqbegin() and read_seqretry()
> can execute at any time. That means the read side access of
> the sequence number can occur doing an increment.
> 
> To prevent the reader from reading a partially written value,
> we need the WRITE_ONCE() to ensure the relaxed atomic
> write.

OK, now I see the race there.

But see below.

> --- a/CodeSamples/defer/seqlock.h
> +++ b/CodeSamples/defer/seqlock.h
> @@ -60,14 +60,14 @@ static inline int read_seqretry(seqlock_t *slp,		//\lnlbl{read_seqretry:b}
>  static inline void write_seqlock(seqlock_t *slp)	//\lnlbl{write_seqlock:b}
>  {
>  	spin_lock(&slp->lock);
> -	++slp->seq;
> +	WRITE_ONCE(slp->seq, READ_ONCE(slp->seq) + 1);
                             ^^^^^^^^^
>  	smp_mb();
>  }							//\lnlbl{write_seqlock:e}
>  
>  static inline void write_sequnlock(seqlock_t *slp)	//\lnlbl{write_sequnlock:b}
>  {
>  	smp_mb();					//\lnlbl{write_sequnlock:mb}
> -	++slp->seq;					//\lnlbl{write_sequnlock:inc}
> +	WRITE_ONCE(slp->seq, READ_ONCE(slp->seq) + 1);  //\lnlbl{write_sequnlock:inc}
                             ^^^^^^^^^
>  	spin_unlock(&slp->lock);
>  }							//\lnlbl{write_sequnlock:e}
>  //\end{snippet}
 
Those two READ_ONCE()s don't have any concurrent writes.
So there seems to be no need of them, IIUC.

        Thanks, Akira

