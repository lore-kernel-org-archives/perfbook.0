Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E2417799F
	for <perfbook@vger.kernel.org>; Sun, 16 Mar 2025 11:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742125044; cv=none; b=N+Gzf7wM1NBxp9kP2AdBmY7StkRdZ/9NtxVTsHIqu8fM/hOoQkEKqMLU3L+hnlP7X1GSljgkIRUHPHru0r/f9L3tCvQ7N0uta6K8/QWOGCiMR9rmNMIQbel0nNDhnt3P4SYfbUywhKCJNrUbQWYtxsgBTnzetW6TlbCAs4X171Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742125044; c=relaxed/simple;
	bh=lq8cSnJMC41h6u3AU1+pPAoFOa457kzA4P19zoPu5gs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=oo8a8JdeQ+hMrBw+nqlMkhhL4jcVU8G1InA7jDHKburNpSBD2EAiGGG5Bf1cgfN8LMbU3XpUy8Q2XLbx0kLIALbiTIkY+f1ChOMBmIt8SU6IsJpKM+t9GuBEIL4Hqs5qyxvOOz5GTBuicZ931CJrHyAiL9wt2r7b4Z4Tm9lj/N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cLxLhAmR; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cLxLhAmR"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2255003f4c6so58046655ad.0
        for <perfbook@vger.kernel.org>; Sun, 16 Mar 2025 04:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742125042; x=1742729842; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iFhccaVuxIUqWvZeXChHIR4p29K+2OCAK5SVGNlYfgE=;
        b=cLxLhAmRKdbsFN6tadXEWr+v7vrT5pzQyEr8jPfUKvfIF5HFvrfYamzc+NP4A8DKM0
         h+6vjYW2MrP66LJohnbOQbMsr0J3r0MbJHuUA+yqxXE6QymseAPyiJZ241dS1uTffkMc
         5/7AXngUFjQxbnRX0h6KX+xFX9605ryW0Gd4SVXaEJ+Rv/3byMuzBd+AuEoRxi+FIEfe
         ak6nlESR3VKiNqgf3KDC95ijW/YMIn3al8azSY0e3jlbH/csNY3OsesSCOTxKsC2b7Dh
         5PTFECxVYR35o9esaltrY13GUxT1jMWAHxLUOs9YxSQ1DjlIWk72meU3t0HGbZtCG+9Z
         HBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742125042; x=1742729842;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iFhccaVuxIUqWvZeXChHIR4p29K+2OCAK5SVGNlYfgE=;
        b=vt+B3VTEYK3lvoG4MwldF5rfII+8/pGI941rKh+kd4GPfqcV4rPyQ8YWq4kGNKQi/U
         hFu7B831wazzozpWMD/kBhb/1eUzshqgczfMsrCAMIgiELLXC5Cpx0RDq3ZpUB+zF5Lg
         1yyrVr0oHaNjn/WvsIh2fwrphZAs7DFFCZTDAenmk6i8fr1UGznsD7vHcxvZCiMhQcKw
         hUxGwrJHU71EhwUqlvm/S/lEclDGoCxuZYxAwqJz3SvrsoBRgBwV537kb++ZRY2z/fAS
         1iWGGERYWBACyVNAkQfNgWVu8vxdgHeSHymZELF8j/Eq8twnhOJfRgkLo+VQ30HkBYpe
         lEHg==
X-Gm-Message-State: AOJu0YzST+E1GiOq9G3w5HGKR0IBGoT0ocQbvbQBE9ZtMChF2NhwlBFg
	v9M/Zkms9c2vZFc9Fbby/h+5WAce2IBKzjKvLSwC3MLWMAk7czyz
X-Gm-Gg: ASbGncv0UTYuf5HcMursA0fSfBHreicJlPiOn07xqmhXm1GxXpshKvRZKgrnOTCxV13
	2CwSxEkUV1EMNv58LiUiDEsuukpjZGpFPZ86n0jgsX8nbfWKooWfOAiAdtNbd+x/n4JQgUFgNrD
	O5jGbjBpowip1FU/cSnNf8T7bfGZhTECuNU7yrzUZbBp8m4vutg3j3kf0HFxPVNNKZjp7szzwPF
	pJl9WzSrSyl4s+bazziccJuLGAUmAyKCpiMv8o2KysD2O6atJazXyc9rJs+wgqfdQp5UIoQgEiL
	cQINbfUgh4zyllgPUn9xsazC/PbNToOYOPtyG2vwOIpj58Pg3i/Hkjfr3pwJxm3lvJC77wY+M4/
	nWshPiuLs4WqCGD0=
X-Google-Smtp-Source: AGHT+IEUmRgQybTsfixlzf4s6zecvvtq0HAXKdzDCGv1D2GmfGRYd03mNyS1EzWOBFnUEDY80GW5WQ==
X-Received: by 2002:a05:6a20:d81b:b0:1f5:6c94:2cce with SMTP id adf61e73a8af0-1f5c12cd664mr12963730637.30.1742125041768;
        Sun, 16 Mar 2025 04:37:21 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711578a5csm5685810b3a.74.2025.03.16.04.37.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Mar 2025 04:37:21 -0700 (PDT)
Message-ID: <64509d29-0593-4b7b-bb29-8a96835ac1bc@gmail.com>
Date: Sun, 16 Mar 2025 20:37:19 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Is Alpha non-other-multicopy atomic?
To: Ignacio Encinas Rubio <ignacio@iencinas.com>
References: <6c2c3199-e092-4909-853e-4fad1ca0f35c@iencinas.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <6c2c3199-e092-4909-853e-4fad1ca0f35c@iencinas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[+Cc: Paul]

Hello,

I reflowed your message quoted below so that it fits 78 char width.

On Fri, 28 Feb 2025 18:31:02 +0100, Ignacio Encinas Rubio wrote:
> Hello!
> 
> I recently looked at memory consistency models with a particular focus
> on hardware details and found this book to be great, but I was left
> wondering about something regarding Alpha's memory model. 
> 
> I tried to find previous discussions about this but didn't find
> anything, so I'll go ahead:
> 
> Table 15.5: Summary of Memory Ordering states that Alpha is *NOT*
> Other-Multicopy Atomic but I couldn't find the explanation for this.
> Other sources contradict this statement [1] [2].
> [3] Documents ARM's adoption of other-multicopy atomicity, using POWER
> as an example of non-other-multicopy-atomicity but fails to mention Alpha.
> 
> Furthermore, [2] models non-other-multicopy-atomicity by having "Read
> from external" (rfe) not impose ordering. Alpha's reference manual [3]
> Section 5.6.1.5 states 
> 
>   If u is a write access Pi:W<m>(x,a) and v is an overlapping read
> access Pj:R<n>(y,b), u is visible to v only if:
>     - u <- v, or
>     - u precedes v in processor issue sequence (possible only if Pi=Pjn).

As is well known, Alpha is infamous of its lack of address-dependency
guarantees.  I don't see much point in discussing whether it is multicopy
atomic or not.

That said, here is a naive litmus test on Non multicopy atomicity:

---------------------------------------------------------------------
C NMCA

(* Demonstrate no-ordering of non-multicopy atomicity
 * Result: Sometimes -- Non-multicopy atomic platforms
                            (LKMM, Armv7, POWER, etc.)
           Never     -- Other-multicopy atomic platforms (e.g., x86, Armv8)
                     -- Full-multicopy atomic platform (s390)
 *)

{}

P0(int *x, int *y)
{
	int r0;
	int r1;

	r0 = READ_ONCE(*y);
	r1 = READ_ONCE(*x);
}

P1(int *x, int *y)
{
	int r0;
	int r1;

	r0 = READ_ONCE(*y);
	r1 = READ_ONCE(*x);
}

P2(int *x, int *y)
{
	WRITE_ONCE(*x, 1);
	WRITE_ONCE(*y, 1);
}

exists (0:r0=0 /\ 0:r1=1 /\ 1:r0=1 /\ 1:r1=0)
---------------------------------------------------------------------

If you have access to an Alpha machine with 3 or more CPUs,
you should be able to run this test with the help of klitmus7.

Note that you might need to run the test against pre-4.15 Linux release.
READ_ONCE() since 4.15 has smp_mb() for Alpha to ensure that it can
be used as a start point of an address dependency.  Litmus test
above might behave differently against Linux releases of pre and post
4.15 WRT Alpha.

Also note that even if you see a result saying "Never", it does not
necessarily mean Alpha architecture is other-multicopy-atomic or stronger.
The behavior might depend on specific memory/cache system found on a
specific model of the machine, for example.

Finally, my mental model of other-multi-copy might be different from
those defined in papers you cited below. 

> 
> Which seems to confirm that Alpha was indeed other-multicopy atomic.
> 
> Best regards,
> Ignacio
> 
> 
> [1] https://arxiv.org/pdf/1707.05923 - First page
> [2] http://www0.cs.ucl.ac.uk/staff/j.alglave/these.pdf - Section 4.2.3.1
> [3] https://dl.acm.org/doi/pdf/10.1145/3158107

  ([3]: with the last-minute edit in your follow-up.)

        Thanks, Akira

