Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACA222DFA8
	for <perfbook@vger.kernel.org>; Mon, 17 Mar 2025 09:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205511; cv=none; b=HPJRMRqOVLs/j5kn312G8hU4MSicVX5KRk+F+AxiL/2N6GmbxSBYh1UrpIadI43LRTrucVuQ5VAAcajSuxl6pziC+eC+8HYw0xoF9Xl22B5e3x2QtoztzXyBhActmc2l3JQDz/2afkIXKaRowjJSHWoR/lMFKDWcjtJ3Pu6OMls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205511; c=relaxed/simple;
	bh=piZlMLY9zxbzYz/dxKxmNVAmpV6JvGDoHOxVqZSdkuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FUcPSw10UzoGLs1EUgkecpxCz2dda12mdJdvPx+GO8fI6Vv8NroBa84qAmUCVrcA5OawtG7a5MeDpcyNvvP8axF4SVVy+GWHOXKKrtcE4e3T7zzey9fpVvQRjkKVCdhOSWwOugwQ4qT6ATmF7bmb/y6pyQwnAGzEN4483cswmBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KykTG75r; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KykTG75r"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2fecba90cc3so4108602a91.2
        for <perfbook@vger.kernel.org>; Mon, 17 Mar 2025 02:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742205509; x=1742810309; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=skTQpyT9CIOXoRUEZyEcq7voefZmdJzu9BO1OnKmO34=;
        b=KykTG75rYQt/GiD5hVlQMBGh3zr4BLkFrcpkZo0ZmGF5TAYW1OWGb+DxGvWK8gN8we
         AAgW1qTYkSMShPdH56w5+RrnvnRRQPoPQimEejBC7yUNSkhJDRfDTIo4q81pQ6hKnPPu
         wdBHhEFluEg0Tj5oVEH4ee4oJviHktvDP8YEYGm4CXneFY2r+U9CoBIa1jzcfy2isNWz
         29dyctam8WNAvNojZYnhcw8EYvhp1IOdsMwA+60SuhCSbn7wb5ogtsecq1BpnPLVE5MZ
         O5B8gQx8OYnB3T2ikHCSHD8GyMjmP0tEoU+MSZAr/qW7d5z13w30jcW5RJdgmJca01Ms
         3OaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742205509; x=1742810309;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=skTQpyT9CIOXoRUEZyEcq7voefZmdJzu9BO1OnKmO34=;
        b=iyosoacxjHiVgexBU8cWedHgUP33ZX4a+k/sIe3PrgIN2bUCPfPqTfe05iUlBxc2Sw
         ouLMFy4bzcNRudqmuicDAjXxQ1F8kGzbuAD+RM2U5l0CZR3uq48TF34791OHACSdZejw
         /eyU4dPuFivUXa9EYV03ZyHSCF1BUqFe4qrBF9wE2j+1Lkn207ADYwLTooD5usUsIvWQ
         Zkfj0sjJM4JzZwTp1idGUNrPTZqHXWEFFsrdwwT+PQ9OscEiKtvLjUXjr7alp31QfkV1
         CqSVOyAg0O0r3v8KA3k1AjSa1F70Bc0NLJbO1sgSByYZr4jnCZpLugXKqJkER5GfBCgt
         NGXQ==
X-Gm-Message-State: AOJu0YzxH1GitVj0fq80A8vuSbQd7qP8VCCk6cn2/XnEth0DZOSv66rA
	Nb7kZt414iJMMBB/r9rwKHG2yRtlWev0ixRhxVw+dYv+4P1oUQH+
X-Gm-Gg: ASbGnctuv3Mx/VccESuvjfiij80lUER0jq2T2OWD0lDsLpp6sbolpkUn/+N2wZqysTw
	e30UGLqCGbJSMoOI7li0qwU1L5ZR8e8GhGYf2VP8WK6aAodtnjwiMzVapZ+22IoA2CwlxxNAffP
	Ekxr31T39iYo1DbB+Jk7gGzgmfTIkO+AIirHY9gOiyug0DGarh+3MMjhBZw+hQoMiShtiQ/8O9x
	gx2MXZD8INaWhJyn4NMySA9ysTtBC12q/uL9Vj35HiDWJQbj9vkBfPZjdcsWio8e3p9X2z3KuxQ
	G2Mi3Agva6giGO6qQUTyQev4urz0+DeKR25dP+yQUHtFJuBs72ic7Ta8XrulUd2uu51CZlB5b83
	ry2KfeWGQhn40BHEIQbvRl2/KwA==
X-Google-Smtp-Source: AGHT+IHmpOiDccJtybqNjL9bX21nVRbf4fly0tRjXm68FdQB8KHxrHdcA9s2ibHFCHesTkXVcD8p1A==
X-Received: by 2002:a17:90b:2752:b0:2ff:6af3:b5fa with SMTP id 98e67ed59e1d1-30151d403d5mr12475776a91.22.1742205508841;
        Mon, 17 Mar 2025 02:58:28 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301539d3f17sm5609245a91.10.2025.03.17.02.58.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 02:58:28 -0700 (PDT)
Message-ID: <c1832cf9-49e6-461f-bf6c-92b6b5e7f220@gmail.com>
Date: Mon, 17 Mar 2025 18:58:26 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Is Alpha non-other-multicopy atomic?
To: Ignacio Encinas Rubio <ignacio@iencinas.com>
Cc: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>
References: <6c2c3199-e092-4909-853e-4fad1ca0f35c@iencinas.com>
 <64509d29-0593-4b7b-bb29-8a96835ac1bc@gmail.com>
 <03f234c4-faac-49ef-8956-2bf04579eab7@iencinas.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <03f234c4-faac-49ef-8956-2bf04579eab7@iencinas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Ignacio Encinas Rubio wrote:
> On 16/3/25 12:37, Akira Yokosawa wrote:
>> As is well known, Alpha is infamous of its lack of address-dependency
>> guarantees.  I don't see much point in discussing whether it is multicopy
>> atomic or not.
> 
> I agree this is not particularly important, I just found contradicting
> information and wanted to clarify/fix Table 15.5.
> 
>> If you have access to an Alpha machine with 3 or more CPUs,
>> you should be able to run this test with the help of klitmus7.
> 
> Thanks for the test. Sadly, I don't have access to an Alpha CPU (I was
> born after DEC was bought by Compaq)

That is what I had anticipated ...

> 
>> Finally, my mental model of other-multi-copy might be different from
>> those defined in papers you cited below. 
> 
> Might be, I have just realized mine is wrong. I have just run Listing 
> 15.16 (C-WRC...) in herd using the "linux" model to realize the exists
> clause can trigger. 
> 
> Note that it can do so while "RFE" imposes order for the "linux" model 
> (it is part of happens-before), so my original comment stating 
> 
>   non-mca == rfe does not impose order 
> 
> is wrong if Read[X = 0] (fr) -> Write[X = 1] does not mean that the read
> is ordered before the write. However, this doesn't seem to be the case
> for Alpha [3]
> 
>   Section 5.6.1.2: The ordering relation Before (<=) is acyclic
>   Section 5.6.1.4: If u and v are overlapping read/write accesses, at
>     least one of which is a write, then u and v must be comparable in 
>     the BEFORE (<=) ordering, that is, either u <= v or v <= u.
> 

The wording "If u and v are overlapping read/write accesses" sounds to
me like it has nothing to do with what perfbook calls "multicopy atomicity".
It is more related to the concept of perfbook's "single-copy atomicity" or
"coherency", isn't it?

Quite from Section 15.3.6:

  On cache-coherent platforms, all CPUs agree on the order of loads and
  stores to a given variable. Fortunately, when READ_ONCE() and WRITE_ONCE()
  are used, almost all platforms are cache-coherent, as indicated by the "SV"
  column of the cheat sheet shown in Table 15.3. Unfortunately, this property
  is so popular that it has been named multiple times, with "single-variable
  SC", "single-copy atomic" [SF95], and just plain "coherence" [AMP+11]
  having seen use.

Miss-orderings related to address-dependent loads on Alpha happen only
when two variables belong to two different cache banks as shown in
Figure 15.25.
They don't happen when u and v overlap (and share a cache line).

I'm suspecting that the meaning of "multicopy atomicity" in perfbook
(or LKMM), and/or my interpretation of it, might not be exactly the
same as what is widely accepted by computer industry people.

Are we on the same page now?

> It's still my opinion that Alpha is other-multi-copy atomic but I
> understand it is a bit pointless to discuss about this... Sorry, I
> couldn't resist.

No need to apologize.
Any feedback from a fresh minded reader is much appreciated!

        Thanks, Akira

> 
> Thanks
> 
> [3] https://download.majix.org/dec/alpha_arch_ref.pdf
> 
>

