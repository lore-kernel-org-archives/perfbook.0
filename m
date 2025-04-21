Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A9163D
	for <perfbook@vger.kernel.org>; Mon, 21 Apr 2025 09:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745229224; cv=none; b=VpOqEA243R4Zkc68Inz0e9ZLjPJ2vFngt0BCaIeALvEbaM6bp8xfUH1dnZC3oEdjrklr3ixUyn4qyqW9ZF54Ssx2nZwPzpkUQu9GzcPS71K6t+JRO0EiJsLfcwqJ8jMmuhXKExtE6Uz5KGYSKwnzY4bmXkS+KBl4x4jpRxGEkdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745229224; c=relaxed/simple;
	bh=7a9wjYkIFlNO6QvhXJj2Ok3z3n32pAYi8EZSW90CiFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rMxf7PRQErLvGSjGE5czMjtkv7QJlyvo+DTY/mTYtUdcdfmORmmj5QttPJifOR1/SBfgTQBh+dk2SEyncZ70FAstPjBPJ3Ud5ruJ2xiEB/E9yDRp6PlUMWSz0hvXftAGSl6aAyVEe3dpVdyANhC1oXzV+cVdCleZBAz4XMOHpb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dOtATgZq; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dOtATgZq"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-226185948ffso42019095ad.0
        for <perfbook@vger.kernel.org>; Mon, 21 Apr 2025 02:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745229222; x=1745834022; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tnuN3+kTYe7xHedUZor8NNNs8aiMk65qFrWVCnkIMms=;
        b=dOtATgZqctdTpn1RpCWdOnDIbQYH/EPiBrXYiA/D3eqMIg8IkBOpScoRjeMT/0RCFG
         rZbPE52dc5ri7JwoYZMN2Z5rPfSsWoPVqhYAHs+W7LWAHZp3RQlddZunJAi8A+eSo7EZ
         Vswip8CadqIgULraCpuLMDcyD9PmsvIL9mqxPj9h0ui0xLI2iYahvTYXmlO8l6UE9wX3
         FzeWzWonYZ+cjY5bhh6MB7WGNXiJZTCU4tkNpCwqZPjUj0Fa+dwGGBObjRTBM07K7mg3
         6TqLhvbpv9i24fjp1yRgJfiF1j3U+YW5U/cwwcN2xqOMSyCHEG6oL9pl3wVKPW8pxbsJ
         XsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745229222; x=1745834022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tnuN3+kTYe7xHedUZor8NNNs8aiMk65qFrWVCnkIMms=;
        b=VxS35xaIW5hOGK7RyuRYisbbQ9pH4+ZKegrDGizc/D0UDzdWeMbZwehZiPlGNRSw9U
         JVlZ5kbVN63UZaoBBYPI0eaj1ApgPOW1hIZFCL+9xxCnvXK7FML2CiHsId+Tg5iJZHxy
         H8BBfFhl1fAcD8DfAku0iWwNPADwA2+A4PAyPkTR3WbGS4gsvze0rctuELx0+S6Fp1q1
         xe287D2czywBDqhAkINs/StAsQnpU0MHa+RAM3ZoJ/ru9CML40eKpuKWMpqp56m29s3q
         Xv4ceam4iz0Jom4iH9P/nM/id4xnWlcVMYKTQQkBiy3h2ZYiWBCyE81Qthe/aqVMss+0
         beBw==
X-Gm-Message-State: AOJu0YzbYllSrI2l/i3gSpC3sJI8nQHQR9MSJLWJAiqsgQfmUEVmR6O0
	+1sz6uAf24g2BQJg7ASg63CpANvOSoFIFzMrI0FZriZ4JdR7+zMv
X-Gm-Gg: ASbGnctKXxNzCovjijq7XcsOUImOVwh4OqoV/gqw76KOOb4rYpxlEKmgdd3ExVdP9h7
	FH9vHrHaYrb2Q0UB5QYV+iqTsW9n2mssVg4NRZWXuR/S6AnOL7E54Psu8RHU/0iEYkI2iEVQ+3W
	GjgUQkZ7XoMabnpQrs4Xs8vkJt3dUI8KhWp6H/RNJmj6HghIIdABZTFI1dX3LgeBcyOL7UNIm16
	pMMdXZleDEctowmOBZ/ovhkbSFthm8hMVdQ0hsuOeB5akWnOc3P4/b18zwYmokFticdstq+Ttda
	fhfEpZrRz2x44MyLLr5oTsB6khY8vutfvnQlhZmERwklO6xruV8hJLlPuAP8zjFVCGgJQlTbTIz
	rHak+w2zFBcU=
X-Google-Smtp-Source: AGHT+IHs3nSS7Ja/iKXCyo4dzqDCiDVE204Gd6VPY7gSUUgeq7Dffh5rUQZlLEny+xAZkmpW7IypSw==
X-Received: by 2002:a17:903:2acd:b0:22c:33b2:e40e with SMTP id d9443c01a7336-22c535683d5mr169391675ad.2.1745229221884;
        Mon, 21 Apr 2025 02:53:41 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b102701e679sm2124924a12.55.2025.04.21.02.53.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 02:53:41 -0700 (PDT)
Message-ID: <2d36f655-0054-4428-b8d0-b25b06954d09@gmail.com>
Date: Mon, 21 Apr 2025 18:53:39 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Ideas on reorganizing terms in perfbook's Index pages
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <ec0b5744-65b9-4335-be12-6f3ff0e8c31b@gmail.com>
 <2751a064-a9d4-4753-8948-346e12bbe456@paulmck-laptop>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <2751a064-a9d4-4753-8948-346e12bbe456@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Thu, 17 Apr 2025 12:43:06 -0700, Paul E. McKenney wrote:
> On Thu, Apr 17, 2025 at 11:02:02AM +0900, Akira Yokosawa wrote:
[...]
>> So, I'm thinking of reorganizing them into something like, including
>> additional markers for "memory model":
>> 
>>   - Memory consistency
>>      - process
>>      - sequential
>>      - weak
>> 
>>   - Memory model
>>      - Linux kernel
>>      - Armv7
>>      - Armv8
>>      - etc.
>> 
>>   - Memory consistency model -> Memory model
>> 
>>   - Linux kernel memory consistency model (LKMM) -> Memory model, Linux kernel
>> 
>> How does the above sound to you?
> 
> That works for me, and thank you for going through this!

Hi Paul,

This patch set is my attempt taking care of above.

        Thanks, Akira

--
Akira Yokosawa (5):
  Refactor index markers of "memory consistency"-related terms
  index: List LKMM under "Memory model"
  indexsee: Add a couple of redirections to "Cache coherence"
  together/seqlock: Remove wrong index marker for "sequential consistency"
  indexsee: Add redirections for arch specific memory models.

 formal/axiomatic.tex     |  7 ++++---
 formal/ppcmem.tex        |  4 ++--
 formal/spinhint.tex      |  4 +++-
 future/formalregress.tex | 11 ++++++-----
 glossary.tex             |  6 +++---
 indexsee.tex             | 27 +++++++++++++++++++++------
 memorder/memorder.tex    | 39 ++++++++++++++++++++++++---------------
 together/seqlock.tex     |  2 +-
 8 files changed, 64 insertions(+), 36 deletions(-)


base-commit: d4014ed9b2f2ec4074f86b2bdf0cf79953408cb0
-- 
2.43.0



